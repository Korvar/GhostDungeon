package ;
import org.flixel.FlxState;
import org.flixel.FlxTilemap;
import nme.Assets;

/**
 * ...
 * @author Mike Cugley
 */
class PlayState extends FlxState
{

	public function new() 
	{
		super();
		// Load the tilemap
		var DungeonWalls = new FlxTilemap();
		DungeonWalls.loadMap(Assets.getText("assets/data/Dungeon_Walls.csv"), "assets/data/GhostDungeonTiles.png", 32, 32);
		add(DungeonWalls);
	}
	
}