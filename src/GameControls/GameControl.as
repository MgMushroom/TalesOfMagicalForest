package GameControls 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.getTimer;
	
	import assets.Assets;
	
	import objects.Hero;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.text.TextField
	public class GameControl extends Sprite 
	{
	//Image variables
		private var heroArt:Image;
		private var heroArtL:Image;
		private var heroArtR:Image;
	
		private var mouseArea:Image;
	//Boolean variables
		
		private var wDown:Boolean;
		private var aDown:Boolean;
		private var dDown:Boolean;
		private var spaceDown:Boolean;
		
		private var heroAttackL:Boolean;
		private var heroAttackR:Boolean;
		
		private var speedHero:int = 6;
		private var jump:int = 13;
		private var gravity:Number = 0;
		private var minionSpeed:Number = 1;
		private var counter:Boolean = true;
		private var gravitySmooth:Boolean;
		private var jumpCounter:Boolean;
		private var ingameBG:Image;
		
	//Mouse detection
		private var touch:Touch;
		private var touchX:Number;
		private var touchY:Number;
	
	//Sound variables
		private var soundAmoutControl:int;
		private var textF:TextField = new TextField(300,300,"");
		
	//Get texture for hero and handle player controls
		public function GameControl() 
		{	
			
			MouseArea();
			drawWorld();
			bringHeroArt();
			
			
			this.addEventListener(Event.ENTER_FRAME, checkKeysAndParams);
			this.addEventListener(TouchEvent.TOUCH, onTouch);
		
		}
		
		private function MouseArea():void
		{
			mouseArea = new Image(Assets.getTexture("MouseDetection"));
			this.addChild(mouseArea);
		}
		
		private function text():void
		{
			
			textF.border = true;
			this.addChild(textF);
			
			var text:String = String(touchX);
			textF.text = text;
		}
		
		private function bringHeroArt():void
		{
			heroArt = new Image(Assets.getTexture("MagicHeroR"));
			heroArt.x = 400;
			heroArt.y = 510;
			this.addChild(heroArt);
			trace("heroArt brougth");
			
		}
		
		private function drawWorld():void
		{
			
			
			ingameBG = new Image(Assets.getTexture("InGameBG"));
			this.addChild(ingameBG);
			
		}
		
		private function attackSound1():void
		{
			var attackSoundC:SoundChannel;
			var soundFileSoundA1:URLRequest = new URLRequest("Attack1.mp3");        
			var soundA1:Sound = new Sound();
			soundA1.load(soundFileSoundA1);
			attackSoundC = soundA1.play();
		
			
		}
		
		//Checking control keys and params
		public function checkKeysAndParams(e:Event):void 

			{
			
			//stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(starling.events.KeyboardEvent.KEY_DOWN, keysDown);
			stage.addEventListener(starling.events.KeyboardEvent.KEY_UP, keysUp);
			
			text();
			if (ingameBG.x < -stage.stageWidth){ingameBG.x = 0;}
			
			heroArt.x += gravity;
			if (touchX > heroArt.x + heroArt.width * 0.5)
			{
			heroArt.texture = Assets.getTexture("MagicHeroR");
			}
			
			if (touchX < heroArt.x + heroArt.width * 0.5)
			{
				heroArt.texture = Assets.getTexture("MagicHeroL");
			}
			
			if(spaceDown)
			{
				if (touchX > heroArt.x + heroArt.width * 0.5)
				{
					heroArt.texture = Assets.getTexture("MagicHeroR");
					
					ingameBG.x -= speedHero;
					if(speedHero > 7){speedHero = 7;}
				}
				
				if (touchX < heroArt.x + heroArt.width * 0.5)
				{
					heroArt.texture = Assets.getTexture("MagicHeroL");
					ingameBG.x += speedHero;
					if(speedHero > 7){speedHero = 7;}
				}		
			}
			
			if (aDown)
				{
				
				}
			if (dDown)	
				{
						
				}	
			}
		
	
	
		
		public function keysDown(e:KeyboardEvent):void 
			{
				
				//if control key pressed
				//TRUE
				
				if (e.keyCode == 32)
				{
					spaceDown = true;
				}
				
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
			{
				
				//if control key not pressed
				//FALSE
				
				if (e.keyCode == 32)
				{
					
					spaceDown = false;
				}
				
				if (e.keyCode == 65)
				{
					aDown = false;
				}
				
				if (e.keyCode == 68)
				{
					dDown = false;
				}
			}
		private function onTouch(event:TouchEvent):void
		{
			touch = event.getTouch(stage);
			touchX = touch.globalX;
			touchY = touch.globalY;
		}		
	}
}
