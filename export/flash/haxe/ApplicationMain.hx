#if nme

import Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new org.flixel.system.FlxPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		#if !fdb
		haxe.Log.trace = flashTrace;
		#end
		
		if (call_real)
			begin ();
	}

	#if !fdb
	private static function flashTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
		var className = pos.className.substr(pos.className.lastIndexOf('.') + 1);
		var message = className+"::"+pos.methodName+":"+pos.lineNumber+": " + v;
		
        if (flash.external.ExternalInterface.available)
			flash.external.ExternalInterface.call("console.log", message);
		else untyped flash.Boot.__trace(v, pos);
    }
	#end
	
	private static function begin () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, nme.display.DisplayObject)) {
				nme.Lib.current.addChild(cast instance);
			}	
		}
		
	}

	static function onEnter (_) {
		
		var loaded = nme.Lib.current.loaderInfo.bytesLoaded;
		var total = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="Beep")
			 
            return Assets.getSound ("Beep");
         
		
		if (inName=="assets/data/autotiles.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles.png");
         
		
		if (inName=="assets/data/autotiles_alt.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles_alt.png");
         
		
		if (inName=="assets/data/base.png")
			 
            return Assets.getBitmapData ("assets/data/base.png");
         
		
		if (inName=="assets/data/beep.mp3")
			 
            return Assets.getSound ("assets/data/beep.mp3");
		 
		
		if (inName=="assets/data/button.png")
			 
            return Assets.getBitmapData ("assets/data/button.png");
         
		
		if (inName=="assets/data/button_a.png")
			 
            return Assets.getBitmapData ("assets/data/button_a.png");
         
		
		if (inName=="assets/data/button_b.png")
			 
            return Assets.getBitmapData ("assets/data/button_b.png");
         
		
		if (inName=="assets/data/button_c.png")
			 
            return Assets.getBitmapData ("assets/data/button_c.png");
         
		
		if (inName=="assets/data/button_down.png")
			 
            return Assets.getBitmapData ("assets/data/button_down.png");
         
		
		if (inName=="assets/data/button_left.png")
			 
            return Assets.getBitmapData ("assets/data/button_left.png");
         
		
		if (inName=="assets/data/button_right.png")
			 
            return Assets.getBitmapData ("assets/data/button_right.png");
         
		
		if (inName=="assets/data/button_up.png")
			 
            return Assets.getBitmapData ("assets/data/button_up.png");
         
		
		if (inName=="assets/data/button_x.png")
			 
            return Assets.getBitmapData ("assets/data/button_x.png");
         
		
		if (inName=="assets/data/button_y.png")
			 
            return Assets.getBitmapData ("assets/data/button_y.png");
         
		
		if (inName=="assets/data/courier.ttf")
			 
			 return Assets.getFont ("assets/data/courier.ttf");
		 
		
		if (inName=="assets/data/cursor.png")
			 
            return Assets.getBitmapData ("assets/data/cursor.png");
         
		
		if (inName=="assets/data/default.png")
			 
            return Assets.getBitmapData ("assets/data/default.png");
         
		
		if (inName=="assets/data/Dungeon_Walls.csv")
			 
			 return Assets.getText ("assets/data/Dungeon_Walls.csv");
         
		
		if (inName=="assets/data/fontData10pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData10pt.png");
         
		
		if (inName=="assets/data/fontData11pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData11pt.png");
         
		
		if (inName=="assets/data/GhostDungeonTiles.png")
			 
            return Assets.getBitmapData ("assets/data/GhostDungeonTiles.png");
         
		
		if (inName=="assets/data/handle.png")
			 
            return Assets.getBitmapData ("assets/data/handle.png");
         
		
		if (inName=="assets/data/logo.png")
			 
            return Assets.getBitmapData ("assets/data/logo.png");
         
		
		if (inName=="assets/data/logo_corners.png")
			 
            return Assets.getBitmapData ("assets/data/logo_corners.png");
         
		
		if (inName=="assets/data/logo_light.png")
			 
            return Assets.getBitmapData ("assets/data/logo_light.png");
         
		
		if (inName=="assets/data/nokiafc22.ttf")
			 
			 return Assets.getFont ("assets/data/nokiafc22.ttf");
		 
		
		if (inName=="assets/data/Player/bow/BELT_leather.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/BELT_leather.png");
         
		
		if (inName=="assets/data/Player/bow/BELT_rope.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/BELT_rope.png");
         
		
		if (inName=="assets/data/Player/bow/BODY_animation.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/BODY_animation.png");
         
		
		if (inName=="assets/data/Player/bow/FEET_plate_armor_shoes.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/FEET_plate_armor_shoes.png");
         
		
		if (inName=="assets/data/Player/bow/FEET_shoes_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/FEET_shoes_brown.png");
         
		
		if (inName=="assets/data/Player/bow/HANDS_plate_armor_gloves.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/HANDS_plate_armor_gloves.png");
         
		
		if (inName=="assets/data/Player/bow/HEAD_chain_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/HEAD_chain_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/bow/HEAD_chain_armor_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/HEAD_chain_armor_hood.png");
         
		
		if (inName=="assets/data/Player/bow/HEAD_hair_blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/HEAD_hair_blonde.png");
         
		
		if (inName=="assets/data/Player/bow/HEAD_leather_armor_hat.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/HEAD_leather_armor_hat.png");
         
		
		if (inName=="assets/data/Player/bow/HEAD_plate_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/HEAD_plate_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/bow/HEAD_robe_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/HEAD_robe_hood.png");
         
		
		if (inName=="assets/data/Player/bow/LEGS_pants_greenish.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/LEGS_pants_greenish.png");
         
		
		if (inName=="assets/data/Player/bow/LEGS_plate_armor_pants.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/LEGS_plate_armor_pants.png");
         
		
		if (inName=="assets/data/Player/bow/LEGS_robe_skirt.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/LEGS_robe_skirt.png");
         
		
		if (inName=="assets/data/Player/bow/TORSO_chain_armor_jacket_purple.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/TORSO_chain_armor_jacket_purple.png");
         
		
		if (inName=="assets/data/Player/bow/TORSO_chain_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/TORSO_chain_armor_torso.png");
         
		
		if (inName=="assets/data/Player/bow/TORSO_leather_armor_bracers.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/TORSO_leather_armor_bracers.png");
         
		
		if (inName=="assets/data/Player/bow/TORSO_leather_armor_shirt_white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/TORSO_leather_armor_shirt_white.png");
         
		
		if (inName=="assets/data/Player/bow/TORSO_leather_armor_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/TORSO_leather_armor_shoulders.png");
         
		
		if (inName=="assets/data/Player/bow/TORSO_leather_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/TORSO_leather_armor_torso.png");
         
		
		if (inName=="assets/data/Player/bow/TORSO_plate_armor_arms_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/TORSO_plate_armor_arms_shoulders.png");
         
		
		if (inName=="assets/data/Player/bow/TORSO_plate_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/TORSO_plate_armor_torso.png");
         
		
		if (inName=="assets/data/Player/bow/TORSO_robe_shirt_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/TORSO_robe_shirt_brown.png");
         
		
		if (inName=="assets/data/Player/bow/WEAPON_arrow.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/WEAPON_arrow.png");
         
		
		if (inName=="assets/data/Player/bow/WEAPON_bow.png")
			 
            return Assets.getBitmapData ("assets/data/Player/bow/WEAPON_bow.png");
         
		
		if (inName=="assets/data/Player/combat_dummy/BODY_animation.png")
			 
            return Assets.getBitmapData ("assets/data/Player/combat_dummy/BODY_animation.png");
         
		
		if (inName=="assets/data/Player/hurt/BEHIND_quiver.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/BEHIND_quiver.png");
         
		
		if (inName=="assets/data/Player/hurt/BELT_leather.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/BELT_leather.png");
         
		
		if (inName=="assets/data/Player/hurt/BELT_rope.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/BELT_rope.png");
         
		
		if (inName=="assets/data/Player/hurt/BODY_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/BODY_male.png");
         
		
		if (inName=="assets/data/Player/hurt/BODY_skeleton.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/BODY_skeleton.png");
         
		
		if (inName=="assets/data/Player/hurt/FEET_plate_armor_shoes.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/FEET_plate_armor_shoes.png");
         
		
		if (inName=="assets/data/Player/hurt/FEET_shoes_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/FEET_shoes_brown.png");
         
		
		if (inName=="assets/data/Player/hurt/HANDS_plate_armor_gloves.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/HANDS_plate_armor_gloves.png");
         
		
		if (inName=="assets/data/Player/hurt/HEAD_chain_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/HEAD_chain_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/hurt/HEAD_chain_armor_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/HEAD_chain_armor_hood.png");
         
		
		if (inName=="assets/data/Player/hurt/HEAD_hair_blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/HEAD_hair_blonde.png");
         
		
		if (inName=="assets/data/Player/hurt/HEAD_leather_armor_hat.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/HEAD_leather_armor_hat.png");
         
		
		if (inName=="assets/data/Player/hurt/HEAD_plate_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/HEAD_plate_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/hurt/HEAD_robe_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/HEAD_robe_hood.png");
         
		
		if (inName=="assets/data/Player/hurt/LEGS_pants_greenish.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/LEGS_pants_greenish.png");
         
		
		if (inName=="assets/data/Player/hurt/LEGS_plate_armor_pants.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/LEGS_plate_armor_pants.png");
         
		
		if (inName=="assets/data/Player/hurt/LEGS_robe_skirt.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/LEGS_robe_skirt.png");
         
		
		if (inName=="assets/data/Player/hurt/TORSO_chain_armor_jacket_purple.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/TORSO_chain_armor_jacket_purple.png");
         
		
		if (inName=="assets/data/Player/hurt/TORSO_chain_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/TORSO_chain_armor_torso.png");
         
		
		if (inName=="assets/data/Player/hurt/TORSO_leather_armor_bracers.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/TORSO_leather_armor_bracers.png");
         
		
		if (inName=="assets/data/Player/hurt/TORSO_leather_armor_shirt_white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/TORSO_leather_armor_shirt_white.png");
         
		
		if (inName=="assets/data/Player/hurt/TORSO_leather_armor_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/TORSO_leather_armor_shoulders.png");
         
		
		if (inName=="assets/data/Player/hurt/TORSO_leather_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/TORSO_leather_armor_torso.png");
         
		
		if (inName=="assets/data/Player/hurt/TORSO_plate_armor_arms_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/TORSO_plate_armor_arms_shoulders.png");
         
		
		if (inName=="assets/data/Player/hurt/TORSO_plate_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/TORSO_plate_armor_torso.png");
         
		
		if (inName=="assets/data/Player/hurt/TORSO_robe_shirt_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hurt/TORSO_robe_shirt_brown.png");
         
		
		if (inName=="assets/data/Player/slash/BEHIND_quiver.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/BEHIND_quiver.png");
         
		
		if (inName=="assets/data/Player/slash/BELT_leather.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/BELT_leather.png");
         
		
		if (inName=="assets/data/Player/slash/BELT_rope.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/BELT_rope.png");
         
		
		if (inName=="assets/data/Player/slash/BODY_human.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/BODY_human.png");
         
		
		if (inName=="assets/data/Player/slash/BODY_skeleton.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/BODY_skeleton.png");
         
		
		if (inName=="assets/data/Player/slash/FEET_plate_armor_shoes.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/FEET_plate_armor_shoes.png");
         
		
		if (inName=="assets/data/Player/slash/FEET_shoes_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/FEET_shoes_brown.png");
         
		
		if (inName=="assets/data/Player/slash/HANDS_plate_armor_gloves.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/HANDS_plate_armor_gloves.png");
         
		
		if (inName=="assets/data/Player/slash/HEAD_chain_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/HEAD_chain_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/slash/HEAD_chain_armor_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/HEAD_chain_armor_hood.png");
         
		
		if (inName=="assets/data/Player/slash/HEAD_hair_blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/HEAD_hair_blonde.png");
         
		
		if (inName=="assets/data/Player/slash/HEAD_leather_armor_hat.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/HEAD_leather_armor_hat.png");
         
		
		if (inName=="assets/data/Player/slash/HEAD_plate_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/HEAD_plate_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/slash/HEAD_robe_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/HEAD_robe_hood.png");
         
		
		if (inName=="assets/data/Player/slash/LEGS_pants_greenish.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/LEGS_pants_greenish.png");
         
		
		if (inName=="assets/data/Player/slash/LEGS_plate_armor_pants.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/LEGS_plate_armor_pants.png");
         
		
		if (inName=="assets/data/Player/slash/LEGS_robe_skirt.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/LEGS_robe_skirt.png");
         
		
		if (inName=="assets/data/Player/slash/TORSO_chain_armor_jacket_purple.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/TORSO_chain_armor_jacket_purple.png");
         
		
		if (inName=="assets/data/Player/slash/TORSO_chain_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/TORSO_chain_armor_torso.png");
         
		
		if (inName=="assets/data/Player/slash/TORSO_leather_armor_bracers.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/TORSO_leather_armor_bracers.png");
         
		
		if (inName=="assets/data/Player/slash/TORSO_leather_armor_shirt_white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/TORSO_leather_armor_shirt_white.png");
         
		
		if (inName=="assets/data/Player/slash/TORSO_leather_armor_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/TORSO_leather_armor_shoulders.png");
         
		
		if (inName=="assets/data/Player/slash/TORSO_leather_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/TORSO_leather_armor_torso.png");
         
		
		if (inName=="assets/data/Player/slash/TORSO_plate_armor_arms_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/TORSO_plate_armor_arms_shoulders.png");
         
		
		if (inName=="assets/data/Player/slash/TORSO_plate_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/TORSO_plate_armor_torso.png");
         
		
		if (inName=="assets/data/Player/slash/TORSO_robe_shirt_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/TORSO_robe_shirt_brown.png");
         
		
		if (inName=="assets/data/Player/slash/WEAPON_dagger.png")
			 
            return Assets.getBitmapData ("assets/data/Player/slash/WEAPON_dagger.png");
         
		
		if (inName=="assets/data/Player/spellcast/BEHIND_quiver.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/BEHIND_quiver.png");
         
		
		if (inName=="assets/data/Player/spellcast/BELT_leather.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/BELT_leather.png");
         
		
		if (inName=="assets/data/Player/spellcast/BELT_rope.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/BELT_rope.png");
         
		
		if (inName=="assets/data/Player/spellcast/BODY_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/BODY_male.png");
         
		
		if (inName=="assets/data/Player/spellcast/BODY_skeleton.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/BODY_skeleton.png");
         
		
		if (inName=="assets/data/Player/spellcast/FEET_plate_armor_shoes.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/FEET_plate_armor_shoes.png");
         
		
		if (inName=="assets/data/Player/spellcast/FEET_shoes_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/FEET_shoes_brown.png");
         
		
		if (inName=="assets/data/Player/spellcast/HANDS_plate_armor_gloves.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/HANDS_plate_armor_gloves.png");
         
		
		if (inName=="assets/data/Player/spellcast/HEAD_chain_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/HEAD_chain_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/spellcast/HEAD_chain_armor_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/HEAD_chain_armor_hood.png");
         
		
		if (inName=="assets/data/Player/spellcast/HEAD_hair_blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/HEAD_hair_blonde.png");
         
		
		if (inName=="assets/data/Player/spellcast/HEAD_leather_armor_hat.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/HEAD_leather_armor_hat.png");
         
		
		if (inName=="assets/data/Player/spellcast/HEAD_plate_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/HEAD_plate_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/spellcast/HEAD_robe_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/HEAD_robe_hood.png");
         
		
		if (inName=="assets/data/Player/spellcast/HEAD_skeleton_eye_glow.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/HEAD_skeleton_eye_glow.png");
         
		
		if (inName=="assets/data/Player/spellcast/LEGS_pants_greenish.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/LEGS_pants_greenish.png");
         
		
		if (inName=="assets/data/Player/spellcast/LEGS_plate_armor_pants.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/LEGS_plate_armor_pants.png");
         
		
		if (inName=="assets/data/Player/spellcast/LEGS_robe_skirt.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/LEGS_robe_skirt.png");
         
		
		if (inName=="assets/data/Player/spellcast/TORSO_chain_armor_jacket_purple.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/TORSO_chain_armor_jacket_purple.png");
         
		
		if (inName=="assets/data/Player/spellcast/TORSO_chain_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/TORSO_chain_armor_torso.png");
         
		
		if (inName=="assets/data/Player/spellcast/TORSO_leather_armor_bracers.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/TORSO_leather_armor_bracers.png");
         
		
		if (inName=="assets/data/Player/spellcast/TORSO_leather_armor_shirt_white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/TORSO_leather_armor_shirt_white.png");
         
		
		if (inName=="assets/data/Player/spellcast/TORSO_leather_armor_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/TORSO_leather_armor_shoulders.png");
         
		
		if (inName=="assets/data/Player/spellcast/TORSO_leather_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/TORSO_leather_armor_torso.png");
         
		
		if (inName=="assets/data/Player/spellcast/TORSO_plate_armor_arms_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/TORSO_plate_armor_arms_shoulders.png");
         
		
		if (inName=="assets/data/Player/spellcast/TORSO_plate_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/TORSO_plate_armor_torso.png");
         
		
		if (inName=="assets/data/Player/spellcast/TORSO_robe_shirt_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/spellcast/TORSO_robe_shirt_brown.png");
         
		
		if (inName=="assets/data/Player/thrust/BEHIND_quiver.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/BEHIND_quiver.png");
         
		
		if (inName=="assets/data/Player/thrust/BELT_leather.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/BELT_leather.png");
         
		
		if (inName=="assets/data/Player/thrust/BELT_rope.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/BELT_rope.png");
         
		
		if (inName=="assets/data/Player/thrust/BODY_animation.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/BODY_animation.png");
         
		
		if (inName=="assets/data/Player/thrust/FEET_plate_armor_shoes.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/FEET_plate_armor_shoes.png");
         
		
		if (inName=="assets/data/Player/thrust/FEET_shoes_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/FEET_shoes_brown.png");
         
		
		if (inName=="assets/data/Player/thrust/HANDS_plate_armor_gloves.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/HANDS_plate_armor_gloves.png");
         
		
		if (inName=="assets/data/Player/thrust/HEAD_chain_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/HEAD_chain_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/thrust/HEAD_chain_armor_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/HEAD_chain_armor_hood.png");
         
		
		if (inName=="assets/data/Player/thrust/HEAD_hair_blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/HEAD_hair_blonde.png");
         
		
		if (inName=="assets/data/Player/thrust/HEAD_leather_armor_hat.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/HEAD_leather_armor_hat.png");
         
		
		if (inName=="assets/data/Player/thrust/HEAD_plate_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/HEAD_plate_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/thrust/HEAD_robe_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/HEAD_robe_hood.png");
         
		
		if (inName=="assets/data/Player/thrust/LEGS_pants_greenish.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/LEGS_pants_greenish.png");
         
		
		if (inName=="assets/data/Player/thrust/LEGS_plate_armor_pants.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/LEGS_plate_armor_pants.png");
         
		
		if (inName=="assets/data/Player/thrust/LEGS_robe_skirt.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/LEGS_robe_skirt.png");
         
		
		if (inName=="assets/data/Player/thrust/TORSO_chain_armor_jacket_purple.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/TORSO_chain_armor_jacket_purple.png");
         
		
		if (inName=="assets/data/Player/thrust/TORSO_chain_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/TORSO_chain_armor_torso.png");
         
		
		if (inName=="assets/data/Player/thrust/TORSO_leather_armor_bracers.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/TORSO_leather_armor_bracers.png");
         
		
		if (inName=="assets/data/Player/thrust/TORSO_leather_armor_shirt_white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/TORSO_leather_armor_shirt_white.png");
         
		
		if (inName=="assets/data/Player/thrust/TORSO_leather_armor_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/TORSO_leather_armor_shoulders.png");
         
		
		if (inName=="assets/data/Player/thrust/TORSO_leather_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/TORSO_leather_armor_torso.png");
         
		
		if (inName=="assets/data/Player/thrust/TORSO_plate_armor_arms_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/TORSO_plate_armor_arms_shoulders.png");
         
		
		if (inName=="assets/data/Player/thrust/TORSO_plate_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/TORSO_plate_armor_torso.png");
         
		
		if (inName=="assets/data/Player/thrust/TORSO_robe_shirt_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/TORSO_robe_shirt_brown.png");
         
		
		if (inName=="assets/data/Player/thrust/WEAPON_shield_cutout_body.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/WEAPON_shield_cutout_body.png");
         
		
		if (inName=="assets/data/Player/thrust/WEAPON_shield_cutout_chain_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/WEAPON_shield_cutout_chain_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/thrust/WEAPON_spear.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/WEAPON_spear.png");
         
		
		if (inName=="assets/data/Player/thrust/WEAPON_staff.png")
			 
            return Assets.getBitmapData ("assets/data/Player/thrust/WEAPON_staff.png");
         
		
		if (inName=="assets/data/Player/walkcycle/BEHIND_quiver.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/BEHIND_quiver.png");
         
		
		if (inName=="assets/data/Player/walkcycle/BELT_leather.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/BELT_leather.png");
         
		
		if (inName=="assets/data/Player/walkcycle/BELT_rope.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/BELT_rope.png");
         
		
		if (inName=="assets/data/Player/walkcycle/BODY_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/BODY_male.png");
         
		
		if (inName=="assets/data/Player/walkcycle/BODY_skeleton.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/BODY_skeleton.png");
         
		
		if (inName=="assets/data/Player/walkcycle/FEET_plate_armor_shoes.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/FEET_plate_armor_shoes.png");
         
		
		if (inName=="assets/data/Player/walkcycle/FEET_shoes_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/FEET_shoes_brown.png");
         
		
		if (inName=="assets/data/Player/walkcycle/HANDS_plate_armor_gloves.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/HANDS_plate_armor_gloves.png");
         
		
		if (inName=="assets/data/Player/walkcycle/HEAD_chain_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/HEAD_chain_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/walkcycle/HEAD_chain_armor_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/HEAD_chain_armor_hood.png");
         
		
		if (inName=="assets/data/Player/walkcycle/HEAD_hair_blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/HEAD_hair_blonde.png");
         
		
		if (inName=="assets/data/Player/walkcycle/HEAD_leather_armor_hat.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/HEAD_leather_armor_hat.png");
         
		
		if (inName=="assets/data/Player/walkcycle/HEAD_plate_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/HEAD_plate_armor_helmet.png");
         
		
		if (inName=="assets/data/Player/walkcycle/HEAD_robe_hood.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/HEAD_robe_hood.png");
         
		
		if (inName=="assets/data/Player/walkcycle/LEGS_pants_greenish.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/LEGS_pants_greenish.png");
         
		
		if (inName=="assets/data/Player/walkcycle/LEGS_plate_armor_pants.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/LEGS_plate_armor_pants.png");
         
		
		if (inName=="assets/data/Player/walkcycle/LEGS_robe_skirt.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/LEGS_robe_skirt.png");
         
		
		if (inName=="assets/data/Player/walkcycle/TORSO_chain_armor_jacket_purple.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/TORSO_chain_armor_jacket_purple.png");
         
		
		if (inName=="assets/data/Player/walkcycle/TORSO_chain_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/TORSO_chain_armor_torso.png");
         
		
		if (inName=="assets/data/Player/walkcycle/TORSO_leather_armor_bracers.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/TORSO_leather_armor_bracers.png");
         
		
		if (inName=="assets/data/Player/walkcycle/TORSO_leather_armor_shirt_white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/TORSO_leather_armor_shirt_white.png");
         
		
		if (inName=="assets/data/Player/walkcycle/TORSO_leather_armor_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/TORSO_leather_armor_shoulders.png");
         
		
		if (inName=="assets/data/Player/walkcycle/TORSO_leather_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/TORSO_leather_armor_torso.png");
         
		
		if (inName=="assets/data/Player/walkcycle/TORSO_plate_armor_arms_shoulders.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/TORSO_plate_armor_arms_shoulders.png");
         
		
		if (inName=="assets/data/Player/walkcycle/TORSO_plate_armor_torso.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/TORSO_plate_armor_torso.png");
         
		
		if (inName=="assets/data/Player/walkcycle/TORSO_robe_shirt_brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/TORSO_robe_shirt_brown.png");
         
		
		if (inName=="assets/data/Player/walkcycle/WEAPON_shield_cutout_body.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/WEAPON_shield_cutout_body.png");
         
		
		if (inName=="assets/data/Player/walkcycle/WEAPON_shield_cutout_chain_armor_helmet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/walkcycle/WEAPON_shield_cutout_chain_armor_helmet.png");
         
		
		if (inName=="assets/data/stick.png")
			 
            return Assets.getBitmapData ("assets/data/stick.png");
         
		
		if (inName=="assets/data/vcr/flixel.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/flixel.png");
         
		
		if (inName=="assets/data/vcr/open.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/open.png");
         
		
		if (inName=="assets/data/vcr/pause.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/pause.png");
         
		
		if (inName=="assets/data/vcr/play.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/play.png");
         
		
		if (inName=="assets/data/vcr/record_off.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_off.png");
         
		
		if (inName=="assets/data/vcr/record_on.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_on.png");
         
		
		if (inName=="assets/data/vcr/restart.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/restart.png");
         
		
		if (inName=="assets/data/vcr/step.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/step.png");
         
		
		if (inName=="assets/data/vcr/stop.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/stop.png");
         
		
		if (inName=="assets/data/vis/bounds.png")
			 
            return Assets.getBitmapData ("assets/data/vis/bounds.png");
         
		
		if (inName=="assets/HaxeFlixel.svg")
			 
			 return Assets.getText ("assets/HaxeFlixel.svg");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}

