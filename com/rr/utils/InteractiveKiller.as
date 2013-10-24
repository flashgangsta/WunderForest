package com.rr.utils {
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class InteractiveKiller {
		
		public function InteractiveKiller() {
			
		}
		
		public static function kill( ...items ):void {
			for ( var i:int = 0; i < items.length; i++ ) {
				var item:InteractiveObject = items[ i ];
				item.mouseEnabled = false;
				if ( item is Sprite ) {
					Sprite( item ).mouseChildren = false;
				}
			}
		}
		
	}

}