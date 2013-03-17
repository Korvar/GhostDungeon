class ApplicationMain
{

	#if waxe
	static public var frame : wx.Frame;
	static public var autoShowFrame : Bool = true;
	#if nme
	static public var nmeStage : wx.NMEStage;
	#end
	#end
	
	public static function main()
	{
		#if nme
		nme.Lib.setPackage("Zaphod", "GhostDungeon", "com.example.myapp", "0.0.1");
		
		#end
		
		#if waxe
		wx.App.boot(function()
		{
			
			frame = wx.Frame.create(null, null, "GhostDungeon", null, { width: 640, height: 480 });
			
			#if nme
			var stage = wx.NMEStage.create(frame, null, null, { width: 640, height: 480 });
			#end
			
			Main.main();
			
			if (autoShowFrame)
			{
				wx.App.setTopWindow(frame);
				frame.shown = true;
			}
		});
		#else
		
		nme.Lib.create(function()
			{ 
				//if ((640 == 0 && 480 == 0) || false)
				//{
					nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
					nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
				//}
				
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
					#if nme
					if (Std.is (instance, nme.display.DisplayObject)) {
						nme.Lib.current.addChild(cast instance);
					}
					#end
				}
			},
			640, 480, 
			30, 
			16777215,
			(true ? nme.Lib.HARDWARE : 0) |
			(false ? nme.Lib.ALLOW_SHADERS : 0) |
			(false ? nme.Lib.REQUIRE_SHADERS : 0) |
			(false ? nme.Lib.DEPTH_BUFFER : 0) |
			(false ? nme.Lib.STENCIL_BUFFER : 0) |
			(true ? nme.Lib.RESIZABLE : 0) |
			(false ? nme.Lib.BORDERLESS : 0) |
			(false ? nme.Lib.VSYNC : 0) |
			(false ? nme.Lib.FULLSCREEN : 0) |
			(0 == 4 ? nme.Lib.HW_AA_HIRES : 0) |
			(0 == 2 ? nme.Lib.HW_AA : 0),
			"GhostDungeon"
			
		);
		#end
		
	}
	
	
	#if neko
	public static function __init__ () {
		
		untyped $loader.path = $array ("@executable_path/", $loader.path);
		
	}
	#end
	
	
	public static function getAsset(inName:String):Dynamic
	{
		#if nme
		
		if (inName == "Beep")
		{
			
			return nme.Assets.getSound ("Beep");
			
		}
		
		if (inName == "assets/data/autotiles.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/autotiles.png");
			
		}
		
		if (inName == "assets/data/autotiles_alt.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/autotiles_alt.png");
			
		}
		
		if (inName == "assets/data/base.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/base.png");
			
		}
		
		if (inName == "assets/data/beep.mp3")
		{
			
			return nme.Assets.getSound ("assets/data/beep.mp3");
			
		}
		
		if (inName == "assets/data/beep.wav")
		{
			
			return nme.Assets.getSound ("assets/data/beep.wav");
			
		}
		
		if (inName == "assets/data/button.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button.png");
			
		}
		
		if (inName == "assets/data/button_a.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_a.png");
			
		}
		
		if (inName == "assets/data/button_b.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_b.png");
			
		}
		
		if (inName == "assets/data/button_c.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_c.png");
			
		}
		
		if (inName == "assets/data/button_down.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_down.png");
			
		}
		
		if (inName == "assets/data/button_left.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_left.png");
			
		}
		
		if (inName == "assets/data/button_right.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_right.png");
			
		}
		
		if (inName == "assets/data/button_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_up.png");
			
		}
		
		if (inName == "assets/data/button_x.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_x.png");
			
		}
		
		if (inName == "assets/data/button_y.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_y.png");
			
		}
		
		if (inName == "assets/data/courier.ttf")
		{
			
			return nme.Assets.getFont ("assets/data/courier.ttf");
			
		}
		
		if (inName == "assets/data/cursor.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/cursor.png");
			
		}
		
		if (inName == "assets/data/default.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/default.png");
			
		}
		
		if (inName == "assets/data/Dungeon_Walls.csv")
		{
			
			return nme.Assets.getText ("assets/data/Dungeon_Walls.csv");
			
		}
		
		if (inName == "assets/data/fontData10pt.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/fontData10pt.png");
			
		}
		
		if (inName == "assets/data/fontData11pt.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/fontData11pt.png");
			
		}
		
		if (inName == "assets/data/GhostDungeonTiles.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/GhostDungeonTiles.png");
			
		}
		
		if (inName == "assets/data/handle.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/handle.png");
			
		}
		
		if (inName == "assets/data/logo.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/logo.png");
			
		}
		
		if (inName == "assets/data/logo_corners.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/logo_corners.png");
			
		}
		
		if (inName == "assets/data/logo_light.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/logo_light.png");
			
		}
		
		if (inName == "assets/data/nokiafc22.ttf")
		{
			
			return nme.Assets.getFont ("assets/data/nokiafc22.ttf");
			
		}
		
		if (inName == "assets/data/Player/accessories/necklaces_female_ no_th-sh/bronze.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/bronze.png");
			
		}
		
		if (inName == "assets/data/Player/accessories/necklaces_female_ no_th-sh/gold.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/gold.png");
			
		}
		
		if (inName == "assets/data/Player/accessories/necklaces_female_ no_th-sh/iron.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/iron.png");
			
		}
		
		if (inName == "assets/data/Player/accessories/necklaces_female_ no_th-sh/pirate_wc_only.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/pirate_wc_only.png");
			
		}
		
		if (inName == "assets/data/Player/accessories/necklaces_female_ no_th-sh/silver.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/accessories/necklaces_female_ no_th-sh/silver.png");
			
		}
		
		if (inName == "assets/data/Player/behind_body/quiver.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/behind_body/quiver.png");
			
		}
		
		if (inName == "assets/data/Player/belt/black_female_no_th-sh.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/black_female_no_th-sh.png");
			
		}
		
		if (inName == "assets/data/Player/belt/bronze_female_no_th-sh.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/bronze_female_no_th-sh.png");
			
		}
		
		if (inName == "assets/data/Player/belt/brown_female_no_th-sh.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/brown_female_no_th-sh.png");
			
		}
		
		if (inName == "assets/data/Player/belt/buckles_female_no_th-sh/bronze.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/buckles_female_no_th-sh/bronze.png");
			
		}
		
		if (inName == "assets/data/Player/belt/buckles_female_no_th-sh/gold.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/buckles_female_no_th-sh/gold.png");
			
		}
		
		if (inName == "assets/data/Player/belt/buckles_female_no_th-sh/iron.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/buckles_female_no_th-sh/iron.png");
			
		}
		
		if (inName == "assets/data/Player/belt/buckles_female_no_th-sh/silver.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/buckles_female_no_th-sh/silver.png");
			
		}
		
		if (inName == "assets/data/Player/belt/gold_female_no_th-sh.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/gold_female_no_th-sh.png");
			
		}
		
		if (inName == "assets/data/Player/belt/iron_female_no_th-sh.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/iron_female_no_th-sh.png");
			
		}
		
		if (inName == "assets/data/Player/belt/leather_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/leather_female.png");
			
		}
		
		if (inName == "assets/data/Player/belt/leather_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/leather_male.png");
			
		}
		
		if (inName == "assets/data/Player/belt/rope_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/rope_female.png");
			
		}
		
		if (inName == "assets/data/Player/belt/rope_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/rope_male.png");
			
		}
		
		if (inName == "assets/data/Player/belt/silver_female_no_th-sh.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/belt/silver_female_no_th-sh.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/dark.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/dark.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/dark2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/dark2.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/eyes/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/eyes/blue.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/eyes/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/eyes/brown.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/eyes/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/eyes/gray.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/eyes/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/eyes/green.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/eyes/red.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/eyes/red.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/light.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/light.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/orc.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/orc.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/red_orc_wc_only.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/red_orc_wc_only.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/tanned.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/tanned.png");
			
		}
		
		if (inName == "assets/data/Player/body/female/tanned2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/female/tanned2.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/dark.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/dark.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/dark2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/dark2.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/eyes/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/eyes/blue.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/eyes/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/eyes/brown.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/eyes/casting_eyeglow_skeleton.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/eyes/casting_eyeglow_skeleton.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/eyes/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/eyes/gray.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/eyes/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/eyes/green.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/eyes/red.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/eyes/red.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/light.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/light.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/orc.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/orc.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/skeleton.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/skeleton.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/tanned.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/tanned.png");
			
		}
		
		if (inName == "assets/data/Player/body/male/tanned2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/body/male/tanned2.png");
			
		}
		
		if (inName == "assets/data/Player/feet/black_shoes_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/black_shoes_female.png");
			
		}
		
		if (inName == "assets/data/Player/feet/black_shoes_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/black_shoes_male.png");
			
		}
		
		if (inName == "assets/data/Player/feet/brown_shoes_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/brown_shoes_female.png");
			
		}
		
		if (inName == "assets/data/Player/feet/brown_shoes_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/brown_shoes_male.png");
			
		}
		
		if (inName == "assets/data/Player/feet/ghillies_female_no_th-sh.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/ghillies_female_no_th-sh.png");
			
		}
		
		if (inName == "assets/data/Player/feet/golden_boots_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/golden_boots_female.png");
			
		}
		
		if (inName == "assets/data/Player/feet/golden_boots_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/golden_boots_male.png");
			
		}
		
		if (inName == "assets/data/Player/feet/metal_boots_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/metal_boots_female.png");
			
		}
		
		if (inName == "assets/data/Player/feet/metal_boots_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/metal_boots_male.png");
			
		}
		
		if (inName == "assets/data/Player/feet/slippers_female/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/slippers_female/black.png");
			
		}
		
		if (inName == "assets/data/Player/feet/slippers_female/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/slippers_female/brown.png");
			
		}
		
		if (inName == "assets/data/Player/feet/slippers_female/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/slippers_female/gray.png");
			
		}
		
		if (inName == "assets/data/Player/feet/slippers_female/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/feet/slippers_female/white.png");
			
		}
		
		if (inName == "assets/data/Player/formal_male_no_th-sh/bowtie.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/bowtie.png");
			
		}
		
		if (inName == "assets/data/Player/formal_male_no_th-sh/pants.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/pants.png");
			
		}
		
		if (inName == "assets/data/Player/formal_male_no_th-sh/shirt.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/shirt.png");
			
		}
		
		if (inName == "assets/data/Player/formal_male_no_th-sh/tie.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/tie.png");
			
		}
		
		if (inName == "assets/data/Player/formal_male_no_th-sh/vest.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/vest.png");
			
		}
		
		if (inName == "assets/data/Player/formal_male_no_th-sh/vest_w_shirt_cutout.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/formal_male_no_th-sh/vest_w_shirt_cutout.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/black.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/brown.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/brunette2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/brunette2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/dark-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/dark-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/gray.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/light-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/light-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/raven2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/raven2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/white-blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/white-blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong/white.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangslong.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangslong.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/black.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/brown.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/brunette2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/brunette2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/dark-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/dark-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/gray.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/light-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/light-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/raven2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/raven2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/white-blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/white-blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort/white.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/bangsshort.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/bangsshort.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/black.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/brown.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/brunette2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/brunette2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/dark-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/dark-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/gray.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/light-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/light-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/raven2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/raven2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/white-blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/white-blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose/white.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/loose.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/loose.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/black.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/brown.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/brunette2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/brunette2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/dark-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/dark-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/gray.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/light-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/light-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/raven2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/raven2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/white-blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/white-blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie/white.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/pixie.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/pixie.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/black.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/brown.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/brunette2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/brunette2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/dark-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/dark-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/gray.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/light-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/light-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/raven2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/raven2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/white-blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/white-blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail/white.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/black.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/brown.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/gray.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/light-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/light-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/shadows-darkbody.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/shadows-darkbody.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/shadows-lightbody.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/shadows-lightbody.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/shadows-tanned2body.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/shadows-tanned2body.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/shadows-tannedbody.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/shadows-tannedbody.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/ponytail2/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/ponytail2/white.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/princess/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/princess/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/princess/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/princess/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/princess/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/princess/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/princess/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/princess/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/princess/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/princess/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/princess/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/princess/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/princess/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/princess/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/princess/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/princess/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/princess.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/princess.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/black.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/brown.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/brunette2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/brunette2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/dark-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/dark-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/gray.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/light-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/light-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/raven2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/raven2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/white-blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/white-blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop/white.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/swoop.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/swoop.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/black.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/brown.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/brunette2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/brunette2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/dark-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/dark-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/gray.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/light-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/light-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/raven2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/raven2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/white-blonde2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/white-blonde2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt/white.png");
			
		}
		
		if (inName == "assets/data/Player/hair/female/unkempt.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/female/unkempt.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bangs/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bangs/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bangs/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bangs/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bangs/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bangs/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bangs/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bangs/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bangs/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bangs/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bangs/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bangs/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bangs/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bangs/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bangs/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bangs/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bangs.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bangs.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bedhead/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bedhead/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bedhead/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bedhead/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bedhead/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bedhead/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bedhead/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bedhead/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bedhead/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/bedhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/bedhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/long/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/long/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/long/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/long/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/long/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/long/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/long/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/long/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/long/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/long/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/long/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/long/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/long/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/long/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/long/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/long/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/long.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/long.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/longhawk/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/longhawk/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/longhawk/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/longhawk/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/longhawk/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/longhawk/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/longhawk/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/longhawk/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/longhawk/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/longhawk.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/longhawk.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy1/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy1/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy1/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy1/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy1/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy1/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy1/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy1/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy1/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy1/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy1/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy1/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy1/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy1/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy1/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy1/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy1.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy1.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy2/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy2/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy2/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy2/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy2/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy2/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy2/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy2/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy2/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy2/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy2/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy2/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy2/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy2/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy2/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy2/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/messy2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/messy2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/mohawk/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/mohawk/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/mohawk/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/mohawk/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/mohawk/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/mohawk/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/mohawk/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/mohawk/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/mohawk/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/mohawk.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/mohawk.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/page2.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/page2.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/parted/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/parted/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/parted/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/parted/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/parted/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/parted/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/parted/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/parted/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/parted/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/parted/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/parted/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/parted/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/parted/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/parted/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/parted/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/parted/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/parted.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/parted.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/shadows-darkbody.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/shadows-darkbody.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/shadows-lightbody.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/shadows-lightbody.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/shadows-tanned2body.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/shadows-tanned2body.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/shadows-tannedbody.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/shadows-tannedbody.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/plain/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/plain/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/shorthawk/blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/shorthawk/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/blue.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/shorthawk/brunette.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/brunette.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/shorthawk/green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/green.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/shorthawk/pink.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/pink.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/shorthawk/raven.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/raven.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/shorthawk/redhead.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/redhead.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/shorthawk/white-blonde.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk/white-blonde.png");
			
		}
		
		if (inName == "assets/data/Player/hair/male/shorthawk.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hair/male/shorthawk.png");
			
		}
		
		if (inName == "assets/data/Player/hands/bracelet.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hands/bracelet.png");
			
		}
		
		if (inName == "assets/data/Player/hands/golden_gloves_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hands/golden_gloves_female.png");
			
		}
		
		if (inName == "assets/data/Player/hands/golden_gloves_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hands/golden_gloves_male.png");
			
		}
		
		if (inName == "assets/data/Player/hands/metal_gloves_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hands/metal_gloves_female.png");
			
		}
		
		if (inName == "assets/data/Player/hands/metal_gloves_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/hands/metal_gloves_male.png");
			
		}
		
		if (inName == "assets/data/Player/head/bandana_male_wconly.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/bandana_male_wconly.png");
			
		}
		
		if (inName == "assets/data/Player/head/chainhat_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/chainhat_female.png");
			
		}
		
		if (inName == "assets/data/Player/head/chainhat_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/chainhat_male.png");
			
		}
		
		if (inName == "assets/data/Player/head/chain_hood_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/chain_hood_female.png");
			
		}
		
		if (inName == "assets/data/Player/head/chain_hood_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/chain_hood_male.png");
			
		}
		
		if (inName == "assets/data/Player/head/cloth_hood_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/cloth_hood_female.png");
			
		}
		
		if (inName == "assets/data/Player/head/cloth_hood_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/cloth_hood_male.png");
			
		}
		
		if (inName == "assets/data/Player/head/golden_helm_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/golden_helm_female.png");
			
		}
		
		if (inName == "assets/data/Player/head/golden_helm_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/golden_helm_male.png");
			
		}
		
		if (inName == "assets/data/Player/head/leather_cap_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/leather_cap_female.png");
			
		}
		
		if (inName == "assets/data/Player/head/leather_cap_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/leather_cap_male.png");
			
		}
		
		if (inName == "assets/data/Player/head/metal_helm_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/metal_helm_female.png");
			
		}
		
		if (inName == "assets/data/Player/head/metal_helm_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/metal_helm_male.png");
			
		}
		
		if (inName == "assets/data/Player/head/tiaras_female_no_th_or_sh/bronze.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/tiaras_female_no_th_or_sh/bronze.png");
			
		}
		
		if (inName == "assets/data/Player/head/tiaras_female_no_th_or_sh/gold.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/tiaras_female_no_th_or_sh/gold.png");
			
		}
		
		if (inName == "assets/data/Player/head/tiaras_female_no_th_or_sh/iron.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/tiaras_female_no_th_or_sh/iron.png");
			
		}
		
		if (inName == "assets/data/Player/head/tiaras_female_no_th_or_sh/silver.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/head/tiaras_female_no_th_or_sh/silver.png");
			
		}
		
		if (inName == "assets/data/Player/legs/golden_greaves_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/legs/golden_greaves_female.png");
			
		}
		
		if (inName == "assets/data/Player/legs/golden_greaves_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/legs/golden_greaves_male.png");
			
		}
		
		if (inName == "assets/data/Player/legs/green_pants_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/legs/green_pants_female.png");
			
		}
		
		if (inName == "assets/data/Player/legs/green_pants_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/legs/green_pants_male.png");
			
		}
		
		if (inName == "assets/data/Player/legs/metal_pants_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/legs/metal_pants_female.png");
			
		}
		
		if (inName == "assets/data/Player/legs/metal_pants_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/legs/metal_pants_male.png");
			
		}
		
		if (inName == "assets/data/Player/legs/red_pants_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/legs/red_pants_male.png");
			
		}
		
		if (inName == "assets/data/Player/legs/robe_skirt_female_incomplete.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/legs/robe_skirt_female_incomplete.png");
			
		}
		
		if (inName == "assets/data/Player/legs/robe_skirt_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/legs/robe_skirt_male.png");
			
		}
		
		if (inName == "assets/data/Player/oversize_xcf/slash_swords.xcf")
		{
			
			return nme.Assets.getBytes ("assets/data/Player/oversize_xcf/slash_swords.xcf");
			
		}
		
		if (inName == "assets/data/Player/oversize_xcf/thrust_spears.xcf")
		{
			
			return nme.Assets.getBytes ("assets/data/Player/oversize_xcf/thrust_spears.xcf");
			
		}
		
		if (inName == "assets/data/Player/torso/brown_shirt_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/brown_shirt_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/chain/mail_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/chain/mail_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/chain/mail_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/chain/mail_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/chain/tabard/jacket_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/chain/tabard/jacket_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/chain/tabard/jacket_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/chain/tabard/jacket_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/dress_female/blue_vest.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/dress_female/blue_vest.png");
			
		}
		
		if (inName == "assets/data/Player/torso/dress_female/overskirt.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/dress_female/overskirt.png");
			
		}
		
		if (inName == "assets/data/Player/torso/dress_female/underdress.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/dress_female/underdress.png");
			
		}
		
		if (inName == "assets/data/Player/torso/dress_w_sash_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/dress_w_sash_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/gold/arms_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/gold/arms_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/gold/arms_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/gold/arms_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/gold/chest_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/gold/chest_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/gold/chest_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/gold/chest_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/gold/spikes_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/gold/spikes_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/leather/bracers_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/leather/bracers_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/leather/bracers_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/leather/bracers_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/leather/chest_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/leather/chest_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/leather/chest_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/leather/chest_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/leather/shoulders_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/leather/shoulders_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/leather/shoulders_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/leather/shoulders_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/pirate_shirt_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/pirate_shirt_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/plate/arms_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/plate/arms_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/plate/arms_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/plate/arms_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/plate/chest_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/plate/chest_female.png");
			
		}
		
		if (inName == "assets/data/Player/torso/plate/chest_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/plate/chest_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/black.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/black.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/blue.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/blue.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/brown.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/dark brown.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/dark brown.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/dark gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/dark gray.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/forest green.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/forest green.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/light gray.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/light gray.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/purple.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/purple.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/red.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/red.png");
			
		}
		
		if (inName == "assets/data/Player/torso/robes_female_no_th-sh/white.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/robes_female_no_th-sh/white.png");
			
		}
		
		if (inName == "assets/data/Player/torso/white_shirt_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/white_shirt_male.png");
			
		}
		
		if (inName == "assets/data/Player/torso/wings_no_th-sh.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/torso/wings_no_th-sh.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/arrow.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/arrow.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/arrow_skeleton.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/arrow_skeleton.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/bow.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/bow.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/bow_skeleton.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/bow_skeleton.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/dagger_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/dagger_female.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/dagger_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/dagger_male.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/greatbow.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/greatbow.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/dreagonspear.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/dreagonspear.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/longsword_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/longsword_female.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/longsword_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/longsword_male.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/mace_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/mace_female.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/mace_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/mace_male.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/rapier_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/rapier_female.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/rapier_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/rapier_male.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/saber_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/saber_female.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/saber_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/saber_male.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/spear.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/spear.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/oversize/trident.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/oversize/trident.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/recurvebow.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/recurvebow.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/shield_male_cutoutforbody.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/shield_male_cutoutforbody.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/shield_male_cutoutforhat.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/shield_male_cutoutforhat.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/spear.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/spear.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/steelwand_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/steelwand_female.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/woodwand_female.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/woodwand_female.png");
			
		}
		
		if (inName == "assets/data/Player/weapons/woodwand_male.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/Player/weapons/woodwand_male.png");
			
		}
		
		if (inName == "assets/data/stick.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/stick.png");
			
		}
		
		if (inName == "assets/data/vcr/flixel.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/flixel.png");
			
		}
		
		if (inName == "assets/data/vcr/open.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/open.png");
			
		}
		
		if (inName == "assets/data/vcr/pause.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/pause.png");
			
		}
		
		if (inName == "assets/data/vcr/play.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/play.png");
			
		}
		
		if (inName == "assets/data/vcr/record_off.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/record_off.png");
			
		}
		
		if (inName == "assets/data/vcr/record_on.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/record_on.png");
			
		}
		
		if (inName == "assets/data/vcr/restart.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/restart.png");
			
		}
		
		if (inName == "assets/data/vcr/step.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/step.png");
			
		}
		
		if (inName == "assets/data/vcr/stop.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/stop.png");
			
		}
		
		if (inName == "assets/data/vis/bounds.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vis/bounds.png");
			
		}
		
		if (inName == "assets/HaxeFlixel.svg")
		{
			
			return nme.Assets.getText ("assets/HaxeFlixel.svg");
			
		}
		
		#end
		return null;
	}
	
	
}
