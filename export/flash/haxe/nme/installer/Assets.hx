package nme.installer;


import format.display.MovieClip;
import haxe.Unserializer;
import nme.display.BitmapData;
import nme.media.Sound;
import nme.net.URLRequest;
import nme.text.Font;
import nme.utils.ByteArray;
import ApplicationMain;

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
	private static var resourceClasses:Hash <Dynamic> = new Hash <Dynamic> ();
	private static var resourceTypes:Hash <String> = new Hash <String> ();
	
	
	private static function initialize ():Void {
		
		if (!initialized) {
			
			resourceClasses.set ("Beep", NME_assets_data_beep_mp3);
			resourceTypes.set ("Beep", "sound");
			resourceClasses.set ("assets/data/autotiles.png", NME_assets_data_autotiles_png);
			resourceTypes.set ("assets/data/autotiles.png", "image");
			resourceClasses.set ("assets/data/autotiles_alt.png", NME_assets_data_autotiles_alt_png);
			resourceTypes.set ("assets/data/autotiles_alt.png", "image");
			resourceClasses.set ("assets/data/base.png", NME_assets_data_base_png);
			resourceTypes.set ("assets/data/base.png", "image");
			resourceClasses.set ("assets/data/beep.mp3", NME_assets_data_beep_mp4);
			resourceTypes.set ("assets/data/beep.mp3", "music");
			resourceClasses.set ("assets/data/button.png", NME_assets_data_button_png);
			resourceTypes.set ("assets/data/button.png", "image");
			resourceClasses.set ("assets/data/button_a.png", NME_assets_data_button_a_png);
			resourceTypes.set ("assets/data/button_a.png", "image");
			resourceClasses.set ("assets/data/button_b.png", NME_assets_data_button_b_png);
			resourceTypes.set ("assets/data/button_b.png", "image");
			resourceClasses.set ("assets/data/button_c.png", NME_assets_data_button_c_png);
			resourceTypes.set ("assets/data/button_c.png", "image");
			resourceClasses.set ("assets/data/button_down.png", NME_assets_data_button_down_png);
			resourceTypes.set ("assets/data/button_down.png", "image");
			resourceClasses.set ("assets/data/button_left.png", NME_assets_data_button_left_png);
			resourceTypes.set ("assets/data/button_left.png", "image");
			resourceClasses.set ("assets/data/button_right.png", NME_assets_data_button_right_png);
			resourceTypes.set ("assets/data/button_right.png", "image");
			resourceClasses.set ("assets/data/button_up.png", NME_assets_data_button_up_png);
			resourceTypes.set ("assets/data/button_up.png", "image");
			resourceClasses.set ("assets/data/button_x.png", NME_assets_data_button_x_png);
			resourceTypes.set ("assets/data/button_x.png", "image");
			resourceClasses.set ("assets/data/button_y.png", NME_assets_data_button_y_png);
			resourceTypes.set ("assets/data/button_y.png", "image");
			resourceClasses.set ("assets/data/courier.ttf", NME_assets_data_courier_ttf);
			resourceTypes.set ("assets/data/courier.ttf", "font");
			resourceClasses.set ("assets/data/cursor.png", NME_assets_data_cursor_png);
			resourceTypes.set ("assets/data/cursor.png", "image");
			resourceClasses.set ("assets/data/default.png", NME_assets_data_default_png);
			resourceTypes.set ("assets/data/default.png", "image");
			resourceClasses.set ("assets/data/Dungeon_Walls.csv", NME_assets_data_dungeon_walls_csv);
			resourceTypes.set ("assets/data/Dungeon_Walls.csv", "text");
			resourceClasses.set ("assets/data/fontData10pt.png", NME_assets_data_fontdata10pt_png);
			resourceTypes.set ("assets/data/fontData10pt.png", "image");
			resourceClasses.set ("assets/data/fontData11pt.png", NME_assets_data_fontdata11pt_png);
			resourceTypes.set ("assets/data/fontData11pt.png", "image");
			resourceClasses.set ("assets/data/GhostDungeonTiles.png", NME_assets_data_ghostdungeontiles_png);
			resourceTypes.set ("assets/data/GhostDungeonTiles.png", "image");
			resourceClasses.set ("assets/data/handle.png", NME_assets_data_handle_png);
			resourceTypes.set ("assets/data/handle.png", "image");
			resourceClasses.set ("assets/data/logo.png", NME_assets_data_logo_png);
			resourceTypes.set ("assets/data/logo.png", "image");
			resourceClasses.set ("assets/data/logo_corners.png", NME_assets_data_logo_corners_png);
			resourceTypes.set ("assets/data/logo_corners.png", "image");
			resourceClasses.set ("assets/data/logo_light.png", NME_assets_data_logo_light_png);
			resourceTypes.set ("assets/data/logo_light.png", "image");
			resourceClasses.set ("assets/data/nokiafc22.ttf", NME_assets_data_nokiafc22_ttf);
			resourceTypes.set ("assets/data/nokiafc22.ttf", "font");
			resourceClasses.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/bronze.png", NME_assets_data_player_accessories_necklaces_female__no_th_sh_bronze_png);
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/bronze.png", "image");
			resourceClasses.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/gold.png", NME_assets_data_player_accessories_necklaces_female__no_th_sh_gold_png);
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/gold.png", "image");
			resourceClasses.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/iron.png", NME_assets_data_player_accessories_necklaces_female__no_th_sh_iron_png);
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/iron.png", "image");
			resourceClasses.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/pirate_wc_only.png", NME_assets_data_player_accessories_necklaces_female__no_th_sh_pirate_wc_only_png);
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/pirate_wc_only.png", "image");
			resourceClasses.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/silver.png", NME_assets_data_player_accessories_necklaces_female__no_th_sh_silver_png);
			resourceTypes.set ("assets/data/Player/accessories/necklaces_female_ no_th-sh/silver.png", "image");
			resourceClasses.set ("assets/data/Player/behind_body/quiver.png", NME_assets_data_player_behind_body_quiver_png);
			resourceTypes.set ("assets/data/Player/behind_body/quiver.png", "image");
			resourceClasses.set ("assets/data/Player/belt/black_female_no_th-sh.png", NME_assets_data_player_belt_black_female_no_th_sh_png);
			resourceTypes.set ("assets/data/Player/belt/black_female_no_th-sh.png", "image");
			resourceClasses.set ("assets/data/Player/belt/bronze_female_no_th-sh.png", NME_assets_data_player_belt_bronze_female_no_th_sh_png);
			resourceTypes.set ("assets/data/Player/belt/bronze_female_no_th-sh.png", "image");
			resourceClasses.set ("assets/data/Player/belt/brown_female_no_th-sh.png", NME_assets_data_player_belt_brown_female_no_th_sh_png);
			resourceTypes.set ("assets/data/Player/belt/brown_female_no_th-sh.png", "image");
			resourceClasses.set ("assets/data/Player/belt/buckles_female_no_th-sh/bronze.png", NME_assets_data_player_belt_buckles_female_no_th_sh_bronze_png);
			resourceTypes.set ("assets/data/Player/belt/buckles_female_no_th-sh/bronze.png", "image");
			resourceClasses.set ("assets/data/Player/belt/buckles_female_no_th-sh/gold.png", NME_assets_data_player_belt_buckles_female_no_th_sh_gold_png);
			resourceTypes.set ("assets/data/Player/belt/buckles_female_no_th-sh/gold.png", "image");
			resourceClasses.set ("assets/data/Player/belt/buckles_female_no_th-sh/iron.png", NME_assets_data_player_belt_buckles_female_no_th_sh_iron_png);
			resourceTypes.set ("assets/data/Player/belt/buckles_female_no_th-sh/iron.png", "image");
			resourceClasses.set ("assets/data/Player/belt/buckles_female_no_th-sh/silver.png", NME_assets_data_player_belt_buckles_female_no_th_sh_silver_png);
			resourceTypes.set ("assets/data/Player/belt/buckles_female_no_th-sh/silver.png", "image");
			resourceClasses.set ("assets/data/Player/belt/gold_female_no_th-sh.png", NME_assets_data_player_belt_gold_female_no_th_sh_png);
			resourceTypes.set ("assets/data/Player/belt/gold_female_no_th-sh.png", "image");
			resourceClasses.set ("assets/data/Player/belt/iron_female_no_th-sh.png", NME_assets_data_player_belt_iron_female_no_th_sh_png);
			resourceTypes.set ("assets/data/Player/belt/iron_female_no_th-sh.png", "image");
			resourceClasses.set ("assets/data/Player/belt/leather_female.png", NME_assets_data_player_belt_leather_female_png);
			resourceTypes.set ("assets/data/Player/belt/leather_female.png", "image");
			resourceClasses.set ("assets/data/Player/belt/leather_male.png", NME_assets_data_player_belt_leather_male_png);
			resourceTypes.set ("assets/data/Player/belt/leather_male.png", "image");
			resourceClasses.set ("assets/data/Player/belt/rope_female.png", NME_assets_data_player_belt_rope_female_png);
			resourceTypes.set ("assets/data/Player/belt/rope_female.png", "image");
			resourceClasses.set ("assets/data/Player/belt/rope_male.png", NME_assets_data_player_belt_rope_male_png);
			resourceTypes.set ("assets/data/Player/belt/rope_male.png", "image");
			resourceClasses.set ("assets/data/Player/belt/silver_female_no_th-sh.png", NME_assets_data_player_belt_silver_female_no_th_sh_png);
			resourceTypes.set ("assets/data/Player/belt/silver_female_no_th-sh.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/dark.png", NME_assets_data_player_body_female_dark_png);
			resourceTypes.set ("assets/data/Player/body/female/dark.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/dark2.png", NME_assets_data_player_body_female_dark2_png);
			resourceTypes.set ("assets/data/Player/body/female/dark2.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/eyes/blue.png", NME_assets_data_player_body_female_eyes_blue_png);
			resourceTypes.set ("assets/data/Player/body/female/eyes/blue.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/eyes/brown.png", NME_assets_data_player_body_female_eyes_brown_png);
			resourceTypes.set ("assets/data/Player/body/female/eyes/brown.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/eyes/gray.png", NME_assets_data_player_body_female_eyes_gray_png);
			resourceTypes.set ("assets/data/Player/body/female/eyes/gray.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/eyes/green.png", NME_assets_data_player_body_female_eyes_green_png);
			resourceTypes.set ("assets/data/Player/body/female/eyes/green.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/eyes/red.png", NME_assets_data_player_body_female_eyes_red_png);
			resourceTypes.set ("assets/data/Player/body/female/eyes/red.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/light.png", NME_assets_data_player_body_female_light_png);
			resourceTypes.set ("assets/data/Player/body/female/light.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/orc.png", NME_assets_data_player_body_female_orc_png);
			resourceTypes.set ("assets/data/Player/body/female/orc.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/red_orc_wc_only.png", NME_assets_data_player_body_female_red_orc_wc_only_png);
			resourceTypes.set ("assets/data/Player/body/female/red_orc_wc_only.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/tanned.png", NME_assets_data_player_body_female_tanned_png);
			resourceTypes.set ("assets/data/Player/body/female/tanned.png", "image");
			resourceClasses.set ("assets/data/Player/body/female/tanned2.png", NME_assets_data_player_body_female_tanned2_png);
			resourceTypes.set ("assets/data/Player/body/female/tanned2.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/dark.png", NME_assets_data_player_body_male_dark_png);
			resourceTypes.set ("assets/data/Player/body/male/dark.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/dark2.png", NME_assets_data_player_body_male_dark2_png);
			resourceTypes.set ("assets/data/Player/body/male/dark2.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/eyes/blue.png", NME_assets_data_player_body_male_eyes_blue_png);
			resourceTypes.set ("assets/data/Player/body/male/eyes/blue.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/eyes/brown.png", NME_assets_data_player_body_male_eyes_brown_png);
			resourceTypes.set ("assets/data/Player/body/male/eyes/brown.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/eyes/casting_eyeglow_skeleton.png", NME_assets_data_player_body_male_eyes_casting_eyeglow_skeleton_png);
			resourceTypes.set ("assets/data/Player/body/male/eyes/casting_eyeglow_skeleton.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/eyes/gray.png", NME_assets_data_player_body_male_eyes_gray_png);
			resourceTypes.set ("assets/data/Player/body/male/eyes/gray.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/eyes/green.png", NME_assets_data_player_body_male_eyes_green_png);
			resourceTypes.set ("assets/data/Player/body/male/eyes/green.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/eyes/red.png", NME_assets_data_player_body_male_eyes_red_png);
			resourceTypes.set ("assets/data/Player/body/male/eyes/red.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/light.png", NME_assets_data_player_body_male_light_png);
			resourceTypes.set ("assets/data/Player/body/male/light.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/orc.png", NME_assets_data_player_body_male_orc_png);
			resourceTypes.set ("assets/data/Player/body/male/orc.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/skeleton.png", NME_assets_data_player_body_male_skeleton_png);
			resourceTypes.set ("assets/data/Player/body/male/skeleton.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/tanned.png", NME_assets_data_player_body_male_tanned_png);
			resourceTypes.set ("assets/data/Player/body/male/tanned.png", "image");
			resourceClasses.set ("assets/data/Player/body/male/tanned2.png", NME_assets_data_player_body_male_tanned2_png);
			resourceTypes.set ("assets/data/Player/body/male/tanned2.png", "image");
			resourceClasses.set ("assets/data/Player/feet/black_shoes_female.png", NME_assets_data_player_feet_black_shoes_female_png);
			resourceTypes.set ("assets/data/Player/feet/black_shoes_female.png", "image");
			resourceClasses.set ("assets/data/Player/feet/black_shoes_male.png", NME_assets_data_player_feet_black_shoes_male_png);
			resourceTypes.set ("assets/data/Player/feet/black_shoes_male.png", "image");
			resourceClasses.set ("assets/data/Player/feet/brown_shoes_female.png", NME_assets_data_player_feet_brown_shoes_female_png);
			resourceTypes.set ("assets/data/Player/feet/brown_shoes_female.png", "image");
			resourceClasses.set ("assets/data/Player/feet/brown_shoes_male.png", NME_assets_data_player_feet_brown_shoes_male_png);
			resourceTypes.set ("assets/data/Player/feet/brown_shoes_male.png", "image");
			resourceClasses.set ("assets/data/Player/feet/ghillies_female_no_th-sh.png", NME_assets_data_player_feet_ghillies_female_no_th_sh_png);
			resourceTypes.set ("assets/data/Player/feet/ghillies_female_no_th-sh.png", "image");
			resourceClasses.set ("assets/data/Player/feet/golden_boots_female.png", NME_assets_data_player_feet_golden_boots_female_png);
			resourceTypes.set ("assets/data/Player/feet/golden_boots_female.png", "image");
			resourceClasses.set ("assets/data/Player/feet/golden_boots_male.png", NME_assets_data_player_feet_golden_boots_male_png);
			resourceTypes.set ("assets/data/Player/feet/golden_boots_male.png", "image");
			resourceClasses.set ("assets/data/Player/feet/metal_boots_female.png", NME_assets_data_player_feet_metal_boots_female_png);
			resourceTypes.set ("assets/data/Player/feet/metal_boots_female.png", "image");
			resourceClasses.set ("assets/data/Player/feet/metal_boots_male.png", NME_assets_data_player_feet_metal_boots_male_png);
			resourceTypes.set ("assets/data/Player/feet/metal_boots_male.png", "image");
			resourceClasses.set ("assets/data/Player/feet/slippers_female/black.png", NME_assets_data_player_feet_slippers_female_black_png);
			resourceTypes.set ("assets/data/Player/feet/slippers_female/black.png", "image");
			resourceClasses.set ("assets/data/Player/feet/slippers_female/brown.png", NME_assets_data_player_feet_slippers_female_brown_png);
			resourceTypes.set ("assets/data/Player/feet/slippers_female/brown.png", "image");
			resourceClasses.set ("assets/data/Player/feet/slippers_female/gray.png", NME_assets_data_player_feet_slippers_female_gray_png);
			resourceTypes.set ("assets/data/Player/feet/slippers_female/gray.png", "image");
			resourceClasses.set ("assets/data/Player/feet/slippers_female/white.png", NME_assets_data_player_feet_slippers_female_white_png);
			resourceTypes.set ("assets/data/Player/feet/slippers_female/white.png", "image");
			resourceClasses.set ("assets/data/Player/formal_male_no_th-sh/bowtie.png", NME_assets_data_player_formal_male_no_th_sh_bowtie_png);
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/bowtie.png", "image");
			resourceClasses.set ("assets/data/Player/formal_male_no_th-sh/pants.png", NME_assets_data_player_formal_male_no_th_sh_pants_png);
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/pants.png", "image");
			resourceClasses.set ("assets/data/Player/formal_male_no_th-sh/shirt.png", NME_assets_data_player_formal_male_no_th_sh_shirt_png);
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/shirt.png", "image");
			resourceClasses.set ("assets/data/Player/formal_male_no_th-sh/tie.png", NME_assets_data_player_formal_male_no_th_sh_tie_png);
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/tie.png", "image");
			resourceClasses.set ("assets/data/Player/formal_male_no_th-sh/vest.png", NME_assets_data_player_formal_male_no_th_sh_vest_png);
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/vest.png", "image");
			resourceClasses.set ("assets/data/Player/formal_male_no_th-sh/vest_w_shirt_cutout.png", NME_assets_data_player_formal_male_no_th_sh_vest_w_shirt_cutout_png);
			resourceTypes.set ("assets/data/Player/formal_male_no_th-sh/vest_w_shirt_cutout.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/black.png", NME_assets_data_player_hair_female_bangslong_black_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/black.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/blonde.png", NME_assets_data_player_hair_female_bangslong_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/blonde2.png", NME_assets_data_player_hair_female_bangslong_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/blue.png", NME_assets_data_player_hair_female_bangslong_blue_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/brown.png", NME_assets_data_player_hair_female_bangslong_brown_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/brown.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/brunette.png", NME_assets_data_player_hair_female_bangslong_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/brunette2.png", NME_assets_data_player_hair_female_bangslong_brunette2_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/brunette2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/dark-blonde.png", NME_assets_data_player_hair_female_bangslong_dark_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/dark-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/gray.png", NME_assets_data_player_hair_female_bangslong_gray_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/gray.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/green.png", NME_assets_data_player_hair_female_bangslong_green_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/light-blonde.png", NME_assets_data_player_hair_female_bangslong_light_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/light-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/pink.png", NME_assets_data_player_hair_female_bangslong_pink_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/raven.png", NME_assets_data_player_hair_female_bangslong_raven_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/raven2.png", NME_assets_data_player_hair_female_bangslong_raven2_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/raven2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/redhead.png", NME_assets_data_player_hair_female_bangslong_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/white-blonde.png", NME_assets_data_player_hair_female_bangslong_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/white-blonde2.png", NME_assets_data_player_hair_female_bangslong_white_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/white-blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong/white.png", NME_assets_data_player_hair_female_bangslong_white_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong/white.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangslong.png", NME_assets_data_player_hair_female_bangslong_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangslong.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/black.png", NME_assets_data_player_hair_female_bangsshort_black_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/black.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/blonde.png", NME_assets_data_player_hair_female_bangsshort_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/blonde2.png", NME_assets_data_player_hair_female_bangsshort_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/blue.png", NME_assets_data_player_hair_female_bangsshort_blue_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/brown.png", NME_assets_data_player_hair_female_bangsshort_brown_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/brown.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/brunette.png", NME_assets_data_player_hair_female_bangsshort_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/brunette2.png", NME_assets_data_player_hair_female_bangsshort_brunette2_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/brunette2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/dark-blonde.png", NME_assets_data_player_hair_female_bangsshort_dark_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/dark-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/gray.png", NME_assets_data_player_hair_female_bangsshort_gray_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/gray.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/green.png", NME_assets_data_player_hair_female_bangsshort_green_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/light-blonde.png", NME_assets_data_player_hair_female_bangsshort_light_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/light-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/pink.png", NME_assets_data_player_hair_female_bangsshort_pink_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/raven.png", NME_assets_data_player_hair_female_bangsshort_raven_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/raven2.png", NME_assets_data_player_hair_female_bangsshort_raven2_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/raven2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/redhead.png", NME_assets_data_player_hair_female_bangsshort_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/white-blonde.png", NME_assets_data_player_hair_female_bangsshort_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/white-blonde2.png", NME_assets_data_player_hair_female_bangsshort_white_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/white-blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort/white.png", NME_assets_data_player_hair_female_bangsshort_white_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort/white.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/bangsshort.png", NME_assets_data_player_hair_female_bangsshort_png);
			resourceTypes.set ("assets/data/Player/hair/female/bangsshort.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/black.png", NME_assets_data_player_hair_female_loose_black_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/black.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/blonde.png", NME_assets_data_player_hair_female_loose_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/blonde2.png", NME_assets_data_player_hair_female_loose_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/blue.png", NME_assets_data_player_hair_female_loose_blue_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/brown.png", NME_assets_data_player_hair_female_loose_brown_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/brown.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/brunette.png", NME_assets_data_player_hair_female_loose_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/brunette2.png", NME_assets_data_player_hair_female_loose_brunette2_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/brunette2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/dark-blonde.png", NME_assets_data_player_hair_female_loose_dark_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/dark-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/gray.png", NME_assets_data_player_hair_female_loose_gray_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/gray.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/green.png", NME_assets_data_player_hair_female_loose_green_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/light-blonde.png", NME_assets_data_player_hair_female_loose_light_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/light-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/pink.png", NME_assets_data_player_hair_female_loose_pink_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/raven.png", NME_assets_data_player_hair_female_loose_raven_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/raven2.png", NME_assets_data_player_hair_female_loose_raven2_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/raven2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/redhead.png", NME_assets_data_player_hair_female_loose_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/white-blonde.png", NME_assets_data_player_hair_female_loose_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/white-blonde2.png", NME_assets_data_player_hair_female_loose_white_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/white-blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose/white.png", NME_assets_data_player_hair_female_loose_white_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose/white.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/loose.png", NME_assets_data_player_hair_female_loose_png);
			resourceTypes.set ("assets/data/Player/hair/female/loose.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/black.png", NME_assets_data_player_hair_female_pixie_black_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/black.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/blonde.png", NME_assets_data_player_hair_female_pixie_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/blonde2.png", NME_assets_data_player_hair_female_pixie_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/blue.png", NME_assets_data_player_hair_female_pixie_blue_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/brown.png", NME_assets_data_player_hair_female_pixie_brown_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/brown.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/brunette.png", NME_assets_data_player_hair_female_pixie_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/brunette2.png", NME_assets_data_player_hair_female_pixie_brunette2_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/brunette2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/dark-blonde.png", NME_assets_data_player_hair_female_pixie_dark_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/dark-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/gray.png", NME_assets_data_player_hair_female_pixie_gray_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/gray.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/green.png", NME_assets_data_player_hair_female_pixie_green_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/light-blonde.png", NME_assets_data_player_hair_female_pixie_light_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/light-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/pink.png", NME_assets_data_player_hair_female_pixie_pink_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/raven.png", NME_assets_data_player_hair_female_pixie_raven_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/raven2.png", NME_assets_data_player_hair_female_pixie_raven2_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/raven2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/redhead.png", NME_assets_data_player_hair_female_pixie_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/white-blonde.png", NME_assets_data_player_hair_female_pixie_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/white-blonde2.png", NME_assets_data_player_hair_female_pixie_white_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/white-blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie/white.png", NME_assets_data_player_hair_female_pixie_white_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie/white.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/pixie.png", NME_assets_data_player_hair_female_pixie_png);
			resourceTypes.set ("assets/data/Player/hair/female/pixie.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/black.png", NME_assets_data_player_hair_female_ponytail_black_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/black.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/blonde.png", NME_assets_data_player_hair_female_ponytail_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/blonde2.png", NME_assets_data_player_hair_female_ponytail_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/blue.png", NME_assets_data_player_hair_female_ponytail_blue_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/brown.png", NME_assets_data_player_hair_female_ponytail_brown_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/brown.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/brunette.png", NME_assets_data_player_hair_female_ponytail_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/brunette2.png", NME_assets_data_player_hair_female_ponytail_brunette2_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/brunette2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/dark-blonde.png", NME_assets_data_player_hair_female_ponytail_dark_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/dark-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/gray.png", NME_assets_data_player_hair_female_ponytail_gray_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/gray.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/green.png", NME_assets_data_player_hair_female_ponytail_green_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/light-blonde.png", NME_assets_data_player_hair_female_ponytail_light_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/light-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/pink.png", NME_assets_data_player_hair_female_ponytail_pink_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/raven.png", NME_assets_data_player_hair_female_ponytail_raven_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/raven2.png", NME_assets_data_player_hair_female_ponytail_raven2_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/raven2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/redhead.png", NME_assets_data_player_hair_female_ponytail_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/white-blonde.png", NME_assets_data_player_hair_female_ponytail_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/white-blonde2.png", NME_assets_data_player_hair_female_ponytail_white_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/white-blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail/white.png", NME_assets_data_player_hair_female_ponytail_white_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail/white.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail.png", NME_assets_data_player_hair_female_ponytail_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/black.png", NME_assets_data_player_hair_female_ponytail2_black_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/black.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/blonde.png", NME_assets_data_player_hair_female_ponytail2_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/blue.png", NME_assets_data_player_hair_female_ponytail2_blue_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/brown.png", NME_assets_data_player_hair_female_ponytail2_brown_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/brown.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/brunette.png", NME_assets_data_player_hair_female_ponytail2_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/gray.png", NME_assets_data_player_hair_female_ponytail2_gray_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/gray.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/green.png", NME_assets_data_player_hair_female_ponytail2_green_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/light-blonde.png", NME_assets_data_player_hair_female_ponytail2_light_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/light-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/pink.png", NME_assets_data_player_hair_female_ponytail2_pink_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/raven.png", NME_assets_data_player_hair_female_ponytail2_raven_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/redhead.png", NME_assets_data_player_hair_female_ponytail2_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/shadows-darkbody.png", NME_assets_data_player_hair_female_ponytail2_shadows_darkbody_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/shadows-darkbody.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/shadows-lightbody.png", NME_assets_data_player_hair_female_ponytail2_shadows_lightbody_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/shadows-lightbody.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/shadows-tanned2body.png", NME_assets_data_player_hair_female_ponytail2_shadows_tanned2body_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/shadows-tanned2body.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/shadows-tannedbody.png", NME_assets_data_player_hair_female_ponytail2_shadows_tannedbody_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/shadows-tannedbody.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/white-blonde.png", NME_assets_data_player_hair_female_ponytail2_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/ponytail2/white.png", NME_assets_data_player_hair_female_ponytail2_white_png);
			resourceTypes.set ("assets/data/Player/hair/female/ponytail2/white.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/princess/blonde.png", NME_assets_data_player_hair_female_princess_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/princess/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/princess/blue.png", NME_assets_data_player_hair_female_princess_blue_png);
			resourceTypes.set ("assets/data/Player/hair/female/princess/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/princess/brunette.png", NME_assets_data_player_hair_female_princess_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/female/princess/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/princess/green.png", NME_assets_data_player_hair_female_princess_green_png);
			resourceTypes.set ("assets/data/Player/hair/female/princess/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/princess/pink.png", NME_assets_data_player_hair_female_princess_pink_png);
			resourceTypes.set ("assets/data/Player/hair/female/princess/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/princess/raven.png", NME_assets_data_player_hair_female_princess_raven_png);
			resourceTypes.set ("assets/data/Player/hair/female/princess/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/princess/redhead.png", NME_assets_data_player_hair_female_princess_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/female/princess/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/princess/white-blonde.png", NME_assets_data_player_hair_female_princess_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/princess/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/princess.png", NME_assets_data_player_hair_female_princess_png);
			resourceTypes.set ("assets/data/Player/hair/female/princess.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/black.png", NME_assets_data_player_hair_female_swoop_black_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/black.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/blonde.png", NME_assets_data_player_hair_female_swoop_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/blonde2.png", NME_assets_data_player_hair_female_swoop_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/blue.png", NME_assets_data_player_hair_female_swoop_blue_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/brown.png", NME_assets_data_player_hair_female_swoop_brown_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/brown.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/brunette.png", NME_assets_data_player_hair_female_swoop_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/brunette2.png", NME_assets_data_player_hair_female_swoop_brunette2_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/brunette2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/dark-blonde.png", NME_assets_data_player_hair_female_swoop_dark_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/dark-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/gray.png", NME_assets_data_player_hair_female_swoop_gray_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/gray.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/green.png", NME_assets_data_player_hair_female_swoop_green_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/light-blonde.png", NME_assets_data_player_hair_female_swoop_light_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/light-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/pink.png", NME_assets_data_player_hair_female_swoop_pink_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/raven.png", NME_assets_data_player_hair_female_swoop_raven_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/raven2.png", NME_assets_data_player_hair_female_swoop_raven2_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/raven2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/redhead.png", NME_assets_data_player_hair_female_swoop_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/white-blonde.png", NME_assets_data_player_hair_female_swoop_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/white-blonde2.png", NME_assets_data_player_hair_female_swoop_white_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/white-blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop/white.png", NME_assets_data_player_hair_female_swoop_white_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop/white.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/swoop.png", NME_assets_data_player_hair_female_swoop_png);
			resourceTypes.set ("assets/data/Player/hair/female/swoop.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/black.png", NME_assets_data_player_hair_female_unkempt_black_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/black.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/blonde.png", NME_assets_data_player_hair_female_unkempt_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/blonde2.png", NME_assets_data_player_hair_female_unkempt_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/blue.png", NME_assets_data_player_hair_female_unkempt_blue_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/brown.png", NME_assets_data_player_hair_female_unkempt_brown_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/brown.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/brunette.png", NME_assets_data_player_hair_female_unkempt_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/brunette2.png", NME_assets_data_player_hair_female_unkempt_brunette2_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/brunette2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/dark-blonde.png", NME_assets_data_player_hair_female_unkempt_dark_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/dark-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/gray.png", NME_assets_data_player_hair_female_unkempt_gray_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/gray.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/green.png", NME_assets_data_player_hair_female_unkempt_green_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/light-blonde.png", NME_assets_data_player_hair_female_unkempt_light_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/light-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/pink.png", NME_assets_data_player_hair_female_unkempt_pink_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/raven.png", NME_assets_data_player_hair_female_unkempt_raven_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/raven2.png", NME_assets_data_player_hair_female_unkempt_raven2_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/raven2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/redhead.png", NME_assets_data_player_hair_female_unkempt_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/white-blonde.png", NME_assets_data_player_hair_female_unkempt_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/white-blonde2.png", NME_assets_data_player_hair_female_unkempt_white_blonde2_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/white-blonde2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt/white.png", NME_assets_data_player_hair_female_unkempt_white_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt/white.png", "image");
			resourceClasses.set ("assets/data/Player/hair/female/unkempt.png", NME_assets_data_player_hair_female_unkempt_png);
			resourceTypes.set ("assets/data/Player/hair/female/unkempt.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bangs/blonde.png", NME_assets_data_player_hair_male_bangs_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/bangs/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bangs/blue.png", NME_assets_data_player_hair_male_bangs_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/bangs/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bangs/brunette.png", NME_assets_data_player_hair_male_bangs_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/bangs/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bangs/green.png", NME_assets_data_player_hair_male_bangs_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/bangs/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bangs/pink.png", NME_assets_data_player_hair_male_bangs_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/bangs/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bangs/raven.png", NME_assets_data_player_hair_male_bangs_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/bangs/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bangs/redhead.png", NME_assets_data_player_hair_male_bangs_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/bangs/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bangs/white-blonde.png", NME_assets_data_player_hair_male_bangs_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/bangs/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bangs.png", NME_assets_data_player_hair_male_bangs_png);
			resourceTypes.set ("assets/data/Player/hair/male/bangs.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bedhead/blonde.png", NME_assets_data_player_hair_male_bedhead_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bedhead/blue.png", NME_assets_data_player_hair_male_bedhead_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bedhead/brunette.png", NME_assets_data_player_hair_male_bedhead_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bedhead/green.png", NME_assets_data_player_hair_male_bedhead_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bedhead/pink.png", NME_assets_data_player_hair_male_bedhead_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bedhead/raven.png", NME_assets_data_player_hair_male_bedhead_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bedhead/redhead.png", NME_assets_data_player_hair_male_bedhead_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bedhead/white-blonde.png", NME_assets_data_player_hair_male_bedhead_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/bedhead/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/bedhead.png", NME_assets_data_player_hair_male_bedhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/bedhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/long/blonde.png", NME_assets_data_player_hair_male_long_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/long/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/long/blue.png", NME_assets_data_player_hair_male_long_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/long/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/long/brunette.png", NME_assets_data_player_hair_male_long_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/long/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/long/green.png", NME_assets_data_player_hair_male_long_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/long/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/long/pink.png", NME_assets_data_player_hair_male_long_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/long/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/long/raven.png", NME_assets_data_player_hair_male_long_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/long/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/long/redhead.png", NME_assets_data_player_hair_male_long_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/long/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/long/white-blonde.png", NME_assets_data_player_hair_male_long_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/long/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/long.png", NME_assets_data_player_hair_male_long_png);
			resourceTypes.set ("assets/data/Player/hair/male/long.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/longhawk/blonde.png", NME_assets_data_player_hair_male_longhawk_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/longhawk/blue.png", NME_assets_data_player_hair_male_longhawk_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/longhawk/brunette.png", NME_assets_data_player_hair_male_longhawk_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/longhawk/green.png", NME_assets_data_player_hair_male_longhawk_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/longhawk/pink.png", NME_assets_data_player_hair_male_longhawk_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/longhawk/raven.png", NME_assets_data_player_hair_male_longhawk_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/longhawk/redhead.png", NME_assets_data_player_hair_male_longhawk_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/longhawk/white-blonde.png", NME_assets_data_player_hair_male_longhawk_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/longhawk/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/longhawk.png", NME_assets_data_player_hair_male_longhawk_png);
			resourceTypes.set ("assets/data/Player/hair/male/longhawk.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy1/blonde.png", NME_assets_data_player_hair_male_messy1_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy1/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy1/blue.png", NME_assets_data_player_hair_male_messy1_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy1/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy1/brunette.png", NME_assets_data_player_hair_male_messy1_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy1/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy1/green.png", NME_assets_data_player_hair_male_messy1_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy1/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy1/pink.png", NME_assets_data_player_hair_male_messy1_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy1/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy1/raven.png", NME_assets_data_player_hair_male_messy1_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy1/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy1/redhead.png", NME_assets_data_player_hair_male_messy1_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy1/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy1/white-blonde.png", NME_assets_data_player_hair_male_messy1_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy1/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy1.png", NME_assets_data_player_hair_male_messy1_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy1.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy2/blonde.png", NME_assets_data_player_hair_male_messy2_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy2/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy2/blue.png", NME_assets_data_player_hair_male_messy2_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy2/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy2/brunette.png", NME_assets_data_player_hair_male_messy2_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy2/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy2/green.png", NME_assets_data_player_hair_male_messy2_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy2/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy2/pink.png", NME_assets_data_player_hair_male_messy2_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy2/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy2/raven.png", NME_assets_data_player_hair_male_messy2_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy2/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy2/redhead.png", NME_assets_data_player_hair_male_messy2_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy2/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy2/white-blonde.png", NME_assets_data_player_hair_male_messy2_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy2/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/messy2.png", NME_assets_data_player_hair_male_messy2_png);
			resourceTypes.set ("assets/data/Player/hair/male/messy2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/mohawk/blonde.png", NME_assets_data_player_hair_male_mohawk_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/mohawk/blue.png", NME_assets_data_player_hair_male_mohawk_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/mohawk/brunette.png", NME_assets_data_player_hair_male_mohawk_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/mohawk/green.png", NME_assets_data_player_hair_male_mohawk_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/mohawk/pink.png", NME_assets_data_player_hair_male_mohawk_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/mohawk/raven.png", NME_assets_data_player_hair_male_mohawk_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/mohawk/redhead.png", NME_assets_data_player_hair_male_mohawk_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/mohawk/white-blonde.png", NME_assets_data_player_hair_male_mohawk_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/mohawk/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/mohawk.png", NME_assets_data_player_hair_male_mohawk_png);
			resourceTypes.set ("assets/data/Player/hair/male/mohawk.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page/blonde.png", NME_assets_data_player_hair_male_page_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/page/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page/blue.png", NME_assets_data_player_hair_male_page_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/page/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page/brunette.png", NME_assets_data_player_hair_male_page_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/page/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page/green.png", NME_assets_data_player_hair_male_page_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/page/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page/pink.png", NME_assets_data_player_hair_male_page_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/page/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page/raven.png", NME_assets_data_player_hair_male_page_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/page/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page/redhead.png", NME_assets_data_player_hair_male_page_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/page/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page/white-blonde.png", NME_assets_data_player_hair_male_page_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/page/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page.png", NME_assets_data_player_hair_male_page_png);
			resourceTypes.set ("assets/data/Player/hair/male/page.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/page2.png", NME_assets_data_player_hair_male_page2_png);
			resourceTypes.set ("assets/data/Player/hair/male/page2.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/parted/blonde.png", NME_assets_data_player_hair_male_parted_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/parted/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/parted/blue.png", NME_assets_data_player_hair_male_parted_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/parted/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/parted/brunette.png", NME_assets_data_player_hair_male_parted_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/parted/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/parted/green.png", NME_assets_data_player_hair_male_parted_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/parted/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/parted/pink.png", NME_assets_data_player_hair_male_parted_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/parted/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/parted/raven.png", NME_assets_data_player_hair_male_parted_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/parted/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/parted/redhead.png", NME_assets_data_player_hair_male_parted_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/parted/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/parted/white-blonde.png", NME_assets_data_player_hair_male_parted_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/parted/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/parted.png", NME_assets_data_player_hair_male_parted_png);
			resourceTypes.set ("assets/data/Player/hair/male/parted.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/blonde.png", NME_assets_data_player_hair_male_plain_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/blue.png", NME_assets_data_player_hair_male_plain_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/brunette.png", NME_assets_data_player_hair_male_plain_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/green.png", NME_assets_data_player_hair_male_plain_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/pink.png", NME_assets_data_player_hair_male_plain_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/raven.png", NME_assets_data_player_hair_male_plain_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/redhead.png", NME_assets_data_player_hair_male_plain_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/shadows-darkbody.png", NME_assets_data_player_hair_male_plain_shadows_darkbody_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/shadows-darkbody.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/shadows-lightbody.png", NME_assets_data_player_hair_male_plain_shadows_lightbody_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/shadows-lightbody.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/shadows-tanned2body.png", NME_assets_data_player_hair_male_plain_shadows_tanned2body_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/shadows-tanned2body.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/shadows-tannedbody.png", NME_assets_data_player_hair_male_plain_shadows_tannedbody_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/shadows-tannedbody.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/plain/white-blonde.png", NME_assets_data_player_hair_male_plain_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/plain/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/shorthawk/blonde.png", NME_assets_data_player_hair_male_shorthawk_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/shorthawk/blue.png", NME_assets_data_player_hair_male_shorthawk_blue_png);
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/blue.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/shorthawk/brunette.png", NME_assets_data_player_hair_male_shorthawk_brunette_png);
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/brunette.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/shorthawk/green.png", NME_assets_data_player_hair_male_shorthawk_green_png);
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/green.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/shorthawk/pink.png", NME_assets_data_player_hair_male_shorthawk_pink_png);
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/pink.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/shorthawk/raven.png", NME_assets_data_player_hair_male_shorthawk_raven_png);
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/raven.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/shorthawk/redhead.png", NME_assets_data_player_hair_male_shorthawk_redhead_png);
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/redhead.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/shorthawk/white-blonde.png", NME_assets_data_player_hair_male_shorthawk_white_blonde_png);
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk/white-blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hair/male/shorthawk.png", NME_assets_data_player_hair_male_shorthawk_png);
			resourceTypes.set ("assets/data/Player/hair/male/shorthawk.png", "image");
			resourceClasses.set ("assets/data/Player/hands/bracelet.png", NME_assets_data_player_hands_bracelet_png);
			resourceTypes.set ("assets/data/Player/hands/bracelet.png", "image");
			resourceClasses.set ("assets/data/Player/hands/golden_gloves_female.png", NME_assets_data_player_hands_golden_gloves_female_png);
			resourceTypes.set ("assets/data/Player/hands/golden_gloves_female.png", "image");
			resourceClasses.set ("assets/data/Player/hands/golden_gloves_male.png", NME_assets_data_player_hands_golden_gloves_male_png);
			resourceTypes.set ("assets/data/Player/hands/golden_gloves_male.png", "image");
			resourceClasses.set ("assets/data/Player/hands/metal_gloves_female.png", NME_assets_data_player_hands_metal_gloves_female_png);
			resourceTypes.set ("assets/data/Player/hands/metal_gloves_female.png", "image");
			resourceClasses.set ("assets/data/Player/hands/metal_gloves_male.png", NME_assets_data_player_hands_metal_gloves_male_png);
			resourceTypes.set ("assets/data/Player/hands/metal_gloves_male.png", "image");
			resourceClasses.set ("assets/data/Player/head/bandana_male_wconly.png", NME_assets_data_player_head_bandana_male_wconly_png);
			resourceTypes.set ("assets/data/Player/head/bandana_male_wconly.png", "image");
			resourceClasses.set ("assets/data/Player/head/chainhat_female.png", NME_assets_data_player_head_chainhat_female_png);
			resourceTypes.set ("assets/data/Player/head/chainhat_female.png", "image");
			resourceClasses.set ("assets/data/Player/head/chainhat_male.png", NME_assets_data_player_head_chainhat_male_png);
			resourceTypes.set ("assets/data/Player/head/chainhat_male.png", "image");
			resourceClasses.set ("assets/data/Player/head/chain_hood_female.png", NME_assets_data_player_head_chain_hood_female_png);
			resourceTypes.set ("assets/data/Player/head/chain_hood_female.png", "image");
			resourceClasses.set ("assets/data/Player/head/chain_hood_male.png", NME_assets_data_player_head_chain_hood_male_png);
			resourceTypes.set ("assets/data/Player/head/chain_hood_male.png", "image");
			resourceClasses.set ("assets/data/Player/head/cloth_hood_female.png", NME_assets_data_player_head_cloth_hood_female_png);
			resourceTypes.set ("assets/data/Player/head/cloth_hood_female.png", "image");
			resourceClasses.set ("assets/data/Player/head/cloth_hood_male.png", NME_assets_data_player_head_cloth_hood_male_png);
			resourceTypes.set ("assets/data/Player/head/cloth_hood_male.png", "image");
			resourceClasses.set ("assets/data/Player/head/golden_helm_female.png", NME_assets_data_player_head_golden_helm_female_png);
			resourceTypes.set ("assets/data/Player/head/golden_helm_female.png", "image");
			resourceClasses.set ("assets/data/Player/head/golden_helm_male.png", NME_assets_data_player_head_golden_helm_male_png);
			resourceTypes.set ("assets/data/Player/head/golden_helm_male.png", "image");
			resourceClasses.set ("assets/data/Player/head/leather_cap_female.png", NME_assets_data_player_head_leather_cap_female_png);
			resourceTypes.set ("assets/data/Player/head/leather_cap_female.png", "image");
			resourceClasses.set ("assets/data/Player/head/leather_cap_male.png", NME_assets_data_player_head_leather_cap_male_png);
			resourceTypes.set ("assets/data/Player/head/leather_cap_male.png", "image");
			resourceClasses.set ("assets/data/Player/head/metal_helm_female.png", NME_assets_data_player_head_metal_helm_female_png);
			resourceTypes.set ("assets/data/Player/head/metal_helm_female.png", "image");
			resourceClasses.set ("assets/data/Player/head/metal_helm_male.png", NME_assets_data_player_head_metal_helm_male_png);
			resourceTypes.set ("assets/data/Player/head/metal_helm_male.png", "image");
			resourceClasses.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/bronze.png", NME_assets_data_player_head_tiaras_female_no_th_or_sh_bronze_png);
			resourceTypes.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/bronze.png", "image");
			resourceClasses.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/gold.png", NME_assets_data_player_head_tiaras_female_no_th_or_sh_gold_png);
			resourceTypes.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/gold.png", "image");
			resourceClasses.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/iron.png", NME_assets_data_player_head_tiaras_female_no_th_or_sh_iron_png);
			resourceTypes.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/iron.png", "image");
			resourceClasses.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/silver.png", NME_assets_data_player_head_tiaras_female_no_th_or_sh_silver_png);
			resourceTypes.set ("assets/data/Player/head/tiaras_female_no_th_or_sh/silver.png", "image");
			resourceClasses.set ("assets/data/Player/legs/golden_greaves_female.png", NME_assets_data_player_legs_golden_greaves_female_png);
			resourceTypes.set ("assets/data/Player/legs/golden_greaves_female.png", "image");
			resourceClasses.set ("assets/data/Player/legs/golden_greaves_male.png", NME_assets_data_player_legs_golden_greaves_male_png);
			resourceTypes.set ("assets/data/Player/legs/golden_greaves_male.png", "image");
			resourceClasses.set ("assets/data/Player/legs/green_pants_female.png", NME_assets_data_player_legs_green_pants_female_png);
			resourceTypes.set ("assets/data/Player/legs/green_pants_female.png", "image");
			resourceClasses.set ("assets/data/Player/legs/green_pants_male.png", NME_assets_data_player_legs_green_pants_male_png);
			resourceTypes.set ("assets/data/Player/legs/green_pants_male.png", "image");
			resourceClasses.set ("assets/data/Player/legs/metal_pants_female.png", NME_assets_data_player_legs_metal_pants_female_png);
			resourceTypes.set ("assets/data/Player/legs/metal_pants_female.png", "image");
			resourceClasses.set ("assets/data/Player/legs/metal_pants_male.png", NME_assets_data_player_legs_metal_pants_male_png);
			resourceTypes.set ("assets/data/Player/legs/metal_pants_male.png", "image");
			resourceClasses.set ("assets/data/Player/legs/red_pants_male.png", NME_assets_data_player_legs_red_pants_male_png);
			resourceTypes.set ("assets/data/Player/legs/red_pants_male.png", "image");
			resourceClasses.set ("assets/data/Player/legs/robe_skirt_female_incomplete.png", NME_assets_data_player_legs_robe_skirt_female_incomplete_png);
			resourceTypes.set ("assets/data/Player/legs/robe_skirt_female_incomplete.png", "image");
			resourceClasses.set ("assets/data/Player/legs/robe_skirt_male.png", NME_assets_data_player_legs_robe_skirt_male_png);
			resourceTypes.set ("assets/data/Player/legs/robe_skirt_male.png", "image");
			resourceClasses.set ("assets/data/Player/oversize_xcf/slash_swords.xcf", NME_assets_data_player_oversize_xcf_slash_swords_xcf);
			resourceTypes.set ("assets/data/Player/oversize_xcf/slash_swords.xcf", "binary");
			resourceClasses.set ("assets/data/Player/oversize_xcf/thrust_spears.xcf", NME_assets_data_player_oversize_xcf_thrust_spears_xcf);
			resourceTypes.set ("assets/data/Player/oversize_xcf/thrust_spears.xcf", "binary");
			resourceClasses.set ("assets/data/Player/torso/brown_shirt_male.png", NME_assets_data_player_torso_brown_shirt_male_png);
			resourceTypes.set ("assets/data/Player/torso/brown_shirt_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/chain/mail_female.png", NME_assets_data_player_torso_chain_mail_female_png);
			resourceTypes.set ("assets/data/Player/torso/chain/mail_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/chain/mail_male.png", NME_assets_data_player_torso_chain_mail_male_png);
			resourceTypes.set ("assets/data/Player/torso/chain/mail_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/chain/tabard/jacket_female.png", NME_assets_data_player_torso_chain_tabard_jacket_female_png);
			resourceTypes.set ("assets/data/Player/torso/chain/tabard/jacket_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/chain/tabard/jacket_male.png", NME_assets_data_player_torso_chain_tabard_jacket_male_png);
			resourceTypes.set ("assets/data/Player/torso/chain/tabard/jacket_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/dress_female/blue_vest.png", NME_assets_data_player_torso_dress_female_blue_vest_png);
			resourceTypes.set ("assets/data/Player/torso/dress_female/blue_vest.png", "image");
			resourceClasses.set ("assets/data/Player/torso/dress_female/overskirt.png", NME_assets_data_player_torso_dress_female_overskirt_png);
			resourceTypes.set ("assets/data/Player/torso/dress_female/overskirt.png", "image");
			resourceClasses.set ("assets/data/Player/torso/dress_female/underdress.png", NME_assets_data_player_torso_dress_female_underdress_png);
			resourceTypes.set ("assets/data/Player/torso/dress_female/underdress.png", "image");
			resourceClasses.set ("assets/data/Player/torso/dress_w_sash_female.png", NME_assets_data_player_torso_dress_w_sash_female_png);
			resourceTypes.set ("assets/data/Player/torso/dress_w_sash_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/gold/arms_female.png", NME_assets_data_player_torso_gold_arms_female_png);
			resourceTypes.set ("assets/data/Player/torso/gold/arms_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/gold/arms_male.png", NME_assets_data_player_torso_gold_arms_male_png);
			resourceTypes.set ("assets/data/Player/torso/gold/arms_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/gold/chest_female.png", NME_assets_data_player_torso_gold_chest_female_png);
			resourceTypes.set ("assets/data/Player/torso/gold/chest_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/gold/chest_male.png", NME_assets_data_player_torso_gold_chest_male_png);
			resourceTypes.set ("assets/data/Player/torso/gold/chest_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/gold/spikes_male.png", NME_assets_data_player_torso_gold_spikes_male_png);
			resourceTypes.set ("assets/data/Player/torso/gold/spikes_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/leather/bracers_female.png", NME_assets_data_player_torso_leather_bracers_female_png);
			resourceTypes.set ("assets/data/Player/torso/leather/bracers_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/leather/bracers_male.png", NME_assets_data_player_torso_leather_bracers_male_png);
			resourceTypes.set ("assets/data/Player/torso/leather/bracers_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/leather/chest_female.png", NME_assets_data_player_torso_leather_chest_female_png);
			resourceTypes.set ("assets/data/Player/torso/leather/chest_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/leather/chest_male.png", NME_assets_data_player_torso_leather_chest_male_png);
			resourceTypes.set ("assets/data/Player/torso/leather/chest_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/leather/shoulders_female.png", NME_assets_data_player_torso_leather_shoulders_female_png);
			resourceTypes.set ("assets/data/Player/torso/leather/shoulders_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/leather/shoulders_male.png", NME_assets_data_player_torso_leather_shoulders_male_png);
			resourceTypes.set ("assets/data/Player/torso/leather/shoulders_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/pirate_shirt_female.png", NME_assets_data_player_torso_pirate_shirt_female_png);
			resourceTypes.set ("assets/data/Player/torso/pirate_shirt_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/plate/arms_female.png", NME_assets_data_player_torso_plate_arms_female_png);
			resourceTypes.set ("assets/data/Player/torso/plate/arms_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/plate/arms_male.png", NME_assets_data_player_torso_plate_arms_male_png);
			resourceTypes.set ("assets/data/Player/torso/plate/arms_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/plate/chest_female.png", NME_assets_data_player_torso_plate_chest_female_png);
			resourceTypes.set ("assets/data/Player/torso/plate/chest_female.png", "image");
			resourceClasses.set ("assets/data/Player/torso/plate/chest_male.png", NME_assets_data_player_torso_plate_chest_male_png);
			resourceTypes.set ("assets/data/Player/torso/plate/chest_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/black.png", NME_assets_data_player_torso_robes_female_no_th_sh_black_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/black.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/blue.png", NME_assets_data_player_torso_robes_female_no_th_sh_blue_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/blue.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/brown.png", NME_assets_data_player_torso_robes_female_no_th_sh_brown_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/brown.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/dark brown.png", NME_assets_data_player_torso_robes_female_no_th_sh_dark_brown_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/dark brown.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/dark gray.png", NME_assets_data_player_torso_robes_female_no_th_sh_dark_gray_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/dark gray.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/forest green.png", NME_assets_data_player_torso_robes_female_no_th_sh_forest_green_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/forest green.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/light gray.png", NME_assets_data_player_torso_robes_female_no_th_sh_light_gray_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/light gray.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/purple.png", NME_assets_data_player_torso_robes_female_no_th_sh_purple_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/purple.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/red.png", NME_assets_data_player_torso_robes_female_no_th_sh_red_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/red.png", "image");
			resourceClasses.set ("assets/data/Player/torso/robes_female_no_th-sh/white.png", NME_assets_data_player_torso_robes_female_no_th_sh_white_png);
			resourceTypes.set ("assets/data/Player/torso/robes_female_no_th-sh/white.png", "image");
			resourceClasses.set ("assets/data/Player/torso/white_shirt_male.png", NME_assets_data_player_torso_white_shirt_male_png);
			resourceTypes.set ("assets/data/Player/torso/white_shirt_male.png", "image");
			resourceClasses.set ("assets/data/Player/torso/wings_no_th-sh.png", NME_assets_data_player_torso_wings_no_th_sh_png);
			resourceTypes.set ("assets/data/Player/torso/wings_no_th-sh.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/arrow.png", NME_assets_data_player_weapons_arrow_png);
			resourceTypes.set ("assets/data/Player/weapons/arrow.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/arrow_skeleton.png", NME_assets_data_player_weapons_arrow_skeleton_png);
			resourceTypes.set ("assets/data/Player/weapons/arrow_skeleton.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/bow.png", NME_assets_data_player_weapons_bow_png);
			resourceTypes.set ("assets/data/Player/weapons/bow.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/bow_skeleton.png", NME_assets_data_player_weapons_bow_skeleton_png);
			resourceTypes.set ("assets/data/Player/weapons/bow_skeleton.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/dagger_female.png", NME_assets_data_player_weapons_dagger_female_png);
			resourceTypes.set ("assets/data/Player/weapons/dagger_female.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/dagger_male.png", NME_assets_data_player_weapons_dagger_male_png);
			resourceTypes.set ("assets/data/Player/weapons/dagger_male.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/greatbow.png", NME_assets_data_player_weapons_greatbow_png);
			resourceTypes.set ("assets/data/Player/weapons/greatbow.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/dreagonspear.png", NME_assets_data_player_weapons_oversize_dreagonspear_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/dreagonspear.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/longsword_female.png", NME_assets_data_player_weapons_oversize_longsword_female_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/longsword_female.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/longsword_male.png", NME_assets_data_player_weapons_oversize_longsword_male_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/longsword_male.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/mace_female.png", NME_assets_data_player_weapons_oversize_mace_female_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/mace_female.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/mace_male.png", NME_assets_data_player_weapons_oversize_mace_male_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/mace_male.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/rapier_female.png", NME_assets_data_player_weapons_oversize_rapier_female_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/rapier_female.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/rapier_male.png", NME_assets_data_player_weapons_oversize_rapier_male_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/rapier_male.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/saber_female.png", NME_assets_data_player_weapons_oversize_saber_female_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/saber_female.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/saber_male.png", NME_assets_data_player_weapons_oversize_saber_male_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/saber_male.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/spear.png", NME_assets_data_player_weapons_oversize_spear_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/spear.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/oversize/trident.png", NME_assets_data_player_weapons_oversize_trident_png);
			resourceTypes.set ("assets/data/Player/weapons/oversize/trident.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/recurvebow.png", NME_assets_data_player_weapons_recurvebow_png);
			resourceTypes.set ("assets/data/Player/weapons/recurvebow.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/shield_male_cutoutforbody.png", NME_assets_data_player_weapons_shield_male_cutoutforbody_png);
			resourceTypes.set ("assets/data/Player/weapons/shield_male_cutoutforbody.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/shield_male_cutoutforhat.png", NME_assets_data_player_weapons_shield_male_cutoutforhat_png);
			resourceTypes.set ("assets/data/Player/weapons/shield_male_cutoutforhat.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/spear.png", NME_assets_data_player_weapons_spear_png);
			resourceTypes.set ("assets/data/Player/weapons/spear.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/steelwand_female.png", NME_assets_data_player_weapons_steelwand_female_png);
			resourceTypes.set ("assets/data/Player/weapons/steelwand_female.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/woodwand_female.png", NME_assets_data_player_weapons_woodwand_female_png);
			resourceTypes.set ("assets/data/Player/weapons/woodwand_female.png", "image");
			resourceClasses.set ("assets/data/Player/weapons/woodwand_male.png", NME_assets_data_player_weapons_woodwand_male_png);
			resourceTypes.set ("assets/data/Player/weapons/woodwand_male.png", "image");
			resourceClasses.set ("assets/data/stick.png", NME_assets_data_stick_png);
			resourceTypes.set ("assets/data/stick.png", "image");
			resourceClasses.set ("assets/data/vcr/flixel.png", NME_assets_data_vcr_flixel_png);
			resourceTypes.set ("assets/data/vcr/flixel.png", "image");
			resourceClasses.set ("assets/data/vcr/open.png", NME_assets_data_vcr_open_png);
			resourceTypes.set ("assets/data/vcr/open.png", "image");
			resourceClasses.set ("assets/data/vcr/pause.png", NME_assets_data_vcr_pause_png);
			resourceTypes.set ("assets/data/vcr/pause.png", "image");
			resourceClasses.set ("assets/data/vcr/play.png", NME_assets_data_vcr_play_png);
			resourceTypes.set ("assets/data/vcr/play.png", "image");
			resourceClasses.set ("assets/data/vcr/record_off.png", NME_assets_data_vcr_record_off_png);
			resourceTypes.set ("assets/data/vcr/record_off.png", "image");
			resourceClasses.set ("assets/data/vcr/record_on.png", NME_assets_data_vcr_record_on_png);
			resourceTypes.set ("assets/data/vcr/record_on.png", "image");
			resourceClasses.set ("assets/data/vcr/restart.png", NME_assets_data_vcr_restart_png);
			resourceTypes.set ("assets/data/vcr/restart.png", "image");
			resourceClasses.set ("assets/data/vcr/step.png", NME_assets_data_vcr_step_png);
			resourceTypes.set ("assets/data/vcr/step.png", "image");
			resourceClasses.set ("assets/data/vcr/stop.png", NME_assets_data_vcr_stop_png);
			resourceTypes.set ("assets/data/vcr/stop.png", "image");
			resourceClasses.set ("assets/data/vis/bounds.png", NME_assets_data_vis_bounds_png);
			resourceTypes.set ("assets/data/vis/bounds.png", "image");
			resourceClasses.set ("assets/HaxeFlixel.svg", NME_assets_haxeflixel_svg);
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
				
				var data = cast (Type.createInstance (resourceClasses.get (id), []), BitmapData);
				
				if (useCache) {
					
					cachedBitmapData.set (id, data);
					
				}
				
				return data;
				
			}
			
		} else if (id.indexOf (":") > -1) {
			
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
		
		if (resourceClasses.exists (id)) {
			
			return Type.createInstance (resourceClasses.get (id), []);
			
		} else {
			
			trace ("[nme.Assets] There is no ByteArray asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getFont (id:String):Font {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "font") {
			
			return cast (Type.createInstance (resourceClasses.get (id), []), Font);
			
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
	
	
	public static function getSound (id:String):Sound {
		
		initialize ();
		
		if (resourceTypes.exists (id)) {
			
			if (resourceTypes.get (id).toLowerCase () == "sound" || resourceTypes.get (id).toLowerCase () == "music") {
				
				return cast (Type.createInstance (resourceClasses.get (id), []), Sound);
				
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