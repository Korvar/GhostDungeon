package ;

/**
 * ...
 * @author Mike Cugley
 */

 import org.flixel.FlxPoint;
 import org.flixel.FlxState;
 import org.flixel.FlxTilemap;
 import org.flixel.FlxG;
 import org.flixel.FlxU;
 import org.flixel.FlxObject;
 import org.flixel.FlxSprite;
 
class Enemy extends LayeredSprite
{
	var DungeonWalls:FlxTilemap;
	
	static var ATTACK:Int = 0;
	static var SCATTER:Int = 1;
	static var FRIGHTENED:Int = 2;
	static var CAGED:Int = 3;
	static var DEAD:Int = 4;
	
	static var speed = 4;
	
	var dotcounter:Int; // Used for various AI purposes
	
	var player:Player;  // Used to get various bits of information about the player for AI purposes
	
	var mode:Int;  // Which mode the enemy is in, ATTACK, SCATTER or FRIGHTENED
	
	var reverse:Bool;  // Whether there is a "reverse" directive
	
	var target:FlxPoint;  // in tile scale, the current target of the enemy
	
	var scatterTarget:FlxPoint; // In tile scale, the target of the enemy in SCATTER mode.
	
	var startPoint:FlxPoint; // in tile scale, the origin of the enemy.  Used when dead to return to start point.
		

	static private var runSpeed = 3.8;  // Needs to be a multiple of 2
	static private var margin = 1; 
	static private var size = 32;

	public function new(X:Float=0, Y:Float=0, SimpleGraphic:Dynamic=null, Layers:Array<String>, Width:Int=0, Height:Int=0) 
	{
		DungeonWalls = cast(FlxG.state, PlayState).DungeonWalls;
		
		// trace(SimpleGraphic);
		super(X, Y, SimpleGraphic, Layers, Width, Height);
		facing = FlxObject.LEFT;
		width = size;
		height = size;
		centerOffsets(false);
		mode = SCATTER;
		
		
		origin = new FlxPoint(FlxU.floor(X), FlxU.floor(Y));
		
		#if debug
		drawLine(x, y, x, y + height, 0xff0000, 2);
		drawLine(x, y + height, x + width, y + height, 0xff0000, 2);
		drawLine(x + width, y + height, x + width, y, 0xff0000, 2);
		drawLine(x + width, y, x, y, 0xff0000, 2);
		#end
	
		for (layer in layers.members)
		{
			var tmpSprite = cast(layer, FlxSprite);
			tmpSprite.width = size;
			tmpSprite.height = size;
			tmpSprite.centerOffsets(false);

		}
		
		moves = false; // Don't use the standard moving code
	}
	
	
	public function checkAI():FlxPoint
	{
		// Used to check which direction to go on coming to an intersection.
		// specifically find a tile target
		var target:FlxPoint = new FlxPoint();
		
		var player = cast(FlxG.state, PlayState).player;
		
		switch(mode)
		{
			case ATTACK:
				{
					target.x = player.x;
					target.y = player.y;
					target.x = FlxU.floor(target.x / 32);
					target.y = FlxU.floor(target.y / 32);
				}
			case SCATTER:
				target = scatterTarget;
			case FRIGHTENED:
				target = scatterTarget; // target isn't used, but set the variable just in case!
		}
		return(target);
	}
	
	override public function update()
	{
		#if debug
		if (FlxG.keys.justPressed("M"))
		{
			if (mode != FRIGHTENED)
			{
				reverse = true;
			}
			mode = (mode + 1) % 3; // cycle through ATTACK, SCATTER and FRIGHTENED
		}
		#end
		

		// Let's have a look at what tile we're in
		var tileX = FlxU.floor(x / 32);
		var tileY = FlxU.floor(y / 32);
		var tilePos:FlxPoint = new FlxPoint(tileX, tileY);
		
		// Nearest tile border
		var borderX = FlxU.round(x / 32) * 32;
		var borderY = FlxU.round(y / 32) * 32;
		
		// Snap to tile border
		if (FlxU.abs(x - borderX) < 2)
		{
			x = borderX;
		}
		
		if (FlxU.abs(y - borderY) < 2)
		{
			y = borderY;
		}
		
		if (x == borderX && y == borderY) // i.e. we've just entered a tile
		{
			if (reverse == true) 
			{
				// If there's a reverse directive... reverse!
				switch(facing)
				{
					case FlxObject.LEFT:
						{
							facing = FlxObject.RIGHT;
						}
					case FlxObject.RIGHT:
						{
							facing = FlxObject.LEFT;
						}
					case FlxObject.UP:
						{
							facing = FlxObject.DOWN;
						}
					case FlxObject.DOWN:
						{
							facing = FlxObject.UP;
						}
				}
				
				reverse = false;
			}
			else
			{
				
				var tileType:Int = DungeonWalls.getTile(tileX, tileY);
				if (tileType == 28 || tileType == 29)
				{
					
					chooseFacing(tileType, tilePos);
				}
				else 
				{	// At this point, we're not in an intersection.
					// Check to see if we're about to bash into a wall.  If so, we're
					// in a corner.
					checkCorner();
				}
			}
		}
		
		// By this point we should have a Facing for our Enemy
		velocity.x = 0;
		velocity.y = 0;
		
		switch(facing)
		{
			case FlxObject.LEFT:
				{
					velocity.x = -speed;
					play("walkleft");
				}
			case FlxObject.RIGHT:
				{
					velocity.x = speed;
					play("walkright");
				}
			case FlxObject.UP:
				{
					velocity.y = -speed;
					play("walkup");
				}
			case FlxObject.DOWN:
				{
					velocity.y = speed;
					play("walkdown");
				}
		}
		
		x += velocity.x;
		y += velocity.y;
		
		// Teleporter!
		if (x > 896)
		{
			x = -32;
		}
		else if (x < -32)
		{	
			x = 896;
		}
		
		super.update();
	}
	
