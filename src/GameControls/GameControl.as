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
	
	public class GameControl extends Sprite 
	{
	//Image variables
		private var heroArt:Image;
		private var heroArtL:Image;
		private var heroArtR:Image;
	//Boolean variables
		private var aDown:Boolean;
		private var dDown:Boolean;
		private var spaceDown:Boolean;
		private var heroAttackL:Boolean;
		private var heroAttackR:Boolean;
		public var grav:int = 0;
	//heroSpeed
		private var speedHero:Number;
	//Sound variables
		private var soundAmoutControl:int;
		
		
	//Get texture for hero and handle player controls
		public function GameControl() 
		{	
			this.addEventListener(Event.ENTER_FRAME, checkKeysAndParams);
			bringHeroArt();
		
		}
		
		private function bringHeroArt():void
		{
			heroArt = new Image(Assets.getTexture("MagicHeroR"));
			heroArt.x = 25;
			heroArt.y = 445;
			this.addChild(heroArt);
			trace("heroArt brougth");
			
		}
		
		private function attack():void
		{
			var startTime=getTimer();
			
			stage.addEventListener(Event.ENTER_FRAME, timeDelay);
			
			function timeDelay(event:Event):void
			{
				
				var timePassed=getTimer();
				if (timePassed-startTime >= 100) 
				{
					stage.removeEventListener(Event.ENTER_FRAME, timeDelay);
					
					if(heroArt.texture == Assets.getTexture("MagicHeroLAttack"))
					{
					heroArt.texture = Assets.getTexture("MagicHeroL");
					
					}
				
					if(heroArt.texture == Assets.getTexture("MagicHeroRAttack"))
					{
					heroArt.texture = Assets.getTexture("MagicHeroR");
				
					}
				}
			}
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
			
			//hero movement speed
			speedHero = 7;
			
			//stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(starling.events.KeyboardEvent.KEY_DOWN, keysDown);
			stage.addEventListener(starling.events.KeyboardEvent.KEY_UP, keysUp);
		
			//heroArt.gravity();
			
			
			
			if(spaceDown)
			{
				if(soundAmoutControl < 1)
				{
				
					if(heroArt.texture == Assets.getTexture("MagicHeroL"))
					{
						heroArt.texture = Assets.getTexture("MagicHeroLAttack");
					
						aDown = false;
						dDown = false;
					
							attack();
					
					
						if(soundAmoutControl < 1)
						{
							attackSound1();
							soundAmoutControl++;
						}
					}
				}
				
				if(soundAmoutControl < 1)
				{
				
					if(heroArt.texture == Assets.getTexture("MagicHeroR"))
					{
						heroArt.texture = Assets.getTexture("MagicHeroRAttack");
					
						aDown = false;
						dDown = false;
					
						attack();
					
						if(soundAmoutControl < 1)
						{
							attackSound1();
							soundAmoutControl++;
						}
					}
				}
			}
			
			if (aDown)
			{
				
				heroArt.texture = Assets.getTexture("MagicHeroL");
				heroArt.x -= speedHero; //move left
				//heroArtR.scaleX = -1; // face to the left
				
				}
			if (dDown)	
				{
				
				
				heroArt.texture = Assets.getTexture("MagicHeroR");
				heroArt.x += speedHero;	//move right
				//heroArtL.scaleX = 1; // face to the right
				
				//heroArt.x -= heroArt.width;
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
					soundAmoutControl = 0;
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
			/*public function gravity():void
			{
				this.y += grav;
				grav ++;
			}*/
	}

}