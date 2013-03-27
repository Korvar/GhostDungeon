package ;
import org.flixel.FlxPoint;
import org.flixel.FlxG;
import org.flixel.FlxU;

/**
 * ...
 * @author Mike Cugley
 */
class Clyde extends Enemy
{

public function new(X:Float=0, Y:Float=0) 
	{
		var layers:Array<String>;
		
		scatterTarget = new FlxPoint(3, 36);

		layers = [
			"assets/data/Player/body/male/eyes/red.png",
			"assets/data/Player/body/male/skeleton.png"
			];
		
		super(X, Y, null, layers, 64, 64);
		
	}
	
	
	override function checkAI():FlxPoint
	{
		// Used to check which direction to go on coming to an intersection.
		// specifically find a tile target
		var target:FlxPoint = new FlxPoint();
		var playerPos:FlxPoint = new FlxPoint();
		var clydePos:FlxPoint = new FlxPoint();
		var dist:Float;
		var player = cast(FlxG.state, PlayState).player;

		playerPos.x = player.x;
		playerPos.y = player.y;
		playerPos.x = FlxU.floor(playerPos.x / 32);
		playerPos.y = FlxU.floor(playerPos.y / 32);
		
		clydePos.x = x;
		clydePos.y = y;
		clydePos.x = FlxU.floor(clydePos.x / 32);
		clydePos.y = FlxU.floor(clydePos.y / 32);
		
		switch(mode)
		{
			case Enemy.ATTACK:
				dist = FlxU.getDistance(playerPos, clydePos);
				if (dist > 8)
				{
					target = playerPos;
				}
				else
				{
					target = scatterTarget;
				}
			case Enemy.SCATTER:
				target = scatterTarget;
			case Enemy.FRIGHTENED:
				target = scatterTarget; // target isn't used, but set the variable just in case!
		}
		return(target);
	}
	
}