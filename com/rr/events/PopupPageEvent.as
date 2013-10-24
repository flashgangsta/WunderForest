package com.rr.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class PopupPageEvent extends Event {
		
		static public const CLOSED:String = "pageClosed";
		
		
		public function PopupPageEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) { 
			super( type, bubbles, cancelable );
		} 
		
		public override function clone():Event { 
			return new PopupPageEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String { 
			return formatToString( "PopupPageEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
		
	}
	
}