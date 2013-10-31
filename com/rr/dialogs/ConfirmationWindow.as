package com.rr.dialogs {
	
	import flash.display.MovieClip;
  import flash.display.Sprite;
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
		private var bg:Sprite;
		private var image:Sprite;
		
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
			
			yesButton    = getChildByName( "yes_mc" ) as MovieClip; 
			noButton     = getChildByName( "no_mc" )  as MovieClip;
			titleLabel   = getChildByName( "title_txt" )   as TLFTextField;
			messageLabel = getChildByName( "message_txt" ) as TLFTextField;
			bg           = getChildByName( "bg_mc" )    as Sprite;
			image        = getChildByName( "image_mc" ) as Sprite;
			
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
