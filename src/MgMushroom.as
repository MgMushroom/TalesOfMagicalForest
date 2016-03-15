
//Daddy class
//11.3.2016
//Project "MgMushroom/TalesOfMagicalForest"
//Main coders "Severi Suominen" % "Samuli Leppänen"

package 
{
	
	import flash.display.Sprite;
	import screens.InGame;
	import starling.core.Starling;
	import objects.Hero;
	import screens.Intro;
	
	//Setting up stage parameters
	[SWF(width="1200", height="800", frameRate="60", backgroundColor="#000000", wmode="direct")]
	
	public class MgMushroom extends Sprite
	{
		private var mStarling:Starling;
		
		public function MgMushroom()
		{
			// Create a Starling instance, running "Game" class
			mStarling = new Starling(InGame, stage);
			mStarling.start();
		}
	}
}