class NME_assets_data_beep_mp3 extends nme.media.Sound { }
class NME_assets_data_autotiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_alt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_base_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_beep_mp4 extends nme.media.Sound { }
class NME_assets_data_button_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_a_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_b_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_c_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_left_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_right_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_x_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_y_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_courier_ttf extends nme.text.Font { }
class NME_assets_data_cursor_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_default_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_dungeon_walls_csv extends nme.utils.ByteArray { }
class NME_assets_data_fontdata10pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata11pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_ghostdungeontiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_handle_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_corners_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_light_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_nokiafc22_ttf extends nme.text.Font { }
class NME_assets_data_player_bow_belt_leather_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_belt_rope_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_body_animation_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_feet_plate_armor_shoes_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_feet_shoes_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_hands_plate_armor_gloves_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_head_chain_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_head_chain_armor_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_head_hair_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_head_leather_armor_hat_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_head_plate_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_head_robe_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_legs_pants_greenish_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_legs_plate_armor_pants_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_legs_robe_skirt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_torso_chain_armor_jacket_purple_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_torso_chain_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_torso_leather_armor_bracers_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_torso_leather_armor_shirt_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_torso_leather_armor_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_torso_leather_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_torso_plate_armor_arms_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_torso_plate_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_torso_robe_shirt_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_weapon_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_bow_weapon_bow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_combat_dummy_body_animation_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_behind_quiver_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_belt_leather_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_belt_rope_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_body_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_body_skeleton_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_feet_plate_armor_shoes_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_feet_shoes_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_hands_plate_armor_gloves_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_head_chain_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_head_chain_armor_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_head_hair_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_head_leather_armor_hat_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_head_plate_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_head_robe_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_legs_pants_greenish_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_legs_plate_armor_pants_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_legs_robe_skirt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_torso_chain_armor_jacket_purple_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_torso_chain_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_torso_leather_armor_bracers_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_torso_leather_armor_shirt_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_torso_leather_armor_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_torso_leather_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_torso_plate_armor_arms_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_torso_plate_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hurt_torso_robe_shirt_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_behind_quiver_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_belt_leather_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_belt_rope_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_body_human_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_body_skeleton_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_feet_plate_armor_shoes_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_feet_shoes_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_hands_plate_armor_gloves_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_head_chain_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_head_chain_armor_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_head_hair_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_head_leather_armor_hat_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_head_plate_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_head_robe_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_legs_pants_greenish_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_legs_plate_armor_pants_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_legs_robe_skirt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_torso_chain_armor_jacket_purple_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_torso_chain_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_torso_leather_armor_bracers_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_torso_leather_armor_shirt_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_torso_leather_armor_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_torso_leather_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_torso_plate_armor_arms_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_torso_plate_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_torso_robe_shirt_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_slash_weapon_dagger_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_behind_quiver_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_belt_leather_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_belt_rope_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_body_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_body_skeleton_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_feet_plate_armor_shoes_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_feet_shoes_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_hands_plate_armor_gloves_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_head_chain_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_head_chain_armor_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_head_hair_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_head_leather_armor_hat_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_head_plate_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_head_robe_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_head_skeleton_eye_glow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_legs_pants_greenish_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_legs_plate_armor_pants_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_legs_robe_skirt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_torso_chain_armor_jacket_purple_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_torso_chain_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_torso_leather_armor_bracers_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_torso_leather_armor_shirt_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_torso_leather_armor_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_torso_leather_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_torso_plate_armor_arms_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_torso_plate_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_spellcast_torso_robe_shirt_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_behind_quiver_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_belt_leather_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_belt_rope_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_body_animation_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_feet_plate_armor_shoes_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_feet_shoes_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_hands_plate_armor_gloves_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_head_chain_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_head_chain_armor_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_head_hair_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_head_leather_armor_hat_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_head_plate_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_head_robe_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_legs_pants_greenish_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_legs_plate_armor_pants_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_legs_robe_skirt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_torso_chain_armor_jacket_purple_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_torso_chain_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_torso_leather_armor_bracers_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_torso_leather_armor_shirt_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_torso_leather_armor_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_torso_leather_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_torso_plate_armor_arms_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_torso_plate_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_torso_robe_shirt_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_weapon_shield_cutout_body_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_weapon_shield_cutout_chain_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_weapon_spear_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_thrust_weapon_staff_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_behind_quiver_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_belt_leather_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_belt_rope_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_body_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_body_skeleton_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_feet_plate_armor_shoes_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_feet_shoes_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_hands_plate_armor_gloves_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_head_chain_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_head_chain_armor_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_head_hair_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_head_leather_armor_hat_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_head_plate_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_head_robe_hood_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_legs_pants_greenish_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_legs_plate_armor_pants_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_legs_robe_skirt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_torso_chain_armor_jacket_purple_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_torso_chain_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_torso_leather_armor_bracers_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_torso_leather_armor_shirt_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_torso_leather_armor_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_torso_leather_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_torso_plate_armor_arms_shoulders_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_torso_plate_armor_torso_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_torso_robe_shirt_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_weapon_shield_cutout_body_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_walkcycle_weapon_shield_cutout_chain_armor_helmet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_stick_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_flixel_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_open_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_pause_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_play_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_off_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_on_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_restart_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_step_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_stop_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vis_bounds_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_haxeflixel_svg extends nme.utils.ByteArray { }


#else

import Main;

class ApplicationMain {
	
	public static function main () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, flash.display.DisplayObject)) {
				flash.Lib.current.addChild(cast instance);
			}
		}
		
	}

}

#end
