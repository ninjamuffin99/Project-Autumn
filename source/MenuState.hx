package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	private var _btnPlay:FlxButton;
	override public function create():Void
	{
		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.screenCenter();
		add(_btnPlay);
		
		if (FlxG.sound.music == null) // don't restart the music if it's alredy playing
		{
			FlxG.sound.playMusic("assets/music/IAMRF.mp3", 1, true);
		}
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	private function clickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
}