	private function chooseFacing(tileType:Int, tilePos:FlxPoint):Void 
	{
		var distUp:Float;
		var distDown:Float;
		var distLeft:Float;
		var distRight:Float;
		
		var tileUp:FlxPoint = new FlxPoint(tilePos.x, tilePos.y - 1);
		var tileDown:FlxPoint = new FlxPoint(tilePos.x, tilePos.y + 1);
		var tileLeft:FlxPoint = new FlxPoint(tilePos.x - 1, tilePos.y);
		var tileRight:FlxPoint = new FlxPoint(tilePos.x + 1, tilePos.y);
		
		if (mode == FRIGHTENED) 
		{
			// If we're FRIGHTENED, then we want to choose a direction at random
			// To fit in with the rest of the AI, give each distance variable a 
			// random value.  Reversing will be prevented later.
			distUp = FlxG.random();
			distDown = FlxG.random();
			distLeft = FlxG.random();
			distRight = FlxG.random();
		}
		else
		{
			target = checkAI();

			
			distUp = FlxU.getDistance(target, tileUp);
			distDown = FlxU.getDistance(target, tileDown);
			distLeft = FlxU.getDistance(target, tileLeft);
			distRight = FlxU.getDistance(target, tileRight);
		
			#if debug
			trace("distUp: " + distUp +
				" distDown: " + distDown +
				" distLeft: " + distLeft +
				" distRight: " + distRight);
			#end
			
			// In specific intersections, cannot go up
			if (tileType == 29)
			{
				distUp = 9999;
			}
		}
		
		// Disallow squares that are occupied
		if (DungeonWalls.getTile(FlxU.floor(tileUp.x), FlxU.floor(tileUp.y)) != 0
			&&
			DungeonWalls.getTile(FlxU.floor(tileUp.x), FlxU.floor(tileUp.y)) != 30)
		{
			distUp = 9999;
		}
		if (DungeonWalls.getTile(FlxU.floor(tileDown.x), FlxU.floor(tileDown.y)) != 0
			&&
			DungeonWalls.getTile(FlxU.floor(tileDown.x), FlxU.floor(tileDown.y)) != 30)
		{
			distDown = 9999;
		}
		if (DungeonWalls.getTile(FlxU.floor(tileLeft.x), FlxU.floor(tileLeft.y)) != 0
			&&
			DungeonWalls.getTile(FlxU.floor(tileLeft.x), FlxU.floor(tileLeft.y)) != 30)
		{
			distLeft = 9999;
		}
		if (DungeonWalls.getTile(FlxU.floor(tileRight.x), FlxU.floor(tileRight.y)) != 0
			&&
			DungeonWalls.getTile(FlxU.floor(tileRight.x), FlxU.floor(tileRight.y)) != 30)
		{
			distRight = 9999;
		}
		
		// Disallow reversing
		switch(facing)
		{
			case FlxObject.LEFT:
				{
					distRight = 9999;
				}
			case FlxObject.RIGHT:
				{
					distLeft = 9999;
				}
			case FlxObject.UP:
				{
					distDown = 9999;
				}
			case FlxObject.DOWN:
				{
					distUp = 9999;
				}
		}
		
		if (distRight <= distUp && distRight <= distLeft && distRight <= distDown)
		{
			facing = FlxObject.RIGHT;
		}
		if (distDown <= distUp && distDown <= distRight && distDown <= distLeft)
		{
			facing = FlxObject.DOWN;
		}
		if (distLeft <= distUp && distLeft <= distDown && distLeft <= distRight)
		{
			facing = FlxObject.LEFT;
		}
		if (distUp <= distLeft && distUp <= distRight && distUp <= distDown)
						{
			facing = FlxObject.UP;
		}
		

	}
	
	private function checkCorner():Void 
	{
		if (overlapsAt(x + velocity.x, y + velocity.y, DungeonWalls))
		{
			switch(facing)
			{
			case FlxObject.LEFT, FlxObject.RIGHT:
				{
					if (!overlapsAt(x, y + 2, DungeonWalls))
					{
						facing = FlxObject.DOWN;
					}
					else
					{
						facing = FlxObject.UP;
					}
				}
			case FlxObject.UP, FlxObject.DOWN:
				{
					if (!overlapsAt(x + 2, y, DungeonWalls))
					{
						facing = FlxObject.RIGHT;
					}
					else
					{
						facing = FlxObject.LEFT;
					}							
				}
			}	
		}
	}
}