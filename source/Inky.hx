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
		var inkyLayers:Array<String>;
		
		scatterTarget = new FlxPoint(28, 33);
		blinky = myBlinky;

		inkyLayers = [
			"assets/data/Player/body/male/eyes/red.png",
			"assets/data/Player/belt/leather_male.png",
			"assets/data/Player/head/leather_cap_male.png",
			"assets/data/Player/torso/leather/bracers_male.png",
			"assets/data/Player/body/male/skeleton.png",
			"assets/data/Player/behind_body/quiver.png",
			];
		
		#if debug
		targetColour = 0xFF00FFFF;
		#end		
			
		super(X, Y, null, inkyLayers, 64, 64);
		
		#if debug
		modeKey = "I";
		#end
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
					
					vector.x = pivot.x - blinkyPos.x;
					vector.y = pivot.y - blinkyPos.y;
					
					target.x = pivot.x + vector.x;
					target.y = pivot.y + vector.y;
				}
			case Enemy.SCATTER:
				target = scatterTarget;
			case Enemy.FRIGHTENED:
				target = scatterTarget; // target isn't used, but set the variable just in case!
			case Enemy.DEAD:
				target = super.checkAI();				
		}
		return(target);
	}
}