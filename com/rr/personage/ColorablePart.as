package com.rr.personage {
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class ColorablePart extends Sprite {
		
		public function ColorablePart() {
			
		}
		
		public function getColor():uint {
			var color:uint = 0;
			if ( root ) {
				color = PersonageInstance( root ).getColor();
			}
			return color;
		}
		
		public function setColor():void {
			
		}
		
	}

}