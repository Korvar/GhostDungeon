package ;
import org.flixel.FlxPoint;
import org.flixel.FlxState;
import org.flixel.FlxTilemap;
import nme.Assets;

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
		player.play("walkleft");
		player.acceleration = new FlxPoint(5, 5);
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
		
		return tempPlayer;

	}
	
	private function setUpAnimations():Void 
	{
		walkUpAnim = [104, 105, 106, 107, 108, 109, 110, 111];
		walkLeftAnim = [117, 118, 119, 120, 121, 122, 123, 124];
		walkDownAnim = [130, 131, 132, 133, 134, 135, 136, 137];			
		walkRightAnim = [143, 144, 145, 146, 147, 148, 149, 150];
	}
}