package ;
import org.flixel.FlxGroup;
import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxU;
import org.flixel.FlxObject;
import org.flixel.FlxTilemap;

/**
 * ...
 * @author Mike Cugley
 */
class Player extends LayeredSprite
{
	var DungeonWalls:FlxTilemap;
		

	private var runSpeed:Float = 4.0;  
	static private var margin = 1; 
	static private var size = 32;
	
	var tileX:Int;
	var tileY:Int;
	var borderX:Int;
	var borderY:Int;
	
	var trueX:Float;
	var trueY:Float;
	
	#if debug
	var message:String = "";
	#end
	
	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null, Layers:Array<String>, Width:Int = 0, Height:Int = 0) 
	{
		DungeonWalls = Registry.DungeonWalls;
		
		// trace(SimpleGraphic);
		super(X, Y, SimpleGraphic, Layers, Width, Height);
		
		trueX = X;
		trueY = Y;
		
		facing = FlxObject.RIGHT;
		width = size;
		height = size;
		centerOffsets(false);
		solid = true;
		
		health = 3;
		
		for (layer in layers.members)
		{
			var tmpSprite = cast(layer, FlxSprite);
			tmpSprite.width = size;
			tmpSprite.height = size;
			tmpSprite.centerOffsets(false);

		}
		
		cast(layers.members[0], FlxSprite).addAnimationCallback(animationCallback);
		
		moves = false; // Don't use the standard moving code
		runSpeed = Registry.maxSpeed * Registry.levelInfo[FlxG.level].pacManSpeed;
	}
	
	override public function update()
	{
		// velocity.x = 0;
		// velocity.y = 0;
		
		if (Registry.mode == Enemy.FRIGHTENED)
		{
			runSpeed = Registry.maxSpeed * Registry.levelInfo[FlxG.level].frightenedPacManSpeed;
		}
		else
		{
			runSpeed = Registry.maxSpeed * Registry.levelInfo[FlxG.level].pacManSpeed;
		}
		
		x = FlxU.floor(trueX);
		y = FlxU.floor(trueY);
		
		tileX = FlxU.floor(x / 32.0) * 32;
		tileY = FlxU.floor(y / 32.0) * 32;
		
		if (Registry.playerDead)
		{
			velocity.x = 0;
			velocity.y = 0;
			
			if (_curAnim != null)
			{
				if (_curFrame >= _curAnim.frames.length)
					resetPlayer();
			}
			return;
		}
		
		// Nearest tile border
		borderX = FlxU.round(x / 32.0) * 32;
		borderY = FlxU.round(y / 32.0) * 32;
		
		// Snap to tile border	
		snapToTile(borderX, borderY);
		

		
		
		x = Std.int(x);
		y = Std.int(y);
		
		#if debug
		if (FlxG.keys.justPressed("SPACE"))
		{
			resetPlayer();
		}
		#end
		
		// By changing the order of key checking depending on facing,
		// I should get the desired behaviour of taking a turn if a turn
		// is available
		
		switch(facing)
		{
			case FlxObject.LEFT, FlxObject.RIGHT:
			{
				checkA();
				checkD();
				checkW();
				checkS();
			}
			case FlxObject.UP, FlxObject.DOWN:
			{
				checkW();
				checkS();
				checkA();
				checkD();			
			}
		}
		
		// Ensure we only stop when we're aligned to the tiles

		//var pBorderX = Std.int(x / 32) * 32;  // This is the 32-aligned "block" player is in.
		//var pBorderY = Std.int(y / 32) * 32;
		//var pDiffX = Math.abs(x - pBorderX);
		//var pDiffY = Math.abs(y - pBorderY);

		
		if (!FlxG.keys.pressed("A") &&
			!FlxG.keys.pressed("D"))
		{
			if (velocity.x == 0 && facing == FlxObject.LEFT && (Std.int(x) % 32 != 0))
			{
				velocity.x = -runSpeed;
			}
			if (velocity.x == 0 && facing == FlxObject.RIGHT && (Std.int(x) % 32 != 0))
			{
				velocity.x = runSpeed;
			}
		}
			
		if (!FlxG.keys.pressed("W") &&
			!FlxG.keys.pressed("S"))
		{
						if (velocity.y == 0 && facing == FlxObject.UP && (Std.int(y) % 32 != 0))
			{
				velocity.y = -runSpeed;
			}
			if (velocity.x == 0 && facing == FlxObject.DOWN && (Std.int(y) % 32 != 0))
			{
				velocity.y = runSpeed;
			}
		}
		
		var xColCheck:Int;
		if (velocity.x > 0)
		{
			xColCheck = 1;
		}
		else if (velocity.x < 0)
		{
			xColCheck = -1;
		}
		else
		{
			xColCheck = 0;
		}
		
		var yColCheck:Int;
		if (velocity.y > 0)
		{
			yColCheck = 1;
		}
		else if (velocity.y < 0)
		{
			yColCheck = -1;
		}
		else
		{
			yColCheck = 0;
		}
		
		var tempString:String = "";
		if (overlapsAt(x + xColCheck, tileY, DungeonWalls))
		{	
			velocity.x = 0;
			snapToTile(borderX, borderY);
			tempString += "Overlaps at X";
		}
		else
			message = "";
		
		if (overlapsAt(tileX, y + yColCheck, DungeonWalls))
		{
			velocity.y = 0;
			snapToTile(borderX, borderY);
			tempString  += "Overlaps at Y";

		}
		
		deStick();
		
		message = tempString;
		

		
		// Find the right animation to play
		if (velocity.x < 0)
		{
			play("walkleft");
		}
		if (velocity.x > 0)
		{
			play("walkright");
		}
		if (velocity.y < 0)
		{
			play("walkup");			
		}
		if (velocity.y > 0)
		{
			play("walkdown");
		}
		
		
		
		if (velocity.x == 0 && velocity.y == 0)
		{
			if (facing == FlxObject.LEFT) play("faceleft");
			if (facing == FlxObject.RIGHT) play("faceright");
			if (facing == FlxObject.UP) play("faceup");
			if (facing == FlxObject.DOWN) play("facedown");
		}
		
		// Don't use the standard moving methods
		trueX = trueX + velocity.x;
		trueY = trueY + velocity.y;
		
		x = FlxU.floor(trueX);
		y = FlxU.floor(trueY);
		
		
		// Teleporter!
		if (x > 896)
		{
			trueX = x = -32;
			
		}
		else if (x < -32)
		{	
			trueX = x = 896;
		}
		
		super.update();
	}
	
	private function deStick():Void 
	{
		if (overlaps(DungeonWalls))
		{
			var xv:Int, yv:Int;
			xv = yv = 0;
			switch(facing)
			{
				case FlxObject.LEFT:
					xv = 1;
				case FlxObject.RIGHT:
					xv = -1;
				case FlxObject.UP:
					yv = 1;
				case FlxObject.DOWN:
					yv = -1;
			}	
			
			while (overlaps(DungeonWalls))
			{
				x = x + xv;
				y = y + yv;
			}
			
		}
	}
	
	private function checkA():Void 
	{
		if (FlxG.keys.pressed("A") && (!(overlapsAt(x - margin, y, DungeonWalls))))
		{
			facing = FlxObject.LEFT;
			velocity.x = -runSpeed;
			velocity.y = 0;
			message = "A";
		}
	}
	
	private function checkD():Void 
	{
		if (FlxG.keys.pressed("D") && !(overlapsAt(x + margin, y, DungeonWalls)))
		{
			facing = FlxObject.RIGHT;
			velocity.x = runSpeed;
			velocity.y = 0;
			message = "D";
		}
	}
	
	private function checkW():Void 
	{
		if (FlxG.keys.pressed("W") && !(overlapsAt(x, y - margin, DungeonWalls)))
		{
			facing = FlxObject.UP;
			velocity.y = -runSpeed;
			velocity.x = 0;
			message = "W";
		}
	}
	
	private function checkS():Void 
	{
		if (FlxG.keys.pressed("S") && !(overlapsAt(x, y + margin, DungeonWalls)))
		{
			facing = FlxObject.DOWN;
			velocity.y = runSpeed;
			velocity.x = 0;	
			message = "S";
		}
	}
	
	public function resetPlayer()
	{
		x = 448;
		y = 544;
		trueX = x;
		trueY = y;
		facing = FlxObject.RIGHT;
		Registry.deathAnim = false;
		Registry.playerDead = false;
		
		runSpeed = Registry.maxSpeed * Registry.levelInfo[FlxG.level].pacManSpeed;
	}
	
	override public function hurt(Damage: Float):Void
	{
		super.hurt(Damage);
		play("hurt");
	}
	
	function animationCallback(Name:String, frameNum:Int, frameIndex:Int)
	{
		//message = Name;
		if (Name == "hurt")
		{
			if (frameNum >= 5)
			{
				resetPlayer();
			}
		}
	}
	
	private function snapToTile(borderX, borderY):Void 
	{
		var borderSnap:Float = runSpeed * 0.9;
		
		if (FlxU.abs(trueX - borderX) < borderSnap)
		{
			x = borderX;
			trueX = x;
		}
		if (FlxU.abs(trueY - borderY) < borderSnap)
		{
			y = borderY;
			trueY = borderY;
		}
	}
}