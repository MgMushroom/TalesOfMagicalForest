package screens 
{
	//import flash.events.Event;
	
	import com.greensock.TweenLite;
	
	import objects.Hero;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.Color;
	
	public class InGame extends Sprite 
	{
		trace ("1");
		private var hero:Hero;
		
		
		public function InGame() 
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE,onAddedToStage);	
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