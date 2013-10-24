package com.rr.dialogs {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.flashgangsta.managers.ButtonManager;
	import fl.text.TLFTextField;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import com.flashgangsta.managers.MappingManager;
	
	
	public class ConfirmationWindow extends MovieClip {
		
		private var _title:String;
		private var _message:String;
		private var _bmd:BitmapData;
		private var _onYes:Function;
		private var _onNo:Function;
		private var yesButton:MovieClip;
		private var noButton:MovieClip;
		private var titleLabel:TLFTextField;
		private var messageLabel:TLFTextField;
		private var bg:MovieClip;
		private var image:MovieClip;
		
		public function ConfirmationWindow( title:String, message:String, bitmap:BitmapData, onYes:Function, onNo:Function ) {
			addEventListener( Event.ADDED_TO_STAGE, init );
			
			_title = title;
			_message = message;
			_bmd = bitmap;
			_onYes = onYes;
			_onNo = onNo;
			
		}
		
		private function init( event:Event ):void {
			
			removeEventListener( Event.ADDED_TO_STAGE, init );
			
			yesButton = yes_mc; 
			noButton = no_mc;
			titleLabel = title_txt;
			messageLabel = message_txt;
			bg = bg_mc;
			image = image_mc;
			
			titleLabel.text = _title;
			messageLabel.text = _message;
			
			ButtonManager.addButton( yesButton, null, _onYes );
			ButtonManager.addButton( noButton, null, _onNo );
			
			if( _bmd ) {
				insertImage( _bmd );
			}
			
		}
		
		public function insertImage( bmd:BitmapData ):void {
			var bitmap:Bitmap = new Bitmap( bmd, "auto", true );
			addChild( bitmap );
			MappingManager.setScaleOnlyReduce( bitmap, image.width, image.height );
			MappingManager.setAlign( bitmap, image.getBounds( this ) );
		}
		
		
	}
	
}
