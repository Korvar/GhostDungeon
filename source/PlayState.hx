package ;
import org.flixel.FlxPoint;
import org.flixel.FlxRect;
import org.flixel.FlxState;
import org.flixel.FlxTilemap;
import nme.Assets;
import org.flixel.FlxG;
import org.flixel.FlxCamera;

/**
 * ...
 * @author Mike Cugley
 */
class PlayState extends FlxState
{

	var player:Player;
	
	public var DungeonWalls:FlxTilemap;
	
	public function new() 
	{
		super();
		// Load the tilemap
		DungeonWalls = new FlxTilemap();
		DungeonWalls.loadMap(Assets.getText("assets/data/Dungeon_Walls.csv"), "assets/data/GhostDungeonTiles.png", 32, 32);
				
		FlxG.width = 640;
		FlxG.height = 480;
		FlxG.worldBounds = new FlxRect(0, 0, DungeonWalls.width, DungeonWalls.height);		
		
		add(DungeonWalls);
		
		player = setUpPlayer();
		add(player);
		add(player.layers);

		// FlxG.camera.setBounds(0, 0, DungeonWalls.width, DungeonWalls.height, true);
		FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN);

		trace(DungeonWalls.width);
		trace(DungeonWalls.height);

	}
	
	function setUpPlayer():Player
	{
		var layers:Array<String>;
		var tempPlayer:Player;
		
		
		// layers go in descending order, that is, the top layer first.
		layers=["assets/data/Player/hands/metal_gloves_male.png",
		"assets/data/Player/head/chain_hood_male.png",
		"assets/data/Player/belt/leather_male.png",
		"assets/data/Player/torso/chain/mail_male.png",
		"assets/data/Player/legs/green_pants_male.png",
		"assets/data/Player/feet/brown_shoes_male.png",
		"assets/data/Player/body/male/tanned2.png",
		"assets/data/Player/behind_body/quiver.png"];
		
		tempPlayer = new Player(64, 64, null, layers, 64, 64);

		
		return tempPlayer;

	}
	


	override public function update()
	{
		super.update();
		


	}
}