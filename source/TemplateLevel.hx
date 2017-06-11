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
		var lerp:Float = 0.075;
		
		FlxG.camera.follow(_player, LOCKON, lerp);
		FlxG.camera.setScrollBoundsRect(0, 0, 500, 90);
		
		super.create();
	}
	
}