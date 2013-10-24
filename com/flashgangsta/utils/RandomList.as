package com.flashgangsta  {
	
	public class RandomList extends Array {

		public function RandomList() {
			// constructor code
		}
		
		private static var list:Array = [];
		
		
		private static function generateRandomList( arr:Array ):Array {
			arr.sort( function (a, b) {
				var rn = Math.random();
				return ( rn < 0.33 ) ? -1 : ( rn < 0.66 ? 1 : 0 );
			});
			return arr;
		}

		public static function get( from:Number, to:Number ):Array {
			list = [];
			for ( var i:Number = from; i <= to; i++ ) {
				list.push(i);
			}
			return generateRandomList( list );
		}
		
	}
	
}
