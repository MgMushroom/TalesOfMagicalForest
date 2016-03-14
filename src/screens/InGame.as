package screens 
{
	//import flash.events.Event;
	
	import GameControls.GameControl;
	import objects.Hero;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.events.Event;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.utils.Color;
	import flash.events.KeyboardEvent;
	
	public class InGame extends Sprite 
	{
		trace ("1");
		private var hero:Hero;
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
			hero = new Hero();
			this.addChild(hero);
			
			HeroMovement();
		}
		
		private function HeroMovement():void
		{//Get GameControl
			trace ("6");
			HeroM = new GameControl();
			this.addChild(HeroM);
			
		}
		
		
		
	}

}