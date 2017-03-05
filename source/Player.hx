package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author 
 */
class Player extends FlxSprite
{
	public var speed:Float = 60;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		loadGraphic("assets/images/SCWal_V3.png", true, 19, 38);
		animation.add("walk", [2, 3, 4, 5, 0, 1], 15, true);
		animation.add("idle", [1]);
		drag.x = drag.y = 1600;
		
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		movement();
		super.update(elapsed);
	}
	
	private function movement():Void
	{
		var _left:Bool = false;
		var _right:Bool = false;
		
		_left = FlxG.keys.anyPressed([LEFT, A]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);
		
		if (_left && _right)
			_left = _right = false;
			
		if (_left)
		{
			velocity.x = -speed;
			facing = FlxObject.LEFT;
		}
		if (_right)
		{
			velocity.x = speed;
			facing = FlxObject.RIGHT;
		}
		if (velocity.x == 0)
		{
			animation.play("idle");
			
		}
		
		if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
		{
			switch (facing)
			{
				case FlxObject.LEFT, FlxObject.RIGHT :
					animation.play("walk");
			}
		}
	}
}