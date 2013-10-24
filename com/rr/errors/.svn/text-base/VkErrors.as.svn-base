package com.rr.errors {
	
	public class VkErrors {

		public function VkErrors() {
			// constructor code
		}
		
		public static function isApiUserError( data:Object ):void {
			throw new Error( "isApiUserError: " + data );
		}
		
		public static function getBalanceError( data:Object ):void {
			throw new Error( "getBalanceError: " + data.error_msg );
		}
		
		public static function checkRegError():void {
			throw new Error( "checkRegError" );
		}
		
		public static function buyPersonageError():void {
			throw new Error( "buyPersonageError" );
		}
		
		public static function getProfileError():void {
			throw new Error( "getProfileError" );
		}
		
		public static function personalDataError():void {
			throw new Error( "personalDataError" );
		}
		
		public static function appUsersError( data:Object ):void {
			throw new Error( "appUsersError: " + data.error_msg );
			/*Permission to perform this action is denied by user*/
		}
		
		public static function appAppUsersProfiles( data:Object ):void {
			throw new Error( "appAppUsersProfiles: " + data.error_msg );
		}
		
		public static function allFriends( data:Object ):void {
			throw new Error( "friends: " + data.error_msg );
		}
		
	}
	
}
