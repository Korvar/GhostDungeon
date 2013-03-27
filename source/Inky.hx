package ;

import org.flixel.FlxPoint;
import org.flixel.FlxPoint;
import org.flixel.FlxG;
import org.flixel.FlxU;
import org.flixel.FlxObject;

/**
 * ...
 * @author Mike Cugley
 */
class Inky extends Enemy
{

	var blinky:Blinky;
	
	public function new(X:Float=0, Y:Float=0, myBlinky:Blinky) 
	{
		var layers:Array<String>;
		
		scatterTarget = new FlxPoint(28, 33);
		blinky = myBlinky;

		layers = [
			"assets/data/Player/body/male/eyes/red.png",
			"assets/data/Player/belt/leather_male.png",
			"assets/data/Player/head/leather_cap_male.png",
			"assets/data/Player/torso/leather/bracers_male.png",
			"assets/data/Player/body/male/skeleton.png",
			"assets/data/Player/behind_body/quiver.png",
			];
		
		super(X, Y, null, layers, 64, 64);
	}
	
	override function checkAI():FlxPoint
	{
		var player = cast(FlxG.state, PlayState).player;
		var pivot:FlxPoint = new FlxPoint();
		var blinkyPos:FlxPoint = new FlxPoint();
		var target:FlxPoint = new FlxPoint();
		var vector:FlxPoint = new FlxPoint();
		
		switch(mode)
		{
			case Enemy.ATTACK:
				{
					pivot.x = player.x;
					pivot.y = player.y;
					pivot.x = FlxU.floor(pivot.x / 32);
					pivot.y = FlxU.floor(pivot.y / 32);
					switch (player.facing)
					{
						case FlxObject.LEFT:
							pivot.x -= 2;
						case FlxObject.RIGHT:
							pivot.x += 2;
						case FlxObject.UP:
							pivot.y -= 2;
						case FlxObject.DOWN:
							pivot.y += 2;
					}
					
					blinkyPos.x = blinky.x;
					blinkyPos.y = blinky.y;
					blinkyPos.x = FlxU.floor(blinkyPos.x / 32);
					blinkyPos.y = FlxU.floor(blinkyPos.y / 32);
					
					vector.x = pivot.x - blinky.x;
					vector.y = pivot.y - blinky.y;
					
					target.x = pivot.x + vector.x;
					target.y = pivot.y + vector.y;
				}
			case Enemy.SCATTER:
				target = scatterTarget;
			case Enemy.FRIGHTENED:
				target = scatterTarget; // target isn't used, but set the variable just in case!
		}
		return(target);
	}
}