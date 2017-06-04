package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_amstrad_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_pixelarial_ttf);
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_tiny_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/amstrad.ttf", __ASSET__assets_amstrad_ttf);
		type.set ("assets/amstrad.ttf", AssetType.FONT);
		className.set ("assets/bg01.png", __ASSET__assets_bg01_png);
		type.set ("assets/bg01.png", AssetType.IMAGE);
		className.set ("assets/bg02.png", __ASSET__assets_bg02_png);
		type.set ("assets/bg02.png", AssetType.IMAGE);
		className.set ("assets/bg03.png", __ASSET__assets_bg03_png);
		type.set ("assets/bg03.png", AssetType.IMAGE);
		className.set ("assets/bird_anim.png", __ASSET__assets_bird_anim_png);
		type.set ("assets/bird_anim.png", AssetType.IMAGE);
		className.set ("assets/data/oldparams.json", __ASSET__assets_data_oldparams_json);
		type.set ("assets/data/oldparams.json", AssetType.TEXT);
		className.set ("assets/data/params.json", __ASSET__assets_data_params_json);
		type.set ("assets/data/params.json", AssetType.TEXT);
		className.set ("assets/DJLOGO.png", __ASSET__assets_djlogo_png);
		type.set ("assets/DJLOGO.png", AssetType.IMAGE);
		className.set ("assets/HAXELOGO.png", __ASSET__assets_haxelogo_png);
		type.set ("assets/HAXELOGO.png", AssetType.IMAGE);
		className.set ("assets/images/Bathroom_V1.png", __ASSET__assets_images_bathroom_v1_png);
		type.set ("assets/images/Bathroom_V1.png", AssetType.IMAGE);
		className.set ("assets/images/Bedroom.ase", __ASSET__assets_images_bedroom_ase);
		type.set ("assets/images/Bedroom.ase", AssetType.BINARY);
		className.set ("assets/images/Bed_V1.png", __ASSET__assets_images_bed_v1_png);
		type.set ("assets/images/Bed_V1.png", AssetType.IMAGE);
		className.set ("assets/images/ClassroomASSETS.ase", __ASSET__assets_images_classroomassets_ase);
		type.set ("assets/images/ClassroomASSETS.ase", AssetType.BINARY);
		className.set ("assets/images/ClassroomTest1.png", __ASSET__assets_images_classroomtest1_png);
		type.set ("assets/images/ClassroomTest1.png", AssetType.IMAGE);
		className.set ("assets/images/ClassroomV1.png", __ASSET__assets_images_classroomv1_png);
		type.set ("assets/images/ClassroomV1.png", AssetType.IMAGE);
		className.set ("assets/images/DeskAnim_V1.png", __ASSET__assets_images_deskanim_v1_png);
		type.set ("assets/images/DeskAnim_V1.png", AssetType.IMAGE);
		className.set ("assets/images/houseBW.png", __ASSET__assets_images_housebw_png);
		type.set ("assets/images/houseBW.png", AssetType.IMAGE);
		className.set ("assets/images/lightswitch_V1.png", __ASSET__assets_images_lightswitch_v1_png);
		type.set ("assets/images/lightswitch_V1.png", AssetType.IMAGE);
		className.set ("assets/images/Oven_V1.png", __ASSET__assets_images_oven_v1_png);
		type.set ("assets/images/Oven_V1.png", AssetType.IMAGE);
		className.set ("assets/images/SCWal_V3.png", __ASSET__assets_images_scwal_v3_png);
		type.set ("assets/images/SCWal_V3.png", AssetType.IMAGE);
		className.set ("assets/images/sink_V1.png", __ASSET__assets_images_sink_v1_png);
		type.set ("assets/images/sink_V1.png", AssetType.IMAGE);
		className.set ("assets/images/TVCouch_V1.png", __ASSET__assets_images_tvcouch_v1_png);
		type.set ("assets/images/TVCouch_V1.png", AssetType.IMAGE);
		className.set ("assets/images/window_V1.png", __ASSET__assets_images_window_v1_png);
		type.set ("assets/images/window_V1.png", AssetType.IMAGE);
		className.set ("assets/music/track1.mp3", __ASSET__assets_music_track1_mp3);
		type.set ("assets/music/track1.mp3", AssetType.MUSIC);
		className.set ("assets/music/track1.txt", __ASSET__assets_music_track1_txt);
		type.set ("assets/music/track1.txt", AssetType.TEXT);
		className.set ("assets/pixelarial.ttf", __ASSET__assets_pixelarial_ttf);
		type.set ("assets/pixelarial.ttf", AssetType.FONT);
		className.set ("assets/sounds/cursor_error.mp3", __ASSET__assets_sounds_cursor_error_mp3);
		type.set ("assets/sounds/cursor_error.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/cursor_high.mp3", __ASSET__assets_sounds_cursor_high_mp3);
		type.set ("assets/sounds/cursor_high.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/cursor_low.mp3", __ASSET__assets_sounds_cursor_low_mp3);
		type.set ("assets/sounds/cursor_low.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/cursor_tick.mp3", __ASSET__assets_sounds_cursor_tick_mp3);
		type.set ("assets/sounds/cursor_tick.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fx1.mp3", __ASSET__assets_sounds_fx1_mp3);
		type.set ("assets/sounds/fx1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fx2.mp3", __ASSET__assets_sounds_fx2_mp3);
		type.set ("assets/sounds/fx2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fx3.mp3", __ASSET__assets_sounds_fx3_mp3);
		type.set ("assets/sounds/fx3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fx4.mp3", __ASSET__assets_sounds_fx4_mp3);
		type.set ("assets/sounds/fx4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/short1.mp3", __ASSET__assets_sounds_short1_mp3);
		type.set ("assets/sounds/short1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/short2.mp3", __ASSET__assets_sounds_short2_mp3);
		type.set ("assets/sounds/short2.mp3", AssetType.MUSIC);
		className.set ("assets/stripe_01.png", __ASSET__assets_stripe_01_png);
		type.set ("assets/stripe_01.png", AssetType.IMAGE);
		className.set ("assets/tiny.ttf", __ASSET__assets_tiny_ttf);
		type.set ("assets/tiny.ttf", AssetType.FONT);
		className.set ("assets/music/track1.mp3", __ASSET__assets_music_track2);
		type.set ("assets/music/track1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/cursor_error.mp3", __ASSET__assets_sounds_cursor_error_mp4);
		type.set ("assets/sounds/cursor_error.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/cursor_high.mp3", __ASSET__assets_sounds_cursor_high_mp4);
		type.set ("assets/sounds/cursor_high.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/cursor_low.mp3", __ASSET__assets_sounds_cursor_low_mp4);
		type.set ("assets/sounds/cursor_low.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/cursor_tick.mp3", __ASSET__assets_sounds_cursor_tick_mp4);
		type.set ("assets/sounds/cursor_tick.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fx1.mp3", __ASSET__assets_sounds_fx2);
		type.set ("assets/sounds/fx1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fx2.mp3", __ASSET__assets_sounds_fx3);
		type.set ("assets/sounds/fx2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fx3.mp3", __ASSET__assets_sounds_fx4);
		type.set ("assets/sounds/fx3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fx4.mp3", __ASSET__assets_sounds_fx5);
		type.set ("assets/sounds/fx4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/short1.mp3", __ASSET__assets_sounds_short2);
		type.set ("assets/sounds/short1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/short2.mp3", __ASSET__assets_sounds_short3);
		type.set ("assets/sounds/short2.mp3", AssetType.MUSIC);
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		className.set ("assets/hud_icons.png", __ASSET__assets_hud_icons_png);
		type.set ("assets/hud_icons.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/amstrad.ttf";
		className.set (id, __ASSET__assets_amstrad_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/bg01.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/bg02.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/bg03.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/bird_anim.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/oldparams.json";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/params.json";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/DJLOGO.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/HAXELOGO.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Bathroom_V1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Bedroom.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/Bed_V1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ClassroomASSETS.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/ClassroomTest1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ClassroomV1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/DeskAnim_V1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/houseBW.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/lightswitch_V1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Oven_V1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SCWal_V3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sink_V1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TVCouch_V1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/window_V1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/track1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/track1.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/pixelarial.ttf";
		className.set (id, __ASSET__assets_pixelarial_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/sounds/cursor_error.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/cursor_high.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/cursor_low.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/cursor_tick.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fx1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fx2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fx3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fx4.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/short1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/short2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/stripe_01.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/tiny.ttf";
		className.set (id, __ASSET__assets_tiny_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/music/track1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/cursor_error.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/cursor_high.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/cursor_low.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/cursor_tick.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fx1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fx2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fx3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fx4.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/short1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/short2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/hud_icons.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/amstrad.ttf", __ASSET__assets_amstrad_ttf);
		type.set ("assets/amstrad.ttf", AssetType.FONT);
		
		className.set ("assets/bg01.png", __ASSET__assets_bg01_png);
		type.set ("assets/bg01.png", AssetType.IMAGE);
		
		className.set ("assets/bg02.png", __ASSET__assets_bg02_png);
		type.set ("assets/bg02.png", AssetType.IMAGE);
		
		className.set ("assets/bg03.png", __ASSET__assets_bg03_png);
		type.set ("assets/bg03.png", AssetType.IMAGE);
		
		className.set ("assets/bird_anim.png", __ASSET__assets_bird_anim_png);
		type.set ("assets/bird_anim.png", AssetType.IMAGE);
		
		className.set ("assets/data/oldparams.json", __ASSET__assets_data_oldparams_json);
		type.set ("assets/data/oldparams.json", AssetType.TEXT);
		
		className.set ("assets/data/params.json", __ASSET__assets_data_params_json);
		type.set ("assets/data/params.json", AssetType.TEXT);
		
		className.set ("assets/DJLOGO.png", __ASSET__assets_djlogo_png);
		type.set ("assets/DJLOGO.png", AssetType.IMAGE);
		
		className.set ("assets/HAXELOGO.png", __ASSET__assets_haxelogo_png);
		type.set ("assets/HAXELOGO.png", AssetType.IMAGE);
		
		className.set ("assets/images/Bathroom_V1.png", __ASSET__assets_images_bathroom_v1_png);
		type.set ("assets/images/Bathroom_V1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Bedroom.ase", __ASSET__assets_images_bedroom_ase);
		type.set ("assets/images/Bedroom.ase", AssetType.BINARY);
		
		className.set ("assets/images/Bed_V1.png", __ASSET__assets_images_bed_v1_png);
		type.set ("assets/images/Bed_V1.png", AssetType.IMAGE);
		
		className.set ("assets/images/ClassroomASSETS.ase", __ASSET__assets_images_classroomassets_ase);
		type.set ("assets/images/ClassroomASSETS.ase", AssetType.BINARY);
		
		className.set ("assets/images/ClassroomTest1.png", __ASSET__assets_images_classroomtest1_png);
		type.set ("assets/images/ClassroomTest1.png", AssetType.IMAGE);
		
		className.set ("assets/images/ClassroomV1.png", __ASSET__assets_images_classroomv1_png);
		type.set ("assets/images/ClassroomV1.png", AssetType.IMAGE);
		
		className.set ("assets/images/DeskAnim_V1.png", __ASSET__assets_images_deskanim_v1_png);
		type.set ("assets/images/DeskAnim_V1.png", AssetType.IMAGE);
		
		className.set ("assets/images/houseBW.png", __ASSET__assets_images_housebw_png);
		type.set ("assets/images/houseBW.png", AssetType.IMAGE);
		
		className.set ("assets/images/lightswitch_V1.png", __ASSET__assets_images_lightswitch_v1_png);
		type.set ("assets/images/lightswitch_V1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Oven_V1.png", __ASSET__assets_images_oven_v1_png);
		type.set ("assets/images/Oven_V1.png", AssetType.IMAGE);
		
		className.set ("assets/images/SCWal_V3.png", __ASSET__assets_images_scwal_v3_png);
		type.set ("assets/images/SCWal_V3.png", AssetType.IMAGE);
		
		className.set ("assets/images/sink_V1.png", __ASSET__assets_images_sink_v1_png);
		type.set ("assets/images/sink_V1.png", AssetType.IMAGE);
		
		className.set ("assets/images/TVCouch_V1.png", __ASSET__assets_images_tvcouch_v1_png);
		type.set ("assets/images/TVCouch_V1.png", AssetType.IMAGE);
		
		className.set ("assets/images/window_V1.png", __ASSET__assets_images_window_v1_png);
		type.set ("assets/images/window_V1.png", AssetType.IMAGE);
		
		className.set ("assets/music/track1.mp3", __ASSET__assets_music_track1_mp3);
		type.set ("assets/music/track1.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/track1.txt", __ASSET__assets_music_track1_txt);
		type.set ("assets/music/track1.txt", AssetType.TEXT);
		
		className.set ("assets/pixelarial.ttf", __ASSET__assets_pixelarial_ttf);
		type.set ("assets/pixelarial.ttf", AssetType.FONT);
		
		className.set ("assets/sounds/cursor_error.mp3", __ASSET__assets_sounds_cursor_error_mp3);
		type.set ("assets/sounds/cursor_error.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/cursor_high.mp3", __ASSET__assets_sounds_cursor_high_mp3);
		type.set ("assets/sounds/cursor_high.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/cursor_low.mp3", __ASSET__assets_sounds_cursor_low_mp3);
		type.set ("assets/sounds/cursor_low.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/cursor_tick.mp3", __ASSET__assets_sounds_cursor_tick_mp3);
		type.set ("assets/sounds/cursor_tick.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fx1.mp3", __ASSET__assets_sounds_fx1_mp3);
		type.set ("assets/sounds/fx1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fx2.mp3", __ASSET__assets_sounds_fx2_mp3);
		type.set ("assets/sounds/fx2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fx3.mp3", __ASSET__assets_sounds_fx3_mp3);
		type.set ("assets/sounds/fx3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fx4.mp3", __ASSET__assets_sounds_fx4_mp3);
		type.set ("assets/sounds/fx4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/short1.mp3", __ASSET__assets_sounds_short1_mp3);
		type.set ("assets/sounds/short1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/short2.mp3", __ASSET__assets_sounds_short2_mp3);
		type.set ("assets/sounds/short2.mp3", AssetType.MUSIC);
		
		className.set ("assets/stripe_01.png", __ASSET__assets_stripe_01_png);
		type.set ("assets/stripe_01.png", AssetType.IMAGE);
		
		className.set ("assets/tiny.ttf", __ASSET__assets_tiny_ttf);
		type.set ("assets/tiny.ttf", AssetType.FONT);
		
		className.set ("assets/music/track1.mp3", __ASSET__assets_music_track2);
		type.set ("assets/music/track1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/cursor_error.mp3", __ASSET__assets_sounds_cursor_error_mp4);
		type.set ("assets/sounds/cursor_error.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/cursor_high.mp3", __ASSET__assets_sounds_cursor_high_mp4);
		type.set ("assets/sounds/cursor_high.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/cursor_low.mp3", __ASSET__assets_sounds_cursor_low_mp4);
		type.set ("assets/sounds/cursor_low.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/cursor_tick.mp3", __ASSET__assets_sounds_cursor_tick_mp4);
		type.set ("assets/sounds/cursor_tick.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fx1.mp3", __ASSET__assets_sounds_fx2);
		type.set ("assets/sounds/fx1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fx2.mp3", __ASSET__assets_sounds_fx3);
		type.set ("assets/sounds/fx2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fx3.mp3", __ASSET__assets_sounds_fx4);
		type.set ("assets/sounds/fx3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fx4.mp3", __ASSET__assets_sounds_fx5);
		type.set ("assets/sounds/fx4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/short1.mp3", __ASSET__assets_sounds_short2);
		type.set ("assets/sounds/short1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/short2.mp3", __ASSET__assets_sounds_short3);
		type.set ("assets/sounds/short2.mp3", AssetType.MUSIC);
		
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		className.set ("assets/hud_icons.png", __ASSET__assets_hud_icons_png);
		type.set ("assets/hud_icons.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_amstrad_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_bg01_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bg02_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bg03_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_bird_anim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_oldparams_json extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_params_json extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_djlogo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_haxelogo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bathroom_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bedroom_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_bed_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_classroomassets_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_classroomtest1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_classroomv1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_deskanim_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_housebw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lightswitch_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_oven_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_scwal_v3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sink_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tvcouch_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_window_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_track1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_track1_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_pixelarial_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cursor_error_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cursor_high_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cursor_low_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cursor_tick_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fx1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fx2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fx3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fx4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_short1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_short2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_stripe_01_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_tiny_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_music_track2 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cursor_error_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cursor_high_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cursor_low_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_cursor_tick_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fx2 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fx3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fx4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fx5 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_short2 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_short3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_hud_icons_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5

@:keep #if display private #end class __ASSET__assets_amstrad_ttf extends lime.text.Font { public function new () { super (); name = "Amstrad CPC464 Regular"; } } 
























@:keep #if display private #end class __ASSET__assets_pixelarial_ttf extends lime.text.Font { public function new () { super (); name = "Pixel Arial 11"; } } 











@:keep #if display private #end class __ASSET__assets_tiny_ttf extends lime.text.Font { public function new () { super (); name = "Tiny Pixy"; } } 













@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 





#else



#if (windows || mac || linux || cpp)


@:font("assets/amstrad.ttf") #if display private #end class __ASSET__assets_amstrad_ttf extends lime.text.Font {}
@:image("assets/bg01.png") #if display private #end class __ASSET__assets_bg01_png extends lime.graphics.Image {}
@:image("assets/bg02.png") #if display private #end class __ASSET__assets_bg02_png extends lime.graphics.Image {}
@:image("assets/bg03.png") #if display private #end class __ASSET__assets_bg03_png extends lime.graphics.Image {}
@:image("assets/bird_anim.png") #if display private #end class __ASSET__assets_bird_anim_png extends lime.graphics.Image {}
@:file("assets/data/oldparams.json") #if display private #end class __ASSET__assets_data_oldparams_json extends lime.utils.Bytes {}
@:file("assets/data/params.json") #if display private #end class __ASSET__assets_data_params_json extends lime.utils.Bytes {}
@:image("assets/DJLOGO.png") #if display private #end class __ASSET__assets_djlogo_png extends lime.graphics.Image {}
@:image("assets/HAXELOGO.png") #if display private #end class __ASSET__assets_haxelogo_png extends lime.graphics.Image {}
@:image("assets/images/Bathroom_V1.png") #if display private #end class __ASSET__assets_images_bathroom_v1_png extends lime.graphics.Image {}
@:file("assets/images/Bedroom.ase") #if display private #end class __ASSET__assets_images_bedroom_ase extends lime.utils.Bytes {}
@:image("assets/images/Bed_V1.png") #if display private #end class __ASSET__assets_images_bed_v1_png extends lime.graphics.Image {}
@:file("assets/images/ClassroomASSETS.ase") #if display private #end class __ASSET__assets_images_classroomassets_ase extends lime.utils.Bytes {}
@:image("assets/images/ClassroomTest1.png") #if display private #end class __ASSET__assets_images_classroomtest1_png extends lime.graphics.Image {}
@:image("assets/images/ClassroomV1.png") #if display private #end class __ASSET__assets_images_classroomv1_png extends lime.graphics.Image {}
@:image("assets/images/DeskAnim_V1.png") #if display private #end class __ASSET__assets_images_deskanim_v1_png extends lime.graphics.Image {}
@:image("assets/images/houseBW.png") #if display private #end class __ASSET__assets_images_housebw_png extends lime.graphics.Image {}
@:image("assets/images/lightswitch_V1.png") #if display private #end class __ASSET__assets_images_lightswitch_v1_png extends lime.graphics.Image {}
@:image("assets/images/Oven_V1.png") #if display private #end class __ASSET__assets_images_oven_v1_png extends lime.graphics.Image {}
@:image("assets/images/SCWal_V3.png") #if display private #end class __ASSET__assets_images_scwal_v3_png extends lime.graphics.Image {}
@:image("assets/images/sink_V1.png") #if display private #end class __ASSET__assets_images_sink_v1_png extends lime.graphics.Image {}
@:image("assets/images/TVCouch_V1.png") #if display private #end class __ASSET__assets_images_tvcouch_v1_png extends lime.graphics.Image {}
@:image("assets/images/window_V1.png") #if display private #end class __ASSET__assets_images_window_v1_png extends lime.graphics.Image {}
@:file("assets/music/track1.mp3") #if display private #end class __ASSET__assets_music_track1_mp3 extends lime.utils.Bytes {}
@:file("assets/music/track1.txt") #if display private #end class __ASSET__assets_music_track1_txt extends lime.utils.Bytes {}
@:font("assets/pixelarial.ttf") #if display private #end class __ASSET__assets_pixelarial_ttf extends lime.text.Font {}
@:file("assets/sounds/cursor_error.mp3") #if display private #end class __ASSET__assets_sounds_cursor_error_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/cursor_high.mp3") #if display private #end class __ASSET__assets_sounds_cursor_high_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/cursor_low.mp3") #if display private #end class __ASSET__assets_sounds_cursor_low_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/cursor_tick.mp3") #if display private #end class __ASSET__assets_sounds_cursor_tick_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/fx1.mp3") #if display private #end class __ASSET__assets_sounds_fx1_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/fx2.mp3") #if display private #end class __ASSET__assets_sounds_fx2_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/fx3.mp3") #if display private #end class __ASSET__assets_sounds_fx3_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/fx4.mp3") #if display private #end class __ASSET__assets_sounds_fx4_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/short1.mp3") #if display private #end class __ASSET__assets_sounds_short1_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/short2.mp3") #if display private #end class __ASSET__assets_sounds_short2_mp3 extends lime.utils.Bytes {}
@:image("assets/stripe_01.png") #if display private #end class __ASSET__assets_stripe_01_png extends lime.graphics.Image {}
@:font("assets/tiny.ttf") #if display private #end class __ASSET__assets_tiny_ttf extends lime.text.Font {}
@:file("assets/music/track1.mp3") #if display private #end class __ASSET__assets_music_track2 extends lime.utils.Bytes {}
@:file("assets/sounds/cursor_error.mp3") #if display private #end class __ASSET__assets_sounds_cursor_error_mp4 extends lime.utils.Bytes {}
@:file("assets/sounds/cursor_high.mp3") #if display private #end class __ASSET__assets_sounds_cursor_high_mp4 extends lime.utils.Bytes {}
@:file("assets/sounds/cursor_low.mp3") #if display private #end class __ASSET__assets_sounds_cursor_low_mp4 extends lime.utils.Bytes {}
@:file("assets/sounds/cursor_tick.mp3") #if display private #end class __ASSET__assets_sounds_cursor_tick_mp4 extends lime.utils.Bytes {}
@:file("assets/sounds/fx1.mp3") #if display private #end class __ASSET__assets_sounds_fx2 extends lime.utils.Bytes {}
@:file("assets/sounds/fx2.mp3") #if display private #end class __ASSET__assets_sounds_fx3 extends lime.utils.Bytes {}
@:file("assets/sounds/fx3.mp3") #if display private #end class __ASSET__assets_sounds_fx4 extends lime.utils.Bytes {}
@:file("assets/sounds/fx4.mp3") #if display private #end class __ASSET__assets_sounds_fx5 extends lime.utils.Bytes {}
@:file("assets/sounds/short1.mp3") #if display private #end class __ASSET__assets_sounds_short2 extends lime.utils.Bytes {}
@:file("assets/sounds/short2.mp3") #if display private #end class __ASSET__assets_sounds_short3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/djFlixel/git/source/assets/hud_icons.png") #if display private #end class __ASSET__assets_hud_icons_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_amstrad_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_amstrad_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_pixelarial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_pixelarial_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_tiny_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_tiny_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end