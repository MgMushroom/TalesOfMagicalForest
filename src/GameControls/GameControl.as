package GameControls 
{
	import assets.Assets;
	//import starling.display.Sprite;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import objects.Hero;
	//import flash.events.KeyboardEvent;
	import starling.events.EnterFrameEvent;
	import flash.events.EventDispatcher;
	import starling.events.KeyboardEvent;
	
	public class GameControl extends Sprite 
	{
		private var heroArt:Image;
		//private var hero:Hero;
		private var aDown:Boolean;
		private var dDown:Boolean;
		
		public function GameControl() 
		{
			super();
			//checkStuff();
			this.addEventListener(Event.ENTER_FRAME, checkStuff);
			/*stage.addEventListener(KeyboardEvent.KEY_DOWN, keysDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keysUp);*/
		
			heroArt = new Image(Assets.getTexture("MagicHero"));
			heroArt.x = 25
			heroArt.y = 300
			this.addChild(heroArt);
			trace("5");
			
			
			
			
		}
		public function checkStuff(e:Event):void 
		//if true move hero.x ( only a and d keys now)
			{
			//stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(starling.events.KeyboardEvent.KEY_DOWN, keysDown);
			stage.addEventListener(starling.events.KeyboardEvent.KEY_UP, keysUp);
			trace("8");
			if (aDown)
				heroArt.x -= 5;
			if (dDown)
				heroArt.x += 5;
			}
		
		public function keysDown(e:KeyboardEvent):void 
			{//Check if a or d key pushed
				trace ("9");
				if (e.keyCode == 65)
				{
				aDown = true;
				}
				if (e.keyCode == 68)
				{
				dDown = true;
				}
			}
		public function keysUp(e:KeyboardEvent):void
			{//Check if a or d key not down
				trace("10");
				if (e.keyCode == 65)
				{
				aDown = false;
				}
				if (e.keyCode == 68)
				{
				dDown = false;
				}
			}
		
	}

}