package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	public var _player:Player;
	public var desk:FlxSprite = new FlxSprite(375, 29);
	public var bathroom:FlxSprite = new FlxSprite(9, 8);
	public var tele:FlxSprite = new FlxSprite(281, 36);
	public var bed:FlxSprite = new FlxSprite(129, 50);
	public var oven:FlxSprite = new FlxSprite(549, 30);
	public var sink:FlxSprite = new FlxSprite(69, 24);
	
	public var lightswitch:FlxSprite = new FlxSprite(259, 48);
	
	private var working:Bool;
	private var shower:Bool;
	private var sleeping:Bool;
	private var lightson:Bool;
	private var watching:Bool;
	private var cooking:Bool;
	private var cleaningup:Bool;
	
	private var showerTimer:Float = 7.5;
	private var computerTimer:Float = 7.5;
	
	
	override public function create():Void
	{
		FlxG.worldBounds.set(0, 0, 650, 90);
		
		var map:FlxSprite = new FlxSprite(0, 0);
		map.loadGraphic("assets/images/houseBW.png", false, 650, 90);
		add(map);
		
		tele.loadGraphic("assets/images/TVCouch_V1.png", true, 84, 43);
		tele.animation.add("off", [0]);
		tele.animation.add("watching", [1, 2], 8, true);
		tele.animation.play("off");
		tele.width = 75;
		add(tele);
		
		bed.loadGraphic("assets/images/Bed_V1.png", true, 53, 29);
		bed.animation.add("idle", [0]);
		bed.animation.add("sleep", [1, 5, 2, 3, 4], 6, true);
		bed.animation.play("sleep");
		bed.width = 42;
		bed.offset.x = 11;
		add(bed);
		
		//pc window
		var window1:FlxSprite = new FlxSprite(305, 24);
		window1.loadGraphic("assets/images/window_V1.png", true, 38, 30); 
		window1.animation.add("rain", [0, 1, 2], 12, true);
		window1.animation.play("rain");
		add(window1);
		
		//tv window
		var window2:FlxSprite = new FlxSprite(435, 24);
		window2.loadGraphic("assets/images/window_V1.png", true, 38, 30); 
		window2.animation.add("rain", [0, 1, 2], 12, true);
		window2.animation.play("rain");
		add(window2);
		
		//bedroom window
		var window3:FlxSprite = new FlxSprite(140, 23);
		window3.loadGraphic("assets/images/window_V1.png", true, 38, 30); 
		window3.animation.add("rain", [0, 1, 2], 12, true);
		window3.animation.play("rain");
		add(window3);
		
		desk.loadGraphic("assets/images/DeskAnim_V1.png", true, 59, 50);
		desk.animation.add("idle", [0]);
		desk.animation.add("work", [1, 2, 3, 4], 2, true);
		desk.animation.play("idle");
		add(desk);
		
		bathroom.loadGraphic("assets/images/Bathroom_V1.png", true, 77, 72);
		bathroom.animation.add("idle", [0]);
		bathroom.animation.add("steam", [1, 2, 3], 5, true);
		bathroom.animation.play("idle");
		bathroom.width = 40;
		add(bathroom);
		
		sink.loadGraphic("assets/images/sink_V1.png", true, 24, 55);
		sink.animation.add("off", [0]);
		sink.animation.add("on", [1, 2, 3], 3, true);
		sink.animation.play("off");
		sink.width = 12;
		sink.offset.x = 6;
		add(sink);
		
		lightswitch.loadGraphic("assets/images/lightswitch_V1.png", true, 5, 8);
		lightswitch.animation.add("on", [0]);
		lightswitch.animation.add("off", [1]);
		lightswitch.animation.play("off");
		add(lightswitch);
		
		oven.loadGraphic("assets/images/Oven_V1.png", true, 46, 49);
		oven.animation.add("off", [0]);
		oven.animation.add("cooking", [1, 2, 3], 5, true);
		oven.animation.play("off");
		add(oven);
		
		_player = new Player(130, 41);
		_player.visible = false;
		add(_player);
		
		
		//Camera Stuff
		FlxG.camera.follow(_player, LOCKON, 0.8);
		FlxG.camera.setScrollBoundsRect(8, 7, 640, 79);
		FlxG.camera.alpha = 0.35;
		
		
		working = false;
		shower = false;
		sleeping = true;
		lightson = false;
		watching = false;
		cooking = false;
		cleaningup = false;
		
		if (FlxG.sound.music == null) // don't restart the music if it's alredy playing
		{
			#if flash
			FlxG.sound.playMusic("assets/music/IAMRF.mp3", 1, true);
			#else
			FlxG.sound.playMusic("assets/music/IAMRF.ogg", 1, true);
			#end
			
		}
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.ENTER)
            FlxG.fullscreen = !FlxG.fullscreen;
		
		FlxG.overlap(_player, desk, onDeskOverlap);
		FlxG.overlap(_player, bathroom, onBathroom);
		FlxG.overlap(_player, tele, onTV);
		
		
		//Bounds
		if (_player.x <= 8)
		{
			_player.x = 8;
		}
		if (_player.x >= 626)
		{
			_player.x = 626;
		}
		
		if (FlxG.overlap(_player, oven))
		{
			if (FlxG.keys.anyPressed([SPACE, UP, W]))
			{
				if (!cooking)
				{
					#if flash
					FlxG.sound.play("assets/sounds/hotsizzling.mp3", 0.7);
					#else
					FlxG.sound.play("assets/sounds/hotsizzling.ogg", 0.7);
					#end
					
					_player.visible = false;
					oven.animation.play("cooking");
					cooking = true;
				}
			}
			if (cooking)
			{
				_player.x = 550;
			}
		}
		if (FlxG.overlap(_player, sink))
		{
			if (FlxG.keys.anyPressed([SPACE, UP, W]))
			{
				if (!cleaningup)
				{
					#if flash
					FlxG.sound.play("assets/sounds/sink.mp3", 0.7);
					#else
					FlxG.sound.play("assets/sounds/sink.ogg", 0.7);
					#end
					
					_player.visible = false;
					sink.animation.play("on");
					cleaningup = true;
				}
			}
			if (cleaningup)
			{
				_player.x = 60;
			}
		}
		
		if (FlxG.overlap(_player, lightswitch))
		{
			if (FlxG.keys.anyJustPressed([SPACE, UP, W]))
			{
				if (lightson)
				{
					#if flash
					FlxG.sound.play("assets/sounds/switchoff.mp3");
					#else
					FlxG.sound.play("assets/sounds/switchoff.ogg");
					#end
					
					lightswitch.animation.play("off");
					FlxG.camera.alpha = 0.35;
					lightson = false;
				}
				else
				{
					#if flash
					FlxG.sound.play("assets/sounds/switchon.mp3");
					#else
					FlxG.sound.play("assets/sounds/switchon.ogg");
					#end
					lightswitch.animation.play("on");
					FlxG.camera.alpha = 1;
					lightson = true;
				}
			}
		}
		//keepts player in same place
		if (sleeping)
		{
			_player.x = 140;
		}
		
		if (shower)
		{
			showerTimer -= elapsed;
			_player.x = 40;
			if (showerTimer <= 0)
			{
				_player.visible = true;
				bathroom.animation.play("idle");
				shower = false;
				showerTimer = 7.5;
			}
		}
		if (working)
		{
			_player.x = 390;
		}
		if (FlxG.keys.justPressed.ANY)
		{
			if (sleeping)
			{
				_player.x = 140;
				_player.visible = true;
				bed.animation.play("idle");
				sleeping = false;
			}
			if (working)
			{
				_player.x = 390;
				_player.visible = true;
				desk.animation.play("idle");
				working = false;
			}
			if (watching)
			{
				_player.visible = true;
				tele.animation.play("off");
				watching = false;
			}
			if (cooking)
			{
				_player.x = 550;
				_player.visible = true;
				oven.animation.play("off");
				cooking = false;
			}
			if (cleaningup)
			{
				_player.x = 60;
				_player.visible = true;
				sink.animation.play("off");
				cleaningup = false;
			}
		}
		FlxG.overlap(_player, bed, onBed);
	}
	
	private function onDeskOverlap(player:FlxSprite, desk:FlxSprite):Void
	{
		if (FlxG.keys.anyPressed([SPACE, UP, W]))
		{
			if (!working)
			{
				#if flash
				FlxG.sound.play("assets/sounds/pc.mp3", 0.3);
				#else
				FlxG.sound.play("assets/sounds/pc.ogg", 0.3);
				#end
				
				player.visible = false;
				desk.animation.play("work");
				working = true;
			}
		}
	}
	private function onBathroom(player:FlxSprite, bathroom:FlxSprite):Void
	{
		if (FlxG.keys.anyJustPressed([SPACE, UP, W]))
		{	
			player.visible = false;
			bathroom.animation.play("steam");
			#if flash
			FlxG.sound.play("assets/sounds/shower.mp3", 0.1, false);
			#else
			FlxG.sound.play("assets/sounds/shower.ogg", 0.1, false);
			#end
			
			shower = true;
		}
	}
	private function onTV(player:FlxSprite, tele:FlxSprite):Void
	{
		if (FlxG.keys.anyJustPressed([SPACE, UP, W]))
		{	
			if (!watching)
			{
				player.visible = false;
				tele.animation.play("watching");
				watching = true;
			}
		}
	}
	
	private function onBed(player:FlxSprite, bed:FlxSprite):Void
	{
		if (FlxG.keys.anyJustPressed([SPACE, UP, W]) && !sleeping)
		{	
			player.visible = false;
			bed.animation.play("sleep");
			sleeping = true;
		}
	}
}
