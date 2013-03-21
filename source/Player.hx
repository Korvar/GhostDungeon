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
		

	static private var runSpeed = 80;
	static private var margin = 1; 
	static private var size = 32;
	
	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null, Layers:Array<String>, Width:Int = 0, Height:Int = 0) 
	{
		DungeonWalls = cast(FlxG.state, PlayState).DungeonWalls;
		
		// trace(SimpleGraphic);
		super(X, Y, SimpleGraphic, Layers, Width, Height);
		facing = FlxObject.LEFT;
		width = size;
		height = size;
		centerOffsets(true);
		x = 432;
		y = 544;
		
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
			tmpSprite.centerOffsets(true);

		}
		
	}
	
	override public function update()
	{
		velocity.x = 0;
		velocity.y = 0;
		x = Std.int(x);
		y = Std.int(y);
		
		if (FlxG.keys.justPressed("SPACE"))
		{
			x = 432;
			y = 544;
		}
		
		// Check to see if we've gotten stuck
		deStick();
			
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
		if (FlxG.keys.pressed("A") && !(overlapsAt(x - margin, y, DungeonWalls)))
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
	
}