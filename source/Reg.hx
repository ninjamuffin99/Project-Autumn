package;

import flixel.FlxG;
import flixel.util.FlxSave;
import djFlixel.tool.DynAssets;
import djFlixel.gapi.ApiEmpty;
import djFlixel.SAVE;
import djFlixel.Controls;
import djFlixel.SND;


/*
 * Default REG class
 * --------------
 * You should copy-paste this file to your new Project and use this as a template.
 * Expand the functions as you like
 */

class Reg
{
	inline static public var PARAMS_FILE:String = "data/params.json";

		
	// -  These vars are loaded externally from the JSON parameters file ::
	//    If the parameter is not present on the ext file, then defaults will be used.
	public static var VERSION:String = "0.1";
	public static var NAME:String = "HaxeFlixel app";
	public static var FULLSCREEN:Bool = false;
	public static var VOLUME:Float = 0.6;
	// Currently Antialiasing on/off, comes with a setter that applies to all cameras
	public static var ANTIALIASING(default, set):Bool = true;
	
	// ------- 
	// Store the json parameters loaded from the file
	public static var JSON:Dynamic;
	// -- APIS 
	#if GAMEJOLT
		// Extend the ApiGameJoltGeneric and set it to api
		// public static var api:ApiGameJolt = new ApiGameJolt();
	#elseif KONG
		// Extend the ApiKongregateGeneric and set it to api
		// public static var api:ApiKongregate = new ApiKongregate();
	#elseif NEWGROUNDS
		// public static var api:ApiNewgrounds = new ApiNewgrounds();
	#else
		public static var api:ApiEmpty = new ApiEmpty();
	#end
	
	//====================================================;
	// FUNCTIONS
	//====================================================;
	//--
	// Do a once per program run, initialization.
	// Auto called right after the FlxGame is ready 
	// and before any state is created.
	public static function initOnce()
	{
		trace("Info: Initializing REG --");		
		// --
		JSON = DynAssets.json.get(PARAMS_FILE);	// *Create a pointer for quicker access
		#if debug
		if (JSON == null) {
			trace("Error: JSON Error, check $PARAMS_FILE");
			throw "Error: JSON Error, check $PARAMS_FILE";
		}
		#end
		
		applyParamsInto("reg", Reg); // Works with static objects as well.
		
		// Add some triggers
		FlxG.signals.stateSwitched.add(onStateSwitch);
		
		FlxG.sound.volume = VOLUME;
		FlxG.fullscreen = FULLSCREEN;
		FlxG.mouse.useSystemCursor = true;
		
		#if debug
			FlxG.autoPause = false;
		#else
			FlxG.autoPause = true;
		#end

		// Load the sounds.
		SND.init();
		loadSounds();
		
		
		FlxG.log.redirectTraces = true;
		// Init the controls
		Controls.init();
		
		
		// Enable Saving
		// SAVE.init("Game_Unique_Name");
		
	}//---------------------------------------------------;
	
	
	// --
	// # USER CODE
	static function loadSounds()
	{
		/* LOAD SOUNDS HERE
		 * ----------------
		 All sounds must be placed in the assets/sounds directory
		 You can load a sound by calling it's filename without the extension, like this:
			SND.as("cursor");
		 
		 You can then playback a sound by calling
			Snd.play("cursor");
		*/
			
		/*
		 * Or auto-load sounds from the params file:
		 */
		if (JSON.sounds == null) return;
		
		for (field in Reflect.fields(JSON.sounds)) {
			trace('- Loading Sound with ID-$field, FILE -' + Reflect.field(JSON.sounds, field));
			SND.as(Reflect.field(JSON.sounds, field), field);
		}
		
	}//---------------------------------------------------;
	
	// --
	// Gets called after every state switch.
	static function onStateSwitch()
	{
		// Force the cameras to use the default AA (with setter)
		Reg.ANTIALIASING = Reg.ANTIALIASING;		
		// # USER CODE
	}//---------------------------------------------------;
	
	// --
	// Quick way to alter the Antialiasing of all cameras
	static function set_ANTIALIASING(value:Bool):Bool
	{
		ANTIALIASING = value;
		
		for (i in FlxG.cameras.list)
		{
			i.antialiasing = ANTIALIASING;
		}
	
		return value;
	}//---------------------------------------------------;
	
	// --
	// Apply all the variables from a json node into an object
	// WARNING: FIELDS MUST HAVE THE SAME NAME!!
	// e.g. json.player.speed ==> player.speed
	public static function applyParamsInto(node:String, Object:Dynamic)
	{
		var jsonNode = Reflect.getProperty(JSON, node);
		
		for (field in Reflect.fields(jsonNode)) {
			Reflect.setField(Object, field, Reflect.field(jsonNode, field));
		}
	}//---------------------------------------------------;
	
	// Apply a dynamic's object fields into another field
	public static function applyFieldsInto(node:Dynamic, into:Dynamic)
	{
		for (field in Reflect.fields(node)) {
			Reflect.setField(into, field, Reflect.field(node, field));
		}
	}//---------------------------------------------------;
	#if debug
	// -- Call this on main update() to reload settings and reset the game
	public static function OnKeyReloadParamsAndGame()
	{
		if (FlxG.keys.justPressed.F12)
		{
			trace("Re-loading external parameters file ---");
			DynAssets.loadFiles(function() {
					JSON = DynAssets.json.get(Reg.PARAMS_FILE);
					FlxG.resetState();
			});
		}
	}//---------------------------------------------------;
	#end
}//--