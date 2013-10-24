package com.rr.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class ContentLoaderEvent extends Event {
		
		static public const DESTROY:String = "destroy";
		static public const LOAD_COMPLETE:String = "loadComplete";
		static public const LOAD_STARTED:String = "loadStarted";
		
		public function ContentLoaderEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) { 
			super( type, bubbles, cancelable );
			
		} 
		
		public override function clone():Event { 
			return new ContentLoaderEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String { 
			return formatToString( "ContentLoaderEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
		
	}
	
}