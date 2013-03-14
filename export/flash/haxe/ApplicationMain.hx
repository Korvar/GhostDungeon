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
		 
		
		if (inName=="assets/data/Player/accessories/necklaces_female_ no_th-sh/bronze.png")
			 
            return Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/bronze.png");
         
		
		if (inName=="assets/data/Player/accessories/necklaces_female_ no_th-sh/gold.png")
			 
            return Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/gold.png");
         
		
		if (inName=="assets/data/Player/accessories/necklaces_female_ no_th-sh/iron.png")
			 
            return Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/iron.png");
         
		
		if (inName=="assets/data/Player/accessories/necklaces_female_ no_th-sh/pirate_wc_only.png")
			 
            return Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/pirate_wc_only.png");
         
		
		if (inName=="assets/data/Player/accessories/necklaces_female_ no_th-sh/silver.png")
			 
            return Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/silver.png");
         
		
		if (inName=="assets/data/Player/behind_body/quiver.png")
			 
            return Assets.getBitmapData ("assets/data/Player/behind_body/quiver.png");
         
		
		if (inName=="assets/data/Player/belt/black_female_no_th-sh.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/black_female_no_th-sh.png");
         
		
		if (inName=="assets/data/Player/belt/bronze_female_no_th-sh.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/bronze_female_no_th-sh.png");
         
		
		if (inName=="assets/data/Player/belt/brown_female_no_th-sh.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/brown_female_no_th-sh.png");
         
		
		if (inName=="assets/data/Player/belt/buckles_female_no_th-sh/bronze.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/buckles_female_no_th-sh/bronze.png");
         
		
		if (inName=="assets/data/Player/belt/buckles_female_no_th-sh/gold.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/buckles_female_no_th-sh/gold.png");
         
		
		if (inName=="assets/data/Player/belt/buckles_female_no_th-sh/iron.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/buckles_female_no_th-sh/iron.png");
         
		
		if (inName=="assets/data/Player/belt/buckles_female_no_th-sh/silver.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/buckles_female_no_th-sh/silver.png");
         
		
		if (inName=="assets/data/Player/belt/gold_female_no_th-sh.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/gold_female_no_th-sh.png");
         
		
		if (inName=="assets/data/Player/belt/iron_female_no_th-sh.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/iron_female_no_th-sh.png");
         
		
		if (inName=="assets/data/Player/belt/leather_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/leather_female.png");
         
		
		if (inName=="assets/data/Player/belt/leather_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/leather_male.png");
         
		
		if (inName=="assets/data/Player/belt/rope_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/rope_female.png");
         
		
		if (inName=="assets/data/Player/belt/rope_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/rope_male.png");
         
		
		if (inName=="assets/data/Player/belt/silver_female_no_th-sh.png")
			 
            return Assets.getBitmapData ("assets/data/Player/belt/silver_female_no_th-sh.png");
         
		
		if (inName=="assets/data/Player/body/female/dark.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/dark.png");
         
		
		if (inName=="assets/data/Player/body/female/dark2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/dark2.png");
         
		
		if (inName=="assets/data/Player/body/female/eyes/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/eyes/blue.png");
         
		
		if (inName=="assets/data/Player/body/female/eyes/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/eyes/brown.png");
         
		
		if (inName=="assets/data/Player/body/female/eyes/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/eyes/gray.png");
         
		
		if (inName=="assets/data/Player/body/female/eyes/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/eyes/green.png");
         
		
		if (inName=="assets/data/Player/body/female/eyes/red.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/eyes/red.png");
         
		
		if (inName=="assets/data/Player/body/female/light.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/light.png");
         
		
		if (inName=="assets/data/Player/body/female/orc.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/orc.png");
         
		
		if (inName=="assets/data/Player/body/female/red_orc_wc_only.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/red_orc_wc_only.png");
         
		
		if (inName=="assets/data/Player/body/female/tanned.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/tanned.png");
         
		
		if (inName=="assets/data/Player/body/female/tanned2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/female/tanned2.png");
         
		
		if (inName=="assets/data/Player/body/male/dark.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/dark.png");
         
		
		if (inName=="assets/data/Player/body/male/dark2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/dark2.png");
         
		
		if (inName=="assets/data/Player/body/male/eyes/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/eyes/blue.png");
         
		
		if (inName=="assets/data/Player/body/male/eyes/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/eyes/brown.png");
         
		
		if (inName=="assets/data/Player/body/male/eyes/casting_eyeglow_skeleton.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/eyes/casting_eyeglow_skeleton.png");
         
		
		if (inName=="assets/data/Player/body/male/eyes/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/eyes/gray.png");
         
		
		if (inName=="assets/data/Player/body/male/eyes/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/eyes/green.png");
         
		
		if (inName=="assets/data/Player/body/male/eyes/red.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/eyes/red.png");
         
		
		if (inName=="assets/data/Player/body/male/light.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/light.png");
         
		
		if (inName=="assets/data/Player/body/male/orc.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/orc.png");
         
		
		if (inName=="assets/data/Player/body/male/skeleton.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/skeleton.png");
         
		
		if (inName=="assets/data/Player/body/male/tanned.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/tanned.png");
         
		
		if (inName=="assets/data/Player/body/male/tanned2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/body/male/tanned2.png");
         
		
		if (inName=="assets/data/Player/feet/black_shoes_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/black_shoes_female.png");
         
		
		if (inName=="assets/data/Player/feet/black_shoes_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/black_shoes_male.png");
         
		
		if (inName=="assets/data/Player/feet/brown_shoes_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/brown_shoes_female.png");
         
		
		if (inName=="assets/data/Player/feet/brown_shoes_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/brown_shoes_male.png");
         
		
		if (inName=="assets/data/Player/feet/ghillies_female_no_th-sh.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/ghillies_female_no_th-sh.png");
         
		
		if (inName=="assets/data/Player/feet/golden_boots_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/golden_boots_female.png");
         
		
		if (inName=="assets/data/Player/feet/golden_boots_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/golden_boots_male.png");
         
		
		if (inName=="assets/data/Player/feet/metal_boots_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/metal_boots_female.png");
         
		
		if (inName=="assets/data/Player/feet/metal_boots_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/metal_boots_male.png");
         
		
		if (inName=="assets/data/Player/feet/slippers_female/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/slippers_female/black.png");
         
		
		if (inName=="assets/data/Player/feet/slippers_female/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/slippers_female/brown.png");
         
		
		if (inName=="assets/data/Player/feet/slippers_female/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/slippers_female/gray.png");
         
		
		if (inName=="assets/data/Player/feet/slippers_female/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/feet/slippers_female/white.png");
         
		
		if (inName=="assets/data/Player/formal_male_no_th-sh/bowtie.png")
			 
            return Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/bowtie.png");
         
		
		if (inName=="assets/data/Player/formal_male_no_th-sh/pants.png")
			 
            return Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/pants.png");
         
		
		if (inName=="assets/data/Player/formal_male_no_th-sh/shirt.png")
			 
            return Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/shirt.png");
         
		
		if (inName=="assets/data/Player/formal_male_no_th-sh/tie.png")
			 
            return Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/tie.png");
         
		
		if (inName=="assets/data/Player/formal_male_no_th-sh/vest.png")
			 
            return Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/vest.png");
         
		
		if (inName=="assets/data/Player/formal_male_no_th-sh/vest_w_shirt_cutout.png")
			 
            return Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/vest_w_shirt_cutout.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/black.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/blue.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/brown.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/brunette2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/brunette2.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/dark-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/dark-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/gray.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/green.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/light-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/light-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/pink.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/raven.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/raven2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/raven2.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/white-blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/white-blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/white.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangslong.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangslong.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/black.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/blue.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/brown.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/brunette2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/brunette2.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/dark-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/dark-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/gray.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/green.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/light-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/light-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/pink.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/raven.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/raven2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/raven2.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/white-blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/white-blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/white.png");
         
		
		if (inName=="assets/data/Player/hair/female/bangsshort.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/black.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/blue.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/brown.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/brunette2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/brunette2.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/dark-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/dark-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/gray.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/green.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/light-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/light-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/pink.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/raven.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/raven2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/raven2.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/white-blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/white-blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose/white.png");
         
		
		if (inName=="assets/data/Player/hair/female/loose.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/loose.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/black.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/blue.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/brown.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/brunette2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/brunette2.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/dark-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/dark-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/gray.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/green.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/light-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/light-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/pink.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/raven.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/raven2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/raven2.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/white-blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/white-blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie/white.png");
         
		
		if (inName=="assets/data/Player/hair/female/pixie.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/pixie.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/black.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/blue.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/brown.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/brunette2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/brunette2.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/dark-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/dark-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/gray.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/green.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/light-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/light-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/pink.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/raven.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/raven2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/raven2.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/white-blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/white-blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/white.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/black.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/blue.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/brown.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/gray.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/green.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/light-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/light-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/pink.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/raven.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/shadows-darkbody.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/shadows-darkbody.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/shadows-lightbody.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/shadows-lightbody.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/shadows-tanned2body.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/shadows-tanned2body.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/shadows-tannedbody.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/shadows-tannedbody.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/ponytail2/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/white.png");
         
		
		if (inName=="assets/data/Player/hair/female/princess/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/princess/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/princess/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/princess/blue.png");
         
		
		if (inName=="assets/data/Player/hair/female/princess/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/princess/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/female/princess/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/princess/green.png");
         
		
		if (inName=="assets/data/Player/hair/female/princess/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/princess/pink.png");
         
		
		if (inName=="assets/data/Player/hair/female/princess/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/princess/raven.png");
         
		
		if (inName=="assets/data/Player/hair/female/princess/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/princess/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/female/princess/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/princess/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/princess.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/princess.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/black.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/blue.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/brown.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/brunette2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/brunette2.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/dark-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/dark-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/gray.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/green.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/light-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/light-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/pink.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/raven.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/raven2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/raven2.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/white-blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/white-blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop/white.png");
         
		
		if (inName=="assets/data/Player/hair/female/swoop.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/swoop.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/black.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/blue.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/brown.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/brunette2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/brunette2.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/dark-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/dark-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/gray.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/green.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/light-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/light-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/pink.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/raven.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/raven2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/raven2.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/white-blonde2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/white-blonde2.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/white.png");
         
		
		if (inName=="assets/data/Player/hair/female/unkempt.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/female/unkempt.png");
         
		
		if (inName=="assets/data/Player/hair/male/bangs/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bangs/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/bangs/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bangs/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/bangs/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bangs/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/bangs/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bangs/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/bangs/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bangs/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/bangs/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bangs/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/bangs/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bangs/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/bangs/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bangs/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/bangs.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bangs.png");
         
		
		if (inName=="assets/data/Player/hair/male/bedhead/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/bedhead/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/bedhead/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/bedhead/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/bedhead/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/bedhead/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/bedhead/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/bedhead/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/bedhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/bedhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/long/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/long/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/long/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/long/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/long/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/long/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/long/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/long/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/long/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/long/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/long/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/long/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/long/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/long/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/long/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/long/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/long.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/long.png");
         
		
		if (inName=="assets/data/Player/hair/male/longhawk/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/longhawk/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/longhawk/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/longhawk/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/longhawk/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/longhawk/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/longhawk/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/longhawk/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/longhawk.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/longhawk.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy1/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy1/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy1/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy1/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy1/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy1/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy1/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy1/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy1/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy1/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy1/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy1/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy1/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy1/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy1/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy1/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy1.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy1.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy2/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy2/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy2/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy2/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy2/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy2/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy2/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy2/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy2/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy2/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy2/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy2/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy2/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy2/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy2/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy2/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/messy2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/messy2.png");
         
		
		if (inName=="assets/data/Player/hair/male/mohawk/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/mohawk/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/mohawk/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/mohawk/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/mohawk/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/mohawk/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/mohawk/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/mohawk/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/mohawk.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/mohawk.png");
         
		
		if (inName=="assets/data/Player/hair/male/page/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/page/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/page/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/page/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/page/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/page/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/page/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/page/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/page.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page.png");
         
		
		if (inName=="assets/data/Player/hair/male/page2.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/page2.png");
         
		
		if (inName=="assets/data/Player/hair/male/parted/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/parted/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/parted/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/parted/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/parted/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/parted/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/parted/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/parted/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/parted/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/parted/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/parted/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/parted/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/parted/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/parted/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/parted/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/parted/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/parted.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/parted.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/shadows-darkbody.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/shadows-darkbody.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/shadows-lightbody.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/shadows-lightbody.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/shadows-tanned2body.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/shadows-tanned2body.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/shadows-tannedbody.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/shadows-tannedbody.png");
         
		
		if (inName=="assets/data/Player/hair/male/plain/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/plain/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/shorthawk/blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/shorthawk/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/blue.png");
         
		
		if (inName=="assets/data/Player/hair/male/shorthawk/brunette.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/brunette.png");
         
		
		if (inName=="assets/data/Player/hair/male/shorthawk/green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/green.png");
         
		
		if (inName=="assets/data/Player/hair/male/shorthawk/pink.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/pink.png");
         
		
		if (inName=="assets/data/Player/hair/male/shorthawk/raven.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/raven.png");
         
		
		if (inName=="assets/data/Player/hair/male/shorthawk/redhead.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/redhead.png");
         
		
		if (inName=="assets/data/Player/hair/male/shorthawk/white-blonde.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/white-blonde.png");
         
		
		if (inName=="assets/data/Player/hair/male/shorthawk.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk.png");
         
		
		if (inName=="assets/data/Player/hands/bracelet.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hands/bracelet.png");
         
		
		if (inName=="assets/data/Player/hands/golden_gloves_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hands/golden_gloves_female.png");
         
		
		if (inName=="assets/data/Player/hands/golden_gloves_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hands/golden_gloves_male.png");
         
		
		if (inName=="assets/data/Player/hands/metal_gloves_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hands/metal_gloves_female.png");
         
		
		if (inName=="assets/data/Player/hands/metal_gloves_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/hands/metal_gloves_male.png");
         
		
		if (inName=="assets/data/Player/head/bandana_male_wconly.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/bandana_male_wconly.png");
         
		
		if (inName=="assets/data/Player/head/chainhat_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/chainhat_female.png");
         
		
		if (inName=="assets/data/Player/head/chainhat_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/chainhat_male.png");
         
		
		if (inName=="assets/data/Player/head/chain_hood_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/chain_hood_female.png");
         
		
		if (inName=="assets/data/Player/head/chain_hood_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/chain_hood_male.png");
         
		
		if (inName=="assets/data/Player/head/cloth_hood_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/cloth_hood_female.png");
         
		
		if (inName=="assets/data/Player/head/cloth_hood_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/cloth_hood_male.png");
         
		
		if (inName=="assets/data/Player/head/golden_helm_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/golden_helm_female.png");
         
		
		if (inName=="assets/data/Player/head/golden_helm_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/golden_helm_male.png");
         
		
		if (inName=="assets/data/Player/head/leather_cap_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/leather_cap_female.png");
         
		
		if (inName=="assets/data/Player/head/leather_cap_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/leather_cap_male.png");
         
		
		if (inName=="assets/data/Player/head/metal_helm_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/metal_helm_female.png");
         
		
		if (inName=="assets/data/Player/head/metal_helm_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/metal_helm_male.png");
         
		
		if (inName=="assets/data/Player/head/tiaras_female_no_th_or_sh/bronze.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/tiaras_female_no_th_or_sh/bronze.png");
         
		
		if (inName=="assets/data/Player/head/tiaras_female_no_th_or_sh/gold.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/tiaras_female_no_th_or_sh/gold.png");
         
		
		if (inName=="assets/data/Player/head/tiaras_female_no_th_or_sh/iron.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/tiaras_female_no_th_or_sh/iron.png");
         
		
		if (inName=="assets/data/Player/head/tiaras_female_no_th_or_sh/silver.png")
			 
            return Assets.getBitmapData ("assets/data/Player/head/tiaras_female_no_th_or_sh/silver.png");
         
		
		if (inName=="assets/data/Player/legs/golden_greaves_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/legs/golden_greaves_female.png");
         
		
		if (inName=="assets/data/Player/legs/golden_greaves_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/legs/golden_greaves_male.png");
         
		
		if (inName=="assets/data/Player/legs/green_pants_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/legs/green_pants_female.png");
         
		
		if (inName=="assets/data/Player/legs/green_pants_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/legs/green_pants_male.png");
         
		
		if (inName=="assets/data/Player/legs/metal_pants_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/legs/metal_pants_female.png");
         
		
		if (inName=="assets/data/Player/legs/metal_pants_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/legs/metal_pants_male.png");
         
		
		if (inName=="assets/data/Player/legs/red_pants_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/legs/red_pants_male.png");
         
		
		if (inName=="assets/data/Player/legs/robe_skirt_female_incomplete.png")
			 
            return Assets.getBitmapData ("assets/data/Player/legs/robe_skirt_female_incomplete.png");
         
		
		if (inName=="assets/data/Player/legs/robe_skirt_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/legs/robe_skirt_male.png");
         
		
		if (inName=="assets/data/Player/oversize_xcf/slash_swords.xcf")
			 
            return Assets.getBytes ("assets/data/Player/oversize_xcf/slash_swords.xcf");
         
		
		if (inName=="assets/data/Player/oversize_xcf/thrust_spears.xcf")
			 
            return Assets.getBytes ("assets/data/Player/oversize_xcf/thrust_spears.xcf");
         
		
		if (inName=="assets/data/Player/torso/brown_shirt_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/brown_shirt_male.png");
         
		
		if (inName=="assets/data/Player/torso/chain/mail_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/chain/mail_female.png");
         
		
		if (inName=="assets/data/Player/torso/chain/mail_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/chain/mail_male.png");
         
		
		if (inName=="assets/data/Player/torso/chain/tabard/jacket_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/chain/tabard/jacket_female.png");
         
		
		if (inName=="assets/data/Player/torso/chain/tabard/jacket_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/chain/tabard/jacket_male.png");
         
		
		if (inName=="assets/data/Player/torso/dress_female/blue_vest.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/dress_female/blue_vest.png");
         
		
		if (inName=="assets/data/Player/torso/dress_female/overskirt.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/dress_female/overskirt.png");
         
		
		if (inName=="assets/data/Player/torso/dress_female/underdress.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/dress_female/underdress.png");
         
		
		if (inName=="assets/data/Player/torso/dress_w_sash_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/dress_w_sash_female.png");
         
		
		if (inName=="assets/data/Player/torso/gold/arms_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/gold/arms_female.png");
         
		
		if (inName=="assets/data/Player/torso/gold/arms_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/gold/arms_male.png");
         
		
		if (inName=="assets/data/Player/torso/gold/chest_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/gold/chest_female.png");
         
		
		if (inName=="assets/data/Player/torso/gold/chest_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/gold/chest_male.png");
         
		
		if (inName=="assets/data/Player/torso/gold/spikes_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/gold/spikes_male.png");
         
		
		if (inName=="assets/data/Player/torso/leather/bracers_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/leather/bracers_female.png");
         
		
		if (inName=="assets/data/Player/torso/leather/bracers_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/leather/bracers_male.png");
         
		
		if (inName=="assets/data/Player/torso/leather/chest_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/leather/chest_female.png");
         
		
		if (inName=="assets/data/Player/torso/leather/chest_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/leather/chest_male.png");
         
		
		if (inName=="assets/data/Player/torso/leather/shoulders_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/leather/shoulders_female.png");
         
		
		if (inName=="assets/data/Player/torso/leather/shoulders_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/leather/shoulders_male.png");
         
		
		if (inName=="assets/data/Player/torso/pirate_shirt_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/pirate_shirt_female.png");
         
		
		if (inName=="assets/data/Player/torso/plate/arms_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/plate/arms_female.png");
         
		
		if (inName=="assets/data/Player/torso/plate/arms_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/plate/arms_male.png");
         
		
		if (inName=="assets/data/Player/torso/plate/chest_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/plate/chest_female.png");
         
		
		if (inName=="assets/data/Player/torso/plate/chest_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/plate/chest_male.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/black.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/black.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/blue.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/blue.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/brown.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/dark brown.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/dark brown.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/dark gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/dark gray.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/forest green.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/forest green.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/light gray.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/light gray.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/purple.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/purple.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/red.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/red.png");
         
		
		if (inName=="assets/data/Player/torso/robes_female_no_th-sh/white.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/white.png");
         
		
		if (inName=="assets/data/Player/torso/white_shirt_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/white_shirt_male.png");
         
		
		if (inName=="assets/data/Player/torso/wings_no_th-sh.png")
			 
            return Assets.getBitmapData ("assets/data/Player/torso/wings_no_th-sh.png");
         
		
		if (inName=="assets/data/Player/weapons/arrow.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/arrow.png");
         
		
		if (inName=="assets/data/Player/weapons/arrow_skeleton.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/arrow_skeleton.png");
         
		
		if (inName=="assets/data/Player/weapons/bow.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/bow.png");
         
		
		if (inName=="assets/data/Player/weapons/bow_skeleton.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/bow_skeleton.png");
         
		
		if (inName=="assets/data/Player/weapons/dagger_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/dagger_female.png");
         
		
		if (inName=="assets/data/Player/weapons/dagger_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/dagger_male.png");
         
		
		if (inName=="assets/data/Player/weapons/greatbow.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/greatbow.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/dreagonspear.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/dreagonspear.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/longsword_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/longsword_female.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/longsword_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/longsword_male.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/mace_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/mace_female.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/mace_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/mace_male.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/rapier_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/rapier_female.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/rapier_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/rapier_male.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/saber_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/saber_female.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/saber_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/saber_male.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/spear.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/spear.png");
         
		
		if (inName=="assets/data/Player/weapons/oversize/trident.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/oversize/trident.png");
         
		
		if (inName=="assets/data/Player/weapons/recurvebow.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/recurvebow.png");
         
		
		if (inName=="assets/data/Player/weapons/shield_male_cutoutforbody.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/shield_male_cutoutforbody.png");
         
		
		if (inName=="assets/data/Player/weapons/shield_male_cutoutforhat.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/shield_male_cutoutforhat.png");
         
		
		if (inName=="assets/data/Player/weapons/spear.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/spear.png");
         
		
		if (inName=="assets/data/Player/weapons/steelwand_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/steelwand_female.png");
         
		
		if (inName=="assets/data/Player/weapons/woodwand_female.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/woodwand_female.png");
         
		
		if (inName=="assets/data/Player/weapons/woodwand_male.png")
			 
            return Assets.getBitmapData ("assets/data/Player/weapons/woodwand_male.png");
         
		
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
class NME_assets_data_player_accessories_necklaces_female__no_th_sh_bronze_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_accessories_necklaces_female__no_th_sh_gold_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_accessories_necklaces_female__no_th_sh_iron_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_accessories_necklaces_female__no_th_sh_pirate_wc_only_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_accessories_necklaces_female__no_th_sh_silver_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_behind_body_quiver_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_black_female_no_th_sh_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_bronze_female_no_th_sh_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_brown_female_no_th_sh_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_buckles_female_no_th_sh_bronze_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_buckles_female_no_th_sh_gold_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_buckles_female_no_th_sh_iron_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_buckles_female_no_th_sh_silver_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_gold_female_no_th_sh_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_iron_female_no_th_sh_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_leather_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_leather_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_rope_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_rope_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_belt_silver_female_no_th_sh_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_dark_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_dark2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_eyes_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_eyes_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_eyes_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_eyes_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_eyes_red_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_light_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_orc_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_red_orc_wc_only_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_tanned_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_female_tanned2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_dark_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_dark2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_eyes_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_eyes_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_eyes_casting_eyeglow_skeleton_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_eyes_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_eyes_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_eyes_red_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_light_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_orc_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_skeleton_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_tanned_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_body_male_tanned2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_black_shoes_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_black_shoes_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_brown_shoes_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_brown_shoes_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_ghillies_female_no_th_sh_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_golden_boots_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_golden_boots_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_metal_boots_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_metal_boots_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_slippers_female_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_slippers_female_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_slippers_female_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_feet_slippers_female_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_formal_male_no_th_sh_bowtie_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_formal_male_no_th_sh_pants_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_formal_male_no_th_sh_shirt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_formal_male_no_th_sh_tie_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_formal_male_no_th_sh_vest_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_formal_male_no_th_sh_vest_w_shirt_cutout_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_brunette2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_dark_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_light_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_raven2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_white_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangslong_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_brunette2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_dark_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_light_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_raven2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_white_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_bangsshort_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_brunette2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_dark_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_light_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_raven2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_white_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_loose_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_brunette2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_dark_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_light_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_raven2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_white_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_pixie_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_brunette2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_dark_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_light_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_raven2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_white_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_light_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_shadows_darkbody_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_shadows_lightbody_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_shadows_tanned2body_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_shadows_tannedbody_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_ponytail2_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_princess_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_princess_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_princess_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_princess_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_princess_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_princess_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_princess_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_princess_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_princess_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_brunette2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_dark_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_light_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_raven2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_white_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_swoop_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_brunette2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_dark_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_light_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_raven2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_white_blonde2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_female_unkempt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bangs_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bangs_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bangs_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bangs_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bangs_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bangs_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bangs_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bangs_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bangs_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bedhead_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bedhead_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bedhead_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bedhead_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bedhead_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bedhead_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bedhead_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bedhead_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_bedhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_long_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_long_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_long_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_long_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_long_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_long_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_long_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_long_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_long_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_longhawk_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_longhawk_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_longhawk_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_longhawk_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_longhawk_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_longhawk_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_longhawk_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_longhawk_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_longhawk_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy1_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy1_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy1_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy1_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy1_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy1_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy1_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy1_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy1_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy2_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy2_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy2_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy2_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy2_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy2_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy2_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy2_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_messy2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_mohawk_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_mohawk_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_mohawk_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_mohawk_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_mohawk_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_mohawk_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_mohawk_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_mohawk_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_mohawk_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_page2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_parted_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_parted_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_parted_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_parted_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_parted_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_parted_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_parted_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_parted_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_parted_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_shadows_darkbody_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_shadows_lightbody_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_shadows_tanned2body_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_shadows_tannedbody_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_plain_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_shorthawk_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_shorthawk_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_shorthawk_brunette_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_shorthawk_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_shorthawk_pink_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_shorthawk_raven_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_shorthawk_redhead_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_shorthawk_white_blonde_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hair_male_shorthawk_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hands_bracelet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hands_golden_gloves_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hands_golden_gloves_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hands_metal_gloves_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_hands_metal_gloves_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_bandana_male_wconly_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_chainhat_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_chainhat_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_chain_hood_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_chain_hood_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_cloth_hood_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_cloth_hood_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_golden_helm_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_golden_helm_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_leather_cap_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_leather_cap_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_metal_helm_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_metal_helm_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_tiaras_female_no_th_or_sh_bronze_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_tiaras_female_no_th_or_sh_gold_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_tiaras_female_no_th_or_sh_iron_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_head_tiaras_female_no_th_or_sh_silver_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_legs_golden_greaves_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_legs_golden_greaves_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_legs_green_pants_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_legs_green_pants_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_legs_metal_pants_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_legs_metal_pants_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_legs_red_pants_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_legs_robe_skirt_female_incomplete_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_legs_robe_skirt_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_oversize_xcf_slash_swords_xcf extends nme.utils.ByteArray { }
class NME_assets_data_player_oversize_xcf_thrust_spears_xcf extends nme.utils.ByteArray { }
class NME_assets_data_player_torso_brown_shirt_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_chain_mail_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_chain_mail_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_chain_tabard_jacket_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_chain_tabard_jacket_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_dress_female_blue_vest_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_dress_female_overskirt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_dress_female_underdress_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_dress_w_sash_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_gold_arms_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_gold_arms_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_gold_chest_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_gold_chest_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_gold_spikes_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_leather_bracers_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_leather_bracers_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_leather_chest_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_leather_chest_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_leather_shoulders_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_leather_shoulders_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_pirate_shirt_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_plate_arms_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_plate_arms_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_plate_chest_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_plate_chest_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_black_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_blue_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_dark_brown_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_dark_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_forest_green_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_light_gray_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_purple_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_red_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_robes_female_no_th_sh_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_white_shirt_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_torso_wings_no_th_sh_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_arrow_skeleton_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_bow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_bow_skeleton_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_dagger_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_dagger_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_greatbow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_dreagonspear_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_longsword_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_longsword_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_mace_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_mace_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_rapier_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_rapier_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_saber_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_saber_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_spear_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_oversize_trident_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_recurvebow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_shield_male_cutoutforbody_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_shield_male_cutoutforhat_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_spear_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_steelwand_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_woodwand_female_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_player_weapons_woodwand_male_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
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
