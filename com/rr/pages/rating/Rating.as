﻿package com.rr.pages.rating {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.flashgangsta.managers.ButtonManager;
	import com.rr.Main;
	
	
	public class Rating extends MovieClip {
		
		public function Rating() {
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		private function init( event:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );
		}
	}
	
}
