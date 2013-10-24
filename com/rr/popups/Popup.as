package com.rr.popups {
	import caurina.transitions.Tweener;
	import com.flashgangsta.managers.ButtonManager;
	import com.flashgangsta.managers.MappingManager;
	import com.rr.Helper;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	
	public class Popup extends Sprite {
		
		private static const TWEEN_Y_STEP:int = 150;
		private static const TWEEN_TIME:int = 15;
		private static const TWEEN_TRANSITION:String = "Back";
		
		private var isModal:Boolean;
		private var labelArea:Sprite;
		private var background:Sprite;
		private var shadowFilter:DropShadowFilter = new DropShadowFilter( 0, 45, 0, 1, 32, 32, .68, BitmapFilterQuality.HIGH );
		
		protected var closeBtn:MovieClip;
		protected var label:TextField;
		
		/**
		 * Конструктор
		 * @param	isModal
		 */
		
		public function Popup( isModal:Boolean = true ) {
			this.isModal = isModal;
			
			closeBtn = getChildByName( "close_mc" ) as MovieClip;
			label = getChildByName( "label_txt" ) as TextField;
			background = getChildByName( "background_mc" ) as Sprite;
			
			background.filters = [ shadowFilter ];
			
			alignInCenter();
			Helper.getPopupsFactory().addPopup( this );
			playShowMotion();
			
			if ( closeBtn ) ButtonManager.addButton( closeBtn, null, onCloseBtnClicked );
		}
		
		/**
		 * Возвращает флаг отображающий является ли окно модальным
		 * @return
		 */
		
		public function getModalValue():Boolean {
			return isModal;
		}
		
		/**
		 * Удаляет попап
		 */
		
		public function remove():void {
			Helper.getPopupsFactory().removePopup( this );
			if( closeBtn ) ButtonManager.removeButton( closeBtn );
		}
		
		/**
		 * Выравнивает заголовок по центру заданной области
		 * @param	area область для выравнивания
		 */
		
		protected function alignLabelByArea( area:Rectangle ):void {
			MappingManager.setAlign( label, area );
		}
		
		/**
		 * Центрирует окно
		 */
		
		private function alignInCenter():void {
			MappingManager.setAlign( this, Helper.getScreenController().getFullRect() );
		}
		
		/**
		 * Обработка нажатия кнопки закрытия окна
		 * @param	target
		 */
		
		private function onCloseBtnClicked( target:MovieClip ):void {
			remove();
		}
		
		/**
		 * Запускает анимацию появления
		 */
		
		 private function playShowMotion():void {
			y -= Popup.TWEEN_Y_STEP;
			Tweener.addTween( this, { y: y + Popup.TWEEN_Y_STEP, useFrames: true, time: Popup.TWEEN_TIME, transition: "easeOut" + TWEEN_TRANSITION } );
		}
		
		override public function get width():Number {
			return background.width;
		}
		
		override public function get height():Number {
			return background.height;
		}
		
	}

}