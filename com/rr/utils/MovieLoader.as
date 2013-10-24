package com.rr.utils {
	import com.flashgangsta.managers.MappingManager;
	import com.rr.events.ContentLoaderEvent;
	import com.rr.MiniPreloader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class MovieLoader extends ContentLoader {
		
		private var movie:MovieClip;
		private var preloaderPoint:Point;
		
		public function MovieLoader( path:String, container:Sprite, preloaderPoint:Point = null, autoLoad:Boolean = true ) {
			super();
			super.addEventListener( ContentLoaderEvent.LOAD_STARTED, onLoadStarted );
			super.addEventListener( ContentLoaderEvent.LOAD_COMPLETE, onLoaded );
			super.addEventListener( ContentLoaderEvent.DESTROY, destroyCalled );
			
			this.path = path;
			this.container = container;
			this.preloaderPoint = preloaderPoint;
			
			if( autoLoad ) load();
		}
		
		public function getMovie():MovieClip {
			return movie;
		}
		
		private function onLoadStarted( event:Event ):void {
			if ( loader.contentLoaderInfo.bytesTotal > 1024 * MIN_KB_SIZE_FOR_PRELOADER && ( preloaderPoint || ( container.width && container.height ) ) ) {
				preloader = new MiniPreloader();
				if ( preloaderPoint ) {
					preloader.x = preloaderPoint.x;
					preloader.y = preloaderPoint.y;
				} else {
					MappingManager.setAlign( preloader, container.getBounds( container.parent ) );
					
				}
				container.parent.addChild( preloader );
			}
		}
		
		private function onLoaded( event:Event ):void {
			movie = content as MovieClip;
			movie.gotoAndStop( 1 );
			container.addChild( movie );
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		private function destroyCalled( event:Event ):void {
			movie = null;
			preloaderPoint = null;
		}
		
	}

}