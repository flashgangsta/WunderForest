package com.rr.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class RoomEvent extends Event {
		
		/// Нажатие на крышку погреба
		static public const CELLAR_COVER_CLICKED:String = "cellarCoverClicked";
		
		public function RoomEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) { 
			super( type, bubbles, cancelable );
			
		} 
		
		public override function clone():Event { 
			return new RoomEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String { 
			return formatToString( "RoomEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
		
	}
	
}