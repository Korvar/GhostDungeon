package nme.installer;


import format.display.MovieClip;
import haxe.Unserializer;
import nme.display.BitmapData;
import nme.media.Sound;
import nme.net.URLRequest;
import nme.text.Font;
import nme.utils.ByteArray;

#if swf
import format.SWF;
#end

#if xfl
import format.XFL;
#end


/**
 * ...
 * @author Joshua Granick
 */

class Assets {

	
	public static var cachedBitmapData:Hash<BitmapData> = new Hash<BitmapData>();
	#if swf private static var cachedSWFLibraries:Hash <SWF> = new Hash <SWF> (); #end
	#if xfl private static var cachedXFLLibraries:Hash <XFL> = new Hash <XFL> (); #end
	
	private static var initialized:Bool = false;
	private static var libraryTypes:Hash <String> = new Hash <String> ();
	private static var resourceNames:Hash <String> = new Hash <String> ();
	private static var resourceTypes:Hash <String> = new Hash <String> ();
	
	
	private static function initialize ():Void {
		
		if (!initialized) {
			
			resourceNames.set ("Beep", "assets/data/beep.wav");
			resourceTypes.set ("Beep", "sound");
			resourceNames.set ("assets/data/autotiles.png", "assets/data/autotiles.png");
			resourceTypes.set ("assets/data/autotiles.png", "image");
			resourceNames.set ("assets/data/autotiles_alt.png", "assets/data/autotiles_alt.png");
			resourceTypes.set ("assets/data/autotiles_alt.png", "image");
			resourceNames.set ("assets/data/base.png", "assets/data/base.png");
			resourceTypes.set ("assets/data/base.png", "image");
			resourceNames.set ("assets/data/beep.mp3", "assets/data/beep.mp3");
			resourceTypes.set ("assets/data/beep.mp3", "music");
			resourceNames.set ("assets/data/beep.wav", "assets/data/beep.wav");
			resourceTypes.set ("assets/data/beep.wav", "sound");
			resourceNames.set ("assets/data/button.png", "assets/data/button.png");
			resourceTypes.set ("assets/data/button.png", "image");
			resourceNames.set ("assets/data/button_a.png", "assets/data/button_a.png");
			resourceTypes.set ("assets/data/button_a.png", "image");
			resourceNames.set ("assets/data/button_b.png", "assets/data/button_b.png");
			resourceTypes.set ("assets/data/button_b.png", "image");
			resourceNames.set ("assets/data/button_c.png", "assets/data/button_c.png");
			resourceTypes.set ("assets/data/button_c.png", "image");
			resourceNames.set ("assets/data/button_down.png", "assets/data/button_down.png");
			resourceTypes.set ("assets/data/button_down.png", "image");
			resourceNames.set ("assets/data/button_left.png", "assets/data/button_left.png");
			resourceTypes.set ("assets/data/button_left.png", "image");
			resourceNames.set ("assets/data/button_right.png", "assets/data/button_right.png");
			resourceTypes.set ("assets/data/button_right.png", "image");
			resourceNames.set ("assets/data/button_up.png", "assets/data/button_up.png");
			resourceTypes.set ("assets/data/button_up.png", "image");
			resourceNames.set ("assets/data/button_x.png", "assets/data/button_x.png");
			resourceTypes.set ("assets/data/button_x.png", "image");
			resourceNames.set ("assets/data/button_y.png", "assets/data/button_y.png");
			resourceTypes.set ("assets/data/button_y.png", "image");
			resourceNames.set ("assets/data/coin_gold.png", "assets/data/coin_gold.png");
			resourceTypes.set ("assets/data/coin_gold.png", "image");
			resourceNames.set ("assets/data/completetask_0.mp3", "assets/data/completetask_0.mp3");
			resourceTypes.set ("assets/data/completetask_0.mp3", "music");
			resourceNames.set ("assets/data/courier.ttf", "assets/data/courier.ttf");
			resourceTypes.set ("assets/data/courier.ttf", "font");
			resourceNames.set ("assets/data/cursor.png", "assets/data/cursor.png");
			resourceTypes.set ("assets/data/cursor.png", "image");
			resourceNames.set ("assets/data/default.png", "assets/data/default.png");
			resourceTypes.set ("assets/data/default.png", "image");
			resourceNames.set ("assets/data/Dungeon_Walls.csv", "assets/data/Dungeon_Walls.csv");
			resourceTypes.set ("assets/data/Dungeon_Walls.csv", "text");
			resourceNames.set ("assets/data/export/BaseLevel.as", "assets/data/export/BaseLevel.as");
			resourceTypes.set ("assets/data/export/BaseLevel.as", "text");
			resourceNames.set ("assets/data/export/Level_Group1.as", "assets/data/export/Level_Group1.as");
			resourceTypes.set ("assets/data/export/Level_Group1.as", "text");
			resourceNames.set ("assets/data/export/mapCSV_Group1_Dungeon_Walls.csv", "assets/data/export/mapCSV_Group1_Dungeon_Walls.csv");
			resourceTypes.set ("assets/data/export/mapCSV_Group1_Dungeon_Walls.csv", "text");
			resourceNames.set ("assets/data/fontData10pt.png", "assets/data/fontData10pt.png");
			resourceTypes.set ("assets/data/fontData10pt.png", "image");
			resourceNames.set ("assets/data/fontData11pt.png", "assets/data/fontData11pt.png");
			resourceTypes.set ("assets/data/fontData11pt.png", "image");
			resourceNames.set ("assets/data/GhostDungeonTiles.png", "assets/data/GhostDungeonTiles.png");
			resourceTypes.set ("assets/data/GhostDungeonTiles.png", "image");
			resourceNames.set ("assets/data/handle.png", "assets/data/handle.png");
			resourceTypes.set ("assets/data/handle.png", "image");
			resourceNames.set ("assets/data/heart_full_32x32_1.png", "assets/data/heart_full_32x32_1.png");
			resourceTypes.set ("assets/data/heart_full_32x32_1.png", "image");
			resourceNames.set ("assets/data/logo.png", "assets/data/logo.png");
			resourceTypes.set ("assets/data/logo.png", "image");
			resourceNames.set ("assets/data/logo_corners.png", "assets/data/logo_corners.png");
			resourceTypes.set ("assets/data/logo_corners.png", "image");
			resourceNames.set ("assets/data/logo_light.png", "assets/data/logo_light.png");
			resourceTypes.set ("assets/data/logo_light.png", "image");
			resourceNames.set ("assets/data/mapCSV_Group1_Dungeon_Walls.csv", "assets/data/mapCSV_Group1_Dungeon_Walls.csv");
			resourceTypes.set ("assets/data/mapCSV_Group1_Dungeon_Walls.csv", "text");
			resourceNames.set ("assets/data/nokiafc22.ttf", "assets/data/nokiafc22.ttf");
			resourceTypes.set ("assets/data/nokiafc22.ttf", "font");
			resourceNames.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/bronze.png", "assets/data/Player/accessories/necklaces_female_ no_th-sh/bronze.png");
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/bronze.png", "image");
			resourceNames.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/gold.png", "assets/data/Player/accessories/necklaces_female_ no_th-sh/gold.png");
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/gold.png", "image");
			resourceNames.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/iron.png", "assets/data/Player/accessories/necklaces_female_ no_th-sh/iron.png");
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/iron.png", "image");
			resourceNames.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/pirate_wc_only.png", "assets/data/Player/accessories/necklaces_female_ no_th-sh/pirate_wc_only.png");
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/pirate_wc_only.png", "image");
			resourceNames.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/silver.png", "assets/data/Player/accessories/necklaces_female_ no_th-sh/silver.png");
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/silver.png", "image");
			resourceNames.set ("assets/data/Player/behind_body/quiver.png", "assets/data/Player/behind_body/quiver.png");
			resourceTypes.set ("assets/data/Player/behind_body/quiver.png", "image");
			resourceNames.set ("assets/data/Player/belt/black_female_no_th-sh.png", "assets/data/Player/belt/black_female_no_th-sh.png");
			resourceTypes.set ("assets/data/Player/belt/black_female_no_th-sh.png", "image");
			resourceNames.set ("assets/data/Player/belt/bronze_female_no_th-sh.png", "assets/data/Player/belt/bronze_female_no_th-sh.png");
			resourceTypes.set ("assets/data/Player/belt/bronze_female_no_th-sh.png", "image");
			resourceNames.set ("assets/data/Player/belt/brown_female_no_th-sh.png", "assets/data/Player/belt/brown_female_no_th-sh.png");
			resourceTypes.set ("assets/data/Player/belt/brown_female_no_th-sh.png", "image");
			resourceNames.set ("assets/data/Player/belt/buckles_female_no_th-sh/bronze.png", "assets/data/Player/belt/buckles_female_no_th-sh/bronze.png");
			resourceTypes.set ("assets/data/Player/belt/buckles_female_no_th-sh/bronze.png", "image");
			resourceNames.set ("assets/data/Player/belt/buckles_female_no_th-sh/gold.png", "assets/data/Player/belt/buckles_female_no_th-sh/gold.png");
			resourceTypes.set ("assets/data/Player/belt/buckles_female_no_th-sh/gold.png", "image");
			resourceNames.set ("assets/data/Player/belt/buckles_female_no_th-sh/iron.png", "assets/data/Player/belt/buckles_female_no_th-sh/iron.png");
			resourceTypes.set ("assets/data/Player/belt/buckles_female_no_th-sh/iron.png", "image");
			resourceNames.set ("assets/data/Player/belt/buckles_female_no_th-sh/silver.png", "assets/data/Player/belt/buckles_female_no_th-sh/silver.png");
			resourceTypes.set ("assets/data/Player/belt/buckles_female_no_th-sh/silver.png", "image");
			resourceNames.set ("assets/data/Player/belt/gold_female_no_th-sh.png", "assets/data/Player/belt/gold_female_no_th-sh.png");
			resourceTypes.set ("assets/data/Player/belt/gold_female_no_th-sh.png", "image");
			resourceNames.set ("assets/data/Player/belt/iron_female_no_th-sh.png", "assets/data/Player/belt/iron_female_no_th-sh.png");
			resourceTypes.set ("assets/data/Player/belt/iron_female_no_th-sh.png", "image");
			resourceNames.set ("assets/data/Player/belt/leather_female.png", "assets/data/Player/belt/leather_female.png");
			resourceTypes.set ("assets/data/Player/belt/leather_female.png", "image");
			resourceNames.set ("assets/data/Player/belt/leather_male.png", "assets/data/Player/belt/leather_male.png");
			resourceTypes.set ("assets/data/Player/belt/leather_male.png", "image");
			resourceNames.set ("assets/data/Player/belt/rope_female.png", "assets/data/Player/belt/rope_female.png");
			resourceTypes.set ("assets/data/Player/belt/rope_female.png", "image");
			resourceNames.set ("assets/data/Player/belt/rope_male.png", "assets/data/Player/belt/rope_male.png");
			resourceTypes.set ("assets/data/Player/belt/rope_male.png", "image");
			resourceNames.set ("assets/data/Player/belt/silver_female_no_th-sh.png", "assets/data/Player/belt/silver_female_no_th-sh.png");
			resourceTypes.set ("assets/data/Player/belt/silver_female_no_th-sh.png", "image");
			resourceNames.set ("assets/data/Player/body/female/dark.png", "assets/data/Player/body/female/dark.png");
			resourceTypes.set ("assets/data/Player/body/female/dark.png", "image");
			resourceNames.set ("assets/data/Player/body/female/dark2.png", "assets/data/Player/body/female/dark2.png");
			resourceTypes.set ("assets/data/Player/body/female/dark2.png", "image");
			resourceNames.set ("assets/data/Player/body/female/eyes/blue.png", "assets/data/Player/body/female/eyes/blue.png");
			resourceTypes.set ("assets/data/Player/body/female/eyes/blue.png", "image");
			resourceNames.set ("assets/data/Player/body/female/eyes/brown.png", "assets/data/Player/body/female/eyes/brown.png");
			resourceTypes.set ("assets/data/Player/body/female/eyes/brown.png", "image");
			resourceNames.set ("assets/data/Player/body/female/eyes/gray.png", "assets/data/Player/body/female/eyes/gray.png");
			resourceTypes.set ("assets/data/Player/body/female/eyes/gray.png", "image");
			resourceNames.set ("assets/data/Player/body/female/eyes/green.png", "assets/data/Player/body/female/eyes/green.png");
			resourceTypes.set ("assets/data/Player/body/female/eyes/green.png", "image");
			resourceNames.set ("assets/data/Player/body/female/eyes/red.png", "assets/data/Player/body/female/eyes/red.png");
			resourceTypes.set ("assets/data/Player/body/female/eyes/red.png", "image");
			resourceNames.set ("assets/data/Player/body/female/light.png", "assets/data/Player/body/female/light.png");
			resourceTypes.set ("assets/data/Player/body/female/light.png", "image");
			resourceNames.set ("assets/data/Player/body/female/orc.png", "assets/data/Player/body/female/orc.png");
			resourceTypes.set ("assets/data/Player/body/female/orc.png", "image");
			resourceNames.set ("assets/data/Player/body/female/red_orc_wc_only.png", "assets/data/Player/body/female/red_orc_wc_only.png");
			resourceTypes.set ("assets/data/Player/body/female/red_orc_wc_only.png", "image");
			resourceNames.set ("assets/data/Player/body/female/tanned.png", "assets/data/Player/body/female/tanned.png");
			resourceTypes.set ("assets/data/Player/body/female/tanned.png", "image");
			resourceNames.set ("assets/data/Player/body/female/tanned2.png", "assets/data/Player/body/female/tanned2.png");
			resourceTypes.set ("assets/data/Player/body/female/tanned2.png", "image");
			resourceNames.set ("assets/data/Player/body/male/dark.png", "assets/data/Player/body/male/dark.png");
			resourceTypes.set ("assets/data/Player/body/male/dark.png", "image");
			resourceNames.set ("assets/data/Player/body/male/dark2.png", "assets/data/Player/body/male/dark2.png");
			resourceTypes.set ("assets/data/Player/body/male/dark2.png", "image");
			resourceNames.set ("assets/data/Player/body/male/eyes/blue.png", "assets/data/Player/body/male/eyes/blue.png");
			resourceTypes.set ("assets/data/Player/body/male/eyes/blue.png", "image");
			resourceNames.set ("assets/data/Player/body/male/eyes/brown.png", "assets/data/Player/body/male/eyes/brown.png");
			resourceTypes.set ("assets/data/Player/body/male/eyes/brown.png", "image");
			resourceNames.set ("assets/data/Player/body/male/eyes/casting_eyeglow_skeleton.png", "assets/data/Player/body/male/eyes/casting_eyeglow_skeleton.png");
			resourceTypes.set ("assets/data/Player/body/male/eyes/casting_eyeglow_skeleton.png", "image");
			resourceNames.set ("assets/data/Player/body/male/eyes/gray.png", "assets/data/Player/body/male/eyes/gray.png");
			resourceTypes.set ("assets/data/Player/body/male/eyes/gray.png", "image");
			resourceNames.set ("assets/data/Player/body/male/eyes/green.png", "assets/data/Player/body/male/eyes/green.png");
			resourceTypes.set ("assets/data/Player/body/male/eyes/green.png", "image");
			resourceNames.set ("assets/data/Player/body/male/eyes/red.png", "assets/data/Player/body/male/eyes/red.png");
			resourceTypes.set ("assets/data/Player/body/male/eyes/red.png", "image");
			resourceNames.set ("assets/data/Player/body/male/light.png", "assets/data/Player/body/male/light.png");
			resourceTypes.set ("assets/data/Player/body/male/light.png", "image");
			resourceNames.set ("assets/data/Player/body/male/orc.png", "assets/data/Player/body/male/orc.png");
			resourceTypes.set ("assets/data/Player/body/male/orc.png", "image");
			resourceNames.set ("assets/data/Player/body/male/skeleton.png", "assets/data/Player/body/male/skeleton.png");
			resourceTypes.set ("assets/data/Player/body/male/skeleton.png", "image");
			resourceNames.set ("assets/data/Player/body/male/tanned.png", "assets/data/Player/body/male/tanned.png");
			resourceTypes.set ("assets/data/Player/body/male/tanned.png", "image");
			resourceNames.set ("assets/data/Player/body/male/tanned2.png", "assets/data/Player/body/male/tanned2.png");
			resourceTypes.set ("assets/data/Player/body/male/tanned2.png", "image");
			resourceNames.set ("assets/data/Player/feet/black_shoes_female.png", "assets/data/Player/feet/black_shoes_female.png");
			resourceTypes.set ("assets/data/Player/feet/black_shoes_female.png", "image");
			resourceNames.set ("assets/data/Player/feet/black_shoes_male.png", "assets/data/Player/feet/black_shoes_male.png");
			resourceTypes.set ("assets/data/Player/feet/black_shoes_male.png", "image");
			resourceNames.set ("assets/data/Player/feet/brown_shoes_female.png", "assets/data/Player/feet/brown_shoes_female.png");
			resourceTypes.set ("assets/data/Player/feet/brown_shoes_female.png", "image");
			resourceNames.set ("assets/data/Player/feet/brown_shoes_male.png", "assets/data/Player/feet/brown_shoes_male.png");
			resourceTypes.set ("assets/data/Player/feet/brown_shoes_male.png", "image");
			resourceNames.set ("assets/data/Player/feet/ghillies_female_no_th-sh.png", "assets/data/Player/feet/ghillies_female_no_th-sh.png");
			resourceTypes.set ("assets/data/Player/feet/ghillies_female_no_th-sh.png", "image");
			resourceNames.set ("assets/data/Player/feet/golden_boots_female.png", "assets/data/Player/feet/golden_boots_female.png");
			resourceTypes.set ("assets/data/Player/feet/golden_boots_female.png", "image");
			resourceNames.set ("assets/data/Player/feet/golden_boots_male.png", "assets/data/Player/feet/golden_boots_male.png");
			resourceTypes.set ("assets/data/Player/feet/golden_boots_male.png", "image");
			resourceNames.set ("assets/data/Player/feet/metal_boots_female.png", "assets/data/Player/feet/metal_boots_female.png");
			resourceTypes.set ("assets/data/Player/feet/metal_boots_female.png", "image");
			resourceNames.set ("assets/data/Player/feet/metal_boots_male.png", "assets/data/Player/feet/metal_boots_male.png");
			resourceTypes.set ("assets/data/Player/feet/metal_boots_male.png", "image");
			resourceNames.set ("assets/data/Player/feet/slippers_female/black.png", "assets/data/Player/feet/slippers_female/black.png");
			resourceTypes.set ("assets/data/Player/feet/slippers_female/black.png", "image");
			resourceNames.set ("assets/data/Player/feet/slippers_female/brown.png", "assets/data/Player/feet/slippers_female/brown.png");
			resourceTypes.set ("assets/data/Player/feet/slippers_female/brown.png", "image");
			resourceNames.set ("assets/data/Player/feet/slippers_female/gray.png", "assets/data/Player/feet/slippers_female/gray.png");
			resourceTypes.set ("assets/data/Player/feet/slippers_female/gray.png", "image");
			resourceNames.set ("assets/data/Player/feet/slippers_female/white.png", "assets/data/Player/feet/slippers_female/white.png");
			resourceTypes.set ("assets/data/Player/feet/slippers_female/white.png", "image");
			resourceNames.set ("assets/data/Player/formal_male_no_th-sh/bowtie.png", "assets/data/Player/formal_male_no_th-sh/bowtie.png");
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/bowtie.png", "image");
			resourceNames.set ("assets/data/Player/formal_male_no_th-sh/pants.png", "assets/data/Player/formal_male_no_th-sh/pants.png");
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/pants.png", "image");
			resourceNames.set ("assets/data/Player/formal_male_no_th-sh/shirt.png", "assets/data/Player/formal_male_no_th-sh/shirt.png");
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/shirt.png", "image");
			resourceNames.set ("assets/data/Player/formal_male_no_th-sh/tie.png", "assets/data/Player/formal_male_no_th-sh/tie.png");
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/tie.png", "image");
			resourceNames.set ("assets/data/Player/formal_male_no_th-sh/vest.png", "assets/data/Player/formal_male_no_th-sh/vest.png");
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/vest.png", "image");
			resourceNames.set ("assets/data/Player/formal_male_no_th-sh/vest_w_shirt_cutout.png", "assets/data/Player/formal_male_no_th-sh/vest_w_shirt_cutout.png");
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/vest_w_shirt_cutout.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/black.png", "assets/data/Player/hair/female/bangslong/black.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/black.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/blonde.png", "assets/data/Player/hair/female/bangslong/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/blonde2.png", "assets/data/Player/hair/female/bangslong/blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/blue.png", "assets/data/Player/hair/female/bangslong/blue.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/brown.png", "assets/data/Player/hair/female/bangslong/brown.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/brown.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/brunette.png", "assets/data/Player/hair/female/bangslong/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/brunette2.png", "assets/data/Player/hair/female/bangslong/brunette2.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/brunette2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/dark-blonde.png", "assets/data/Player/hair/female/bangslong/dark-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/dark-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/gray.png", "assets/data/Player/hair/female/bangslong/gray.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/gray.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/green.png", "assets/data/Player/hair/female/bangslong/green.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/light-blonde.png", "assets/data/Player/hair/female/bangslong/light-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/light-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/pink.png", "assets/data/Player/hair/female/bangslong/pink.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/raven.png", "assets/data/Player/hair/female/bangslong/raven.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/raven2.png", "assets/data/Player/hair/female/bangslong/raven2.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/raven2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/redhead.png", "assets/data/Player/hair/female/bangslong/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/white-blonde.png", "assets/data/Player/hair/female/bangslong/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/white-blonde2.png", "assets/data/Player/hair/female/bangslong/white-blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/white-blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong/white.png", "assets/data/Player/hair/female/bangslong/white.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/white.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangslong.png", "assets/data/Player/hair/female/bangslong.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangslong.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/black.png", "assets/data/Player/hair/female/bangsshort/black.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/black.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/blonde.png", "assets/data/Player/hair/female/bangsshort/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/blonde2.png", "assets/data/Player/hair/female/bangsshort/blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/blue.png", "assets/data/Player/hair/female/bangsshort/blue.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/brown.png", "assets/data/Player/hair/female/bangsshort/brown.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/brown.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/brunette.png", "assets/data/Player/hair/female/bangsshort/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/brunette2.png", "assets/data/Player/hair/female/bangsshort/brunette2.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/brunette2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/dark-blonde.png", "assets/data/Player/hair/female/bangsshort/dark-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/dark-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/gray.png", "assets/data/Player/hair/female/bangsshort/gray.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/gray.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/green.png", "assets/data/Player/hair/female/bangsshort/green.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/light-blonde.png", "assets/data/Player/hair/female/bangsshort/light-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/light-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/pink.png", "assets/data/Player/hair/female/bangsshort/pink.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/raven.png", "assets/data/Player/hair/female/bangsshort/raven.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/raven2.png", "assets/data/Player/hair/female/bangsshort/raven2.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/raven2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/redhead.png", "assets/data/Player/hair/female/bangsshort/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/white-blonde.png", "assets/data/Player/hair/female/bangsshort/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/white-blonde2.png", "assets/data/Player/hair/female/bangsshort/white-blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/white-blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort/white.png", "assets/data/Player/hair/female/bangsshort/white.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/white.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/bangsshort.png", "assets/data/Player/hair/female/bangsshort.png");
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/black.png", "assets/data/Player/hair/female/loose/black.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/black.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/blonde.png", "assets/data/Player/hair/female/loose/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/blonde2.png", "assets/data/Player/hair/female/loose/blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/blue.png", "assets/data/Player/hair/female/loose/blue.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/brown.png", "assets/data/Player/hair/female/loose/brown.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/brown.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/brunette.png", "assets/data/Player/hair/female/loose/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/brunette2.png", "assets/data/Player/hair/female/loose/brunette2.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/brunette2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/dark-blonde.png", "assets/data/Player/hair/female/loose/dark-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/dark-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/gray.png", "assets/data/Player/hair/female/loose/gray.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/gray.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/green.png", "assets/data/Player/hair/female/loose/green.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/light-blonde.png", "assets/data/Player/hair/female/loose/light-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/light-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/pink.png", "assets/data/Player/hair/female/loose/pink.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/raven.png", "assets/data/Player/hair/female/loose/raven.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/raven2.png", "assets/data/Player/hair/female/loose/raven2.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/raven2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/redhead.png", "assets/data/Player/hair/female/loose/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/white-blonde.png", "assets/data/Player/hair/female/loose/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/white-blonde2.png", "assets/data/Player/hair/female/loose/white-blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/white-blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose/white.png", "assets/data/Player/hair/female/loose/white.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose/white.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/loose.png", "assets/data/Player/hair/female/loose.png");
			resourceTypes.set ("assets/data/Player/hair/female/loose.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/black.png", "assets/data/Player/hair/female/pixie/black.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/black.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/blonde.png", "assets/data/Player/hair/female/pixie/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/blonde2.png", "assets/data/Player/hair/female/pixie/blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/blue.png", "assets/data/Player/hair/female/pixie/blue.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/brown.png", "assets/data/Player/hair/female/pixie/brown.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/brown.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/brunette.png", "assets/data/Player/hair/female/pixie/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/brunette2.png", "assets/data/Player/hair/female/pixie/brunette2.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/brunette2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/dark-blonde.png", "assets/data/Player/hair/female/pixie/dark-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/dark-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/gray.png", "assets/data/Player/hair/female/pixie/gray.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/gray.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/green.png", "assets/data/Player/hair/female/pixie/green.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/light-blonde.png", "assets/data/Player/hair/female/pixie/light-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/light-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/pink.png", "assets/data/Player/hair/female/pixie/pink.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/raven.png", "assets/data/Player/hair/female/pixie/raven.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/raven2.png", "assets/data/Player/hair/female/pixie/raven2.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/raven2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/redhead.png", "assets/data/Player/hair/female/pixie/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/white-blonde.png", "assets/data/Player/hair/female/pixie/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/white-blonde2.png", "assets/data/Player/hair/female/pixie/white-blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/white-blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie/white.png", "assets/data/Player/hair/female/pixie/white.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie/white.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/pixie.png", "assets/data/Player/hair/female/pixie.png");
			resourceTypes.set ("assets/data/Player/hair/female/pixie.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/black.png", "assets/data/Player/hair/female/ponytail/black.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/black.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/blonde.png", "assets/data/Player/hair/female/ponytail/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/blonde2.png", "assets/data/Player/hair/female/ponytail/blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/blue.png", "assets/data/Player/hair/female/ponytail/blue.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/brown.png", "assets/data/Player/hair/female/ponytail/brown.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/brown.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/brunette.png", "assets/data/Player/hair/female/ponytail/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/brunette2.png", "assets/data/Player/hair/female/ponytail/brunette2.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/brunette2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/dark-blonde.png", "assets/data/Player/hair/female/ponytail/dark-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/dark-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/gray.png", "assets/data/Player/hair/female/ponytail/gray.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/gray.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/green.png", "assets/data/Player/hair/female/ponytail/green.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/light-blonde.png", "assets/data/Player/hair/female/ponytail/light-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/light-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/pink.png", "assets/data/Player/hair/female/ponytail/pink.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/raven.png", "assets/data/Player/hair/female/ponytail/raven.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/raven2.png", "assets/data/Player/hair/female/ponytail/raven2.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/raven2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/redhead.png", "assets/data/Player/hair/female/ponytail/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/white-blonde.png", "assets/data/Player/hair/female/ponytail/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/white-blonde2.png", "assets/data/Player/hair/female/ponytail/white-blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/white-blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail/white.png", "assets/data/Player/hair/female/ponytail/white.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/white.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail.png", "assets/data/Player/hair/female/ponytail.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/black.png", "assets/data/Player/hair/female/ponytail2/black.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/black.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/blonde.png", "assets/data/Player/hair/female/ponytail2/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/blue.png", "assets/data/Player/hair/female/ponytail2/blue.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/brown.png", "assets/data/Player/hair/female/ponytail2/brown.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/brown.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/brunette.png", "assets/data/Player/hair/female/ponytail2/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/gray.png", "assets/data/Player/hair/female/ponytail2/gray.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/gray.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/green.png", "assets/data/Player/hair/female/ponytail2/green.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/light-blonde.png", "assets/data/Player/hair/female/ponytail2/light-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/light-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/pink.png", "assets/data/Player/hair/female/ponytail2/pink.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/raven.png", "assets/data/Player/hair/female/ponytail2/raven.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/redhead.png", "assets/data/Player/hair/female/ponytail2/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/shadows-darkbody.png", "assets/data/Player/hair/female/ponytail2/shadows-darkbody.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/shadows-darkbody.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/shadows-lightbody.png", "assets/data/Player/hair/female/ponytail2/shadows-lightbody.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/shadows-lightbody.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/shadows-tanned2body.png", "assets/data/Player/hair/female/ponytail2/shadows-tanned2body.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/shadows-tanned2body.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/shadows-tannedbody.png", "assets/data/Player/hair/female/ponytail2/shadows-tannedbody.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/shadows-tannedbody.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/white-blonde.png", "assets/data/Player/hair/female/ponytail2/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/ponytail2/white.png", "assets/data/Player/hair/female/ponytail2/white.png");
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/white.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/princess/blonde.png", "assets/data/Player/hair/female/princess/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/princess/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/princess/blue.png", "assets/data/Player/hair/female/princess/blue.png");
			resourceTypes.set ("assets/data/Player/hair/female/princess/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/princess/brunette.png", "assets/data/Player/hair/female/princess/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/female/princess/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/princess/green.png", "assets/data/Player/hair/female/princess/green.png");
			resourceTypes.set ("assets/data/Player/hair/female/princess/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/princess/pink.png", "assets/data/Player/hair/female/princess/pink.png");
			resourceTypes.set ("assets/data/Player/hair/female/princess/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/princess/raven.png", "assets/data/Player/hair/female/princess/raven.png");
			resourceTypes.set ("assets/data/Player/hair/female/princess/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/princess/redhead.png", "assets/data/Player/hair/female/princess/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/female/princess/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/princess/white-blonde.png", "assets/data/Player/hair/female/princess/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/princess/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/princess.png", "assets/data/Player/hair/female/princess.png");
			resourceTypes.set ("assets/data/Player/hair/female/princess.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/black.png", "assets/data/Player/hair/female/swoop/black.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/black.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/blonde.png", "assets/data/Player/hair/female/swoop/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/blonde2.png", "assets/data/Player/hair/female/swoop/blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/blue.png", "assets/data/Player/hair/female/swoop/blue.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/brown.png", "assets/data/Player/hair/female/swoop/brown.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/brown.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/brunette.png", "assets/data/Player/hair/female/swoop/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/brunette2.png", "assets/data/Player/hair/female/swoop/brunette2.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/brunette2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/dark-blonde.png", "assets/data/Player/hair/female/swoop/dark-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/dark-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/gray.png", "assets/data/Player/hair/female/swoop/gray.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/gray.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/green.png", "assets/data/Player/hair/female/swoop/green.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/light-blonde.png", "assets/data/Player/hair/female/swoop/light-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/light-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/pink.png", "assets/data/Player/hair/female/swoop/pink.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/raven.png", "assets/data/Player/hair/female/swoop/raven.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/raven2.png", "assets/data/Player/hair/female/swoop/raven2.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/raven2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/redhead.png", "assets/data/Player/hair/female/swoop/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/white-blonde.png", "assets/data/Player/hair/female/swoop/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/white-blonde2.png", "assets/data/Player/hair/female/swoop/white-blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/white-blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop/white.png", "assets/data/Player/hair/female/swoop/white.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop/white.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/swoop.png", "assets/data/Player/hair/female/swoop.png");
			resourceTypes.set ("assets/data/Player/hair/female/swoop.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/black.png", "assets/data/Player/hair/female/unkempt/black.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/black.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/blonde.png", "assets/data/Player/hair/female/unkempt/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/blonde2.png", "assets/data/Player/hair/female/unkempt/blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/blue.png", "assets/data/Player/hair/female/unkempt/blue.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/brown.png", "assets/data/Player/hair/female/unkempt/brown.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/brown.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/brunette.png", "assets/data/Player/hair/female/unkempt/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/brunette2.png", "assets/data/Player/hair/female/unkempt/brunette2.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/brunette2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/dark-blonde.png", "assets/data/Player/hair/female/unkempt/dark-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/dark-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/gray.png", "assets/data/Player/hair/female/unkempt/gray.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/gray.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/green.png", "assets/data/Player/hair/female/unkempt/green.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/light-blonde.png", "assets/data/Player/hair/female/unkempt/light-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/light-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/pink.png", "assets/data/Player/hair/female/unkempt/pink.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/raven.png", "assets/data/Player/hair/female/unkempt/raven.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/raven2.png", "assets/data/Player/hair/female/unkempt/raven2.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/raven2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/redhead.png", "assets/data/Player/hair/female/unkempt/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/white-blonde.png", "assets/data/Player/hair/female/unkempt/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/white-blonde2.png", "assets/data/Player/hair/female/unkempt/white-blonde2.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/white-blonde2.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt/white.png", "assets/data/Player/hair/female/unkempt/white.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/white.png", "image");
			resourceNames.set ("assets/data/Player/hair/female/unkempt.png", "assets/data/Player/hair/female/unkempt.png");
			resourceTypes.set ("assets/data/Player/hair/female/unkempt.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bangs/blonde.png", "assets/data/Player/hair/male/bangs/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/bangs/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bangs/blue.png", "assets/data/Player/hair/male/bangs/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/bangs/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bangs/brunette.png", "assets/data/Player/hair/male/bangs/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/bangs/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bangs/green.png", "assets/data/Player/hair/male/bangs/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/bangs/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bangs/pink.png", "assets/data/Player/hair/male/bangs/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/bangs/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bangs/raven.png", "assets/data/Player/hair/male/bangs/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/bangs/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bangs/redhead.png", "assets/data/Player/hair/male/bangs/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/bangs/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bangs/white-blonde.png", "assets/data/Player/hair/male/bangs/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/bangs/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bangs.png", "assets/data/Player/hair/male/bangs.png");
			resourceTypes.set ("assets/data/Player/hair/male/bangs.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bedhead/blonde.png", "assets/data/Player/hair/male/bedhead/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bedhead/blue.png", "assets/data/Player/hair/male/bedhead/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bedhead/brunette.png", "assets/data/Player/hair/male/bedhead/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bedhead/green.png", "assets/data/Player/hair/male/bedhead/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bedhead/pink.png", "assets/data/Player/hair/male/bedhead/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bedhead/raven.png", "assets/data/Player/hair/male/bedhead/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bedhead/redhead.png", "assets/data/Player/hair/male/bedhead/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bedhead/white-blonde.png", "assets/data/Player/hair/male/bedhead/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/bedhead.png", "assets/data/Player/hair/male/bedhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/bedhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/long/blonde.png", "assets/data/Player/hair/male/long/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/long/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/long/blue.png", "assets/data/Player/hair/male/long/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/long/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/long/brunette.png", "assets/data/Player/hair/male/long/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/long/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/long/green.png", "assets/data/Player/hair/male/long/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/long/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/long/pink.png", "assets/data/Player/hair/male/long/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/long/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/long/raven.png", "assets/data/Player/hair/male/long/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/long/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/long/redhead.png", "assets/data/Player/hair/male/long/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/long/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/long/white-blonde.png", "assets/data/Player/hair/male/long/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/long/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/long.png", "assets/data/Player/hair/male/long.png");
			resourceTypes.set ("assets/data/Player/hair/male/long.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/longhawk/blonde.png", "assets/data/Player/hair/male/longhawk/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/longhawk/blue.png", "assets/data/Player/hair/male/longhawk/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/longhawk/brunette.png", "assets/data/Player/hair/male/longhawk/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/longhawk/green.png", "assets/data/Player/hair/male/longhawk/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/longhawk/pink.png", "assets/data/Player/hair/male/longhawk/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/longhawk/raven.png", "assets/data/Player/hair/male/longhawk/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/longhawk/redhead.png", "assets/data/Player/hair/male/longhawk/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/longhawk/white-blonde.png", "assets/data/Player/hair/male/longhawk/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/longhawk.png", "assets/data/Player/hair/male/longhawk.png");
			resourceTypes.set ("assets/data/Player/hair/male/longhawk.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy1/blonde.png", "assets/data/Player/hair/male/messy1/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy1/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy1/blue.png", "assets/data/Player/hair/male/messy1/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy1/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy1/brunette.png", "assets/data/Player/hair/male/messy1/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy1/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy1/green.png", "assets/data/Player/hair/male/messy1/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy1/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy1/pink.png", "assets/data/Player/hair/male/messy1/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy1/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy1/raven.png", "assets/data/Player/hair/male/messy1/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy1/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy1/redhead.png", "assets/data/Player/hair/male/messy1/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy1/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy1/white-blonde.png", "assets/data/Player/hair/male/messy1/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy1/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy1.png", "assets/data/Player/hair/male/messy1.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy1.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy2/blonde.png", "assets/data/Player/hair/male/messy2/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy2/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy2/blue.png", "assets/data/Player/hair/male/messy2/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy2/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy2/brunette.png", "assets/data/Player/hair/male/messy2/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy2/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy2/green.png", "assets/data/Player/hair/male/messy2/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy2/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy2/pink.png", "assets/data/Player/hair/male/messy2/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy2/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy2/raven.png", "assets/data/Player/hair/male/messy2/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy2/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy2/redhead.png", "assets/data/Player/hair/male/messy2/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy2/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy2/white-blonde.png", "assets/data/Player/hair/male/messy2/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy2/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/messy2.png", "assets/data/Player/hair/male/messy2.png");
			resourceTypes.set ("assets/data/Player/hair/male/messy2.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/mohawk/blonde.png", "assets/data/Player/hair/male/mohawk/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/mohawk/blue.png", "assets/data/Player/hair/male/mohawk/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/mohawk/brunette.png", "assets/data/Player/hair/male/mohawk/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/mohawk/green.png", "assets/data/Player/hair/male/mohawk/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/mohawk/pink.png", "assets/data/Player/hair/male/mohawk/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/mohawk/raven.png", "assets/data/Player/hair/male/mohawk/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/mohawk/redhead.png", "assets/data/Player/hair/male/mohawk/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/mohawk/white-blonde.png", "assets/data/Player/hair/male/mohawk/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/mohawk.png", "assets/data/Player/hair/male/mohawk.png");
			resourceTypes.set ("assets/data/Player/hair/male/mohawk.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page/blonde.png", "assets/data/Player/hair/male/page/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/page/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page/blue.png", "assets/data/Player/hair/male/page/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/page/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page/brunette.png", "assets/data/Player/hair/male/page/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/page/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page/green.png", "assets/data/Player/hair/male/page/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/page/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page/pink.png", "assets/data/Player/hair/male/page/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/page/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page/raven.png", "assets/data/Player/hair/male/page/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/page/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page/redhead.png", "assets/data/Player/hair/male/page/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/page/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page/white-blonde.png", "assets/data/Player/hair/male/page/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/page/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page.png", "assets/data/Player/hair/male/page.png");
			resourceTypes.set ("assets/data/Player/hair/male/page.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/page2.png", "assets/data/Player/hair/male/page2.png");
			resourceTypes.set ("assets/data/Player/hair/male/page2.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/parted/blonde.png", "assets/data/Player/hair/male/parted/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/parted/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/parted/blue.png", "assets/data/Player/hair/male/parted/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/parted/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/parted/brunette.png", "assets/data/Player/hair/male/parted/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/parted/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/parted/green.png", "assets/data/Player/hair/male/parted/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/parted/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/parted/pink.png", "assets/data/Player/hair/male/parted/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/parted/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/parted/raven.png", "assets/data/Player/hair/male/parted/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/parted/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/parted/redhead.png", "assets/data/Player/hair/male/parted/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/parted/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/parted/white-blonde.png", "assets/data/Player/hair/male/parted/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/parted/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/parted.png", "assets/data/Player/hair/male/parted.png");
			resourceTypes.set ("assets/data/Player/hair/male/parted.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/blonde.png", "assets/data/Player/hair/male/plain/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/blue.png", "assets/data/Player/hair/male/plain/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/brunette.png", "assets/data/Player/hair/male/plain/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/green.png", "assets/data/Player/hair/male/plain/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/pink.png", "assets/data/Player/hair/male/plain/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/raven.png", "assets/data/Player/hair/male/plain/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/redhead.png", "assets/data/Player/hair/male/plain/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/shadows-darkbody.png", "assets/data/Player/hair/male/plain/shadows-darkbody.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/shadows-darkbody.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/shadows-lightbody.png", "assets/data/Player/hair/male/plain/shadows-lightbody.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/shadows-lightbody.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/shadows-tanned2body.png", "assets/data/Player/hair/male/plain/shadows-tanned2body.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/shadows-tanned2body.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/shadows-tannedbody.png", "assets/data/Player/hair/male/plain/shadows-tannedbody.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/shadows-tannedbody.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/plain/white-blonde.png", "assets/data/Player/hair/male/plain/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/plain/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/shorthawk/blonde.png", "assets/data/Player/hair/male/shorthawk/blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/shorthawk/blue.png", "assets/data/Player/hair/male/shorthawk/blue.png");
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/blue.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/shorthawk/brunette.png", "assets/data/Player/hair/male/shorthawk/brunette.png");
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/brunette.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/shorthawk/green.png", "assets/data/Player/hair/male/shorthawk/green.png");
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/green.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/shorthawk/pink.png", "assets/data/Player/hair/male/shorthawk/pink.png");
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/pink.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/shorthawk/raven.png", "assets/data/Player/hair/male/shorthawk/raven.png");
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/raven.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/shorthawk/redhead.png", "assets/data/Player/hair/male/shorthawk/redhead.png");
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/redhead.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/shorthawk/white-blonde.png", "assets/data/Player/hair/male/shorthawk/white-blonde.png");
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/white-blonde.png", "image");
			resourceNames.set ("assets/data/Player/hair/male/shorthawk.png", "assets/data/Player/hair/male/shorthawk.png");
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk.png", "image");
			resourceNames.set ("assets/data/Player/hands/bracelet.png", "assets/data/Player/hands/bracelet.png");
			resourceTypes.set ("assets/data/Player/hands/bracelet.png", "image");
			resourceNames.set ("assets/data/Player/hands/golden_gloves_female.png", "assets/data/Player/hands/golden_gloves_female.png");
			resourceTypes.set ("assets/data/Player/hands/golden_gloves_female.png", "image");
			resourceNames.set ("assets/data/Player/hands/golden_gloves_male.png", "assets/data/Player/hands/golden_gloves_male.png");
			resourceTypes.set ("assets/data/Player/hands/golden_gloves_male.png", "image");
			resourceNames.set ("assets/data/Player/hands/metal_gloves_female.png", "assets/data/Player/hands/metal_gloves_female.png");
			resourceTypes.set ("assets/data/Player/hands/metal_gloves_female.png", "image");
			resourceNames.set ("assets/data/Player/hands/metal_gloves_male.png", "assets/data/Player/hands/metal_gloves_male.png");
			resourceTypes.set ("assets/data/Player/hands/metal_gloves_male.png", "image");
			resourceNames.set ("assets/data/Player/head/bandana_male_wconly.png", "assets/data/Player/head/bandana_male_wconly.png");
			resourceTypes.set ("assets/data/Player/head/bandana_male_wconly.png", "image");
			resourceNames.set ("assets/data/Player/head/chainhat_female.png", "assets/data/Player/head/chainhat_female.png");
			resourceTypes.set ("assets/data/Player/head/chainhat_female.png", "image");
			resourceNames.set ("assets/data/Player/head/chainhat_male.png", "assets/data/Player/head/chainhat_male.png");
			resourceTypes.set ("assets/data/Player/head/chainhat_male.png", "image");
			resourceNames.set ("assets/data/Player/head/chain_hood_female.png", "assets/data/Player/head/chain_hood_female.png");
			resourceTypes.set ("assets/data/Player/head/chain_hood_female.png", "image");
			resourceNames.set ("assets/data/Player/head/chain_hood_male.png", "assets/data/Player/head/chain_hood_male.png");
			resourceTypes.set ("assets/data/Player/head/chain_hood_male.png", "image");
			resourceNames.set ("assets/data/Player/head/cloth_hood_female.png", "assets/data/Player/head/cloth_hood_female.png");
			resourceTypes.set ("assets/data/Player/head/cloth_hood_female.png", "image");
			resourceNames.set ("assets/data/Player/head/cloth_hood_male.png", "assets/data/Player/head/cloth_hood_male.png");
			resourceTypes.set ("assets/data/Player/head/cloth_hood_male.png", "image");
			resourceNames.set ("assets/data/Player/head/golden_helm_female.png", "assets/data/Player/head/golden_helm_female.png");
			resourceTypes.set ("assets/data/Player/head/golden_helm_female.png", "image");
			resourceNames.set ("assets/data/Player/head/golden_helm_male.png", "assets/data/Player/head/golden_helm_male.png");
			resourceTypes.set ("assets/data/Player/head/golden_helm_male.png", "image");
			resourceNames.set ("assets/data/Player/head/leather_cap_female.png", "assets/data/Player/head/leather_cap_female.png");
			resourceTypes.set ("assets/data/Player/head/leather_cap_female.png", "image");
			resourceNames.set ("assets/data/Player/head/leather_cap_male.png", "assets/data/Player/head/leather_cap_male.png");
			resourceTypes.set ("assets/data/Player/head/leather_cap_male.png", "image");
			resourceNames.set ("assets/data/Player/head/metal_helm_female.png", "assets/data/Player/head/metal_helm_female.png");
			resourceTypes.set ("assets/data/Player/head/metal_helm_female.png", "image");
			resourceNames.set ("assets/data/Player/head/metal_helm_male.png", "assets/data/Player/head/metal_helm_male.png");
			resourceTypes.set ("assets/data/Player/head/metal_helm_male.png", "image");
			resourceNames.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/bronze.png", "assets/data/Player/head/tiaras_female_no_th_or_sh/bronze.png");
			resourceTypes.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/bronze.png", "image");
			resourceNames.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/gold.png", "assets/data/Player/head/tiaras_female_no_th_or_sh/gold.png");
			resourceTypes.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/gold.png", "image");
			resourceNames.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/iron.png", "assets/data/Player/head/tiaras_female_no_th_or_sh/iron.png");
			resourceTypes.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/iron.png", "image");
			resourceNames.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/silver.png", "assets/data/Player/head/tiaras_female_no_th_or_sh/silver.png");
			resourceTypes.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/silver.png", "image");
			resourceNames.set ("assets/data/Player/legs/golden_greaves_female.png", "assets/data/Player/legs/golden_greaves_female.png");
			resourceTypes.set ("assets/data/Player/legs/golden_greaves_female.png", "image");
			resourceNames.set ("assets/data/Player/legs/golden_greaves_male.png", "assets/data/Player/legs/golden_greaves_male.png");
			resourceTypes.set ("assets/data/Player/legs/golden_greaves_male.png", "image");
			resourceNames.set ("assets/data/Player/legs/green_pants_female.png", "assets/data/Player/legs/green_pants_female.png");
			resourceTypes.set ("assets/data/Player/legs/green_pants_female.png", "image");
			resourceNames.set ("assets/data/Player/legs/green_pants_male.png", "assets/data/Player/legs/green_pants_male.png");
			resourceTypes.set ("assets/data/Player/legs/green_pants_male.png", "image");
			resourceNames.set ("assets/data/Player/legs/metal_pants_female.png", "assets/data/Player/legs/metal_pants_female.png");
			resourceTypes.set ("assets/data/Player/legs/metal_pants_female.png", "image");
			resourceNames.set ("assets/data/Player/legs/metal_pants_male.png", "assets/data/Player/legs/metal_pants_male.png");
			resourceTypes.set ("assets/data/Player/legs/metal_pants_male.png", "image");
			resourceNames.set ("assets/data/Player/legs/red_pants_male.png", "assets/data/Player/legs/red_pants_male.png");
			resourceTypes.set ("assets/data/Player/legs/red_pants_male.png", "image");
			resourceNames.set ("assets/data/Player/legs/robe_skirt_female_incomplete.png", "assets/data/Player/legs/robe_skirt_female_incomplete.png");
			resourceTypes.set ("assets/data/Player/legs/robe_skirt_female_incomplete.png", "image");
			resourceNames.set ("assets/data/Player/legs/robe_skirt_male.png", "assets/data/Player/legs/robe_skirt_male.png");
			resourceTypes.set ("assets/data/Player/legs/robe_skirt_male.png", "image");
			resourceNames.set ("assets/data/Player/oversize_xcf/slash_swords.xcf", "assets/data/Player/oversize_xcf/slash_swords.xcf");
			resourceTypes.set ("assets/data/Player/oversize_xcf/slash_swords.xcf", "binary");
			resourceNames.set ("assets/data/Player/oversize_xcf/thrust_spears.xcf", "assets/data/Player/oversize_xcf/thrust_spears.xcf");
			resourceTypes.set ("assets/data/Player/oversize_xcf/thrust_spears.xcf", "binary");
			resourceNames.set ("assets/data/Player/torso/brown_shirt_male.png", "assets/data/Player/torso/brown_shirt_male.png");
			resourceTypes.set ("assets/data/Player/torso/brown_shirt_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/chain/mail_female.png", "assets/data/Player/torso/chain/mail_female.png");
			resourceTypes.set ("assets/data/Player/torso/chain/mail_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/chain/mail_male.png", "assets/data/Player/torso/chain/mail_male.png");
			resourceTypes.set ("assets/data/Player/torso/chain/mail_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/chain/tabard/jacket_female.png", "assets/data/Player/torso/chain/tabard/jacket_female.png");
			resourceTypes.set ("assets/data/Player/torso/chain/tabard/jacket_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/chain/tabard/jacket_male.png", "assets/data/Player/torso/chain/tabard/jacket_male.png");
			resourceTypes.set ("assets/data/Player/torso/chain/tabard/jacket_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/dress_female/blue_vest.png", "assets/data/Player/torso/dress_female/blue_vest.png");
			resourceTypes.set ("assets/data/Player/torso/dress_female/blue_vest.png", "image");
			resourceNames.set ("assets/data/Player/torso/dress_female/overskirt.png", "assets/data/Player/torso/dress_female/overskirt.png");
			resourceTypes.set ("assets/data/Player/torso/dress_female/overskirt.png", "image");
			resourceNames.set ("assets/data/Player/torso/dress_female/underdress.png", "assets/data/Player/torso/dress_female/underdress.png");
			resourceTypes.set ("assets/data/Player/torso/dress_female/underdress.png", "image");
			resourceNames.set ("assets/data/Player/torso/dress_w_sash_female.png", "assets/data/Player/torso/dress_w_sash_female.png");
			resourceTypes.set ("assets/data/Player/torso/dress_w_sash_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/gold/arms_female.png", "assets/data/Player/torso/gold/arms_female.png");
			resourceTypes.set ("assets/data/Player/torso/gold/arms_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/gold/arms_male.png", "assets/data/Player/torso/gold/arms_male.png");
			resourceTypes.set ("assets/data/Player/torso/gold/arms_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/gold/chest_female.png", "assets/data/Player/torso/gold/chest_female.png");
			resourceTypes.set ("assets/data/Player/torso/gold/chest_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/gold/chest_male.png", "assets/data/Player/torso/gold/chest_male.png");
			resourceTypes.set ("assets/data/Player/torso/gold/chest_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/gold/spikes_male.png", "assets/data/Player/torso/gold/spikes_male.png");
			resourceTypes.set ("assets/data/Player/torso/gold/spikes_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/leather/bracers_female.png", "assets/data/Player/torso/leather/bracers_female.png");
			resourceTypes.set ("assets/data/Player/torso/leather/bracers_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/leather/bracers_male.png", "assets/data/Player/torso/leather/bracers_male.png");
			resourceTypes.set ("assets/data/Player/torso/leather/bracers_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/leather/chest_female.png", "assets/data/Player/torso/leather/chest_female.png");
			resourceTypes.set ("assets/data/Player/torso/leather/chest_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/leather/chest_male.png", "assets/data/Player/torso/leather/chest_male.png");
			resourceTypes.set ("assets/data/Player/torso/leather/chest_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/leather/shoulders_female.png", "assets/data/Player/torso/leather/shoulders_female.png");
			resourceTypes.set ("assets/data/Player/torso/leather/shoulders_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/leather/shoulders_male.png", "assets/data/Player/torso/leather/shoulders_male.png");
			resourceTypes.set ("assets/data/Player/torso/leather/shoulders_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/pirate_shirt_female.png", "assets/data/Player/torso/pirate_shirt_female.png");
			resourceTypes.set ("assets/data/Player/torso/pirate_shirt_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/plate/arms_female.png", "assets/data/Player/torso/plate/arms_female.png");
			resourceTypes.set ("assets/data/Player/torso/plate/arms_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/plate/arms_male.png", "assets/data/Player/torso/plate/arms_male.png");
			resourceTypes.set ("assets/data/Player/torso/plate/arms_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/plate/chest_female.png", "assets/data/Player/torso/plate/chest_female.png");
			resourceTypes.set ("assets/data/Player/torso/plate/chest_female.png", "image");
			resourceNames.set ("assets/data/Player/torso/plate/chest_male.png", "assets/data/Player/torso/plate/chest_male.png");
			resourceTypes.set ("assets/data/Player/torso/plate/chest_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/black.png", "assets/data/Player/torso/robes_female_no_th-sh/black.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/black.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/blue.png", "assets/data/Player/torso/robes_female_no_th-sh/blue.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/blue.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/brown.png", "assets/data/Player/torso/robes_female_no_th-sh/brown.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/brown.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/dark brown.png", "assets/data/Player/torso/robes_female_no_th-sh/dark brown.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/dark brown.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/dark gray.png", "assets/data/Player/torso/robes_female_no_th-sh/dark gray.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/dark gray.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/forest green.png", "assets/data/Player/torso/robes_female_no_th-sh/forest green.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/forest green.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/light gray.png", "assets/data/Player/torso/robes_female_no_th-sh/light gray.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/light gray.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/purple.png", "assets/data/Player/torso/robes_female_no_th-sh/purple.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/purple.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/red.png", "assets/data/Player/torso/robes_female_no_th-sh/red.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/red.png", "image");
			resourceNames.set ("assets/data/Player/torso/robes_female_no_th-sh/white.png", "assets/data/Player/torso/robes_female_no_th-sh/white.png");
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/white.png", "image");
			resourceNames.set ("assets/data/Player/torso/white_shirt_male.png", "assets/data/Player/torso/white_shirt_male.png");
			resourceTypes.set ("assets/data/Player/torso/white_shirt_male.png", "image");
			resourceNames.set ("assets/data/Player/torso/wings_no_th-sh.png", "assets/data/Player/torso/wings_no_th-sh.png");
			resourceTypes.set ("assets/data/Player/torso/wings_no_th-sh.png", "image");
			resourceNames.set ("assets/data/Player/weapons/arrow.png", "assets/data/Player/weapons/arrow.png");
			resourceTypes.set ("assets/data/Player/weapons/arrow.png", "image");
			resourceNames.set ("assets/data/Player/weapons/arrow_skeleton.png", "assets/data/Player/weapons/arrow_skeleton.png");
			resourceTypes.set ("assets/data/Player/weapons/arrow_skeleton.png", "image");
			resourceNames.set ("assets/data/Player/weapons/bow.png", "assets/data/Player/weapons/bow.png");
			resourceTypes.set ("assets/data/Player/weapons/bow.png", "image");
			resourceNames.set ("assets/data/Player/weapons/bow_skeleton.png", "assets/data/Player/weapons/bow_skeleton.png");
			resourceTypes.set ("assets/data/Player/weapons/bow_skeleton.png", "image");
			resourceNames.set ("assets/data/Player/weapons/dagger_female.png", "assets/data/Player/weapons/dagger_female.png");
			resourceTypes.set ("assets/data/Player/weapons/dagger_female.png", "image");
			resourceNames.set ("assets/data/Player/weapons/dagger_male.png", "assets/data/Player/weapons/dagger_male.png");
			resourceTypes.set ("assets/data/Player/weapons/dagger_male.png", "image");
			resourceNames.set ("assets/data/Player/weapons/greatbow.png", "assets/data/Player/weapons/greatbow.png");
			resourceTypes.set ("assets/data/Player/weapons/greatbow.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/dreagonspear.png", "assets/data/Player/weapons/oversize/dreagonspear.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/dreagonspear.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/longsword_female.png", "assets/data/Player/weapons/oversize/longsword_female.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/longsword_female.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/longsword_male.png", "assets/data/Player/weapons/oversize/longsword_male.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/longsword_male.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/mace_female.png", "assets/data/Player/weapons/oversize/mace_female.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/mace_female.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/mace_male.png", "assets/data/Player/weapons/oversize/mace_male.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/mace_male.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/rapier_female.png", "assets/data/Player/weapons/oversize/rapier_female.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/rapier_female.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/rapier_male.png", "assets/data/Player/weapons/oversize/rapier_male.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/rapier_male.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/saber_female.png", "assets/data/Player/weapons/oversize/saber_female.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/saber_female.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/saber_male.png", "assets/data/Player/weapons/oversize/saber_male.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/saber_male.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/spear.png", "assets/data/Player/weapons/oversize/spear.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/spear.png", "image");
			resourceNames.set ("assets/data/Player/weapons/oversize/trident.png", "assets/data/Player/weapons/oversize/trident.png");
			resourceTypes.set ("assets/data/Player/weapons/oversize/trident.png", "image");
			resourceNames.set ("assets/data/Player/weapons/recurvebow.png", "assets/data/Player/weapons/recurvebow.png");
			resourceTypes.set ("assets/data/Player/weapons/recurvebow.png", "image");
			resourceNames.set ("assets/data/Player/weapons/shield_male_cutoutforbody.png", "assets/data/Player/weapons/shield_male_cutoutforbody.png");
			resourceTypes.set ("assets/data/Player/weapons/shield_male_cutoutforbody.png", "image");
			resourceNames.set ("assets/data/Player/weapons/shield_male_cutoutforhat.png", "assets/data/Player/weapons/shield_male_cutoutforhat.png");
			resourceTypes.set ("assets/data/Player/weapons/shield_male_cutoutforhat.png", "image");
			resourceNames.set ("assets/data/Player/weapons/spear.png", "assets/data/Player/weapons/spear.png");
			resourceTypes.set ("assets/data/Player/weapons/spear.png", "image");
			resourceNames.set ("assets/data/Player/weapons/steelwand_female.png", "assets/data/Player/weapons/steelwand_female.png");
			resourceTypes.set ("assets/data/Player/weapons/steelwand_female.png", "image");
			resourceNames.set ("assets/data/Player/weapons/woodwand_female.png", "assets/data/Player/weapons/woodwand_female.png");
			resourceTypes.set ("assets/data/Player/weapons/woodwand_female.png", "image");
			resourceNames.set ("assets/data/Player/weapons/woodwand_male.png", "assets/data/Player/weapons/woodwand_male.png");
			resourceTypes.set ("assets/data/Player/weapons/woodwand_male.png", "image");
			resourceNames.set ("assets/data/stick.png", "assets/data/stick.png");
			resourceTypes.set ("assets/data/stick.png", "image");
			resourceNames.set ("assets/data/vcr/flixel.png", "assets/data/vcr/flixel.png");
			resourceTypes.set ("assets/data/vcr/flixel.png", "image");
			resourceNames.set ("assets/data/vcr/open.png", "assets/data/vcr/open.png");
			resourceTypes.set ("assets/data/vcr/open.png", "image");
			resourceNames.set ("assets/data/vcr/pause.png", "assets/data/vcr/pause.png");
			resourceTypes.set ("assets/data/vcr/pause.png", "image");
			resourceNames.set ("assets/data/vcr/play.png", "assets/data/vcr/play.png");
			resourceTypes.set ("assets/data/vcr/play.png", "image");
			resourceNames.set ("assets/data/vcr/record_off.png", "assets/data/vcr/record_off.png");
			resourceTypes.set ("assets/data/vcr/record_off.png", "image");
			resourceNames.set ("assets/data/vcr/record_on.png", "assets/data/vcr/record_on.png");
			resourceTypes.set ("assets/data/vcr/record_on.png", "image");
			resourceNames.set ("assets/data/vcr/restart.png", "assets/data/vcr/restart.png");
			resourceTypes.set ("assets/data/vcr/restart.png", "image");
			resourceNames.set ("assets/data/vcr/step.png", "assets/data/vcr/step.png");
			resourceTypes.set ("assets/data/vcr/step.png", "image");
			resourceNames.set ("assets/data/vcr/stop.png", "assets/data/vcr/stop.png");
			resourceTypes.set ("assets/data/vcr/stop.png", "image");
			resourceNames.set ("assets/data/vis/bounds.png", "assets/data/vis/bounds.png");
			resourceTypes.set ("assets/data/vis/bounds.png", "image");
			resourceNames.set ("assets/HaxeFlixel.svg", "assets/HaxeFlixel.svg");
			resourceTypes.set ("assets/HaxeFlixel.svg", "text");
			
			
			initialized = true;
			
		}
		
	}
	
	
	public static function getBitmapData (id:String, useCache:Bool = true):BitmapData {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "image") {
			
			if (useCache && cachedBitmapData.exists (id)) {
				
				return cachedBitmapData.get (id);
				
			} else {
				
				var data = BitmapData.load (resourceNames.get (id));
				
				if (useCache) {
					
					cachedBitmapData.set (id, data);
					
				}
				
				return data;
				
			}
			
		}  else if (id.indexOf (":") > -1) {
			
			var libraryName = id.substr (0, id.indexOf (":"));
			var symbolName = id.substr (id.indexOf (":") + 1);
			
			if (libraryTypes.exists (libraryName)) {
				
				#if swf
				
				if (libraryTypes.get (libraryName) == "swf") {
					
					if (!cachedSWFLibraries.exists (libraryName)) {
						
						cachedSWFLibraries.set (libraryName, new SWF (getBytes ("libraries/" + libraryName + ".swf")));
						
					}
					
					return cachedSWFLibraries.get (libraryName).getBitmapData (symbolName);
					
				}
				
				#end
				
				#if xfl
				
				if (libraryTypes.get (libraryName) == "xfl") {
					
					if (!cachedXFLLibraries.exists (libraryName)) {
						
						cachedXFLLibraries.set (libraryName, Unserializer.run (getText ("libraries/" + libraryName + "/" + libraryName + ".dat")));
						
					}
					
					return cachedXFLLibraries.get (libraryName).getBitmapData (symbolName);
					
				}
				
				#end
				
			} else {
				
				trace ("[nme.Assets] There is no asset library named \"" + libraryName + "\"");
				
			}
			
		} else {
			
			trace ("[nme.Assets] There is no BitmapData asset with an ID of \"" + id + "\"");
			
		}
		
