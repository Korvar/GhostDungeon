package ;

import org.flixel.FlxPoint;
import org.flixel.FlxG;
import org.flixel.FlxU;
import org.flixel.FlxObject;

/**
 * ...
 * @author Mike Cugley
 */
class Pinky extends Enemy
{

	public function new(X:Float=0, Y:Float=0) 
	{
		var pinkyLayers:Array<String>;
		
		scatterTarget = new FlxPoint(3, -3);

		pinkyLayers = [
			"assets/data/Player/body/male/eyes/red.png",
			"assets/data/Player/belt/rope_male.png",
			"assets/data/Player/torso/brown_shirt_male.png",
			"assets/data/Player/legs/robe_skirt_male.png",
			"assets/data/Player/body/male/skeleton.png"
			];
			
		#if debug
		targetColour = 0xFFFF69B4;
		#end	
		
		super(X, Y, null, pinkyLayers, 64, 64);
		
	}
	
	override function checkAI():FlxPoint
	{
		var player = cast(FlxG.state, PlayState).player;
		var target = new FlxPoint();
		
		switch(mode)
		{
			case Enemy.ATTACK:
				{
					target.x = player.x;
					target.y = player.y;
					target.x = FlxU.floor(target.x / 32);
					target.y = FlxU.floor(target.y / 32);
					switch (player.facing)
					{
						case FlxObject.LEFT:
							target.x -= 4;
						case FlxObject.RIGHT:
							target.x += 4;
						case FlxObject.UP:
							target.y -= 4;
						case FlxObject.DOWN:
							target.y += 4;
					}
				}
			case Enemy.SCATTER:
				target = scatterTarget;
			case Enemy.FRIGHTENED:
				target = scatterTarget; // target isn't used, but set the variable just in case!
		}
		return(target);
	}
}