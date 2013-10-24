package com.rr.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class ConfirmationEvent extends Event {
		
		static public const AGREE:String = "confirmationAgree";
		static public const CANCEL:String = "confirmationCancel";
		
		public function ConfirmationEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) { 
			super( type, bubbles, cancelable );
		} 
		
		public override function clone():Event { 
			return new ConfirmationEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String { 
			return formatToString( "ConfirmationEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
		
	}
	
}