		return null;
		
	}
	
	
	public static function getBytes (id:String):ByteArray {
		
		initialize ();
		
		if (resourceNames.exists (id)) {
			
			return ByteArray.readFile (resourceNames.get (id));
			
		} else {
			
			trace ("[nme.Assets] There is no String or ByteArray asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getFont (id:String):Font {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "font") {
			
			return new Font (resourceNames.get (id));
			
		} else {
			
			trace ("[nme.Assets] There is no Font asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getMovieClip (id:String):MovieClip {
		
		initialize ();
		
		var libraryName = id.substr (0, id.indexOf (":"));
		var symbolName = id.substr (id.indexOf (":") + 1);
		
		if (libraryTypes.exists (libraryName)) {
			
			#if swf
			
			if (libraryTypes.get (libraryName) == "swf") {
				
				if (!cachedSWFLibraries.exists (libraryName)) {
					
					cachedSWFLibraries.set (libraryName, new SWF (getBytes ("libraries/" + libraryName + ".swf")));
					
				}
				
				return cachedSWFLibraries.get (libraryName).createMovieClip (symbolName);
				
			}
			
			#end
			
			#if xfl
			
			if (libraryTypes.get (libraryName) == "xfl") {
				
				if (!cachedXFLLibraries.exists (libraryName)) {
					
					cachedXFLLibraries.set (libraryName, Unserializer.run (getText ("libraries/" + libraryName + "/" + libraryName + ".dat")));
					
				}
				
				return cachedXFLLibraries.get (libraryName).createMovieClip (symbolName);
				
			}
			
			#end
			
		} else {
			
			trace ("[nme.Assets] There is no asset library named \"" + libraryName + "\"");
			
		}
		
		return null;
		
	}
	
	
	public static function getResourceName (id:String):String {
		
		initialize ();
		
		return resourceNames.get (id);
		
	}
	
	
	public static function getSound (id:String):Sound {
		
		initialize ();
		
		if (resourceTypes.exists (id)) {
			
			if (resourceTypes.get (id).toLowerCase () == "sound") {
				
				return new Sound (new URLRequest (resourceNames.get (id)), null, false);
				
			} else if (resourceTypes.get (id).toLowerCase () == "music") {
				
				return new Sound (new URLRequest (resourceNames.get (id)), null, true);
				
			}
			
		}
		
		trace ("[nme.Assets] There is no Sound asset with an ID of \"" + id + "\"");
		
		return null;
		
	}
	
	
	public static function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	//public static function loadBitmapData(id:String, handler:BitmapData -> Void, useCache:Bool = true):BitmapData
	//{
		//return null;
	//}
	//
	//
	//public static function loadBytes(id:String, handler:ByteArray -> Void):ByteArray
	//{	
		//return null;
	//}
	//
	//
	//public static function loadText(id:String, handler:String -> Void):String
	//{
		//return null;
	//}
	
	
}
