package com.rr.dialogs {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	
	
	public class LoadingWindow extends MovieClip {
		
		private var titleLabel:TextField;
		private var messageLabel:TextField;
		private var _title:String;
		private var _message:String;
		
		public function LoadingWindow( title:String, message:String ) {
			_title = title;
			_message = message;
			this.addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		private function init( event:Event ):void {
			this.removeEventListener( Event.ADDED_TO_STAGE, init );
			titleLabel = title_txt;
			messageLabel = message_txt;
			
			titleLabel.text = _title;
			messageLabel.text = _message;
		}
		
	}
	
}
