package ;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Mike Cugley
 */

class Crystal extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0)
	{
		super(X, Y);
		loadGraphic("assets/data/crystal-qubodup-ccby3-32-green.png", true, false, 32, 32);
		addAnimation("spin", [0, 1, 2, 3, 4, 5, 6, 7], 16, true);
		play("spin");
		
		moves = false;
		solid = true;
	}
	
}