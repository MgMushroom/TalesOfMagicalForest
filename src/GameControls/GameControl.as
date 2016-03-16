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
		
		//Image variables
		private var heroArt:Image;
		private var heroArtL:Image;
		private var heroArtR:Image;
		
		//Boolean variables
		private var aDown:Boolean;
		private var dDown:Boolean;
		private var spaceDown:Boolean;
		
		public var grav:int = 0;
		
		//heroSpeed
		private var speedHero:Number;
		
		
		
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
				
				if(heroArt.texture == Assets.getTexture("MagicHeroL"))
				{
					heroArt.texture = Assets.getTexture("MagicHeroLAttack");
				}
				
				if(heroArt.texture == Assets.getTexture("MagicHeroR"))
				{
					heroArt.texture = Assets.getTexture("MagicHeroRAttack");
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