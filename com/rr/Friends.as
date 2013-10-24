﻿package com.rr {
	
	public class Friends {
		
		
		public static const UID:String = "uid";
		public static const FIRST_NAME:String = "first_name";
		public static const LAST_NAME:String = "last_name";
		public static const NICKNAME:String = "nickname";
		public static const PHOTO_MEDIUM:String = "photo_medium";

		/// Список друзей установивших приложение
		public static var friendsList:Array = [];
		/// Список друзей не установивших приложение
		public static var allFriendsList:Array = [];
		
		private static var appUsersUids:String = "";
		
		public function Friends() {
			throw new Error( "User is a static class" );
		}
		
		public static function recordFriends( appUsersProfilesList:Object, allFriendsListData:Object ):void {
			for( var i:int = 0; i < appUsersProfilesList.length; i++ ) {
				var user:Object = appUsersProfilesList[ i ];
				friendsList[ i ] = user;
				appUsersUids += user[ UID ] + " ";
			}
			
			for( i = 0; i < allFriendsListData.length; i++ ) {
				user = allFriendsListData[ i ];
				if( appUsersUids.indexOf( user[ UID ] ) === -1 ) {
					allFriendsList.push( user );
				}
			}
			
		}
		
		public static function getFriend( num:int ):Object {
			return friendsList[ num ];
		}
		
		public static function getFriendFromAll( num:int ):Object {
			return allFriendsList[ num ];
		}
		
	}
	
}
