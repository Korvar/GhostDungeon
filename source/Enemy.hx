package ;

/**
 * ...
 * @author Mike Cugley
 */

 import org.flixel.FlxPoint;
 import org.flixel.FlxState;
 import org.flixel.FlxTilemap;
 import org.flixel.FlxG;
 import org.flixel.FlxObject;
 import org.flixel.FlxSprite;
 
class Enemy extends LayeredSprite
{
	var DungeonWalls:FlxTilemap;
	var ScatterTarget:FlxPoint; // In tile scale, the point where the enemy will go in "scatter" mode
	
	static var ATTACK:Int = 0;
	static var SCATTER:Int = 1;
	static var FRIGHTENED:Int = 2;
	
	var dotcounter:Int; // Used for various AI purposes
	
	var player:Player;  // Used to get various bits of information about the player for AI purposes
	
	var mode:Int;  // Which mode the enemy is in, ATTACK, SCATTER or FRIGHTENED
	
	var reverse:Bool;  // Whether there is a "reverse" directive
	
	var target:FlxPoint;  // in tile scale, the current target of the enemy
		

	static private var runSpeed = 4;  // Needs to be a multiple of 2
	static private var margin = 1; 
	static private var size = 32;

	public function new(X:Float=0, Y:Float=0, SimpleGraphic:Dynamic=null, Layers:Array<String>, Width:Int=0, Height:Int=0) 
	{
		DungeonWalls = cast(FlxG.state, PlayState).DungeonWalls;
		
		// trace(SimpleGraphic);
		super(X, Y, SimpleGraphic, Layers, Width, Height);
		facing = FlxObject.RIGHT;
		width = size;
		height = size;
		centerOffsets(false);
		
		#if debug
		drawLine(x, y, x, y + height, 0xff0000, 2);
		drawLine(x, y + height, x + width, y + height, 0xff0000, 2);
		drawLine(x + width, y + height, x + width, y, 0xff0000, 2);
		drawLine(x + width, y, x, y, 0xff0000, 2);
		#end
	
		for (layer in layers.members)
		{
			var tmpSprite = cast(layer, FlxSprite);
			tmpSprite.width = size;
			tmpSprite.height = size;
			tmpSprite.centerOffsets(false);

		}
		
		moves = false; // Don't use the standard moving code
	}
	
	
	public function checkAI()
	{
		// Used to check which direction to go on coming to an intersection.
	}
	
}