package GameControls 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	
	import assets.Assets;
	
	import objects.Hero;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	public class GameControl extends Sprite 
	{
		private var heroArt:Image;
		private var heroArtL:Image;
		private var heroArtR:Image;
		
		//private var hero:Hero;
		private var aDown:Boolean;
		private var dDown:Boolean;
		public var grav:int = 0;
		
		
		
		
		public function GameControl() 
		{//Get texture for hero and handle player controls
			super();
			//checkStuff();
			this.addEventListener(Event.ENTER_FRAME, checkStuff);
			/*stage.addEventListener(KeyboardEvent.KEY_DOWN, keysDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keysUp);*/
		
			heroArt = new Image(Assets.getTexture("MagicHeroR"));
			heroArt.x = 25;
			heroArt.y = 300;
			this.addChild(heroArt);
			trace("5");
			
			
		
		}
		public function checkStuff(e:Event):void 
		//if true move hero.x ( only a and d keys now)
			{
			//stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(starling.events.KeyboardEvent.KEY_DOWN, keysDown);
			stage.addEventListener(starling.events.KeyboardEvent.KEY_UP, keysUp);
		
			//heroArt.gravity();
			if (aDown)
			{
				
				heroArt.texture = Assets.getTexture("MagicHeroL");
				heroArt.x -= 5; //move left
				//heroArtR.scaleX = -1; // face to the left
				
				}
			if (dDown)	
				{
				
				
				heroArt.texture = Assets.getTexture("MagicHeroR");
				heroArt.x += 5;	//move right
				//heroArtL.scaleX = 1; // face to the right
				
				//heroArt.x -= heroArt.width;
				}	
			}
		
		public function keysDown(e:KeyboardEvent):void 
			{//Check if a or d key pushed
				trace ("9");
				if (e.keyCode == 65)//Is a pressed
				{
				aDown = true;//if its set it to true
				}
				if (e.keyCode == 68)//Is d pressed
				{
				dDown = true;//if its set it to true
				}
			}
		public function keysUp(e:KeyboardEvent):void
			{//Check if a or d key not down
				trace("10");
				if (e.keyCode == 65)//Is a pressed
				{
				aDown = false;//if its set it to false
				}
				if (e.keyCode == 68)//Is d pressed
				{
				dDown = false;//if its set it to false
				}
			}
			/*public function gravity():void
			{
				this.y += grav;
				grav ++;
			}*/
	}

}