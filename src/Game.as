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
	import flash.events.KeyboardEvent;
	
	import events.NavigationEvent;
	
	import screens.InGame;
	import screens.Intro;
	import screens.Welcome;
	
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	
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
			
			trace ("Starling Frameworks initialized!");
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			bringScreens();
			
			
		}
		
		//bringing screens 
		private function bringScreens():void
		{
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
		
		
		//Intro delay control
		private function introDelay():void
		{
			var startTime=getTimer();
			
			stage.addEventListener(Event.ENTER_FRAME, timeDelay);
			
			function timeDelay(event:Event):void
			{
				
				var timePassed=getTimer();
				if (timePassed-startTime >= 6000) 
				{
					introScreen.disposeTemporarily();
				
				}
			}
		}			
		
		
		//chaning screens when play game
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