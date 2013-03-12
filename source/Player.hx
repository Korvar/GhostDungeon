package ;
import org.flixel.FlxGroup;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Mike Cugley
 */
class Player extends FlxGroup
{


	public function new() 
	{
		super();
		
		var behind:FlxSprite = new FlxSprite();
		var body:FlxSprite = new FlxSprite();
		var feet:FlxSprite = new FlxSprite();
		var legs:FlxSprite = new FlxSprite();
		var torso:FlxSprite = new FlxSprite();
		var belt:FlxSprite = new FlxSprite();
		var head:FlxSprite = new FlxSprite();
		var hands:FlxSprite = new FlxSprite();
		var weapon:FlxSprite = new FlxSprite();
		
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
		
		//add(behind);
		add(body);
		add(feet);
		add(legs);
		add(torso);
		add(belt);
		add(head);
		//add(hands);
		//add(weapon);
		
		sort("ID", FlxGroup.DESCENDING);
		
		for (item in members)
		{
			cast(item, FlxSprite).addAnimation("walkup", [1, 2, 3, 4, 5, 6, 7, 8], 8, true);
			cast(item, FlxSprite).addAnimation("walkleft", [10, 11, 12, 13, 14, 15, 16, 17], 8, true);
			cast(item, FlxSprite).addAnimation("walkdown", [19, 20, 21, 22, 23, 24, 25, 26], 8, true);			
			cast(item, FlxSprite).addAnimation("walkright", [28, 29, 30, 31, 32, 33, 34, 35], 8, true);			
			cast(item, FlxSprite).play("walkright");
			
		}
	}
	
}