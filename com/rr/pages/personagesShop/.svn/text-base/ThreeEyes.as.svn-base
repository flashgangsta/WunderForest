package com.rr.pages.personagesShop {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class ThreeEyes extends MovieClip {
		
		var maxDelay:int = 5000;
		var minDelay:int = 1000;
		var timeout:uint;
		
		public function ThreeEyes() {
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		private function init( event:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );
			addFrameScript( totalFrames - 1, onLastFrame );
		}
		
		private function onLastFrame():void {
			timeout = setTimeout( onTimeout, minDelay + ( Math.random() * ( maxDelay - minDelay ) ));
			gotoAndStop( 1 );
		}
		
		private function onTimeout():void {
			play();
		}
		
	}

}