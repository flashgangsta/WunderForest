package com.rr.dialogs {
	import com.rr.Helper;
	import com.rr.ItemModelData;
	import com.rr.Main;
	import com.flashgangsta.managers.MappingManager;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import caurina.transitions.Tweener;
	import flash.display.MovieClip;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class DialogFactory {
		
		private var main:Main;
		private var _stage:Stage;
		private var _onOk:Function;
		private var _onCancel:Function;
		private var window:MovieClip;
		
		private static const TWEEN_Y_STEP:int = 200;
		private static const TWEEN_TIME:int = 15;
		
		public function DialogFactory( mainLink:Main, stageLink:Stage ) {
			main = mainLink;
			_stage = stageLink;
			//TODO: Удалить этот класс и всё что не нужно
		}
		
		/**
		*
		*	Окно подтверждения
		*
		*/
		
		public function createConfirmationWindow( title:String, message:String, bitmap:BitmapData = null, onYes:Function = null, onNo:Function = null ):MovieClip {
			_onOk = onYes;
			_onCancel = onNo;
			
			window = new ConfirmationWindow( title, message, bitmap, okHandler, cancelHandler ) as ConfirmationWindow;
			showWindow();
			
			return window;
			
		}
		
		/**
		*
		*	Окно загрузки
		*
		*/
		
		public function createLoadingWindow( title:String = "Закатка", message:String = "Абажжи братан, камп катает файлы какие-то там..." ):void {
			if( window && window is LoadingWindow ) return;
			window = new LoadingWindow( title, message );
			showWindow();
		}
		
		/**
		*
		*	Окно предупреждения
		*
		*/
		
		public function createWarningWindow( message:String, cancelLabel:String = "Бля, ну ладно.", title:String = "Э бля, мужик!" ):void {
			window = new WarningWindow( message, cancelLabel, title, cancelHandler );
			showWindow();
		}
		
		/**
		*
		*	Окно рюкзака
		*
		*/
		
		public function createInBagWindow( onCancel:Function = null ):MovieClip {
			_onCancel = onCancel;
			
			window = new InBag( cancelHandler ) as InBag;
			showWindow();
			return window;
		}
		
		
		/**
		*	
		*	Возвращаяет текущее окно
		*
		*/
		
		public function getCurrentWindow():MovieClip {
			return window;
		}
		
		public function destroyLoadingWindow():void {
			if( window is LoadingWindow ) hideWindow();
		}
		
		private function showWindow():void {
			MappingManager.setAlign( window, new Rectangle( 0, 0, _stage.stageWidth, _stage.stageHeight ) );
			Helper.getPopupsFactory().addPopup( window );
			window.y -= DialogFactory.TWEEN_Y_STEP;
			Tweener.addTween( window, { y: window.y + DialogFactory.TWEEN_Y_STEP, useFrames: true, time: DialogFactory.TWEEN_TIME, delay: window is LoadingWindow ? 10 : 0, transition: "easeOutCubic" } );
		}
		
		private function hideWindow():void {
			Helper.getPopupsFactory().removePopup( window );
			window = null;
		}
		
		private function okHandler( target:MovieClip = null ):void {
			hideWindow();
			if( _onOk !== null ) _onOk();
		}
		
		private function cancelHandler( target:MovieClip = null ):void {
			hideWindow();
			if( _onCancel !== null ) _onCancel();
		}
		
	}
	
}
