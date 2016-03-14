//WelcomeScreen/StartScreen


package screens
{ 	
	import assets.Assets;
	
	import com.greensock.TweenLite;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Welcome extends Sprite
	{
		private var bg:Image;
		private var logo:Image;
		private var char:Image;
		private var border:Image;
		
		private var playBtn:Button;
		private var aboutBtn:Button;
		
		public function Welcome()
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		
		
		//Drawing welcome screen graphics
		private function drawScreen():void
		{
			bg = new Image (Assets.getTexture("BgWelcome"));
			this.addChild(bg);
			
			border = new Image(Assets.getTexture("Leaves"));
			this.addChild(border);
			
			logo = new Image (Assets.getTexture("BgLogo"));
			this.addChild(logo);
			logo.y = 50
			logo.x = 500
			
			char = new Image (Assets.getTexture("BgChar"));
			//this.addChild(char);
		
			playBtn = new Button (Assets.getTexture("BgStart"));
			this.addChild(playBtn);
			playBtn.x = 700;
			
			aboutBtn = new Button (Assets.getTexture("BgAbout"));
			this.addChild(aboutBtn);
			aboutBtn.x = 700;

		}
		
		//Welcomescreen initialize
		public function initialize():void
		{
			this.visible = true;
			char.x = -char.width;
			char.y = 180;	
			
			TweenLite.to(char, 2, {x:140});
			this.addEventListener(Event.ENTER_FRAME, animation);
		
		}
		
		//Setting up animations and locations
		private function animation(event:Event):void
		{
			var currentDate:Date = new Date();
			char.y = 180 + (Math.cos(currentDate.getTime() * 0.002) * 25);
			
			//logo.y = 100 + (Math.cos(currentDate.getTime() * 0.002) * 10);
			//logo.x = 500 + (Math.cos(currentDate.getTime() * 0.002) * 2);
			
			playBtn.y = 300 + (Math.cos(currentDate.getTime() * 0.002) * 12);
			//playBtn.x = 700 + (Math.cos(currentDate.getTime() * 0.002) * 3);
			
			aboutBtn.y = 430 + (Math.cos(currentDate.getTime() * 0.002) * 9);
			//aboutBtn.x = 700 + (Math.cos(currentDate.getTime() * 0.002) * 5);
		}
	
	}	
}