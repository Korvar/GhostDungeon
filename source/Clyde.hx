package ;

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
	}
	
}