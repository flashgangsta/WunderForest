package com.rr {
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	
	public class ItemModelData extends ModelData {
		
		static public const PLACE_HEAD:String = "head";
		static public const PLACE_HAND:String = "hand";
		static public const PLACE_FOOT:String = "foot";
		static public const PLACE_GLASSES:String = "glasses";
		static public const PLACE_BODY:String = "body";
		static public const PLACE_ACCESSORY:String = "accessory";
		static public const PLACE_JAWELLERY:String = "jawellery";
		
		public function ItemModelData( data:Object ) {
			super();
			super.data = data;
		}
		
		/**
		 * Прочность предмета
		 */
		
		public function get durability():int {
			return data.durability;
		}
		
		public function get type():int {
			return data.type;
		}
		
		/**
		 * Возвращает флаг, отображающий является ли предмет предметом экипировки, т.е. одевается на персонажа.
		 */
		
		public function get isEquipment():Boolean {
			var result:Boolean;
			
			switch( type ) {
				case ItemModels.ITEM_FAY_EAR :
				case ItemModels.ITEM_FAY_HAND :
				case ItemModels.ITEM_FAY_FOOT :
				case ItemModels.ITEM_FAY_GLASSES :
				case ItemModels.ITEM_FAY_BOW:
				case ItemModels.ITEM_FAY_TIES :
				case ItemModels.ITEM_BOARS_EAR :
				case ItemModels.ITEM_BOARS_HAND :
				case ItemModels.ITEM_BOARS_FOOT :
				case ItemModels.ITEM_BOARS_GLASSES :
				case ItemModels.ITEM_BOARS_BOW :
				case ItemModels.ITEM_BOARS_TIES :
				case ItemModels.ITEM_HELMETS :
					result = true;
					break;				
				default :
					result = false;
			}
			return result;
		}
		
		/**
		 * Возвращает флаг, отображающий является ли предмет предметом интерьера, т.е. применяется для украшения норки.
		 */
		
		public function get isInteriorItem():Boolean {
			var result:Boolean;
			switch( type ) {
				case ItemModels.ITEM_BOARD :
				case ItemModels.ITEM_CARPET :
				case ItemModels.ITEM_CELLAR :
				case ItemModels.ITEM_DOOR :
				case ItemModels.ITEM_EXSCESS :
				case ItemModels.ITEM_FLOOR :
				case ItemModels.ITEM_LIGHT :
				case ItemModels.ITEM_MONEYBOX :
				case ItemModels.ITEM_PRETINNESS :
				case ItemModels.ITEM_TV :
				case ItemModels.ITEM_WINDOW :
					result = true;
					break;
				default :
					result = false;
			}
			return result;
		}
		
		/**
		 * Возвращает флаг, отображающий является ли предмет предметом рюкзака, т.е. применяется в бою.
		 */
		
		public function get isBagItem():Boolean {
			var result:Boolean;
			switch( type ) {
				case ItemModels.ITEM_ALCO :
				case ItemModels.ITEM_ANTIDOTE :
				case ItemModels.ITEM_BOMB :
				case ItemModels.ITEM_BRIBE :
				case ItemModels.ITEM_CARDIO :
				case ItemModels.ITEM_EAT :
				case ItemModels.ITEM_POISON :
				case ItemModels.ITEM_POLICY :
				case ItemModels.ITEM_SOUVENIRS :
					result = true;
					break;
				default :
					result = false;
			}
			return result;
		}
		
		/**
		 * Возвращает идентификатор места использования
		 */
		
		public function get placeOfUsing():String {
			var result:String;
			switch( type ) {
				case ItemModels.ITEM_HELMETS :
					result = PLACE_HEAD;
					break;
				case ItemModels.ITEM_BOARS_HAND :
				case ItemModels.ITEM_FAY_HAND :
					result = PLACE_HAND;
					break;
				case ItemModels.ITEM_BOARS_FOOT :
				case ItemModels.ITEM_FAY_FOOT :
					result = PLACE_FOOT;
					break;
			}
			return result;
		}
		
	}

}