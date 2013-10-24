package com.rr.utils {
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class Definitier {
		public function Definitier() {
			throw new Error( "Definitier is a static class" );
		}
		
		/**
		 * Эта штука невероятным образом выравнивает кривые кнопки
		 * У некоторых кнопок появляются артефакты.
		 * @param	...objects
		 */
		
		public static function addDefinition( ...objects ):void {
			
			for ( var i:int = 0; i < objects.length; i++ ) {
				var currentObject = objects[ i ];
				
				if ( currentObject is Array ) {
					for ( var j = 0; j < currentObject.length; j++ ) {
						Definitier.start( currentObject[ j ] );
					}
				} else {
					Definitier.start( currentObject );
				}
			}
			
		}
		
		private static function start( object:MovieClip ):void {
			var factFrame:int = object.currentFrame;
			object.gotoAndStop( factFrame === object.totalFrames ? 1 : object.totalFrames );
			object.gotoAndStop( factFrame );
		}
	}
	
}