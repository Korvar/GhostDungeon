package ;

/**
 * ...
 * @author Mike Cugley
 */

 import org.flixel.FlxPath;
 import org.flixel.FlxPoint;
 import org.flixel.FlxState;
 import org.flixel.FlxTilemap;
 import org.flixel.FlxG;
 import org.flixel.FlxTimer;
 import org.flixel.FlxU;
 import org.flixel.FlxObject;
 import org.flixel.FlxSprite;
 
 
class Enemy extends LayeredSprite
{
	var DungeonWalls:FlxTilemap;
	
	static public var ATTACK:Int = 0;
	static public var SCATTER:Int = 1;
	static public var FRIGHTENED:Int = 2;
	static public var CAGED:Int = 3;
	static public var RELEASED:Int = 4;
	static public var INCOMING:Int = 5;
	static public var DEAD:Int = 6;
	
	var speed:Float;
	
	var borderX:Int;
	var borderY:Int;
	var tileX:Int;
	var tileY:Int;
	
	var dotcounter:Int; // Used for various AI purposes
	var dotLimit:Int;
	
	var mode:Int;  // Which mode the enemy is in, ATTACK, SCATTER, FRIGHTENED etc.
	
	var reverse:Bool;  // Whether there is a "reverse" directive
	var deathAnim:Bool = false;
	var resetRequest:Bool = false;
	
	var target:FlxPoint;  // in tile scale, the current target of the enemy
	
	var scatterTarget:FlxPoint; // In tile scale, the target of the enemy in SCATTER mode.
	
	var startPoint:FlxPoint; // in game scale, the origin of the enemy.
	var startTile:FlxPoint; // in tile scale, the origin of the enemy.  Used when dead to return to start point.
	
	var deathTimer:FlxTimer;
	
	#if debug
	var targetSprite:FlxSprite;
	var targetColour:Int;
	var modeKey:String = "";
	#end
		

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
		mode = CAGED;
		dotcounter = 0;
		dotLimit = 0;
	
		
		startPoint = new FlxPoint(FlxU.floor(X), FlxU.floor(Y));
		startTile = new FlxPoint(FlxU.floor(X / 32), FlxU.floor(Y / 32));
		
		for (layer in layers.members)
		{
			var tmpSprite = cast(layer, FlxSprite);
			tmpSprite.width = size;
			tmpSprite.height = size;
			tmpSprite.centerOffsets(false);

		}
		
		cast(layers.members[0], FlxSprite).addAnimationCallback(animationCallback);
		
		moves = false; // Don't use the standard moving code
		
		deathTimer = new FlxTimer();
		
