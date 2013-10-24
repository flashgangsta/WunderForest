package com.rr.pages.cellar {
	
	import com.rr.utils.TextConverter;
	import fl.text.TLFTextField;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class BagCounter extends MovieClip {
		
		private var bg:MovieClip;
		private var label:TLFTextField;
		
		public function BagCounter() {
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		private function init( event:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );
			
			label = label_txt;
			bg = bg_mc;
			
		}
		
		public function setValue( from:int, to:int ):void {
			
			label.text = TextConverter.getNumber( from ) + "/" + TextConverter.getNumber( to );
			label.autoSize = TextFieldAutoSize.LEFT;
			
			bg.width = Math.round( label.width );
			
		}
		
	}
	
}
