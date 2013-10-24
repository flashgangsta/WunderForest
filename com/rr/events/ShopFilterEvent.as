package com.rr.events {
	import com.rr.ModelData;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class ShopFilterEvent extends Event {
		
		public static const FILTER_CHANGED:String = "filterChanged";
		public static const SUBFILTER_CHANGED:String = "subfilterChanged";
		
		public var subfilterData:Vector.<ModelData>;
		
		public function ShopFilterEvent( type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false ) { 
			super( type, bubbles, cancelable );
		} 
		
		public override function clone():Event { 
			return new ShopFilterEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString( "ShopFilterEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
		
	}
	
}