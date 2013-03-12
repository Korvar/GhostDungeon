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
			resourceClasses.set ("assets/data/Player/bow/BELT_leather.png", NME_assets_data_player_bow_belt_leather_png);
			resourceTypes.set ("assets/data/Player/bow/BELT_leather.png", "image");
			resourceClasses.set ("assets/data/Player/bow/BELT_rope.png", NME_assets_data_player_bow_belt_rope_png);
			resourceTypes.set ("assets/data/Player/bow/BELT_rope.png", "image");
			resourceClasses.set ("assets/data/Player/bow/BODY_animation.png", NME_assets_data_player_bow_body_animation_png);
			resourceTypes.set ("assets/data/Player/bow/BODY_animation.png", "image");
			resourceClasses.set ("assets/data/Player/bow/FEET_plate_armor_shoes.png", NME_assets_data_player_bow_feet_plate_armor_shoes_png);
			resourceTypes.set ("assets/data/Player/bow/FEET_plate_armor_shoes.png", "image");
			resourceClasses.set ("assets/data/Player/bow/FEET_shoes_brown.png", NME_assets_data_player_bow_feet_shoes_brown_png);
			resourceTypes.set ("assets/data/Player/bow/FEET_shoes_brown.png", "image");
			resourceClasses.set ("assets/data/Player/bow/HANDS_plate_armor_gloves.png", NME_assets_data_player_bow_hands_plate_armor_gloves_png);
			resourceTypes.set ("assets/data/Player/bow/HANDS_plate_armor_gloves.png", "image");
			resourceClasses.set ("assets/data/Player/bow/HEAD_chain_armor_helmet.png", NME_assets_data_player_bow_head_chain_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/bow/HEAD_chain_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/bow/HEAD_chain_armor_hood.png", NME_assets_data_player_bow_head_chain_armor_hood_png);
			resourceTypes.set ("assets/data/Player/bow/HEAD_chain_armor_hood.png", "image");
			resourceClasses.set ("assets/data/Player/bow/HEAD_hair_blonde.png", NME_assets_data_player_bow_head_hair_blonde_png);
			resourceTypes.set ("assets/data/Player/bow/HEAD_hair_blonde.png", "image");
			resourceClasses.set ("assets/data/Player/bow/HEAD_leather_armor_hat.png", NME_assets_data_player_bow_head_leather_armor_hat_png);
			resourceTypes.set ("assets/data/Player/bow/HEAD_leather_armor_hat.png", "image");
			resourceClasses.set ("assets/data/Player/bow/HEAD_plate_armor_helmet.png", NME_assets_data_player_bow_head_plate_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/bow/HEAD_plate_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/bow/HEAD_robe_hood.png", NME_assets_data_player_bow_head_robe_hood_png);
			resourceTypes.set ("assets/data/Player/bow/HEAD_robe_hood.png", "image");
			resourceClasses.set ("assets/data/Player/bow/LEGS_pants_greenish.png", NME_assets_data_player_bow_legs_pants_greenish_png);
			resourceTypes.set ("assets/data/Player/bow/LEGS_pants_greenish.png", "image");
			resourceClasses.set ("assets/data/Player/bow/LEGS_plate_armor_pants.png", NME_assets_data_player_bow_legs_plate_armor_pants_png);
			resourceTypes.set ("assets/data/Player/bow/LEGS_plate_armor_pants.png", "image");
			resourceClasses.set ("assets/data/Player/bow/LEGS_robe_skirt.png", NME_assets_data_player_bow_legs_robe_skirt_png);
			resourceTypes.set ("assets/data/Player/bow/LEGS_robe_skirt.png", "image");
			resourceClasses.set ("assets/data/Player/bow/TORSO_chain_armor_jacket_purple.png", NME_assets_data_player_bow_torso_chain_armor_jacket_purple_png);
			resourceTypes.set ("assets/data/Player/bow/TORSO_chain_armor_jacket_purple.png", "image");
			resourceClasses.set ("assets/data/Player/bow/TORSO_chain_armor_torso.png", NME_assets_data_player_bow_torso_chain_armor_torso_png);
			resourceTypes.set ("assets/data/Player/bow/TORSO_chain_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/bow/TORSO_leather_armor_bracers.png", NME_assets_data_player_bow_torso_leather_armor_bracers_png);
			resourceTypes.set ("assets/data/Player/bow/TORSO_leather_armor_bracers.png", "image");
			resourceClasses.set ("assets/data/Player/bow/TORSO_leather_armor_shirt_white.png", NME_assets_data_player_bow_torso_leather_armor_shirt_white_png);
			resourceTypes.set ("assets/data/Player/bow/TORSO_leather_armor_shirt_white.png", "image");
			resourceClasses.set ("assets/data/Player/bow/TORSO_leather_armor_shoulders.png", NME_assets_data_player_bow_torso_leather_armor_shoulders_png);
			resourceTypes.set ("assets/data/Player/bow/TORSO_leather_armor_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/bow/TORSO_leather_armor_torso.png", NME_assets_data_player_bow_torso_leather_armor_torso_png);
			resourceTypes.set ("assets/data/Player/bow/TORSO_leather_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/bow/TORSO_plate_armor_arms_shoulders.png", NME_assets_data_player_bow_torso_plate_armor_arms_shoulders_png);
			resourceTypes.set ("assets/data/Player/bow/TORSO_plate_armor_arms_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/bow/TORSO_plate_armor_torso.png", NME_assets_data_player_bow_torso_plate_armor_torso_png);
			resourceTypes.set ("assets/data/Player/bow/TORSO_plate_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/bow/TORSO_robe_shirt_brown.png", NME_assets_data_player_bow_torso_robe_shirt_brown_png);
			resourceTypes.set ("assets/data/Player/bow/TORSO_robe_shirt_brown.png", "image");
			resourceClasses.set ("assets/data/Player/bow/WEAPON_arrow.png", NME_assets_data_player_bow_weapon_arrow_png);
			resourceTypes.set ("assets/data/Player/bow/WEAPON_arrow.png", "image");
			resourceClasses.set ("assets/data/Player/bow/WEAPON_bow.png", NME_assets_data_player_bow_weapon_bow_png);
			resourceTypes.set ("assets/data/Player/bow/WEAPON_bow.png", "image");
			resourceClasses.set ("assets/data/Player/combat_dummy/BODY_animation.png", NME_assets_data_player_combat_dummy_body_animation_png);
			resourceTypes.set ("assets/data/Player/combat_dummy/BODY_animation.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/BEHIND_quiver.png", NME_assets_data_player_hurt_behind_quiver_png);
			resourceTypes.set ("assets/data/Player/hurt/BEHIND_quiver.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/BELT_leather.png", NME_assets_data_player_hurt_belt_leather_png);
			resourceTypes.set ("assets/data/Player/hurt/BELT_leather.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/BELT_rope.png", NME_assets_data_player_hurt_belt_rope_png);
			resourceTypes.set ("assets/data/Player/hurt/BELT_rope.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/BODY_male.png", NME_assets_data_player_hurt_body_male_png);
			resourceTypes.set ("assets/data/Player/hurt/BODY_male.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/BODY_skeleton.png", NME_assets_data_player_hurt_body_skeleton_png);
			resourceTypes.set ("assets/data/Player/hurt/BODY_skeleton.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/FEET_plate_armor_shoes.png", NME_assets_data_player_hurt_feet_plate_armor_shoes_png);
			resourceTypes.set ("assets/data/Player/hurt/FEET_plate_armor_shoes.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/FEET_shoes_brown.png", NME_assets_data_player_hurt_feet_shoes_brown_png);
			resourceTypes.set ("assets/data/Player/hurt/FEET_shoes_brown.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/HANDS_plate_armor_gloves.png", NME_assets_data_player_hurt_hands_plate_armor_gloves_png);
			resourceTypes.set ("assets/data/Player/hurt/HANDS_plate_armor_gloves.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/HEAD_chain_armor_helmet.png", NME_assets_data_player_hurt_head_chain_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/hurt/HEAD_chain_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/HEAD_chain_armor_hood.png", NME_assets_data_player_hurt_head_chain_armor_hood_png);
			resourceTypes.set ("assets/data/Player/hurt/HEAD_chain_armor_hood.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/HEAD_hair_blonde.png", NME_assets_data_player_hurt_head_hair_blonde_png);
			resourceTypes.set ("assets/data/Player/hurt/HEAD_hair_blonde.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/HEAD_leather_armor_hat.png", NME_assets_data_player_hurt_head_leather_armor_hat_png);
			resourceTypes.set ("assets/data/Player/hurt/HEAD_leather_armor_hat.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/HEAD_plate_armor_helmet.png", NME_assets_data_player_hurt_head_plate_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/hurt/HEAD_plate_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/HEAD_robe_hood.png", NME_assets_data_player_hurt_head_robe_hood_png);
			resourceTypes.set ("assets/data/Player/hurt/HEAD_robe_hood.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/LEGS_pants_greenish.png", NME_assets_data_player_hurt_legs_pants_greenish_png);
			resourceTypes.set ("assets/data/Player/hurt/LEGS_pants_greenish.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/LEGS_plate_armor_pants.png", NME_assets_data_player_hurt_legs_plate_armor_pants_png);
			resourceTypes.set ("assets/data/Player/hurt/LEGS_plate_armor_pants.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/LEGS_robe_skirt.png", NME_assets_data_player_hurt_legs_robe_skirt_png);
			resourceTypes.set ("assets/data/Player/hurt/LEGS_robe_skirt.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/TORSO_chain_armor_jacket_purple.png", NME_assets_data_player_hurt_torso_chain_armor_jacket_purple_png);
			resourceTypes.set ("assets/data/Player/hurt/TORSO_chain_armor_jacket_purple.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/TORSO_chain_armor_torso.png", NME_assets_data_player_hurt_torso_chain_armor_torso_png);
			resourceTypes.set ("assets/data/Player/hurt/TORSO_chain_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/TORSO_leather_armor_bracers.png", NME_assets_data_player_hurt_torso_leather_armor_bracers_png);
			resourceTypes.set ("assets/data/Player/hurt/TORSO_leather_armor_bracers.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/TORSO_leather_armor_shirt_white.png", NME_assets_data_player_hurt_torso_leather_armor_shirt_white_png);
			resourceTypes.set ("assets/data/Player/hurt/TORSO_leather_armor_shirt_white.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/TORSO_leather_armor_shoulders.png", NME_assets_data_player_hurt_torso_leather_armor_shoulders_png);
			resourceTypes.set ("assets/data/Player/hurt/TORSO_leather_armor_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/TORSO_leather_armor_torso.png", NME_assets_data_player_hurt_torso_leather_armor_torso_png);
			resourceTypes.set ("assets/data/Player/hurt/TORSO_leather_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/TORSO_plate_armor_arms_shoulders.png", NME_assets_data_player_hurt_torso_plate_armor_arms_shoulders_png);
			resourceTypes.set ("assets/data/Player/hurt/TORSO_plate_armor_arms_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/TORSO_plate_armor_torso.png", NME_assets_data_player_hurt_torso_plate_armor_torso_png);
			resourceTypes.set ("assets/data/Player/hurt/TORSO_plate_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/hurt/TORSO_robe_shirt_brown.png", NME_assets_data_player_hurt_torso_robe_shirt_brown_png);
			resourceTypes.set ("assets/data/Player/hurt/TORSO_robe_shirt_brown.png", "image");
			resourceClasses.set ("assets/data/Player/slash/BEHIND_quiver.png", NME_assets_data_player_slash_behind_quiver_png);
			resourceTypes.set ("assets/data/Player/slash/BEHIND_quiver.png", "image");
			resourceClasses.set ("assets/data/Player/slash/BELT_leather.png", NME_assets_data_player_slash_belt_leather_png);
			resourceTypes.set ("assets/data/Player/slash/BELT_leather.png", "image");
			resourceClasses.set ("assets/data/Player/slash/BELT_rope.png", NME_assets_data_player_slash_belt_rope_png);
			resourceTypes.set ("assets/data/Player/slash/BELT_rope.png", "image");
			resourceClasses.set ("assets/data/Player/slash/BODY_human.png", NME_assets_data_player_slash_body_human_png);
			resourceTypes.set ("assets/data/Player/slash/BODY_human.png", "image");
			resourceClasses.set ("assets/data/Player/slash/BODY_skeleton.png", NME_assets_data_player_slash_body_skeleton_png);
			resourceTypes.set ("assets/data/Player/slash/BODY_skeleton.png", "image");
			resourceClasses.set ("assets/data/Player/slash/FEET_plate_armor_shoes.png", NME_assets_data_player_slash_feet_plate_armor_shoes_png);
			resourceTypes.set ("assets/data/Player/slash/FEET_plate_armor_shoes.png", "image");
			resourceClasses.set ("assets/data/Player/slash/FEET_shoes_brown.png", NME_assets_data_player_slash_feet_shoes_brown_png);
			resourceTypes.set ("assets/data/Player/slash/FEET_shoes_brown.png", "image");
			resourceClasses.set ("assets/data/Player/slash/HANDS_plate_armor_gloves.png", NME_assets_data_player_slash_hands_plate_armor_gloves_png);
			resourceTypes.set ("assets/data/Player/slash/HANDS_plate_armor_gloves.png", "image");
			resourceClasses.set ("assets/data/Player/slash/HEAD_chain_armor_helmet.png", NME_assets_data_player_slash_head_chain_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/slash/HEAD_chain_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/slash/HEAD_chain_armor_hood.png", NME_assets_data_player_slash_head_chain_armor_hood_png);
			resourceTypes.set ("assets/data/Player/slash/HEAD_chain_armor_hood.png", "image");
			resourceClasses.set ("assets/data/Player/slash/HEAD_hair_blonde.png", NME_assets_data_player_slash_head_hair_blonde_png);
			resourceTypes.set ("assets/data/Player/slash/HEAD_hair_blonde.png", "image");
			resourceClasses.set ("assets/data/Player/slash/HEAD_leather_armor_hat.png", NME_assets_data_player_slash_head_leather_armor_hat_png);
			resourceTypes.set ("assets/data/Player/slash/HEAD_leather_armor_hat.png", "image");
			resourceClasses.set ("assets/data/Player/slash/HEAD_plate_armor_helmet.png", NME_assets_data_player_slash_head_plate_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/slash/HEAD_plate_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/slash/HEAD_robe_hood.png", NME_assets_data_player_slash_head_robe_hood_png);
			resourceTypes.set ("assets/data/Player/slash/HEAD_robe_hood.png", "image");
			resourceClasses.set ("assets/data/Player/slash/LEGS_pants_greenish.png", NME_assets_data_player_slash_legs_pants_greenish_png);
			resourceTypes.set ("assets/data/Player/slash/LEGS_pants_greenish.png", "image");
			resourceClasses.set ("assets/data/Player/slash/LEGS_plate_armor_pants.png", NME_assets_data_player_slash_legs_plate_armor_pants_png);
			resourceTypes.set ("assets/data/Player/slash/LEGS_plate_armor_pants.png", "image");
			resourceClasses.set ("assets/data/Player/slash/LEGS_robe_skirt.png", NME_assets_data_player_slash_legs_robe_skirt_png);
			resourceTypes.set ("assets/data/Player/slash/LEGS_robe_skirt.png", "image");
			resourceClasses.set ("assets/data/Player/slash/TORSO_chain_armor_jacket_purple.png", NME_assets_data_player_slash_torso_chain_armor_jacket_purple_png);
			resourceTypes.set ("assets/data/Player/slash/TORSO_chain_armor_jacket_purple.png", "image");
			resourceClasses.set ("assets/data/Player/slash/TORSO_chain_armor_torso.png", NME_assets_data_player_slash_torso_chain_armor_torso_png);
			resourceTypes.set ("assets/data/Player/slash/TORSO_chain_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/slash/TORSO_leather_armor_bracers.png", NME_assets_data_player_slash_torso_leather_armor_bracers_png);
			resourceTypes.set ("assets/data/Player/slash/TORSO_leather_armor_bracers.png", "image");
			resourceClasses.set ("assets/data/Player/slash/TORSO_leather_armor_shirt_white.png", NME_assets_data_player_slash_torso_leather_armor_shirt_white_png);
			resourceTypes.set ("assets/data/Player/slash/TORSO_leather_armor_shirt_white.png", "image");
			resourceClasses.set ("assets/data/Player/slash/TORSO_leather_armor_shoulders.png", NME_assets_data_player_slash_torso_leather_armor_shoulders_png);
			resourceTypes.set ("assets/data/Player/slash/TORSO_leather_armor_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/slash/TORSO_leather_armor_torso.png", NME_assets_data_player_slash_torso_leather_armor_torso_png);
			resourceTypes.set ("assets/data/Player/slash/TORSO_leather_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/slash/TORSO_plate_armor_arms_shoulders.png", NME_assets_data_player_slash_torso_plate_armor_arms_shoulders_png);
			resourceTypes.set ("assets/data/Player/slash/TORSO_plate_armor_arms_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/slash/TORSO_plate_armor_torso.png", NME_assets_data_player_slash_torso_plate_armor_torso_png);
			resourceTypes.set ("assets/data/Player/slash/TORSO_plate_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/slash/TORSO_robe_shirt_brown.png", NME_assets_data_player_slash_torso_robe_shirt_brown_png);
			resourceTypes.set ("assets/data/Player/slash/TORSO_robe_shirt_brown.png", "image");
			resourceClasses.set ("assets/data/Player/slash/WEAPON_dagger.png", NME_assets_data_player_slash_weapon_dagger_png);
			resourceTypes.set ("assets/data/Player/slash/WEAPON_dagger.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/BEHIND_quiver.png", NME_assets_data_player_spellcast_behind_quiver_png);
			resourceTypes.set ("assets/data/Player/spellcast/BEHIND_quiver.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/BELT_leather.png", NME_assets_data_player_spellcast_belt_leather_png);
			resourceTypes.set ("assets/data/Player/spellcast/BELT_leather.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/BELT_rope.png", NME_assets_data_player_spellcast_belt_rope_png);
			resourceTypes.set ("assets/data/Player/spellcast/BELT_rope.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/BODY_male.png", NME_assets_data_player_spellcast_body_male_png);
			resourceTypes.set ("assets/data/Player/spellcast/BODY_male.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/BODY_skeleton.png", NME_assets_data_player_spellcast_body_skeleton_png);
			resourceTypes.set ("assets/data/Player/spellcast/BODY_skeleton.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/FEET_plate_armor_shoes.png", NME_assets_data_player_spellcast_feet_plate_armor_shoes_png);
			resourceTypes.set ("assets/data/Player/spellcast/FEET_plate_armor_shoes.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/FEET_shoes_brown.png", NME_assets_data_player_spellcast_feet_shoes_brown_png);
			resourceTypes.set ("assets/data/Player/spellcast/FEET_shoes_brown.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/HANDS_plate_armor_gloves.png", NME_assets_data_player_spellcast_hands_plate_armor_gloves_png);
			resourceTypes.set ("assets/data/Player/spellcast/HANDS_plate_armor_gloves.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/HEAD_chain_armor_helmet.png", NME_assets_data_player_spellcast_head_chain_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/spellcast/HEAD_chain_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/HEAD_chain_armor_hood.png", NME_assets_data_player_spellcast_head_chain_armor_hood_png);
			resourceTypes.set ("assets/data/Player/spellcast/HEAD_chain_armor_hood.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/HEAD_hair_blonde.png", NME_assets_data_player_spellcast_head_hair_blonde_png);
			resourceTypes.set ("assets/data/Player/spellcast/HEAD_hair_blonde.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/HEAD_leather_armor_hat.png", NME_assets_data_player_spellcast_head_leather_armor_hat_png);
			resourceTypes.set ("assets/data/Player/spellcast/HEAD_leather_armor_hat.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/HEAD_plate_armor_helmet.png", NME_assets_data_player_spellcast_head_plate_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/spellcast/HEAD_plate_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/HEAD_robe_hood.png", NME_assets_data_player_spellcast_head_robe_hood_png);
			resourceTypes.set ("assets/data/Player/spellcast/HEAD_robe_hood.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/HEAD_skeleton_eye_glow.png", NME_assets_data_player_spellcast_head_skeleton_eye_glow_png);
			resourceTypes.set ("assets/data/Player/spellcast/HEAD_skeleton_eye_glow.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/LEGS_pants_greenish.png", NME_assets_data_player_spellcast_legs_pants_greenish_png);
			resourceTypes.set ("assets/data/Player/spellcast/LEGS_pants_greenish.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/LEGS_plate_armor_pants.png", NME_assets_data_player_spellcast_legs_plate_armor_pants_png);
			resourceTypes.set ("assets/data/Player/spellcast/LEGS_plate_armor_pants.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/LEGS_robe_skirt.png", NME_assets_data_player_spellcast_legs_robe_skirt_png);
			resourceTypes.set ("assets/data/Player/spellcast/LEGS_robe_skirt.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/TORSO_chain_armor_jacket_purple.png", NME_assets_data_player_spellcast_torso_chain_armor_jacket_purple_png);
			resourceTypes.set ("assets/data/Player/spellcast/TORSO_chain_armor_jacket_purple.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/TORSO_chain_armor_torso.png", NME_assets_data_player_spellcast_torso_chain_armor_torso_png);
			resourceTypes.set ("assets/data/Player/spellcast/TORSO_chain_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/TORSO_leather_armor_bracers.png", NME_assets_data_player_spellcast_torso_leather_armor_bracers_png);
			resourceTypes.set ("assets/data/Player/spellcast/TORSO_leather_armor_bracers.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/TORSO_leather_armor_shirt_white.png", NME_assets_data_player_spellcast_torso_leather_armor_shirt_white_png);
			resourceTypes.set ("assets/data/Player/spellcast/TORSO_leather_armor_shirt_white.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/TORSO_leather_armor_shoulders.png", NME_assets_data_player_spellcast_torso_leather_armor_shoulders_png);
			resourceTypes.set ("assets/data/Player/spellcast/TORSO_leather_armor_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/TORSO_leather_armor_torso.png", NME_assets_data_player_spellcast_torso_leather_armor_torso_png);
			resourceTypes.set ("assets/data/Player/spellcast/TORSO_leather_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/TORSO_plate_armor_arms_shoulders.png", NME_assets_data_player_spellcast_torso_plate_armor_arms_shoulders_png);
			resourceTypes.set ("assets/data/Player/spellcast/TORSO_plate_armor_arms_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/TORSO_plate_armor_torso.png", NME_assets_data_player_spellcast_torso_plate_armor_torso_png);
			resourceTypes.set ("assets/data/Player/spellcast/TORSO_plate_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/spellcast/TORSO_robe_shirt_brown.png", NME_assets_data_player_spellcast_torso_robe_shirt_brown_png);
			resourceTypes.set ("assets/data/Player/spellcast/TORSO_robe_shirt_brown.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/BEHIND_quiver.png", NME_assets_data_player_thrust_behind_quiver_png);
			resourceTypes.set ("assets/data/Player/thrust/BEHIND_quiver.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/BELT_leather.png", NME_assets_data_player_thrust_belt_leather_png);
			resourceTypes.set ("assets/data/Player/thrust/BELT_leather.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/BELT_rope.png", NME_assets_data_player_thrust_belt_rope_png);
			resourceTypes.set ("assets/data/Player/thrust/BELT_rope.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/BODY_animation.png", NME_assets_data_player_thrust_body_animation_png);
			resourceTypes.set ("assets/data/Player/thrust/BODY_animation.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/FEET_plate_armor_shoes.png", NME_assets_data_player_thrust_feet_plate_armor_shoes_png);
			resourceTypes.set ("assets/data/Player/thrust/FEET_plate_armor_shoes.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/FEET_shoes_brown.png", NME_assets_data_player_thrust_feet_shoes_brown_png);
			resourceTypes.set ("assets/data/Player/thrust/FEET_shoes_brown.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/HANDS_plate_armor_gloves.png", NME_assets_data_player_thrust_hands_plate_armor_gloves_png);
			resourceTypes.set ("assets/data/Player/thrust/HANDS_plate_armor_gloves.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/HEAD_chain_armor_helmet.png", NME_assets_data_player_thrust_head_chain_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/thrust/HEAD_chain_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/HEAD_chain_armor_hood.png", NME_assets_data_player_thrust_head_chain_armor_hood_png);
			resourceTypes.set ("assets/data/Player/thrust/HEAD_chain_armor_hood.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/HEAD_hair_blonde.png", NME_assets_data_player_thrust_head_hair_blonde_png);
			resourceTypes.set ("assets/data/Player/thrust/HEAD_hair_blonde.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/HEAD_leather_armor_hat.png", NME_assets_data_player_thrust_head_leather_armor_hat_png);
			resourceTypes.set ("assets/data/Player/thrust/HEAD_leather_armor_hat.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/HEAD_plate_armor_helmet.png", NME_assets_data_player_thrust_head_plate_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/thrust/HEAD_plate_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/HEAD_robe_hood.png", NME_assets_data_player_thrust_head_robe_hood_png);
			resourceTypes.set ("assets/data/Player/thrust/HEAD_robe_hood.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/LEGS_pants_greenish.png", NME_assets_data_player_thrust_legs_pants_greenish_png);
			resourceTypes.set ("assets/data/Player/thrust/LEGS_pants_greenish.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/LEGS_plate_armor_pants.png", NME_assets_data_player_thrust_legs_plate_armor_pants_png);
			resourceTypes.set ("assets/data/Player/thrust/LEGS_plate_armor_pants.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/LEGS_robe_skirt.png", NME_assets_data_player_thrust_legs_robe_skirt_png);
			resourceTypes.set ("assets/data/Player/thrust/LEGS_robe_skirt.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/TORSO_chain_armor_jacket_purple.png", NME_assets_data_player_thrust_torso_chain_armor_jacket_purple_png);
			resourceTypes.set ("assets/data/Player/thrust/TORSO_chain_armor_jacket_purple.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/TORSO_chain_armor_torso.png", NME_assets_data_player_thrust_torso_chain_armor_torso_png);
			resourceTypes.set ("assets/data/Player/thrust/TORSO_chain_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/TORSO_leather_armor_bracers.png", NME_assets_data_player_thrust_torso_leather_armor_bracers_png);
			resourceTypes.set ("assets/data/Player/thrust/TORSO_leather_armor_bracers.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/TORSO_leather_armor_shirt_white.png", NME_assets_data_player_thrust_torso_leather_armor_shirt_white_png);
			resourceTypes.set ("assets/data/Player/thrust/TORSO_leather_armor_shirt_white.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/TORSO_leather_armor_shoulders.png", NME_assets_data_player_thrust_torso_leather_armor_shoulders_png);
			resourceTypes.set ("assets/data/Player/thrust/TORSO_leather_armor_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/TORSO_leather_armor_torso.png", NME_assets_data_player_thrust_torso_leather_armor_torso_png);
			resourceTypes.set ("assets/data/Player/thrust/TORSO_leather_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/TORSO_plate_armor_arms_shoulders.png", NME_assets_data_player_thrust_torso_plate_armor_arms_shoulders_png);
			resourceTypes.set ("assets/data/Player/thrust/TORSO_plate_armor_arms_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/TORSO_plate_armor_torso.png", NME_assets_data_player_thrust_torso_plate_armor_torso_png);
			resourceTypes.set ("assets/data/Player/thrust/TORSO_plate_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/TORSO_robe_shirt_brown.png", NME_assets_data_player_thrust_torso_robe_shirt_brown_png);
			resourceTypes.set ("assets/data/Player/thrust/TORSO_robe_shirt_brown.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/WEAPON_shield_cutout_body.png", NME_assets_data_player_thrust_weapon_shield_cutout_body_png);
			resourceTypes.set ("assets/data/Player/thrust/WEAPON_shield_cutout_body.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/WEAPON_shield_cutout_chain_armor_helmet.png", NME_assets_data_player_thrust_weapon_shield_cutout_chain_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/thrust/WEAPON_shield_cutout_chain_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/WEAPON_spear.png", NME_assets_data_player_thrust_weapon_spear_png);
			resourceTypes.set ("assets/data/Player/thrust/WEAPON_spear.png", "image");
			resourceClasses.set ("assets/data/Player/thrust/WEAPON_staff.png", NME_assets_data_player_thrust_weapon_staff_png);
			resourceTypes.set ("assets/data/Player/thrust/WEAPON_staff.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/BEHIND_quiver.png", NME_assets_data_player_walkcycle_behind_quiver_png);
			resourceTypes.set ("assets/data/Player/walkcycle/BEHIND_quiver.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/BELT_leather.png", NME_assets_data_player_walkcycle_belt_leather_png);
			resourceTypes.set ("assets/data/Player/walkcycle/BELT_leather.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/BELT_rope.png", NME_assets_data_player_walkcycle_belt_rope_png);
			resourceTypes.set ("assets/data/Player/walkcycle/BELT_rope.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/BODY_male.png", NME_assets_data_player_walkcycle_body_male_png);
			resourceTypes.set ("assets/data/Player/walkcycle/BODY_male.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/BODY_skeleton.png", NME_assets_data_player_walkcycle_body_skeleton_png);
			resourceTypes.set ("assets/data/Player/walkcycle/BODY_skeleton.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/FEET_plate_armor_shoes.png", NME_assets_data_player_walkcycle_feet_plate_armor_shoes_png);
			resourceTypes.set ("assets/data/Player/walkcycle/FEET_plate_armor_shoes.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/FEET_shoes_brown.png", NME_assets_data_player_walkcycle_feet_shoes_brown_png);
			resourceTypes.set ("assets/data/Player/walkcycle/FEET_shoes_brown.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/HANDS_plate_armor_gloves.png", NME_assets_data_player_walkcycle_hands_plate_armor_gloves_png);
			resourceTypes.set ("assets/data/Player/walkcycle/HANDS_plate_armor_gloves.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/HEAD_chain_armor_helmet.png", NME_assets_data_player_walkcycle_head_chain_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/walkcycle/HEAD_chain_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/HEAD_chain_armor_hood.png", NME_assets_data_player_walkcycle_head_chain_armor_hood_png);
			resourceTypes.set ("assets/data/Player/walkcycle/HEAD_chain_armor_hood.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/HEAD_hair_blonde.png", NME_assets_data_player_walkcycle_head_hair_blonde_png);
			resourceTypes.set ("assets/data/Player/walkcycle/HEAD_hair_blonde.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/HEAD_leather_armor_hat.png", NME_assets_data_player_walkcycle_head_leather_armor_hat_png);
			resourceTypes.set ("assets/data/Player/walkcycle/HEAD_leather_armor_hat.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/HEAD_plate_armor_helmet.png", NME_assets_data_player_walkcycle_head_plate_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/walkcycle/HEAD_plate_armor_helmet.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/HEAD_robe_hood.png", NME_assets_data_player_walkcycle_head_robe_hood_png);
			resourceTypes.set ("assets/data/Player/walkcycle/HEAD_robe_hood.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/LEGS_pants_greenish.png", NME_assets_data_player_walkcycle_legs_pants_greenish_png);
			resourceTypes.set ("assets/data/Player/walkcycle/LEGS_pants_greenish.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/LEGS_plate_armor_pants.png", NME_assets_data_player_walkcycle_legs_plate_armor_pants_png);
			resourceTypes.set ("assets/data/Player/walkcycle/LEGS_plate_armor_pants.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/LEGS_robe_skirt.png", NME_assets_data_player_walkcycle_legs_robe_skirt_png);
			resourceTypes.set ("assets/data/Player/walkcycle/LEGS_robe_skirt.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/TORSO_chain_armor_jacket_purple.png", NME_assets_data_player_walkcycle_torso_chain_armor_jacket_purple_png);
			resourceTypes.set ("assets/data/Player/walkcycle/TORSO_chain_armor_jacket_purple.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/TORSO_chain_armor_torso.png", NME_assets_data_player_walkcycle_torso_chain_armor_torso_png);
			resourceTypes.set ("assets/data/Player/walkcycle/TORSO_chain_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/TORSO_leather_armor_bracers.png", NME_assets_data_player_walkcycle_torso_leather_armor_bracers_png);
			resourceTypes.set ("assets/data/Player/walkcycle/TORSO_leather_armor_bracers.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/TORSO_leather_armor_shirt_white.png", NME_assets_data_player_walkcycle_torso_leather_armor_shirt_white_png);
			resourceTypes.set ("assets/data/Player/walkcycle/TORSO_leather_armor_shirt_white.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/TORSO_leather_armor_shoulders.png", NME_assets_data_player_walkcycle_torso_leather_armor_shoulders_png);
			resourceTypes.set ("assets/data/Player/walkcycle/TORSO_leather_armor_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/TORSO_leather_armor_torso.png", NME_assets_data_player_walkcycle_torso_leather_armor_torso_png);
			resourceTypes.set ("assets/data/Player/walkcycle/TORSO_leather_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/TORSO_plate_armor_arms_shoulders.png", NME_assets_data_player_walkcycle_torso_plate_armor_arms_shoulders_png);
			resourceTypes.set ("assets/data/Player/walkcycle/TORSO_plate_armor_arms_shoulders.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/TORSO_plate_armor_torso.png", NME_assets_data_player_walkcycle_torso_plate_armor_torso_png);
			resourceTypes.set ("assets/data/Player/walkcycle/TORSO_plate_armor_torso.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/TORSO_robe_shirt_brown.png", NME_assets_data_player_walkcycle_torso_robe_shirt_brown_png);
			resourceTypes.set ("assets/data/Player/walkcycle/TORSO_robe_shirt_brown.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/WEAPON_shield_cutout_body.png", NME_assets_data_player_walkcycle_weapon_shield_cutout_body_png);
			resourceTypes.set ("assets/data/Player/walkcycle/WEAPON_shield_cutout_body.png", "image");
			resourceClasses.set ("assets/data/Player/walkcycle/WEAPON_shield_cutout_chain_armor_helmet.png", NME_assets_data_player_walkcycle_weapon_shield_cutout_chain_armor_helmet_png);
			resourceTypes.set ("assets/data/Player/walkcycle/WEAPON_shield_cutout_chain_armor_helmet.png", "image");
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