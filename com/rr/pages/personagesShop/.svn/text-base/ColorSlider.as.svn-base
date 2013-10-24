package com.rr.pages.personagesShop 
{
	import com.flashgangsta.display.Drawing;
	import com.flashgangsta.managers.ButtonManager;
	import com.rr.events.ColorSliderEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	public class ColorSlider extends MovieClip {
		
		private var colorArea:MovieClip; // Зона градиента
		private var slider:MovieClip; // Ползунок
		private var colorPalette:Sprite; // Градиент векторный
		private var paletteBitmap:Bitmap; // Градиент растровый
		private var colorBox:Sprite = new Sprite(); //
		private var paletteBMD:BitmapData;  //
		
		public function ColorSlider() {
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		private function init( event:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );
			
			colorArea = colorArea_mc;
			slider = slider_mc;
			
			drawColorPalette();
			
			
		}
		
		//Рисует палитру
		
		private function drawColorPalette():void {
			colorBox.x = colorArea.x;
			colorBox.y = colorArea.y;
			colorArea.x = colorArea.y = 0;
			colorBox.addChild( colorArea );
			
			colorPalette = new Sprite();
			
			var colors:Array = [ 0xFF0000, 0xFF00BF, 0x8000FF, 0x0040FF, 0x00FFFF, 0x00FF40, 0x80FF00, 0xFFBF00, 0xFF0000 ];
			var alphas:Array = [ 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
			
			Drawing.drawGradientRectangle( colorPalette, 0, 0, colorArea.width - 2, colorArea.height - 2, colors, alphas, 0 );
			
			paletteBMD = new BitmapData( colorPalette.width, colorPalette.height );
			paletteBMD.draw( colorPalette );
			colorPalette = null;
			paletteBitmap = new Bitmap( paletteBMD );
			paletteBitmap.x = paletteBitmap.y = 1;
			
			colorBox.addChild( paletteBitmap );
			addChild( colorBox );
			addChild( slider );
			
			ButtonManager.addButton( slider, null, dropSlider, dropSlider, dragSlider );
			ButtonManager.addButton( colorArea, null, dropSlider, dropSlider, dragSlider, null, null, false );
			
		}
		
		private function dragSlider( target:MovieClip ):void {
			if( target === colorArea ) {
				slider.x = colorBox.x + colorBox.mouseX;
			}
			onSliderDragged();
			stage.addEventListener( MouseEvent.MOUSE_MOVE, onSliderDragged );
			var bounds:Rectangle = paletteBitmap.getBounds( this );
			bounds.y = slider.y;
			bounds.height = 0;
			bounds.width -= 1;
			slider.startDrag( false, bounds );
		}
		
		private function dropSlider( target:MovieClip ):void {
			slider.stopDrag();
			stage.removeEventListener( MouseEvent.MOUSE_MOVE, onSliderDragged );
		}
		
		private function onSliderDragged( event:MouseEvent = null ):void {
			var position:int = 5 + slider.getBounds( colorBox ).x;
			
			var outEvent:ColorSliderEvent = new ColorSliderEvent( ColorSliderEvent.DRAGGED );
			outEvent.color = int( paletteBMD.getPixel( position, 0 ) );
			
			dispatchEvent( outEvent );
			
		}
		
	}

}