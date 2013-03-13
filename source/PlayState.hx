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
		
		walkUpAnim = [1, 2, 3, 4, 5, 6, 7, 8];
		walkLeftAnim = [10, 11, 12, 13, 14, 15, 16, 17];
		walkDownAnim = [19, 20, 21, 22, 23, 24, 25, 26];			
		walkRightAnim = [28, 29, 30, 31, 32, 33, 34, 35];
		
		
		player = new Player();
		add(player);
		
		player2 = setUpPlayer();
		add(player2);
		add(player2.layers);
		player2.play("walkleft");
		player2.acceleration = new FlxPoint(5, 5);
	}
	
	function setUpPlayer():LayeredSprite
	{
		var layers:Array<String>;
		var tempLSprite:LayeredSprite;
		
		layers=["assets/data/Player/walkcycle/WEAPON_shield_cutout_body.png",
		"assets/data/Player/walkcycle/HANDS_plate_armor_gloves.png",
		"assets/data/Player/walkcycle/HEAD_chain_armor_hood.png",
		"assets/data/Player/walkcycle/BELT_leather.png",
		"assets/data/Player/walkcycle/TORSO_chain_armor_torso.png",
		"assets/data/Player/walkcycle/LEGS_pants_greenish.png",
		"assets/data/Player/walkcycle/FEET_shoes_brown.png",
		"assets/data/Player/walkcycle/BODY_male.png",
		"assets/data/Player/walkcycle/BEHIND_quiver.png"];
		
		tempLSprite = new LayeredSprite(64, 64, null, layers, 64, 64);
		trace(player2);
		tempLSprite.addAnimation("walkup", walkUpAnim, 16, true);
		tempLSprite.addAnimation("walkleft", walkLeftAnim, 16, true);
		tempLSprite.addAnimation("walkdown", walkDownAnim, 16, true);			
		tempLSprite.addAnimation("walkright", walkRightAnim, 16, true);
		
		return tempLSprite;

	}
}