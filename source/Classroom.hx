package;
import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class Classroom extends TemplateLevel 
{
	private var _desk:FlxSprite;
	
	
	override public function create():Void 
	{
		var BG:FlxSprite;
		BG = new FlxSprite(0, 0);
		BG.loadGraphic("assets/images/ClassroomV1.png", false, 300, 90);
		add(BG);
		
		_desk = new FlxSprite(40, 56);
		_desk.makeGraphic(26, 20, FlxColor.WHITE);
		_desk.alpha = 0.5;
		add(_desk);
		
		
		_player = new Player(60, 39);
		add(_player);
		
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		_player.interact(_desk, null, true);
		
		super.update(elapsed);
	}
	
}