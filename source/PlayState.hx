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
		
		layers=["assets/data/Player/walkcycle/WEAPON_shield_cutout_body.png",
		"assets/data/Player/walkcycle/HANDS_plate_armor_gloves.png",
		"assets/data/Player/walkcycle/HEAD_chain_armor_hood.png",
		"assets/data/Player/walkcycle/BELT_leather.png",
		"assets/data/Player/walkcycle/TORSO_chain_armor_torso.png",
		"assets/data/Player/walkcycle/LEGS_pants_greenish.png",
		"assets/data/Player/walkcycle/FEET_shoes_brown.png",
		"assets/data/Player/walkcycle/BODY_male.png",
		"assets/data/Player/walkcycle/BEHIND_quiver.png"];
		
		tempPlayer = new Player(64, 64, null, layers, 64, 64);
		tempPlayer.addAnimation("walkup", walkUpAnim, 16, true);
		tempPlayer.addAnimation("walkleft", walkLeftAnim, 16, true);
		tempPlayer.addAnimation("walkdown", walkDownAnim, 16, true);			
		tempPlayer.addAnimation("walkright", walkRightAnim, 16, true);
		
		return tempPlayer;

	}
	
	private function setUpAnimations():Void 
	{
		walkUpAnim = [1, 2, 3, 4, 5, 6, 7, 8];
		walkLeftAnim = [10, 11, 12, 13, 14, 15, 16, 17];
		walkDownAnim = [19, 20, 21, 22, 23, 24, 25, 26];			
		walkRightAnim = [28, 29, 30, 31, 32, 33, 34, 35];
	}
}