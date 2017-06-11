package;
import flixel.FlxSprite;

/**
 * ...
 * @author ninjaMuffin
 */
class Classroom extends TemplateLevel 
{

	override public function create():Void 
	{
		var BG:FlxSprite;
		BG = new FlxSprite(0, 0);
		BG.loadGraphic("assets/images/ClassroomV1.png", false, 300, 90);
		add(BG);
		
		
		_player = new Player(60, 39);
		add(_player);
		
		
		super.create();
	}
	
}