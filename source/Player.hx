package ;
import org.flixel.FlxGroup;
import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxObject;
import org.flixel.FlxTilemap;

/**
 * ...
 * @author Mike Cugley
 */
class Player extends LayeredSprite
{
	var DungeonWalls:FlxTilemap;
		

	static private var runSpeed = 4;  // Needs to be a multiple of 2
	static private var margin = 1; 
	static private var size = 32;
	
	#if debug
	var message:String = "";
	#end
	
	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null, Layers:Array<String>, Width:Int = 0, Height:Int = 0) 
	{
		DungeonWalls = Registry.DungeonWalls;
		
		// trace(SimpleGraphic);
		super(X, Y, SimpleGraphic, Layers, Width, Height);
		
		facing = FlxObject.RIGHT;
		width = size;
		height = size;
		centerOffsets(false);
		solid = true;
		
		health = 3;
		
		#if debug
		FlxG.watch(this, "message");
		#end
	
		for (layer in layers.members)
		{
			var tmpSprite = cast(layer, FlxSprite);
			tmpSprite.width = size;
			tmpSprite.height = size;
			tmpSprite.centerOffsets(false);

		}
		
		cast(layers.members[0], FlxSprite).addAnimationCallback(animationCallback);
		
		moves = false; // Don't use the standard moving code
	}
	
	override public function update()
	{
		// velocity.x = 0;
		// velocity.y = 0;
		
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
		
		if (overlapsAt(x + velocity.x, y, DungeonWalls))
		{	
			velocity.x = 0;
		}
		
		if (overlapsAt(x, y + velocity.y, DungeonWalls))
		{
			velocity.y = 0;
		}
		
		
		x = Std.int(x);
		y = Std.int(y);
		
		#if debug
		if (FlxG.keys.justPressed("SPACE"))
		{
			x = 448;
			y = 544;
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
		x = x + velocity.x;
		y = y + velocity.y;
		
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
		}
	}
	
	private function checkD():Void 
	{
		if (FlxG.keys.pressed("D") && !(overlapsAt(x + margin, y, DungeonWalls)))
		{
			facing = FlxObject.RIGHT;
			velocity.x = runSpeed;
			velocity.y = 0;
		}
	}
	
	private function checkW():Void 
	{
		if (FlxG.keys.pressed("W") && !(overlapsAt(x, y - margin, DungeonWalls)))
		{
			facing = FlxObject.UP;
			velocity.y = -runSpeed;
			velocity.x = 0;
		}
	}
	
	private function checkS():Void 
	{
		if (FlxG.keys.pressed("S") && !(overlapsAt(x, y + margin, DungeonWalls)))
		{
			facing = FlxObject.DOWN;
			velocity.y = runSpeed;
			velocity.x = 0;			
		}
	}
	
	public function resetPlayer()
	{
		x = 448;
		y = 544;
		facing = FlxObject.RIGHT;
		Registry.deathAnim = false;
		Registry.playerDead = false;
	}
	
	override public function hurt(Damage: Float):Void
	{
		super.hurt(Damage);
		play("hurt");
	}
	
	function animationCallback(Name:String, frameNum:Int, frameIndex:Int)
	{
		message = Name;
		if (Name == "hurt")
		{
			if (frameNum >= 5)
			{
				resetPlayer();
			}
		}
	}
}