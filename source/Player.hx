package ;
import org.flixel.FlxGroup;
import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxObject;

/**
 * ...
 * @author Mike Cugley
 */
class Player extends LayeredSprite
{

	static private var runSpeed = 80;

	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null, Layers:Array<String>, Width:Int = 0, Height:Int = 0) 
	{
		super(X, Y, SimpleGraphic, Layers, Width, Height);
		
		

	}
	
	override public function update()
	{

		velocity.x = 0;
		velocity.y = 0;
		
			
		if (FlxG.keys.pressed("A")) // && !(tilemap.overlapsat x -runSpeed) ?
		{
			facing = FlxObject.LEFT;
			velocity.x = -runSpeed;
		}
		if (FlxG.keys.pressed("D"))
		{
			facing = FlxObject.RIGHT;
			velocity.x = runSpeed;
		}
		if (FlxG.keys.pressed("W"))
		{
			facing = FlxObject.UP;
			velocity.y = -runSpeed;
		}
		if (FlxG.keys.pressed("S"))
		{
			facing = FlxObject.DOWN;
			velocity.y = runSpeed;
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
	
}