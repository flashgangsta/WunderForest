package com.rr.dialogs {
	import com.flashgangsta.managers.ButtonManager;
	import com.rr.Main;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class InBag extends MovieClip {
		private var _onCancel:Function;
		private var closeBtn:MovieClip;
		
		public function InBag( onCancel:Function ) {
			_onCancel = onCancel;
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
	
		private function init( event:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );

			closeBtn = getChildByName( "closeBtn_mc" ) as MovieClip;
			
			ButtonManager.addButton( closeBtn, null, onCloseClicked );
		}
		
		private function onCloseClicked( target:MovieClip ):void {
			_onCancel();			
		}
		
	}
}