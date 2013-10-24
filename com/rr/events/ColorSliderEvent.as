package com.rr.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class ColorSliderEvent extends Event {
		
		public static const DRAGGED:String = "dragged";
		
		public var color:int;
		
		public function ColorSliderEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) { 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event { 
			return new ColorSliderEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String { 
			return formatToString( "ColorSliderEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
		
	}
	
}