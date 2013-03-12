package ;
import org.flixel.FlxGroup;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Mike Cugley
 */
class Player extends FlxGroup
{

	public var behind:FlxSprite;
	public var body:FlxSprite;
	public var feet:FlxSprite;
	public var legs:FlxSprite;
	public var torso:FlxSprite;
	public var belt:FlxSprite;
	public var head:FlxSprite;
	public var hands:FlxSprite;
	public var weapon:FlxSprite;

	public function new() 
	{
		super();
		
		behind = new FlxSprite();
		body = new FlxSprite();
		feet = new FlxSprite();
		legs = new FlxSprite();
		torso = new FlxSprite();
		belt = new FlxSprite();
		head = new FlxSprite();
		hands = new FlxSprite();
		weapon = new FlxSprite();
		
		weapon.loadGraphic("assets/data/Player/walkcycle/WEAPON_shield_cutout_body.png", true, false, 64, 64);
		hands.loadGraphic("assets/data/Player/walkcycle/HANDS_plate_armor_gloves.png", true, false, 64, 64);
		head.loadGraphic("assets/data/Player/walkcycle/HEAD_chain_armor_hood.png", true, false, 64, 64);
		belt.loadGraphic("assets/data/Player/walkcycle/BELT_leather.png", true, false, 64, 64);
		torso.loadGraphic("assets/data/Player/walkcycle/TORSO_chain_armor_torso.png", true, false, 64, 64);
		legs.loadGraphic("assets/data/Player/walkcycle/LEGS_pants_greenish.png", true, false, 64, 64);
		feet.loadGraphic("assets/data/Player/walkcycle/FEET_shoes_brown.png", true, false, 64, 64);
		body.loadGraphic("assets/data/Player/walkcycle/BODY_male.png", true, false, 64, 64);
		behind.loadGraphic("assets/data/Player/walkcycle/BEHIND_quiver.png", true, false, 64, 64);
		
		weapon.ID = 1;
		hands.ID = 2;
		head.ID = 3;
		belt.ID = 4;
		torso.ID = 5;
		legs.ID = 6;
		feet.ID = 7;
		body.ID = 8;
		behind.ID = 9;
		
		// add(behind);
		add(body);
		add(feet);
		add(legs);
		add(torso);
		add(belt);
		add(head);
		//add(hands);
		//add(weapon);


		sort("ID", FlxGroup.DESCENDING);
		
		addAnimation("walkup", [1, 2, 3, 4, 5, 6, 7, 8], 16, true);
		addAnimation("walkleft", [10, 11, 12, 13, 14, 15, 16, 17], 16, true);
		addAnimation("walkdown", [19, 20, 21, 22, 23, 24, 25, 26], 16, true);			
		addAnimation("walkright", [28, 29, 30, 31, 32, 33, 34, 35], 16, true);			
		play("walkright");
			

	}
	
	public function addAnimation(name:String, frames:Array<Int>, frameRate:Int, looping:Bool)
	{
		for (item in members)
		{
			cast(item, FlxSprite).addAnimation(name, frames, frameRate, looping);
		}
	}
	
	public function play(AnimName:String, Force:Bool = false)
	{
		for (item in members)
		{
			cast(item, FlxSprite).play(AnimName, Force);
		}
	}
	
	override public function update()
	{
		super.update();
		
		
		
	}
	
}