//Game class 
//Manage screens

package
{
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	import events.NavigationEvent;
	
	import screens.InGame;
	import screens.Intro;
	import screens.Welcome;
	import flash.events.KeyboardEvent;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.Color;
	
	public class Game extends Sprite
	{
		private var welcomeScreen:Welcome;
		private var screenInGame:InGame;
		private var introScreen:Intro;
		private var timerB:Boolean;
		
		
		
		public function Game()
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE,onAddedToStage);	
		}
		
	
		private function onAddedToStage (event:Event):void
		{
			
			//Test quad
			var quad:Quad = new Quad(200, 200, Color.RED);
			quad.x = 550;
			quad.y = 350;
			addChild(quad);
			removeChild(quad);
			
			trace ("Starling Frameworks initialized!");
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			welcomeScreen = new Welcome;
			addChild(welcomeScreen);
			welcomeScreen.initialize();
			
			introScreen = new Intro;
			addChild(introScreen);
			introScreen.initialize();
			introDelay();
		
			screenInGame = new InGame;
			this.addChild(screenInGame);
			screenInGame.disposeTemporarily();
		}
		
		private function introDelay():void
		{
			var startTime=getTimer();
			
			stage.addEventListener(Event.ENTER_FRAME, timeDelay);
			
			function timeDelay(event:Event):void
			{
				
				var timePassed=getTimer();
				if (timePassed-startTime >= 5000) 
				{
					introScreen.disposeTemporarily();
				}
			}
		}			
		
		private function onChangeScreen(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				case "play":
					welcomeScreen.disposeTemporarily();
					screenInGame.initialize();
					
					break;
			}
		}
	}
}