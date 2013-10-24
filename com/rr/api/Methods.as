package com.rr.api {
	
	public class Methods {

		public static const getStaticItems:String = "getStaticItems";
		public static const getProfile:String = "getProfile";
		public static const getItems:String = "getItems";
		public static const buyPersonage:String = "buyPersonage";
		public static const buyItem:String = "buyItem";
		public static const eatItem:String = "eatItem";
		public static const useItem:String = "useItem";
		public static const dressItem:String = "dressItem";
		public static const removeItem:String = "removeItem";
		public static const repairItem:String = "repairItem";
		public static const getRooms:String = "getRooms";
		public static const enterRoom:String = "enterRoom";
		public static const createRoom:String = "createRoom";
		
		
		public function Methods() {
			throw new Error( "Methods is a static class" );
		}

	}
	
}
