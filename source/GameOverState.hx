package ;

/**
 * ...
 * @author Mike Cugley
 */

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
 
class GameOverState extends FlxState
{

	var gameOverText:FlxText;
	var menuText:FlxText;
	
	override public function create():Void
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		FlxG.mouse.show();
		
		gameOverText = new FlxText(0, FlxG.height / 3, FlxG.width, "Game Over!", 32 );
		gameOverText.color = 0xFFFFFF;
		gameOverText.alignment = "center";
		add(gameOverText);
		
		var scoreText = new FlxText(0, FlxG.height / 2, FlxG.width, "You scored: " + Std.string(FlxG.score), 28);
		scoreText.color = 0xFF0000;
		scoreText.alignment = "center";
		add(scoreText);
		
		menuText = new FlxText(0, FlxG.height * 2 / 3, FlxG.width, "Click to restart!", 20);
		menuText.color = 0xFFFFFF;
		menuText.alignment = "center";
		add(menuText);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		if (FlxG.mouse.justPressed() || FlxG.keys.any())
		{
			FlxG.switchState(new PlayState());
		}
	}
	
}