		#if debug
		targetSprite = new FlxSprite(448, 352);
		targetSprite.makeGraphic(32, 32, targetColour);
		FlxG.state.add(targetSprite);
		targetSprite.solid = false;
		targetSprite.moves = false;
		#end
	}
	
	
	public function checkAI():FlxPoint
	{
		// Used to check which direction to go on coming to an intersection.
		// specifically find a tile target
		// Each Enemy has a specific algorithm for determining the target when
		// they are in "ATTACK" mode, so only deal with things that all the 
		// enemies do.
		
		var target:FlxPoint = new FlxPoint();
		
		if (mode == DEAD)
		{
			target.x = 14;
			target.y = 11;
		}
		return(target);
	}
	
	override public function update()
	{

		
		if (Registry.deathAnim)
			return;
			
		if (resetRequest == true)
		{
			doResetEnemy();
		}
			
		if (deathAnim == true)
		{
			velocity.x = 0;
			velocity.y = 0;
			super.update();  // don't do any movement; just update animation.
			return;
		}
			
		if (mode == DEAD)
		{
			alpha = 0.5;
		}
		else
		{
			alpha = 1;
		}
			
		#if debug
		if (FlxG.keys.justPressed(modeKey) && !FlxG.keys.SHIFT && !FlxG.keys.CONTROL)
		{
			mode = (mode + 1) % 7; // cycle through all modes
		}
		
		if (FlxG.keys.justPressed(modeKey) && FlxG.keys.SHIFT && mode == CAGED)
		{
			setMode(RELEASED);
		}
		
		if (FlxG.keys.justPressed(modeKey) && FlxG.keys.CONTROL)
		{
			setMode(DEAD);
		}
		
		#end
		
		if (dotcounter >= dotLimit && mode == CAGED)
		{
			mode = RELEASED;
		}
		
		
		// Nearest tile border
		borderX = FlxU.round(x / 32.0) * 32;
		borderY = FlxU.round(y / 32.0) * 32;
		
		// Snap to tile border	
		snapToTile(borderX, borderY);
		
		// Let's have a look at what tile we're in
		tileX = FlxU.floor(x / 32);
		tileY = FlxU.floor(y / 32);
		var tilePos:FlxPoint = new FlxPoint(tileX, tileY);
		var tileType:Int = DungeonWalls.getTile(tileX, tileY);
		
		setSpeed(tileType);

		
		if (x == borderX && y == borderY) // i.e. we've just entered a tile
		{
			// If the mode is DEAD, and it has reached the entrance to the ghost box
			if (mode == Enemy.DEAD && x == 448 && y == 352)
			{
				incomingEnemy();
			}
			
			if (mode == INCOMING && x == startPoint.x && y == startPoint.y) // Come to the end of the INCOMING path
			{
				mode = CAGED;
			}
			
			
			if (mode == RELEASED && x == 448 && y <= 352) // should have reached end of release path
			{
				x = 448;
				y = 352;
				facing = FlxObject.LEFT;
				velocity.x = 0;
				velocity.y = 0;
				mode = Registry.mode; // Not setMode because of how it works.
				
			}
			
			
			
			if (reverse == true && mode <= FRIGHTENED) // ATTACK, SCATTER, FRIGHTENED
			{
				reverseEnemy();
			}
			else
			{
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
			
			if (mode == RELEASED)
			{
				if (x > 448)
					facing = FlxObject.LEFT;
				if (x < 448)
					facing = FlxObject.RIGHT;
				if (x == 448 && y > 352)
					facing = FlxObject.UP;
				if (y <= 352)
				{
					x = 448;
					y = 352;
					facing = FlxObject.LEFT;
					velocity.x = 0;
					velocity.y = 0;
				}
				
				#if debug
				targetSprite.x = 448;
				targetSprite.y = 352;
				#end
			}

			if (mode == INCOMING)
			{
				if (x == 448 && y  < startPoint.y)
					facing = FlxObject.DOWN;
				if (y == startPoint.y && x > startPoint.x)
					facing = FlxObject.LEFT;
				if (y == startPoint.y && x < startPoint.x)
					facing = FlxObject.RIGHT;
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
		
		// Snap to tile border	
		snapToTile(borderX, borderY);
		
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
			#if debug
			targetSprite.x = tilePos.x * 32;
			targetSprite.y = tilePos.y * 32;
			#end

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
		// Except when "INCOMING" or "RELEASED"
		if (mode != INCOMING && mode != RELEASED)
		{
			if (overlapsAt(x, y - 32, DungeonWalls))
			{
				distUp = 9999;
			}
			if (overlapsAt(x, y + 32, DungeonWalls))		
			{
				distDown = 9999;
			}
			if (overlapsAt(x - 32, y, DungeonWalls))
			{
				distLeft = 9999;
			}
			if (overlapsAt(x + 32, y, DungeonWalls))
			{
				distRight = 9999;
			}
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
	
	private function reverseEnemy():Void 
	{
		// If there's a reverse directive... reverse!
		if (mode <= FRIGHTENED)
		{
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
	}
	
	private function incomingEnemy():Void 
	{
		mode = Enemy.INCOMING;

	}
	
	private function snapToTile(borderX, borderY):Void 
	{
		// Nearest tile border
		if (FlxU.abs(x - borderX) < speed * 0.9)
		{
			x = borderX;
		}
		if (FlxU.abs(y - borderY) < speed * 0.9)
		{
			y = borderY;
		}
	}
	
	public function setMode(Mode:Int)
	{
		if (mode != FRIGHTENED && Mode <= FRIGHTENED)
		{
			reverse = true;
		}
		if (Mode <= FRIGHTENED && mode <= FRIGHTENED) // ATTACK, SCATTER, FRIGHTENED
		{
			mode = Mode;
			return;
		}
		
		if (Mode == RELEASED && mode == CAGED)
		{
			mode = Mode;
			return;
		}
		
		if (Mode == CAGED && mode == INCOMING)
		{
			mode = Mode;
			return;
		}
		
		if (Mode == INCOMING && mode == DEAD)
		{ 
			mode = Mode;
			return;
		}
		
		if (Mode == DEAD)
		{
			mode = DEAD;
			deathAnim = true;
			play("hurt");
			return;
		}

	}
	
	function animationCallback(Name:String, frameNum:Int, frameIndex:Int)
	{
		//message = Name;
		if (Name == "hurt")
		{
			if (frameNum >= 5) // end of "hurt" animation
			{
				// Wait one second
				deathTimer.start(1, 1, deathSequence1);
				
			}
		}
		
		if (Name == "rise" && frameNum >= 5) // end of "rise" animation
		{
			deathAnim = false;
		}
		
	}
	
	function deathSequence1(Timer:FlxTimer)
	{
		// Flicker one second
		// play "Rise"
		play("dead");
		flicker(1);
		deathTimer.start(1, 1, deathSequence2);
	}
	
	function deathSequence2(Timer:FlxTimer)
	{
		play("rise");
	}
	
	private function setSpeed(tileType:Int):Void 
	{
		if (tileType == 30)
		{
			speed = Registry.maxSpeed * Registry.levelInfo[FlxG.level].ghostTunnelSpeed;
		}
		else
		{
			switch (mode)
			{
				case FRIGHTENED:
				{
					speed = Registry.maxSpeed * Registry.levelInfo[FlxG.level].frightenedGhostSpeed;
				}
				case DEAD:
				{
					speed = Registry.maxSpeed * 1.5;
				}
				default:
				{
					speed = Registry.maxSpeed * Registry.levelInfo[FlxG.level].ghostSpeed;
				}
			}
		}
	}
	
	private function doResetEnemy():Void 
	{
		mode = Enemy.CAGED;
		target = scatterTarget;
		x = startPoint.x;
		y = startPoint.y;
		velocity.x = 0;
		velocity.y = 0;
		snapToTile(FlxU.floor(startTile.x), FlxU.floor(startTile.y));
		moves = false;
		facing = FlxObject.LEFT;
		reverse = false;
		// if (Registry.playerDead == true)
		// 	dotcounter = 0;	
		
		resetRequest = false;
	}
	
	public function resetEnemy()
	{
		resetRequest = true;
	}
	
	public function getMode():Int
	{
		return mode;
	}
	
	public function addDot()
	{
		if (mode == CAGED)
		{
			dotcounter += 1;
		}
	}
	

}