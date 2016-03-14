package screens
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.*;
	import flash.events.TimerEvent;
	
	import assets.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	

	
	public class Intro extends Sprite
	{
		private var bgIntro:Image;
		private var soundIntro:SoundChannel;
		
		public function Intro()
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
	
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		
			
			bgIntro = new Image(Assets.getTexture("BgIntro"));
			addChild(bgIntro);
			
			var soundFileIntro:URLRequest = new URLRequest("msstudio.mp3");        
			var intro:Sound = new Sound();
			intro.load(soundFileIntro);
			soundIntro = intro.play();
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