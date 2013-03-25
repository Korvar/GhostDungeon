package ;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxPoint;
import org.flixel.FlxRect;
import org.flixel.FlxSprite;
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

	
	#if debug
	var tempTestText1:FlxText;
	var tempTestText2:FlxText;	
	var oldPX:Float;
	var oldPY:Float;
	#end	
	
	var player:Player;
	
	var Blinky:Enemy;
	var Pinky:Enemy;
	var Inky:Enemy;
	var Clyde:Enemy;
	
	public var DungeonWalls:FlxTilemap;
	
	var coins:FlxGroup;
	var powerPills:FlxGroup;
	
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
		// Because I didn't set up my tilemap 100% properly, set some tile properties.
		DungeonWalls.setTileProperties(28, FlxObject.NONE); // Intersection
		DungeonWalls.setTileProperties(29, FlxObject.NONE); // Intersection where the enemies won't go up.
		
		FlxG.width = 640;
		FlxG.height = 480;
		FlxG.worldBounds = new FlxRect(-DungeonWalls.width, -DungeonWalls.height, DungeonWalls.width, DungeonWalls.height);		
		
		add(DungeonWalls);
		
		player = setUpPlayer();

		add(player.layers);
		add(player);

		
		FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN);
		FlxG.camera.bounds = new FlxRect(0, 0, DungeonWalls.width, DungeonWalls.height);
		
		#if debug
		tempTestText1 = new FlxText(0, 0, FlxG.width, "", 20);
		tempTestText2 = new FlxText(0, 30, FlxG.width, "", 20);
		
		tempTestText1.color = tempTestText2.color = 0xffffff;
		tempTestText1.scrollFactor = tempTestText2.scrollFactor = new FlxPoint(0,0);
		add(tempTestText1);
		add(tempTestText2);
		
		oldPX = player.x;
		oldPY = player.y;
		#end 
		
		Blinky = setupBlinky();
		add(Blinky);
		add(Blinky.layers);
		
		coins = setupCoins();
		add(coins);
		
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
		
		tempPlayer = new Player(432, 544, null, layers, 64, 64);

		
		return tempPlayer;

	}
	
	function setupBlinky():Enemy
	{
		var Blinky:Enemy;
		var layers:Array<String>;

		layers = ["assets/data/Player/head/cloth_hood_male.png",
			"assets/data/Player/belt/rope_male.png",
			"assets/data/Player/torso/brown_shirt_male.png",
			"assets/data/Player/legs/robe_skirt_male.png",
			"assets/data/Player/body/male/skeleton.png"];
		
		Blinky = new Enemy(448, 352, null, layers, 64, 64);
		
		return Blinky;
	}
	


	override public function update()
	{
		super.update();

		#if debug

		var dPX = player.x - oldPX;
		var dPY = player.y - oldPY;
		
		
		if (player.overlaps(DungeonWalls))
		{
			tempTestText1.text = "Overlaps!";
		}
		else
		{
			tempTestText1.text = "Doesn't Overlap!";
		}
		
		
		var pBorderX = Std.int(player.x / 32) * 32;  // This is the 32-aligned "block" player is in.
		var pBorderY = Std.int(player.y / 32) * 32;
			
		var pDiffX = Math.abs(player.x - pBorderX);
		var pDiffY = Math.abs(player.y - pBorderY);
		
		//if (pDiffX <= 3)
		//{
			//x = Std.int(pBorderX);
		//}
		//if (pDiffY <= 3)
		//{
			//y = Std.int(pBorderY);
		//}
	
		tempTestText2.text = "X: " + player.x + " Y: " + player.y + 
			" pDX: " + pDiffX + " pDY: " + pDiffY;
			
		oldPX = player.x;
		oldPY = player.y;
		#end 
	}
	
	function setupCoins():FlxGroup
	{
		var coinsPos:Array<Array<Int>>;
		var coins:FlxGroup;
		var coin:FlxSprite;
		
		coins = new FlxGroup();
		
		coinsPos = [[32, 64], [32, 128], [32, 160], [32, 192], [32, 224], [32, 256], 
	[64, 256], [96, 256], [128, 256], [160, 256], [160, 160], [192, 160], 
	[96, 160], [128, 160], [64, 160], [224, 160], [256, 160], [288, 160], 
	[320, 160], [352, 160], [384, 160], [416, 160], [448, 160], [480, 160], 
	[512, 160], [544, 160], [576, 160], [608, 160], [672, 160], [704, 160], 
	[736, 160], [768, 160], [800, 160], [832, 160], [832, 128], [672, 128], 
	[672, 96], [672, 64], [672, 32], [704, 32], [736, 32], [768, 32], 
	[800, 32], [832, 32], [832, 64], [640, 32], [608, 32], [576, 32], 
	[544, 32], [512, 32], [480, 32], [480, 64], [480, 96], [480, 128], 
	[384, 128], [384, 96], [384, 64], [384, 32], [352, 32], [320, 32], 
	[288, 32], [256, 32], [224, 32], [192, 32], [160, 32], [128, 32], 
	[96, 32], [64, 32], [32, 32], [192, 64], [192, 96], [192, 128], 
	[192, 192], [192, 224], [192, 256], [192, 288], [192, 320], [192, 352], 
	[192, 384], [192, 416], [192, 448], [192, 480], [192, 512], [192, 544], 
	[192, 768], [192, 736], [192, 704], [160, 640], [192, 672], [192, 640], 
	[192, 608], [192, 576], [384, 256], [352, 256], [320, 256], [288, 256], 
	[288, 224], [288, 192], [480, 256], [512, 256], [544, 256], [576, 256], 
	[576, 224], [576, 192], [672, 640], [672, 608], [672, 576], [672, 544], 
	[672, 512], [672, 480], [672, 448], [672, 416], [672, 384], [672, 352], 
	[672, 320], [672, 288], [672, 256], [672, 224], [672, 192], [704, 256], 
	[736, 256], [768, 256], [800, 256], [832, 256], [832, 224], [832, 192],
	[224, 640], [256, 640], [288, 640], [320, 640], [352, 640], [384, 640], 
	[384, 672], [384, 704], [384, 736], [352, 736], [320, 736], [288, 736], 
	[256, 736], [224, 736], [96, 640], [64, 640], [128, 640], [32, 640], 
	[32, 672], [32, 704], [64, 736], [96, 736], [96, 768], [96, 800], 
	[96, 832], [128, 832], [160, 832], [192, 800], [192, 832], [64, 832], 
	[32, 832], [32, 864], [32, 896], [32, 928], [64, 928], [96, 928], 
	[128, 928], [160, 928], [192, 928], [224, 928], [256, 928], [288, 928], 
	[320, 928], [352, 928], [384, 928], [416, 928], [448, 928], [480, 928], 
	[512, 928], [544, 928], [576, 928], [608, 928], [640, 928], [672, 928], 
	[704, 928], [736, 928], [768, 928], [800, 928], [832, 928], [832, 896], 
	[832, 864], [832, 832], [800, 832], [768, 832], [736, 832], [704, 832], 
	[672, 832], [672, 672], [672, 704], [672, 736], [672, 768], [672, 800], 
	[704, 640], [736, 640], [768, 640], [800, 640], [832, 640], [832, 672], 	
	[832, 704], [800, 736], [768, 736], [768, 768], [768, 800], [480, 896], 
	[480, 864], [480, 832], [512, 832], [544, 832], [576, 832], [576, 800], 
	[576, 768], [576, 736], [608, 736], [640, 736], [544, 736], [512, 736], 
	[480, 736], [448, 736], [416, 736], [288, 768], [288, 800], [288, 832], 
	[320, 832], [352, 832], [384, 832], [384, 864], [384, 896], [480, 640], 
	[480, 672], [480, 704], [512, 640], [576, 640], [608, 640], [640, 640], 
	[544, 640], [640, 160]];

		for (i in 0...coinsPos.length)
		{
			coin = new Coin(coinsPos[i][0], coinsPos[i][1]);
			coins.add(coin);
			#if debug
			trace(i);
			trace(coinsPos[i][0] + " " + coinsPos[i][1]);
			#end
		}
		
		return(coins);
	}
}