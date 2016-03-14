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
		//importing graphics
		[Embed(source="../Media/Pics/bgWelcome.png")]
		public static const BgWelcome:Class;
		[Embed(source="../Media/Pics/welcomeLogo.png")]
		public static const BgLogo:Class;
		[Embed(source="../Media/Pics/welcomeChar.gif")]
		public static const BgChar:Class;
		[Embed(source="../Media/Pics/welcomeStart.png")]
		public static const BgStart:Class;
		[Embed(source="../Media/Pics/welcomeAbout.png")]
		public static const BgAbout:Class;
		
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