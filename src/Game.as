package
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.Color;
	
	public class Game extends Sprite
	{
		public function Game()
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE,onAddedToStage);	
		}
		
		private function onAddedToStage (event:Event):void
		{
			var quad:Quad = new Quad(200, 200, Color.RED);
			quad.x = 550;
			quad.y = 350;
			addChild(quad);
			
		}
	}
}