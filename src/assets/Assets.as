//Assets Class
//importing graphics


package assets
{
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import flash.utils.Dictionary;
	import flash.display.Bitmap;
	
	
	public class Assets extends Sprite
	{
	//WelcomeScreen assets------------------------------
		[Embed(source="/../Media/Pics/bgWelcome.png")]
		public static const BgWelcome:Class;
		[Embed(source="/../Media/Pics/welcomeLogo.png")]
		public static const BgLogo:Class;
		[Embed(source="/../Media/Pics/welcomeChar.gif")]
		public static const BgChar:Class;
		[Embed(source="/../Media/Pics/welcomeStart.png")]
		public static const BgStart:Class;
		[Embed(source="/../Media/Pics/welcomeAbout.png")]
		public static const BgAbout:Class;
		[Embed(source="/../Media/Pics/leaves.png")]
		public static const Leaves:Class;
		[Embed(source="/../Media/Pics/cloud1.gif")]
		public static const Cloud1:Class;
		[Embed(source="/../Media/Pics/cloud2.png")]
		public static const Cloud2:Class;
		[Embed(source="/../Media/Pics/logo.png")] 
		public static const BrandLogo:Class;
	//GameControl assets--------------------------------
		[Embed(source="/../Media/Pics/MgMushroomL.gif")] 
		public static const MagicHeroL:Class;
		[Embed(source="/../Media/Pics/MgMushroomR.gif")] 
		public static const MagicHeroR:Class;
		[Embed(source="/../Media/Pics/MgMushroomLAttack.gif")] 
		public static const MagicHeroLAttack:Class;
		[Embed(source="/../Media/Pics/MgMushroomRAttack.gif")] 
		public static const MagicHeroRAttack:Class;
	//enemy: Worm assets
	
	//InGame assets-------------------------------------
		[Embed(source="/../Media/Pics/bgInGame.png")] 
		public static const InGameBG:Class;
	//introScreen assets--------------------------------
		[Embed(source="/../Media/Pics/bg_intro.png")] 
		public static const BgIntro:Class;
	//--------------------------------------------------
		
		
	
		
		//making dictionary from embed graphics
		private static var gameTextures:Dictionary = new Dictionary();
		
		
		
		public function Assets()
		{
			super();
		}
	
		//method for importing embed graphics too other classes
		public static function getTexture(name:String):Texture
		{
			if(gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]()
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	}
}