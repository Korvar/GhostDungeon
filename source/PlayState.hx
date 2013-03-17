package ;
import org.flixel.FlxPoint;
import org.flixel.FlxState;
import org.flixel.FlxTilemap;
import nme.Assets;
import org.flixel.FlxTimer;

/**
 * ...
 * @author Mike Cugley
 */
class PlayState extends FlxState
{

	var player:Player;
	var player2:LayeredSprite;
	
	var walkUpAnim:Array<Int>;
	var walkLeftAnim:Array<Int>; 
	var walkDownAnim:Array<Int>;		
	var walkRightAnim:Array<Int>;
	var castUpAnim:Array<Int>;
	var castLeftAnim:Array<Int>;
	var castDownAnim:Array<Int>;
	var castRightAnim:Array<Int>;
	var slashUpAnim:Array<Int>;
	var slashLeftAnim:Array<Int>;
	var slashDownAnim:Array<Int>;
	var slashRightAnim:Array<Int>;
	var hurtAnim:Array<Int>;
	var deadAnim:Array<Int>;
	var faceUpAnim:Array<Int>;
	var faceLeftAnim:Array<Int>;
	var faceDownAnim:Array<Int>;
	var faceRightAnim:Array<Int>;
	
	var animNameList:Array<String>;
	
	// Some variables for testing
	var countdown:FlxTimer;
	var animIndex:Int;
	// end test variables
	
	public function new() 
	{
		super();
		// Load the tilemap
		var DungeonWalls = new FlxTilemap();
		DungeonWalls.loadMap(Assets.getText("assets/data/Dungeon_Walls.csv"), "assets/data/GhostDungeonTiles.png", 32, 32);
		add(DungeonWalls);
		
		setUpAnimations();
		
		player = setUpPlayer();
		add(player);
		add(player.layers);
	}
	
	function setUpPlayer():Player
	{
		var layers:Array<String>;
		var tempPlayer:Player;
		
		
		// layers go in descending order, that is, the top layer first.
		layers=["assets/data/Player/weapons/shield_male_cutoutforbody.png",
		"assets/data/Player/hands/metal_gloves_male.png",
		"assets/data/Player/head/chain_hood_male.png",
		"assets/data/Player/belt/leather_male.png",
		"assets/data/Player/torso/chain/mail_male.png",
		"assets/data/Player/legs/green_pants_male.png",
		"assets/data/Player/feet/brown_shoes_male.png",
		"assets/data/Player/body/male/tanned2.png",
		"assets/data/Player/behind_body/quiver.png"];
		
		tempPlayer = new Player(64, 64, null, layers, 64, 64);
		tempPlayer.addAnimation("walkup", walkUpAnim, 16, true);
		tempPlayer.addAnimation("walkleft", walkLeftAnim, 16, true);
		tempPlayer.addAnimation("walkdown", walkDownAnim, 16, true);			
		tempPlayer.addAnimation("walkright", walkRightAnim, 16, true);
		tempPlayer.addAnimation("castup", castUpAnim, 16, true);
		tempPlayer.addAnimation("castleft", castLeftAnim, 16, true);
		tempPlayer.addAnimation("castdown", castDownAnim, 16, true);
		tempPlayer.addAnimation("castright", castRightAnim, 16, true);
		tempPlayer.addAnimation("slashup", slashUpAnim, 16, true);
		tempPlayer.addAnimation("slashleft", slashLeftAnim, 16, true);
		tempPlayer.addAnimation("slashdown", slashDownAnim, 16, true);
		tempPlayer.addAnimation("slashright", slashRightAnim, 16, true);
		tempPlayer.addAnimation("hurt", hurtAnim, 16, false);
		tempPlayer.addAnimation("dead", deadAnim, 16, true);
		tempPlayer.addAnimation("faceup", faceUpAnim, 16, false);
		tempPlayer.addAnimation("faceleft", faceLeftAnim, 16, false);
		tempPlayer.addAnimation("facedown", faceDownAnim, 16, false);
		tempPlayer.addAnimation("faceright", faceRightAnim, 16, false);
		
		return tempPlayer;

	}
	
	private function setUpAnimations():Void 
	{
		walkUpAnim = [105, 106, 107, 108, 109, 110, 111, 112];
		walkLeftAnim = [118, 119, 120, 121, 122, 123, 124, 125];
		walkDownAnim = [131, 132, 133, 134, 135, 136, 137, 138];			
		walkRightAnim = [144, 145, 146, 147, 148, 149, 150, 151];
		castUpAnim = [0, 1, 2, 3, 4, 5, 6];
		castLeftAnim = [13, 14, 15, 16, 17, 18, 19];
		castDownAnim = [26, 27, 28, 29, 30, 31, 32];
		castRightAnim = [39, 40, 41, 42, 43, 44, 45];
		slashUpAnim = [156, 157, 158, 158, 160, 161];
		slashLeftAnim = [169, 170, 171, 172, 173, 174];
		slashDownAnim = [182, 183, 184, 185, 186, 187];
		slashRightAnim = [195, 196, 197, 198, 199, 200];
		hurtAnim = [260, 261, 262, 263, 264, 265];
		deadAnim = [265];
		faceUpAnim = [0];
		faceLeftAnim = [13];
		faceDownAnim = [26];
		faceRightAnim = [39];
	}

	override public function update()
	{
		super.update();
		


	}
}