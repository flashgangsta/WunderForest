package com.rr {
	import caurina.transitions.Tweener;
	import com.flashgangsta.display.Drawing;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergei Krivtsov
	 */
	
	public class ModalRectangle extends Sprite {
		
		static public const COLOR:uint = 0x452406;
		static public const ALPHA:Number = .9;
		
		private var _stage:Stage;
		
		/**
		 * Блокировочный квадрат (для модальных окнон)
		 * @param	stageLink
		 */
		
		public function ModalRectangle() {
			_stage = Helper.getStage();
			Drawing.drawRectangle( this, 0, 0, _stage.stageWidth, _stage.stageHeight, COLOR, ALPHA );
			Helper.getDispatcher().addEventListener( Event.RESIZE, resize );
		}

		/**
		 * Меняет размер блокировочного квадрата при смене размера экрана
		 * @param	event
		 */
		
		public function resize( event:Event ):void {
			width = _stage.stageWidth;
			height = _stage.stageHeight;
		}
		
	}
	
}