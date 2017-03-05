package;


import haxe.Resource;
import haxe.Timer;
import haxe.Unserializer;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.AssetType;
import lime.utils.Bytes;
import lime.utils.Log;

#if sys
import haxe.io.Path;
import sys.FileSystem;
#end


@:keep @:dox(hide) class DefaultAssetLibrary extends AssetLibrary {
	
	
	private var lastModified:Float;
	private var rootPath:String;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			
			rootPath = Reflect.field (ApplicationMain.config, "assetsPrefix");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos)
			rootPath = "assets/";
			#elseif (windows && !cs)
			rootPath = FileSystem.absolutePath (Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end
		
		var useManifest = #if html5 true #else false #end;
		var id;
		id = "assets/images/Bathroom_V1.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_bathroom_v1_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/Bed_V1.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_bed_v1_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/DeskAnim_V1.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_deskanim_v1_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/houseBW.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_housebw_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/lightswitch_V1.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_lightswitch_v1_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/Oven_V1.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_oven_v1_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/SCSpritesheetwalk.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_scspritesheetwalk_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/SCWal_V2.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_scwal_v2_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/SCWal_V3.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_scwal_v3_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/sink_V1.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_sink_v1_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/TVCouch_V1.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_tvcouch_v1_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/images/window_V1.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_images_window_v1_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "assets/music/IAMRF.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_music_iamrf_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "assets/sounds/hotsizzling.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_sounds_hotsizzling_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "assets/sounds/mouse.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_sounds_mouse_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "assets/sounds/pc.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_sounds_pc_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "assets/sounds/shower.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_sounds_shower_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "assets/sounds/sink.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_sounds_sink_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "assets/sounds/switchoff.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_sounds_switchoff_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "assets/sounds/switchon.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_sounds_switchon_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "assets/sounds/Tom07 Drums1DOTcom.wav";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_sounds_tom07_drums1dotcom_wav);
		types.set (id, AssetType.SOUND);
		#end
		id = "assets/sounds/typing.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__assets_sounds_typing_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "flixel/sounds/beep.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__flixel_sounds_beep_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "flixel/sounds/flixel.mp3";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__flixel_sounds_flixel_mp3);
		types.set (id, AssetType.MUSIC);
		#end
		id = "flixel/fonts/nokiafc22.ttf";
		classTypes.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		types.set (id, AssetType.FONT);
		#if html5
		preload.set (id, true);
		#end id = "flixel/fonts/monsterrat.ttf";
		classTypes.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		types.set (id, AssetType.FONT);
		#if html5
		preload.set (id, true);
		#end id = "flixel/images/ui/button.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__flixel_images_ui_button_png);
		types.set (id, AssetType.IMAGE);
		#end
		id = "flixel/images/logo/default.png";
		#if html5
		preload.set (id, true);
		#elseif (desktop || cpp || flash)
		classTypes.set (id, __ASSET__flixel_images_logo_default_png);
		types.set (id, AssetType.IMAGE);
		#end
		
		
		if (useManifest) {
			
			loadManifest ();
			
			#if sys
			if (false && Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath (rootPath + "manifest");
				
				if (FileSystem.exists (path)) {
					
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
			#end
			
		}
		
	}
	
	
	private function loadManifest ():Void {
		
		var bytes = Resource.getBytes ("__ASSET_MANIFEST__");
		var manifest;
		
		if (bytes != null) {
			
			var manifest = AssetManifest.fromBytes (bytes);
			manifest.basePath = rootPath;
			__fromManifest (manifest);
			
		} else {
			
			// TODO: Make asynchronous
			
			var manifest = AssetManifest.fromFile (rootPath + "manifest");
			
			if (manifest != null) {
				
				manifest.basePath = rootPath;
				__fromManifest (manifest);
				
			} else {
				
				Log.warn ("Could not load asset manifest (bytes was null)");
				
			}
			
			//AssetManifest.loadFromFile (rootPath + "manifest").onComplete (function (manifest:AssetManifest) {
				//
				//if (manifest != null) {
					//
					//__fromManifest (manifest);
					//
				//} else {
					//
					//Log.warn ("Could not load asset manifest (bytes was null)");
					//
				//}
				//
				//__fromManifest (manifest);
				//
			//}).onError (function (e:Dynamic) {
				//
				//Log.warn ('Could not load asset manifest (${e})');
				//
			//});
			
		}
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_images_bathroom_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bed_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_deskanim_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_housebw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lightswitch_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_oven_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_scspritesheetwalk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_scwal_v2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_scwal_v3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sink_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tvcouch_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_window_v1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_iamrf_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hotsizzling_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mouse_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pc_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_shower_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sink_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_switchoff_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_switchon_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tom07_drums1dotcom_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_typing_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif (desktop || cpp)

@:image("assets/images/Bathroom_V1.png") #if display private #end class __ASSET__assets_images_bathroom_v1_png extends lime.graphics.Image {}
@:image("assets/images/Bed_V1.png") #if display private #end class __ASSET__assets_images_bed_v1_png extends lime.graphics.Image {}
@:image("assets/images/DeskAnim_V1.png") #if display private #end class __ASSET__assets_images_deskanim_v1_png extends lime.graphics.Image {}
@:image("assets/images/houseBW.png") #if display private #end class __ASSET__assets_images_housebw_png extends lime.graphics.Image {}
@:image("assets/images/lightswitch_V1.png") #if display private #end class __ASSET__assets_images_lightswitch_v1_png extends lime.graphics.Image {}
@:image("assets/images/Oven_V1.png") #if display private #end class __ASSET__assets_images_oven_v1_png extends lime.graphics.Image {}
@:image("assets/images/SCSpritesheetwalk.png") #if display private #end class __ASSET__assets_images_scspritesheetwalk_png extends lime.graphics.Image {}
@:image("assets/images/SCWal_V2.png") #if display private #end class __ASSET__assets_images_scwal_v2_png extends lime.graphics.Image {}
@:image("assets/images/SCWal_V3.png") #if display private #end class __ASSET__assets_images_scwal_v3_png extends lime.graphics.Image {}
@:image("assets/images/sink_V1.png") #if display private #end class __ASSET__assets_images_sink_v1_png extends lime.graphics.Image {}
@:image("assets/images/TVCouch_V1.png") #if display private #end class __ASSET__assets_images_tvcouch_v1_png extends lime.graphics.Image {}
@:image("assets/images/window_V1.png") #if display private #end class __ASSET__assets_images_window_v1_png extends lime.graphics.Image {}
@:file("assets/music/IAMRF.mp3") #if display private #end class __ASSET__assets_music_iamrf_mp3 extends haxe.io.Bytes {}
@:file("assets/sounds/hotsizzling.mp3") #if display private #end class __ASSET__assets_sounds_hotsizzling_mp3 extends haxe.io.Bytes {}
@:file("assets/sounds/mouse.mp3") #if display private #end class __ASSET__assets_sounds_mouse_mp3 extends haxe.io.Bytes {}
@:file("assets/sounds/pc.mp3") #if display private #end class __ASSET__assets_sounds_pc_mp3 extends haxe.io.Bytes {}
@:file("assets/sounds/shower.mp3") #if display private #end class __ASSET__assets_sounds_shower_mp3 extends haxe.io.Bytes {}
@:file("assets/sounds/sink.mp3") #if display private #end class __ASSET__assets_sounds_sink_mp3 extends haxe.io.Bytes {}
@:file("assets/sounds/switchoff.mp3") #if display private #end class __ASSET__assets_sounds_switchoff_mp3 extends haxe.io.Bytes {}
@:file("assets/sounds/switchon.mp3") #if display private #end class __ASSET__assets_sounds_switchon_mp3 extends haxe.io.Bytes {}
@:file("assets/sounds/Tom07 Drums1DOTcom.wav") #if display private #end class __ASSET__assets_sounds_tom07_drums1dotcom_wav extends haxe.io.Bytes {}
@:file("assets/sounds/typing.mp3") #if display private #end class __ASSET__assets_sounds_typing_mp3 extends haxe.io.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}




#else

@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}


#end
#end