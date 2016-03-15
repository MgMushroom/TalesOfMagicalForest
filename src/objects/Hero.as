package objects 
{
	import GameControls.GameControl;
	import starling.textures.Texture;
	import assets.Assets;
	//import flash.events.Event;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	
	public class Hero extends Sprite 
	{
		trace("2");
		private var heroControls:GameControl;
		private var heroArt:Image;
		
		public function Hero() 
		{
			trace("3");
			super();
			heroControls = new GameControl;
			addChild(heroControls);
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE,onAddedToStage);	
		}
		
		private function onAddedToStage(e:Event):void 
		{
			trace("4");
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			createHeroArt();
			
		}
		//Haetaan heron textuuri
		private function createHeroArt():void 
		{
			heroArt = new Image(Assets.getTexture("MagicHero"));
			heroArt.x = 25
			heroArt.y = 300
			this.addChild(heroArt);
			trace("5");
		}
		
	}

}