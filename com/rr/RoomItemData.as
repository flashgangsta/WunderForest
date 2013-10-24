package com.rr {
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class RoomItemData {
		
		
		/// Данные о комнате
		private var data:Object;
		
		/**
		 * Конструктор
		 * @param	data
		 */
		
		public function RoomItemData( data:Object ) {
			this.data = data;
		}
		
		/**
		 * x коордната предмета
		 */
		
		public function get x():int {
			return data.x;
		}
		
		/**
		 * y координата предмета
		 */
		
		public function get y():int {
			return data.y;
		}
		
		/**
		 * Идентификатор предмета
		 */
		
		public function get id():int {
			return data.id;
		}
		
	}

}