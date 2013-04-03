package ;
import org.flixel.FlxPoint;
import org.flixel.FlxG;
import org.flixel.FlxU;
import org.flixel.FlxText;

/**
 * ...
 * @author Mike Cugley
 */
class Blinky extends Enemy
{
	var cruiseElroy:Bool = false;
	
	#if debug
	var tempTestText1:FlxText;
	var tempTestText2:FlxText;	
	#end	

	public function new(X:Float=0, Y:Float=0) 
	{
		var blinkyLayers:Array<String>;
		
		scatterTarget = new FlxPoint(26, -3);

		blinkyLayers = ["assets/data/Player/head/cloth_hood_male.png",
			"assets/data/Player/body/male/eyes/red.png",
			"assets/data/Player/belt/rope_male.png",
			"assets/data/Player/torso/brown_shirt_male.png",
			"assets/data/Player/legs/robe_skirt_male.png",
			"assets/data/Player/body/male/skeleton.png"];
			
		#if debug
		targetColour = 0xFFFF0000;
		#end
		

		
		super(X, Y, null, blinkyLayers, 64, 64);
		
		mode = Enemy.SCATTER;
		
		#if debug
		modeKey = "B";
		tempTestText1 = new FlxText(0, FlxG.height - 60, FlxG.width, "", 20);
		tempTestText2 = new FlxText(0, FlxG.height - 30, FlxG.width, "", 20);
		
		tempTestText1.color = tempTestText2.color = 0xffffff;
		tempTestText1.scrollFactor = tempTestText2.scrollFactor = new FlxPoint(0,0);
		FlxG.state.add(tempTestText1);
		FlxG.state.add(tempTestText2);
		
		#end
		
	}
	
	override function checkAI():FlxPoint
	{
		// Used to check which direction to go on coming to an intersection.
		// specifically find a tile target
		var target:FlxPoint = new FlxPoint();
		
		var player = cast(FlxG.state, PlayState).player;
		
		switch(mode)
		{
			case Enemy.ATTACK:
				{
					target.x = player.x;
					target.y = player.y;
					target.x = FlxU.floor(target.x / 32);
					target.y = FlxU.floor(target.y / 32);
				}
			case Enemy.SCATTER:
				if (cruiseElroy)
				{ 
					target.x = player.x;
					target.y = player.y;
					target.x = FlxU.floor(target.x / 32);
					target.y = FlxU.floor(target.y / 32);
				}
				else
				{
					target = scatterTarget;
				}
			case Enemy.FRIGHTENED:
				target = scatterTarget; // target isn't used, but set the variable just in case!
			case Enemy.DEAD:
				{
					target = super.checkAI();
				}
		}
		
		#if debug
		var tileX = FlxU.floor(x / 32);
		var tileY = FlxU.floor(y / 32);
		tempTestText1.text = Std.string(tileX) + " " + Std.string(tileY) + " -> " + Std.string(target.x) + " " + Std.string(target.y);
		#end
		
		return(target);
	}
	
	#if debug
	override private function chooseFacing(tileType:Int, tilePos:FlxPoint):Void
	{
		super.chooseFacing(tileType, tilePos);
		
		var distUp:Float;
		var distDown:Float;
		var distLeft:Float;
		var distRight:Float;
		
		var tileUp:FlxPoint = new FlxPoint(tilePos.x, tilePos.y - 1);
		var tileDown:FlxPoint = new FlxPoint(tilePos.x, tilePos.y + 1);
		var tileLeft:FlxPoint = new FlxPoint(tilePos.x - 1, tilePos.y);
		var tileRight:FlxPoint = new FlxPoint(tilePos.x + 1, tilePos.y);
		
		distUp = FlxU.getDistance(target, tileUp);
		distDown = FlxU.getDistance(target, tileDown);
		distLeft = FlxU.getDistance(target, tileLeft);
		distRight = FlxU.getDistance(target, tileRight);
		
		tempTestText2.text = FlxU.formatArray([FlxU.roundDecimal(distUp,2), FlxU.roundDecimal(distDown,2), FlxU.roundDecimal(distLeft,2), FlxU.roundDecimal(distRight,2)]);
		
	}
	#end
	
	override private function incomingEnemy():Void 
	{
		// Blinky never goes in the cage
		mode = cast(FlxG.state, PlayState).mode;
	}
	
	override public function resetEnemy()
	{
		super.resetEnemy();
		mode = cast(FlxG.state, PlayState).mode;
	}
}