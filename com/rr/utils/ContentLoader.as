package com.rr.utils {
	import com.rr.events.ContentLoaderEvent;
	import com.rr.MiniPreloader;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	
	public class ContentLoader extends EventDispatcher {
		
		/// Минимальный размер предмета для отображения прелоадера
		static protected const MIN_KB_SIZE_FOR_PRELOADER:int = 50;
		
		
		protected var _isLoaded:Boolean = false;
		protected var loader:Loader;
		protected var path:String;
		protected var preloader:MiniPreloader;
		protected var content:DisplayObject;
		protected var container:Sprite;
		
		private var _loaderInfo:LoaderInfo;
		
		/**
		 * Конструктор
		 */
		
		public function ContentLoader() {
			
		}
		
		/**
		 * Флаг указывает загрузилось ли изображение
		 * @return
		 */
		
		public function isLoaded():Boolean {
			return _isLoaded;
		}
		
		/**
		 * Запускает загрузку
		 */
		
		public function load():void {
			loader = new Loader();
			_loaderInfo = loader.contentLoaderInfo;
			var request:URLRequest = new URLRequest( path );
			loader.contentLoaderInfo.addEventListener( Event.OPEN, onLoadStart );
			loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, onLoadProgress );
			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onLoadComplete );
			loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, onLoadIOError );
			loader.load( request, new LoaderContext( true ) );
		}
		
		/**
		 * Закрывает загрузку картинки
		 */
		
		public function close():void {
			if ( loader ) {
				loader.close();
				removeListeners();
			}
		}
		
		/**
		 * Разрушает объект и все ссылки
		 */
		
		public function destroy():void {
			close();
			path = null;
			_isLoaded = false;
			dispatchEvent( new ContentLoaderEvent( ContentLoaderEvent.DESTROY ) );
			_loaderInfo = null;
		}
		
		/**
		 * Возвращает ссылку на контент
		 */
		
		public function getContent():DisplayObject {
			return content;
		}
		
		/**
		 * Возвращает ссылку на loaderInfo загружаемого объекта
		 * @return
		 */
		
		public function getLoaderInfo():LoaderInfo {
			return _loaderInfo;
		}
		
		/**
		 * Обработчик окончания загрузки. Удаляет всё не нужное.
		 */
		
		protected function removeListeners():void {
			loader.contentLoaderInfo.removeEventListener( Event.OPEN, onLoadStart );
			loader.contentLoaderInfo.removeEventListener( ProgressEvent.PROGRESS, onLoadProgress );
			loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, onLoadComplete );
			loader.contentLoaderInfo.removeEventListener( IOErrorEvent.IO_ERROR, onLoadIOError );
			loader = null;
			if( preloader ) {
				preloader.destroy();
				preloader = null;
			}
		}
		
		/**
		 * Обработка начала загрузки предмета
		 * @param	event
		 */
		
		private function onLoadStart( event:Event ):void {
			dispatchEvent( new ContentLoaderEvent( ContentLoaderEvent.LOAD_STARTED ) );
		}
		
		/**
		 * Обработка полученя данных о изменении прогресса загрузки
		 * @param	event
		 */
		
		private function onLoadProgress( event:ProgressEvent ):void {
			dispatchEvent( event );
		}
		
		/**
		 * Обработка окончания загрузки
		 * @param	event
		 */
		
		private function onLoadComplete( event:Event ):void {
			_isLoaded = true;
			content = loader.content;
			removeListeners();
			dispatchEvent( new ContentLoaderEvent( ContentLoaderEvent.LOAD_COMPLETE ) );
		}
		
		/**
		 * Обработчик ошибки загрузки
		 * @param	event
		 */
		
		private function onLoadIOError( event:IOErrorEvent ):void {
			trace( "file", path, "load error:", event.text );
			removeListeners();
		}
		
		
	}

}