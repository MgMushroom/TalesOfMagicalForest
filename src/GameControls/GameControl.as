package GameControls 
{
	import flash.display.Sprite;
	import starling.display.Sprite;
	import flash.events.Event;
	import objects.Hero;
	import flash.events.KeyboardEvent;
	import starling.events.EnterFrameEvent;
	
	public class GameControl extends Sprite 
	{
		private var hero:Hero;
		private var aDown:Boolean = true;
		private var dDown:Boolean = true;
		
		public function GameControl() 
		{
			super();
			stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keysDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keysUp);
		}
		public function checkStuff(e:Event):void 
		//if true move hero.x ( only a and d keys now)
			{
			if (aDown)
				hero.x -= 5;
			if (dDown)
				hero.x += 5;
			}
		
		public function keysDown(e:KeyboardEvent):void 
			{//Check if a or d key pushed
			if (e.keyCode == 65)
				aDown = true;
			if (e.keyCode == 68)
				dDown = true;
			}
		public function keysUp(e:KeyboardEvent):void
			{//Check if a or d key not down
			if (e.keyCode == 65)
				aDown = false;
			if (e.keyCode == 68)
				dDown = false;
			}
		
	}

}