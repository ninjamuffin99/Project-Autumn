package;

import djFlixel.tool.DynAssets;
import djFlixel.MainTemplate;
import flash.Lib;

class Main extends MainTemplate
{
	public function new()
	{
		// MainTemplate.framerate = 60; // Optional set custom framerate
		DynAssets.FILE_LOAD_LIST = [Reg.PARAMS_FILE];
		super(PlayState);
	}//---------------------------------------------------;
	// --
	public static function main():Void
	{	
		Lib.current.addChild(new Main());
	}//---------------------------------------------------;
}// --