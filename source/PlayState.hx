package ;
import org.flixel.FlxObject;
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
		var tileInstances:Array<Int>;
		
		FlxG.mouse.hide();
		
		// Load the tilemap
		DungeonWalls = new FlxTilemap();
		DungeonWalls.loadMap(Assets.getText("assets/data/Dungeon_Walls.csv"), "assets/data/GhostDungeonTiles.png", 32, 32);
		tileInstances = DungeonWalls.getTileInstances(2);
		trace(tileInstances);
		if (tileInstances != null)
		{
			for(tileIndex in tileInstances)
			{
				trace(tileIndex);
				var tile = DungeonWalls.getTileByIndex(tileIndex);
				trace(tile);
				DungeonWalls.setTileProperties(tile, FlxObject.FLOOR);
			}
		}	
		DungeonWalls.setTileProperties(20, FlxObject.CEILING);
		DungeonWalls.setTileProperties(26, FlxObject.CEILING);
		
		FlxG.width = 640;
		FlxG.height = 480;
		FlxG.worldBounds = new FlxRect(-DungeonWalls.width, -DungeonWalls.height, DungeonWalls.width, DungeonWalls.height);		
		
		add(DungeonWalls);
		
		player = setUpPlayer();

		add(player.layers);
		add(player);

		// trace(DungeonWalls.width);
		// trace(DungeonWalls.height);
		
		
		FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN);
		FlxG.camera.bounds = new FlxRect(0, 0, DungeonWalls.width, DungeonWalls.height);
		
		// Temporary Test Stuff
		tempTestText1 = new FlxText(0, 0, FlxG.width, "", 20);
		tempTestText2 = new FlxText(0, 30, FlxG.width, "", 20);
		
		tempTestText1.color = tempTestText2.color = 0xffffff;
		tempTestText1.scrollFactor = tempTestText2.scrollFactor = new FlxPoint(0,0);
		add(tempTestText1);
		add(tempTestText2);
		// Temporary Test Stuff
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
		
		tempPlayer = new Player(416, 527.5, null, layers, 64, 64);

		
		return tempPlayer;

	}
	


	override public function update()
	{
		super.update();

		#if debug
		if (player.overlaps(DungeonWalls))
		{
			tempTestText1.text = "Overlaps!";
		}
		else
		{
			tempTestText1.text = "Doesn't Overlap!";
		}
		
		tempTestText2.text = "X: " + player.x + " Y: " + player.y;
		#end 
	}
}