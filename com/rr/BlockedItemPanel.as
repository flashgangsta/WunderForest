package com.rr {
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class BlockedItemPanel extends Sprite {
		
		/// Текстовое поле с сообщением
		private var label:TextField;
		
		/**
		 * Конструктор
		 */
		
		public function BlockedItemPanel() {
			label = getChildByName( "label_txt" ) as TextField;
		}
		
		/**
		 * Устанавливает блокировку по уровню
		 * @param	level
		 */
		
		public function setBlockByLevel( level:int ):void {
			label.text = "Ждать до " + level + "-го уровня\nили прямо сейчас";
		}
		
	}

}