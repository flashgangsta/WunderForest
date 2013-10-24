package com.rr {
	import com.flashgangsta.display.Drawing;
	import com.flashgangsta.managers.MappingManager;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class ScreenController extends Sprite {
		
		static private const FRAME_MARGIN:int = 25;
		static public const MAX_WIDTH:int = 1400;
		static public const MAX_HEIGHT:int = 900;
		static public const WIDTH:int = 760;
		static public const HEIGHT:int = 700;
		
		private var frame:Sprite;
		private var border:Sprite = new Sprite();
		private var pattern:BitmapData = new FullscreenPattern();
		private var fullRect:Rectangle;
		
		/**
		 * Конструктор
		 */
		
		public function ScreenController() {
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		/**
		 * Инициализация
		 * @param	event
		 */
		
		private function init( event:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );
			
			frame = frame_mc;
			
			visible = false;
			mouseChildren = false;
			mouseEnabled = false;
			
			MappingManager.setAlign( frame, new Rectangle( 0, 0, Capabilities.screenResolutionX, Capabilities.screenResolutionY ) );
			
			setFullRect();
			
			stage.addEventListener( FullScreenEvent.FULL_SCREEN, onScreenChanged, false, 0 );
		}
		
		/**
		 * Запоминает текущий квадрат экрана
		 */
		
		private function setFullRect():void {
			fullRect = new Rectangle( 0, 0, stage.stageWidth, stage.stageHeight );
		}
		
		/**
		 * Рисует рамку фуллскрина
		 */
		
		private function drawBorder():void {
			var topHeight:int = pattern.height * Math.ceil( frame.y / pattern.height );
			var bottomHeight:int = stage.stageHeight - ( frame.y + frame.height );
			var leftWidth:int = pattern.width * Math.ceil( frame.x / pattern.width );
			var rightWidth:int = stage.stageWidth - ( frame.x + frame.width );
			
			var areaWidth:int = leftWidth + frame.width + rightWidth;
			
			border.graphics.clear();
			border.graphics.beginBitmapFill( pattern );
			border.graphics.drawRect( 0, 0, areaWidth, topHeight ); //top
			border.graphics.drawRect( 0, topHeight + frame.height, areaWidth, bottomHeight ); //bottom
			border.graphics.drawRect( 0, topHeight, leftWidth, frame.height ); // left
			border.graphics.drawRect( leftWidth + frame.width, topHeight, rightWidth, frame.height ); //right
			border.graphics.endFill();
			
			border.cacheAsBitmap = true;
			
			border.y = frame.y - topHeight;
			border.x = frame.x - leftWidth;
			
			addChild( border );
			addChild( frame );
			
		}
		
		/**
		 * Обработка смены режима экрана
		 * @param	event
		 */
		
		private function onScreenChanged( event:FullScreenEvent ):void {
			setFullRect();
			
			if ( event.fullScreen && ( stage.stageWidth >= MAX_WIDTH || stage.stageHeight >= MAX_HEIGHT ) ) {
				if ( !border.parent ) drawBorder();
				visible = true;
			} else {
				visible = false;
			}
			
			Helper.getDispatcher().dispatchEvent( new Event( Event.RESIZE ) );
		}
		
		/**
		 * Возвращает рабоий квадрат экрана
		 * @return
		 */
		
		public function getScreenRect():Rectangle {
			var rect:Rectangle;
			if ( stage.displayState === StageDisplayState.NORMAL || !visible ) { //Вне фуллскрина, или при мониторе не превышающем максимальную высоту и щирину
				rect = new Rectangle( 0, 0, stage.stageWidth, stage.stageHeight );
			} else if ( Capabilities.screenResolutionX < MAX_WIDTH && Capabilities.screenResolutionY > MAX_HEIGHT ) { //При мониторе привышающем высоту, но не превышающем ширину
				rect = new Rectangle( 0, frame.y + FRAME_MARGIN, stage.stageWidth, frame.height - ( FRAME_MARGIN * 2 ) );
			} else if( Capabilities.screenResolutionX > MAX_WIDTH && Capabilities.screenResolutionY < MAX_HEIGHT ) { //При мониторе привышающем ширину, но не привышающем высоту
				rect = new Rectangle( frame.x + FRAME_MARGIN, 0, frame.width - ( FRAME_MARGIN * 2 ), stage.stageHeight );
			} else { // Монитор привышает и высоту и ширину
				rect = new Rectangle( frame.x + FRAME_MARGIN, frame.y + FRAME_MARGIN, frame.width - ( FRAME_MARGIN * 2 ), frame.height - ( FRAME_MARGIN * 2 ) );
			}
			return rect;
		}
		
		/**
		 * Возвращает полный квадрат экрана
		 * @return
		 */
		
		public function getFullRect():Rectangle {
			return fullRect;
		}
		
	}

}