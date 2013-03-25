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
	var ScatterTarget:FlxPoint; // In tile scale, the point where the enemy will go in "scatter" mode
	
	static var ATTACK:Int = 0;
	static var SCATTER:Int = 1;
	static var FRIGHTENED:Int = 2;
	static var CAGED:Int = 3;
	
	static var speed = 2;
	
	var dotcounter:Int; // Used for various AI purposes
	
	var player:Player;  // Used to get various bits of information about the player for AI purposes
	
	var mode:Int;  // Which mode the enemy is in, ATTACK, SCATTER or FRIGHTENED
	
	var reverse:Bool;  // Whether there is a "reverse" directive
	
	var target:FlxPoint;  // in tile scale, the current target of the enemy
	
	var scatterTarget:FlxPoint; // In tile scale, the target of the enemy in SCATTER mode.
		

	static private var runSpeed = 4;  // Needs to be a multiple of 2
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
	
	
	public function checkAI()
	{
		// Used to check which direction to go on coming to an intersection.
		// specifically find a tile target
	}
	
	override public function update()
	{
		// Let's have a look at what tile we're in
		var tileX = FlxU.floor(x / 32);
		var tileY = FlxU.floor(y / 32);
		
		// Nearest tile border
		var borderX = FlxU.round(x / 32) * 32;
		var borderY = FlxU.round(y / 32) * 32;
		
		if (FlxU.abs(x - borderX) < 2)
		{
			x = borderX;
		}
		
		if (FlxU.abs(y - borderY) < 2)
		{
			y = borderY;
		}
		
		if (x == borderX && y == borderY)
		{
			var tileType:Int = DungeonWalls.getTile(tileX, tileY);
	
			if (tileType == 28 || tileType == 29)
			{
				//Do stuff
			}
			else 
			{	// At this point, we're not in an intersection.
				// Check to see if we're about to bash into a wall.  If so, we're
				// in a corner.
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
		
		super.update();
	}
	
}