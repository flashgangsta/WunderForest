package com.rr.popups {
	import com.flashgangsta.managers.ButtonManager;
	import com.rr.events.ConfirmationEvent;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class ConfirmationPopup extends Popup {
		
		protected var yesBtn:MovieClip;
		private var noBtn:MovieClip;
		
		public function ConfirmationPopup() {
			super( true );
			
			yesBtn = getChildByName( "yesBtn_mc" ) as MovieClip;
			noBtn = getChildByName( "noBtn_mc" ) as MovieClip;
			
			ButtonManager.addButton( yesBtn, null, onAgree );
			ButtonManager.addButton( noBtn, null, onCancel );
		}
		
		private function onAgree( target:MovieClip ):void {
			dispatchEvent( new ConfirmationEvent( ConfirmationEvent.AGREE ) );
			destroy();
		}
		
		private function onCancel( target:MovieClip ):void {
			dispatchEvent( new ConfirmationEvent( ConfirmationEvent.CANCEL ) );
			destroy();
		}
		
		private function destroy():void {
			ButtonManager.removeButton( yesBtn, noBtn );
			yesBtn = null;
			noBtn = null;
			remove();
		}
		
	}

}