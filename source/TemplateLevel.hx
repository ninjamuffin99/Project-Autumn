package;

import flixel.FlxG;
import flixel.FlxState;

/**
 * ...
 * @author ninjaMuffin
 */
class TemplateLevel extends FlxState 
{
	public var _player:Player;
	
	override public function create():Void 
	{
		FlxG.camera.follow(_player, LOCKON, 2);
		FlxG.camera.setScrollBoundsRect(0, 0, 500, 90);
		
		super.create();
	}
	
}