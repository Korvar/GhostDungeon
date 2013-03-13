package ;

import org.flixel.FlxGroup;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Mike Cugley
 */
class LayeredSprite extends FlxSprite
{
	public var layers:FlxGroup;

	// Layers is a list of graphic names that will be loaded into the sprite.  Layers[0] will be the "base"
	// layer that will be the actual sprite; the others will be in the FlxGroup "layers"
	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null, Layers:Array<String>, Width:Int = 0, Height:Int = 0) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(Layers[0], true, false, Width, Height); 
		
		layers = new FlxGroup();
		for (i in 1...Layers.length)
		{
			var tempSprite = new FlxSprite();
			tempSprite.loadGraphic(Layers[i], true, false, Width, Height);
			tempSprite.moves = false; // remove automatic movement, so it can be controlled by the base sprite
			tempSprite.ID = i;
			layers.add(tempSprite);
		}
		
		layers.sort("ID", FlxGroup.DESCENDING);
		
	}
	
	override public function addAnimation(Name:String, Frames:Array<Int>, FrameRate:Int = 0, Looped:Bool = true):Void
	{
		super.addAnimation(Name, Frames, FrameRate, Looped);
		for (layer in layers.members)
		{
			cast(layer, FlxSprite).addAnimation(Name, Frames, FrameRate, Looped);
		}
	}
	
	override public function play(AnimName:String, Force:Bool=false):Void
	{
		super.play(AnimName, Force);
		for (layer in layers.members)
		{
			cast(layer, FlxSprite).play(AnimName, Force);
		}
	}
	
	override public function update()
	{
		super.update();
		for (layer in layers.members)
		{
			cast(layer, FlxSprite).x = x;
			cast(layer, FlxSprite).y = y;
			cast(layer, FlxSprite).acceleration = acceleration;
			cast(layer, FlxSprite).alpha = alpha;
			cast(layer, FlxSprite).angle = angle;
			cast(layer, FlxSprite).facing = facing;
			
		}
	}
	
}