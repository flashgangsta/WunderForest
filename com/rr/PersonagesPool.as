package com.rr {
	import com.rr.personage.Personage;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	
	public class PersonagesPool {
		
		/// Экземпляр класса
		private static var instance:PersonagesPool;
		/// Список персонажей по их PID
		private var poolByIPID:Dictionary = new Dictionary();
		
		/**
		 * 
		 */
		
		public function PersonagesPool() {
			if ( instance ) throw new Error( "PersonagesPool is singletone, use PersonagesPool.getInstance()" );
		}
		
		/**
		 * 
		 * @return
		 */
		
		static public function getInstance():PersonagesPool {
			if ( !instance ) {
				instance = new PersonagesPool();
			}
			return instance;
		}
		
		/**
		 * Позиционирует и скалирует персонажа, возвращает ссылку на енго/
		 * @param	data
		 * @param	placeBounds
		 * @param	container
		 * @return
		 */
		
		public function getPersonage( data:PersonageData, placeBounds:Rectangle, container:Sprite ):Personage {
			var personage:Personage;
			
			if ( poolByIPID[ data.pid ] ) {
				personage = poolByIPID[ data.pid ];
				personage.updatePlacement( placeBounds, container );
				trace( "Personage", data.pid, "taken from pool." );
			} else {
				personage = createPersonage( data, placeBounds, container );
				trace( "Personage", data.pid, "created." );
			}
			
			return personage;
		}
		
		/**
		 * Создает экземпляр персонажа
		 * @param	data
		 * @param	placeBounds
		 * @param	container
		 * @return
		 */
		
		private function createPersonage( data:PersonageData, placeBounds:Rectangle, container:Sprite ):Personage {
			var personage:Personage = new Personage( placeBounds, container );
			poolByIPID[ data.pid ] = personage;
			personage.loadByData( data );
			
			return personage;
		}
		
	}

}