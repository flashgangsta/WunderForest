package com.rr.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class ItemsListLineEvent extends Event {
		
		public static const GO_TO_NEXT:String = "gotoNext";
		public static const GO_TO_PREV:String = "gotoPrev";
		public static const GO_TO_SELECTED:String = "gotoSelected";
		
		/// Индекс выбранного предмета
		public var selectedIndex:int;
		
		public function ItemsListLineEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) { 
			super( type, bubbles, cancelable );
		} 
		
		public override function clone():Event { 
			return new ItemsListLineEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String { 
			return formatToString( "ItemsListLineEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
		
	}
	
}