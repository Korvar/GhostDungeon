package ;
import org.flixel.FlxPoint;
import org.flixel.FlxG;
import org.flixel.FlxU;

/**
 * ...
 * @author Mike Cugley
 */
class Blinky extends Enemy
{
	var cruiseElroy:Bool = false;

	public function new(X:Float=0, Y:Float=0) 
	{
		var layers:Array<String>;
		
		scatterTarget = new FlxPoint(28, -3);

		layers = ["assets/data/Player/head/cloth_hood_male.png",
			"assets/data/Player/belt/rope_male.png",
			"assets/data/Player/torso/brown_shirt_male.png",
			"assets/data/Player/legs/robe_skirt_male.png",
			"assets/data/Player/body/male/skeleton.png"];
		
		super(X, Y, null, layers, 64, 64);
		
	}
	
	override function checkAI():FlxPoint
	{
		// Used to check which direction to go on coming to an intersection.
		// specifically find a tile target
		var target:FlxPoint = new FlxPoint();
		
		var player = cast(FlxG.state, PlayState).player;
		
		switch(mode)
		{
			case Enemy.ATTACK:
				{
					target.x = player.x;
					target.y = player.y;
					target.x = FlxU.floor(target.x / 32);
					target.y = FlxU.floor(target.y / 32);
				}
			case Enemy.SCATTER:
				target = scatterTarget;
			case Enemy.FRIGHTENED:
				target = scatterTarget; // target isn't used, but set the variable just in case!
		}
		return(target);
	}
	
}