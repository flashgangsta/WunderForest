package com.rr.ui {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import com.flashgangsta.managers.ButtonManager;
	import flash.events.Event;
	
	/**
	 * Срабатывает после того как пользвователь изменит выбранную
	 * страницу средствами клика по кнопки данного компонента
	 * @eventType	flash.events.Event.CHANGE
	 */
	[Event(name="change", type="flash.events.Event")]
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	
	public class Paging extends Sprite {
		
		/// Горизнтальный отступ между кнопками
		private const BUTTONS_MARGIN_X:int = 3;
		
		/// Список кнопочек
		private var btns:Array = [];
		/// Выбранный элемент
		private var selectedIndex:int = 1;
		
		
		/**
		 * Конструктор
		 */
		
		public function Paging() {
			page1_mc.stop();
			removeChild( page1_mc );
		}
		
		/**
		 * Заполняет компонент кнопками
		 * @param	length
		 */
		
		public function setPages( length:int ):void {
			if( btns.length ) {
				// Удаляем кнопки
				ButtonManager.removeButtonGroup( btns[ 0 ] );
				for( var j:int = 0; j < btns.length; j++ ) {
					removeChild( btns[ j ] );
				}
				selectedIndex = 1;
			}
			//Добавляем новые
			
			btns = [];
			
			for( var i:int = 0; i < length; i++ ) {
				var btn:MovieClip = new PagingBtn();
				btn.x = ( btn.width + BUTTONS_MARGIN_X ) * i;
				btn.label_txt.text = ( i + 1 ).toString();
				btn.label_txt.mouseChildren = false;
				btn.label_txt.mouseEnabled = false;
				addChild( btn );
				btns.push( btn );
			}
			
			ButtonManager.addButtonGroup( btns, true, btns[ 0 ], false, ButtonManager.STATE_PRESSED, onBtnClick );
			
		}
		
		/**
		 * Возвращает индекс выбранной страницы
		 * @return
		 */
		
		public function getCurrentPage():int {
			return selectedIndex;
		}
		
		/**
		 * Устанавливает выбранную страницу
		 * @param	pageNum
		 */
		
		public function setPageSelection( pageNum:int ):void {
			selectedIndex = pageNum;
			ButtonManager.setSelectionOnGroup( btns[ selectedIndex - 1 ] );
		}
		
		/**
		 * Обработка смены страницы
		 * @param	target
		 */
		
		private function onBtnClick( target:MovieClip ):void {
			selectedIndex = int( target.label_txt.text );
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		
	}
	
}
