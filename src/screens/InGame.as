package screens 
{
	
	import com.greensock.TweenLite;
	
	import flash.events.KeyboardEvent;
	
	import GameControls.GameControl;
	
	import assets.Assets;
	
	import objects.Hero;
	
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.Color;
	import starling.utils.deg2rad;
	
	public class InGame extends Sprite 
	{
		trace ("Ingame actived");
		
		//Class variables
		private var hero:Hero;
		private var HeroM:GameControl;
		
		//InGame images
	
		
	
		

		public function InGame() 
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);	
			
		}
		
		
		private function onAddedToStage(event:Event):void 
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, gameState);
			
			
			
			creatHero();
			
		}
		
		private function gameState():void
		{
			switch(gameState)
			{
				case "idle":
				
					break;
				
				case "game":
				
					
					break;
				case "over":
					break;
			}	
			
		}
		
		//draw graphics too InGame
		
		
		//creat hero too InGame
		private function creatHero():void 
		{
			//bring Hero from class
			
			hero = new Hero();
			this.addChild(hero);
			
			
		}
		
		//InGame initialize
		public function initialize():void
		{
			this.visible = true;
			
			
		}
		
		//InGame dispose	
		public function disposeTemporarily():void
		{
			this.visible = false;
			
		}
	}
}