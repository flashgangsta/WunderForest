package com.rr.popups {
	import com.rr.ModalRectangle;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class PopupsFactory extends Sprite {
		
		private var modalRectangle:ModalRectangle;
		private var modalRectangleOwner:Popup;
		
		/**
		 * 
		 */
		
		public function PopupsFactory() {
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		/**
		 *  Инициализация
		 * @param	event
		 */
		
		private function init( event:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );
			modalRectangle = new ModalRectangle();
		}
		
		/**
		 * 
		 * @param	popup
		 */
		
		public function addPopup( popup:Sprite ):void { //TODO: поменять тип аргумента на Popup
			if ( popup is Popup ) { //TODO убрать первое условие
				if ( Popup( popup ).getModalValue() ) { //TODO: убрать приведение к типу послу удаления первого условия
					modalRectangleOwner = Popup( popup );
					addChild( modalRectangle );
				}
			}
			addChild( popup );
		}
		
		/**
		 * 
		 * @param	popup
		 */
		
		public function removePopup( popup:Sprite ):void { //TODO: поменять тип аргумента на Popup
			removeChild( popup );
			if ( contains( modalRectangle ) && modalRectangleOwner === popup ) {
				removeChild( modalRectangle );
				modalRectangleOwner = null;
			}
		}
		
	}

}