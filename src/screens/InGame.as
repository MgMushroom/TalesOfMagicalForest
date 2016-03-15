package screens 
{
	//import flash.events.Event;
	

	import com.greensock.TweenLite;
	
	import flash.events.KeyboardEvent;
	
	import GameControls.GameControl;
	
	import assets.Assets;
	
	import objects.Hero;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.Color;
	
	public class InGame extends Sprite 
	{
		trace ("1");
		private var hero:Hero;
		private var ingameBG:Image;
		private var aDown:Boolean = true;
		private var dDown:Boolean = true;
		private var HeroM:GameControl;
		
		public function InGame() 
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);	
			
		}
		
		private function onAddedToStage(event:Event):void 
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			drawHero();
			
		}
		//drawhero
		private function drawHero():void 
		{
			//Haetaan hero Hero classistä
			
			ingameBG = new Image(Assets.getTexture("InGameBG"));
			this.addChild(ingameBG);
			
			hero = new Hero();
			this.addChild(hero);
			
			//HeroMovement();
		}
		
		private function HeroMovement():void
		{//Get GameControl
			trace ("6");
			HeroM = new GameControl();
			this.addChild(HeroM);
			
		}
		

		public function initialize():void
		{
			this.visible = true;
			
			
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
			
		}
	

		
		

	}

}