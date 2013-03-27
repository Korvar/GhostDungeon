package ;

/**
 * ...
 * @author Mike Cugley
 */
class Blinky extends Enemy
{

	public function new(X:Float=0, Y:Float=0) 
	{
		var layers:Array<String>;

		layers = ["assets/data/Player/head/cloth_hood_male.png",
			"assets/data/Player/belt/rope_male.png",
			"assets/data/Player/torso/brown_shirt_male.png",
			"assets/data/Player/legs/robe_skirt_male.png",
			"assets/data/Player/body/male/skeleton.png"];
		
		super(X, Y, null, layers, 64, 64);
		
	}
	
}