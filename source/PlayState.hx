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
import org.flixel.FlxU;
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
	
	public var player:Player;
	
	var blinky:Blinky;
	var pinky:Pinky;
	var inky:Enemy;
	var clyde:Enemy;
	
	var enemies:FlxGroup;
	
	public var DungeonWalls:FlxTilemap;
	
	var coins:FlxGroup;
	var powerPills:FlxGroup;
	
	public var mode:Int;
	
	var dotsLeft:Int;
	var dotsEaten:Int;
	
	var enemyKillScore:Int = 200;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void
	{
		FlxG.mouse.hide();
		
		// Load the tilemap
		DungeonWalls = new FlxTilemap();
		DungeonWalls.loadMap(Assets.getText("assets/data/Dungeon_Walls.csv"), "assets/data/GhostDungeonTiles.png", 32, 32);
		// Because I didn't set up my tilemap 100% properly, set some tile properties.
		DungeonWalls.setTileProperties(28, FlxObject.NONE); // Intersection
		DungeonWalls.setTileProperties(29, FlxObject.NONE); // Intersection where the enemies won't go up.
		DungeonWalls.setTileProperties(30, FlxObject.NONE); // Monsters are slow
		
		FlxG.width = 640;
		FlxG.height = 480;
		
		add(DungeonWalls);
				
		coins = setupCoins();
		add(coins);
		dotsLeft = coins.countLiving();
		
		powerPills = setupPowerPills();
		add(powerPills);
		
		player = setUpPlayer();

		add(player.layers);
		add(player);

		
		FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN);
		FlxG.camera.setBounds(0, 0, DungeonWalls.width, DungeonWalls.height, true);
		
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
		
		enemies = new FlxGroup();
		
		blinky = new Blinky(448, 352);
		add(blinky.layers); //The layers get added to the Playstate, but not the enemies list.
							// Otherwise they will collide with the player and that would be a pain.
		enemies.add(blinky);
		
		pinky = new Pinky(416, 448);
		enemies.add(pinky);
		add(pinky.layers);
		
		// inky = new Inky(416, 416, blinky);
		inky = new Inky(448, 448, blinky);
		enemies.add(inky);
		add(inky.layers);
		
		clyde = new Clyde(512, 416);
		enemies.add(clyde);
		add(clyde.layers);
		
		add(enemies);
		FlxG.watch(clyde, "mode");
		FlxG.watch(clyde, "x");
		FlxG.watch(clyde, "y");
		FlxG.watch(clyde, "pathSpeed");
		FlxG.watch(clyde, "pathAngle");
		FlxG.watch(clyde, "path");
		mode = Enemy.SCATTER;

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
	
	override public function update():Void
	{
		
		super.update();
		
		
		FlxG.overlap(player, coins, coinCollect);
		FlxG.overlap(player, powerPills, pillCollect);
		FlxG.overlap(player, enemies, enemyCollide);
		
		#if debug
		if (FlxG.keys.justPressed("M"))
		{
			// cycle through ATTACK, SCATTER and FRIGHTENED
			setMode((mode + 1) % 3);
		}
		
		if (FlxG.keys.justPressed("R"))
		{
			resetEnemies();
		}

		switch(mode)
		{
				case Enemy.ATTACK:
					tempTestText1.text = "ATTACK!";
				case Enemy.SCATTER:
					tempTestText1.text = "SCATTER!";
				case Enemy.FRIGHTENED:
					tempTestText1.text = "FRIGHTENED!";
				case Enemy.CAGED:
					tempTestText1.text = "CAGED!";
				case Enemy.RELEASED:
					tempTestText1.text = "RELEASED!";
				case Enemy.INCOMING:
					tempTestText1.text = "INCOMING!";
				case Enemy.DEAD:
					tempTestText1.text = "DEAD!";
		}
		

		tempTestText2.text = Std.string(FlxG.score) + " " + Std.string(coins.countLiving()) + " " + Std.string(coins.countDead());

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
		}
		
		return(coins);
	}
	
	function resetCoins():Void
	{
		for (coin in coins.members)
		{
			coin.revive();
		}
	}
	
	function resetEnemies():Void
	{
		for (enemy in [blinky, pinky, inky, clyde])
		{
			enemy.resetEnemy();
		}
	}
	
	private function coinCollect(player:FlxObject, coin:FlxObject):Void
	{
		coin.kill();
		FlxG.score += 10;
		FlxG.play("assets/data/completetask_0.mp3");
	}
	
	private function pillCollect(player:FlxObject, pill:FlxObject):Void
	{
		pill.kill();
		FlxG.score += 50;
		FlxG.play("assets/data/completetask_0.mp3");
		setMode(Enemy.FRIGHTENED);
		enemyKillScore = 200;
	}
	
	private function setupPowerPills()
	{
		var powerPills:FlxGroup = new FlxGroup();
		var pillsPos:Array<Array<Int>>;
		var pill:FlxSprite; 
		
		pillsPos = [[832, 736], [32, 736], [832, 96], [32, 96]];
		for (i in 0...pillsPos.length)
		{
			pill = new Crystal(pillsPos[i][0],  pillsPos[i][1]);
			powerPills.add(pill);
		}
		return powerPills;
	}
	
	private function setMode(Mode:Int):Void 
	{
		mode = Mode;
		for (enemy in [blinky, inky, pinky, clyde])
		{
			enemy.setMode(Mode);
		}
	}
	
	private function enemyCollide(player:FlxObject, enemyObject:FlxObject):Void
	{
		var enemy:Enemy = cast(enemyObject, Enemy);
		if (mode == Enemy.FRIGHTENED && enemy.getMode() != Enemy.DEAD)
		{
			  enemy.setMode(Enemy.DEAD);
			  FlxG.score += enemyKillScore;
			  enemyKillScore *= 2;
		}
	}
}