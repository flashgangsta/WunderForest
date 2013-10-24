package com.rr.pages {
	import caurina.transitions.Tweener;
	import com.flashgangsta.managers.ButtonManager;
	import com.rr.events.PopupPageEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class PopupPage extends MovieClip {
		
		public static const ADD_MOTION_COMPLETE:String = "addMotionComplete";
		private static const STEP:int = 200;
		
		protected var closeBtn:MovieClip;
		
		public function PopupPage() {
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			closeBtn = getChildByName( "close_mc" ) as MovieClip;
			if ( closeBtn ) {
				ButtonManager.addButton( closeBtn, null, onCloseBtnClicked );
			}
		}
		
		private function onAddedToStage( event:Event ):void {
			addMotion();
		}
		
		private function onCloseBtnClicked( target:MovieClip ):void {
			dispatchEvent( new PopupPageEvent( PopupPageEvent.CLOSED ) );
		}
		
		private function addMotion():void {
			y += STEP;
			Tweener.addTween( this, { y: y - STEP, useFrames: true, time: 15, transition: "easeOutCubic", onComplete: onAddMotionComplete } );
		}
		
		private function onAddMotionComplete():void {
			dispatchEvent( new Event( PopupPage.ADD_MOTION_COMPLETE ) );
		}
		
	}

}