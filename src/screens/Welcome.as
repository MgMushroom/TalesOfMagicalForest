//WelcomeScreen/StartScreen


package screens
{ 	
	import com.greensock.TweenLite;
	
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.getTimer;
	
	import assets.Assets;
	
	import events.NavigationEvent;
	import events.delayedFunctionCall;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Welcome extends Sprite
	{
		
	//Welcome screen image variables	
		private var bg:Image;
		private var logo:Image;
		private var char:Image;
		private var border:Image;
		private var cloud1:Image;
		private var cloud2:Image;
		private var bgIntro:Image;
		private var brandLogo:Image;
		
	//Welcome screen button variables
		private var playBtn:Button;
		private var aboutBtn:Button;
		
		
		//Welcome screen sound variables
		public var soundC:SoundChannel = new SoundChannel;
		public var songLength:String;
		public var soundIntro:SoundChannel = new SoundChannel;
		
		
		public function Welcome()
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
		
		
			drawScreen();
			welcomeMusic();
		}
		
		
		//Drawing welcome screen graphics
		private function drawScreen():void
		{	
			
			bg = new Image (Assets.getTexture("BgWelcome"));
			this.addChild(bg);
			
			
			cloud1 = new Image(Assets.getTexture("Cloud1"));
			this.addChild(cloud1);
			cloud1.y = 60;
			cloud1.x = 50;
			
			cloud2 = new Image(Assets.getTexture("Cloud2"));
			this.addChild(cloud2);
			cloud2.y = 30;
			cloud2.x = -700
			
			char = new Image (Assets.getTexture("BgChar"));
			char.x = -300;
			this.addChild(char);
			
			border = new Image(Assets.getTexture("Leaves"));
			this.addChild(border);
			
			logo = new Image (Assets.getTexture("BgLogo"));
			this.addChild(logo);
			logo.y = 85
			logo.x = 500
			
			playBtn = new Button (Assets.getTexture("BgStart"));
			this.addChild(playBtn);
			playBtn.x = 700;
			
			aboutBtn = new Button (Assets.getTexture("BgAbout"));
			this.addChild(aboutBtn);
			aboutBtn.x = 700;
				
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		
		}
		
		//Bring sounds and music to welcome screen
		private function welcomeMusic():void
		{
			var soundFile:URLRequest = new URLRequest("bg_musicwelcome.mp3");        
			var song:Sound = new Sound();
			song.load(soundFile);
			soundC = song.play();

		}
		
		
		//buttons actived control
		private function onMainMenuClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if(	(buttonClicked as Button) == playBtn)	
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,{id: "play"}, true));
				soundC.stop();
				
			}
		}
		
		//Welcomescreen initialize
		public function initialize():void
		{
			this.visible = true;
			
			charTween();
			
			this.addEventListener(Event.ENTER_FRAME, animation);
		
		}
		
		//Bring welcomescreen char tween
		private function charTween():void
		{
			var startTime=getTimer();
			
			stage.addEventListener(Event.ENTER_FRAME, timeDelay);
			
			function timeDelay(event:Event):void
			{
				
				var timePassed=getTimer();
				if (timePassed-startTime >= 6500) 
				{
					stage.removeEventListener(Event.ENTER_FRAME, timeDelay);
					
					char.x = -char.width;
					char.y = 180;	
					TweenLite.to(char, 4, {x:140});
					
				}
			}
		}
		
		//disposing welcome screen
		public function disposeTemporarily():void
		{
			this.visible = false;
			//if(this.hasEventListener(Event.ENTER_FRAME))this.removeEventListener(Event.ENTER_FRAME,heroAnimation);
		}
		
		//Setting up animations and locations
		private function animation(event:Event):void
		{
			var currentDate:Date = new Date();
			char.y = 180 + (Math.cos(currentDate.getTime() * 0.002) * 25);
			
			playBtn.y = 325 + (Math.cos(currentDate.getTime() * 0.002) * 12);
			aboutBtn.y = 455 + (Math.cos(currentDate.getTime() * 0.002) * 9);
			
		
			cloud1.x += 0.5;
			cloud2.x += 0.5;
			
			if (cloud1.x > 1200)
			{
				cloud1.x = -700;
			}
			
			if (cloud2.x > 1200)
			{
				cloud2.x = -500;
			}
		}
	}	
}