/*
 * ButtonManager
 * Manager for quick and easy drawing shapes.
 *
 * @author		Sergei Krivtsov
 * @version		1.00.02
 * @e-mail		flashgangsta@gmail.com
 *
 *
*/

package com.flashgangsta.display {
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.display.GradientType;
	import flash.display.Sprite;
	
	public class Drawing {

		public function Drawing() {
			// constructor code
		}
		
		public static function drawGradientRectangle(target:Sprite, x:Number, y:Number, width:Number, height:Number, colors:Array, alphas:Array, rotation:Number = 90, type:String = "linear"):void {
			var matrix:Matrix = new Matrix();
			var ratios:Array = [];
			matrix.createGradientBox(width, height, Math.PI / 180 * rotation);
			
			for( var i:int = 0; i < colors.length; i++ ) {
				ratios.push( ( 255 / ( colors.length - 1 ) ) * i );
			}
			
			target.graphics.beginGradientFill(type === "linear" ? GradientType.LINEAR : GradientType.RADIAL, colors, alphas, ratios, matrix);  
			target.graphics.drawRect( x, y, width, height );
			target.graphics.endFill();
		}
		
		public static function drawRectangle(target:Sprite, x:Number, y:Number, width:Number, height:Number, color:Number, alpha:Number = 1, clear:Boolean = false):void {
			if(clear) target.graphics.clear();
			target.graphics.beginFill(color, alpha);
			target.graphics.drawRect(x, y, width, height);
			target.graphics.endFill();
		}
		
		public static function drawBorder( target:Sprite, x:Number, y:Number, width:Number, height:Number, color:Number = 0, borderHeight:Number = 1, alpha:Number = 1, clear:Boolean = false):void {
			if( clear ) target.graphics.clear();
			
			Drawing.drawRectangle( target, x, y, width, borderHeight, color, alpha );
			Drawing.drawRectangle( target, x, y + height - borderHeight, width, borderHeight, color, alpha );
			Drawing.drawRectangle( target, x, y + borderHeight, borderHeight, height - borderHeight * 2, color, alpha );
			Drawing.drawRectangle( target, width - borderHeight, y + borderHeight, borderHeight, height - borderHeight * 2, color, alpha );
		}
		
	}
	
}
