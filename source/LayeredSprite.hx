package ;

import org.flixel.FlxGroup;
import org.flixel.FlxSprite;
import org.flixel.FlxTypedGroup;
import nme.Assets;

/**
 * ...
 * @author Mike Cugley
 */
class LayeredSprite extends FlxSprite
{

	var walkUpAnim:Array<Int>;
	var walkLeftAnim:Array<Int>; 
	var walkDownAnim:Array<Int>;		
	var walkRightAnim:Array<Int>;
	var castUpAnim:Array<Int>;
	var castLeftAnim:Array<Int>;
	var castDownAnim:Array<Int>;
	var castRightAnim:Array<Int>;
	var slashUpAnim:Array<Int>;
	var slashLeftAnim:Array<Int>;
	var slashDownAnim:Array<Int>;
	var slashRightAnim:Array<Int>;
	var hurtAnim:Array<Int>;
	var deadAnim:Array<Int>;
	var faceUpAnim:Array<Int>;
	var faceLeftAnim:Array<Int>;
	var faceDownAnim:Array<Int>;
	var faceRightAnim:Array<Int>;
	
	public var layers:FlxGroup;

	// "Layers" is a list of graphic names that will be loaded into the sprite.  Layers[0] will be the "base"
	// layer that will be the actual sprite; the others will be in the FlxGroup "layers"
	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null, Layers:Array<String>, Width:Int = 0, Height:Int = 0) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(Layers[0], true, false, Width, Height); 
		
		layers = new FlxGroup();
		for (i in 1...Layers.length)
		{
			var tempSprite = new FlxSprite();
			tempSprite.loadGraphic(Assets.getBitmapData(Layers[i]), true, false, Width, Height);
			tempSprite.moves = false; // remove automatic movement; layers are controlled by the base sprite
			tempSprite.ID = i;
			layers.add(tempSprite);
		}
		
		layers.sort("ID", FlxTypedGroup.DESCENDING);
		
		setUpAnimations();
		
	}
	

	override public function addAnimation(Name:String, Frames:Array<Int>, FrameRate:Int = 0, Looped:Bool = true):Void
	{
		// trace("Animation added: " + Name);
		// trace(Frames);
		super.addAnimation(Name, Frames, FrameRate, Looped);
		for (layer in layers.members)
		{
			cast(layer, FlxSprite).addAnimation(Name, Frames, FrameRate, Looped);
		}
	}
	
	override public function play(AnimName:String, Force:Bool = false):Void
	{
		// trace(AnimName);
		super.play(AnimName, Force);
		// trace("Did I at least get this far?");
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
	
	private function setUpAnimations():Void 
	{
			
		walkUpAnim = new Array<Int>();
		walkLeftAnim = new Array<Int>();
		walkDownAnim = new Array<Int>();
		walkRightAnim = new Array<Int>();
		castUpAnim = new Array<Int>();
		castLeftAnim = new Array<Int>();
		castDownAnim = new Array<Int>();
		castRightAnim = new Array<Int>();
		slashUpAnim = new Array<Int>();
		slashLeftAnim = new Array<Int>();
		slashDownAnim = new Array<Int>();
		slashRightAnim = new Array<Int>();
		hurtAnim = new Array<Int>();
		deadAnim = new Array<Int>();
		faceUpAnim = new Array<Int>();
		faceLeftAnim = new Array<Int>();
		faceDownAnim = new Array<Int>();
		faceRightAnim = new Array<Int>();
	
		walkUpAnim = [105, 106, 107, 108, 109, 110, 111, 112];
		walkLeftAnim = [118, 119, 120, 121, 122, 123, 124, 125];
		walkDownAnim = [131, 132, 133, 134, 135, 136, 137, 138];			
		walkRightAnim = [144, 145, 146, 147, 148, 149, 150, 151];
		castUpAnim = [0, 1, 2, 3, 4, 5, 6];
		castLeftAnim = [13, 14, 15, 16, 17, 18, 19];
		castDownAnim = [26, 27, 28, 29, 30, 31, 32];
		castRightAnim = [39, 40, 41, 42, 43, 44, 45];
		slashUpAnim = [156, 157, 158, 158, 160, 161];
		slashLeftAnim = [169, 170, 171, 172, 173, 174];
		slashDownAnim = [182, 183, 184, 185, 186, 187];
		slashRightAnim = [195, 196, 197, 198, 199, 200];
		hurtAnim = [260, 261, 262, 263, 264, 265];
		deadAnim = [265];
		faceUpAnim = [0,0];
		faceLeftAnim = [13,13];
		faceDownAnim = [26,26];
		faceRightAnim = [39,39];
		
		addAnimation("walkup", walkUpAnim, 16, true);
		addAnimation("walkleft", walkLeftAnim, 16, true);
		addAnimation("walkdown", walkDownAnim, 16, true);			
		addAnimation("walkright", walkRightAnim, 16, true);
		addAnimation("castup", castUpAnim, 16, true);
		addAnimation("castleft", castLeftAnim, 16, true);
		addAnimation("castdown", castDownAnim, 16, true);
		addAnimation("castright", castRightAnim, 16, true);
		addAnimation("slashup", slashUpAnim, 16, true);
		addAnimation("slashleft", slashLeftAnim, 16, true);
		addAnimation("slashdown", slashDownAnim, 16, true);
		addAnimation("slashright", slashRightAnim, 16, true);
		addAnimation("hurt", hurtAnim, 16, false);
		addAnimation("dead", deadAnim, 16, true);
		addAnimation("faceup", faceUpAnim, 16, false);
		addAnimation("faceleft", faceLeftAnim, 16, false);
		addAnimation("facedown", faceDownAnim, 16, false);
		addAnimation("faceright", faceRightAnim, 16, false);
	}
	
}