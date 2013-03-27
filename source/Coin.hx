package ;

import org.flixel.FlxObject;
import org.flixel.FlxSprite;
import org.flixel.FlxG;

/**
 * ...
 * @author Mike Cugley
 */
class Coin extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0, SimpleGraphic:Dynamic=null) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic("assets/data/coin_gold.png", true, false, 32, 32);
		addAnimation("spin", [0, 1, 2, 3, 4, 5, 6, 7], 16, true);
		play("spin");
		
		moves = false;
		solid = true;
	}

	
}