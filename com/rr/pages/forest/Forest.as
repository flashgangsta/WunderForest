package com.rr.pages.forest {
	
	import com.flashgangsta.managers.MappingManager;
	import com.rr.events.NavigationEvent;
	import com.rr.Helper;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.flashgangsta.managers.ButtonManager;
	import com.rr.PageViewer;
	import com.rr.Main;
	import flash.events.EventDispatcher;
	import flash.geom.Rectangle;
	
	
	public class Forest extends MovieClip {
		
		/// Кнопка магазина феи
		private var fayBtn:MovieClip;
		/// Кнопка банка
		private var bankBtn:MovieClip;
		/// Кнопка магазина персонажей
		private var persShopBtn:MovieClip;
		/// Кнопка норы
		private var holeBtn:MovieClip;
		/// Кнопка магазина кабанов
		private var boarsBtn:MovieClip;
		/// Диспатчер
		private var dispatcher:EventDispatcher = Helper.getDispatcher();
		
		/**
		 * Конструктор
		 */
		
		public function Forest() {
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		/**
		 * Инициализация
		 * @param	event
		 */
		
		private function init( event:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );
			
			fayBtn = getChildByName( "fay_mc" ) as MovieClip;
			bankBtn = getChildByName( "bank_mc" ) as MovieClip;
			persShopBtn = getChildByName( "persShop_mc" ) as MovieClip;
			holeBtn = getChildByName( "hole_mc" ) as MovieClip;
			boarsBtn = getChildByName( "boars_mc" ) as MovieClip;
			
			ButtonManager.addButton( fayBtn, null, onFayBtnClicked );
			ButtonManager.addButton( bankBtn, null, onBankBtnClicked );
			ButtonManager.addButton( persShopBtn, null, onPersShopBtnClicked )
			ButtonManager.addButton( holeBtn, null, onHoleBtnClicked );
			ButtonManager.addButton( boarsBtn, null, onBoarsBtnClicked );
			
			dispatcher.addEventListener( Event.RESIZE, resize );
			
			resize();
			
		}
		
		/**
		 * Обработка нажатия кнопки магазина феи
		 * @param	target кнопка
		 */
		
		private function onFayBtnClicked( target:MovieClip ):void {
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.FAY_SHOP_CALLED ) );
		}
		
		/**
		 * Обработка нажатия кнопки магазина кабанов
		 * @param	target кнопка
		 */
		
		private function onBoarsBtnClicked( target:MovieClip ):void {
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.BOARS_SHOP_CALLED ) );
		}
		
		/**
		 * Обработка нажатия кнопки банка
		 * @param	target кнопка
		 */
		
		private function onBankBtnClicked( target:MovieClip ):void {
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.BANK_CALLED ) );
		}
		
		/**
		 * Обработка нажатия кнопки магазина персонажей
		 * @param	target кнопка
		 */
		
		private function onPersShopBtnClicked( target:MovieClip ):void {
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.PERS_SHOP_CALLED ) );
		}
		
		/**
		 * Обработка нажатия кнопки норы
		 * @param	target кнопка
		 */
		
		private function onHoleBtnClicked( target:MovieClip ):void {
			dispatcher.dispatchEvent( new NavigationEvent( NavigationEvent.HOLE_CALLED ) );
		}
		
		/**
		 * Обработка смены режима экрана
		 * @param	event
		 */
		
		private function resize( event:Event = null ):void {
			if ( !stage ) return;
			var screenRect:Rectangle = Helper.getScreenController().getScreenRect();
			MappingManager.setAlign( this, screenRect );
		}
		
	}
	
}
