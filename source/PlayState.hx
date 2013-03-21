package ;
import org.flixel.FlxPoint;
import org.flixel.FlxRect;
import org.flixel.FlxState;
import org.flixel.FlxText;
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

	var tempTestText1:FlxText;
	var tempTestText2:FlxText;
		
	
	var player:Player;
	
	public var DungeonWalls:FlxTilemap;
	
	public function new() 
	{
		super();


	}
	
	override public function create():Void
	{
		
		// Load the tilemap
		DungeonWalls = new FlxTilemap();
		DungeonWalls.loadMap(Assets.getText("assets/data/Dungeon_Walls.csv"), "assets/data/GhostDungeonTiles.png", 32, 32);
				
		FlxG.width = 640;
		FlxG.height = 480;
		FlxG.worldBounds = new FlxRect(-DungeonWalls.width, -DungeonWalls.height, DungeonWalls.width, DungeonWalls.height);		
		
		add(DungeonWalls);
		
		player = setUpPlayer();
		add(player);
		add(player.layers);

		// trace(DungeonWalls.width);
		// trace(DungeonWalls.height);
		
		
		FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN);
		FlxG.camera.bounds = new FlxRect(0, 0, DungeonWalls.width, DungeonWalls.height);
		
		
		tempTestText1 = new FlxText(0, 0, FlxG.width, "", 20);
		tempTestText2 = new FlxText(0, 30, FlxG.width, "", 20);
		
		tempTestText1.color = tempTestText2.color = 0xffffff;
		tempTestText1.scrollFactor = tempTestText2.scrollFactor = new FlxPoint(0,0);
		add(tempTestText1);
		add(tempTestText2);
		
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
		
		tempPlayer = new Player(416, 520, null, layers, 64, 64);

		
		return tempPlayer;

	}
	


	override public function update()
	{
		super.update();
		
		tempTestText1.text = "" + player.x;
		tempTestText2.text = "" + player.y;


	}
}