package com.rr {
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	
	public class RoomData {
		
		/// данные комнаты
		private var data:Object;
		/// список предметов в норе
		private var itemsList:Vector.<RoomItemData>;
		
		/**
		 * Конструктор
		 * @param	data
		 */
		
		public function RoomData( data:Object ) {
			this.data = data;
			recordItems();
		}
		
		/**
		 * Ай ди конкретного персонажа жвущего в этой комнете
		 */
		
		public final function get pid():int {
			return data.pid;
		}
		
		/**
		 * Список предметов имеющихся в норе
		 */
		
		public final function get items():Vector.<RoomItemData> {
			return itemsList;
		}
		
		/**
		 * Записывает предметы
		 */
		
		private function recordItems():void {
			itemsList = new Vector.<RoomItemData>();
			var items:Array = data.items;
			for ( var i:int = 0; i < items.length; i++ ) {
				var itemData:RoomItemData = new RoomItemData( items[ i ] );
				itemsList.push( itemData );
			}
		}
	}

}