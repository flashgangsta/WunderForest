package com.rr.events {
	import flash.events.Event;
	
	/// @eventType	com.rr.events.NavigationEvent
	[Event(name="CLEAR_SELECTION_IN_NAVIGATION", type="com.rr.events.NavigationEvent")] 
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class NavigationEvent extends Event {
		
		/// Запрос на переход в погреб
		public static const CELLAR_CALLED:String = "cellarCalled";
		/// Запрос на переход в магазин персонажей
		public static const PERS_SHOP_CALLED:String = "persShopCalled";
		/// Запрос на переход в магазин феи
		public static const FAY_SHOP_CALLED:String = "fayShopCalled";
		/// Запрос на переход в магазин кабанов
		public static const BOARS_SHOP_CALLED:String = "boarsShopCalled";
		/// Запрос на переход в магазин
		public static const SHOP_CALLED:String = "shopCalled";
		/// Запрос на переход в нору
		public static const HOLE_CALLED:String = "holeCalled";
		/// Запрос на переход в банк
		public static const BANK_CALLED:String = "bankCalled";
		/// Запрос на переход в лес
		static public const FOREST_CALLED:String = "forestCalled";
		
		public function NavigationEvent( type:String, bubbles:Boolean=false, cancelable:Boolean=false ) { 
			super( type, bubbles, cancelable );
			
		} 
		
		public override function clone():Event { 
			return new NavigationEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String { 
			return formatToString( "NavigationEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
		
	}
	
}