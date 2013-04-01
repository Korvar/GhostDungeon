package ;
import org.flixel.FlxTilemap;

/**
 * ...
 * @author Mike Cugley
 */

class Registry 
{

	public static var player:Player;
	public static var blinky:Blinky;
	public static var inky:Inky;
	public static var pinky:Pinky;
	public static var clyde:Clyde;
	public static var DungeonWalls:FlxTilemap;
	
	public static var playerDead:Bool;
	public static var deathAnim:Bool;
	
	static public var ATTACK:Int = 0;
	static public var SCATTER:Int = 1;
	static public var FRIGHTENED:Int = 2;
	static public var CAGED:Int = 3;
	static public var RELEASED:Int = 4;
	static public var INCOMING:Int = 5;
	static public var DEAD:Int = 6;
	
	static public var message:String;
	
	public function new() 
	{
		
	}
	
}