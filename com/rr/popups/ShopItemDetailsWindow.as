package com.rr.popups {
	import com.flashgangsta.managers.MappingManager;
	import com.rr.BlockedItemPanel;
	import com.rr.Entities;
	import com.rr.Helper;
	import com.rr.ModelData;
	import com.rr.Profile;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	
	public class ShopItemDetailsWindow extends Popup {
		
		/// Модель предмета
		protected var itemData:ModelData;
		
		/// Зона установки превью предмета
		private var previewPlace:Sprite;
		/// Кнопка покупки предмета (с ценником)
		private var priceBtn:MovieClip;
		/// Панель блокировки покупки
		private var blockPanel:BlockedItemPanel;
		
		
		/**
		 * Конструктор
		 */
		
		public function ShopItemDetailsWindow() {
			super( true );
			
			previewPlace = getChildByName( "previewPlace_mc" ) as Sprite;
			priceBtn = getChildByName( "price_mc" ) as MovieClip;
			blockPanel = getChildByName( "blockPanel_mc" ) as BlockedItemPanel;
			
			label.text = itemData.name;
			
			setPrice();
		}
		
		/**
		 * Добавляет превью предмета
		 * @param	preview
		 */
		
		public function addPreview( preview:BitmapData ):void {
			var bitmap:Bitmap = new Bitmap( preview, "auto", true );
			addChild( bitmap );
			MappingManager.setScaleOnlyReduce( bitmap, previewPlace.width, previewPlace.height );
			MappingManager.setAlign( bitmap, previewPlace.getBounds( this ) );
		}
		
		/**
		* Заполняет кнопку-ценник и доступность по уровню
		*/
		
		private function setPrice():void {
			var profile:Profile = Helper.getProfile();
			var minLvl:int = itemData.minLvl;
			var price:int;
			var currency:String;
			
			blockPanel.visible = profile.currentPersonage.level < minLvl;
			
			if ( blockPanel.visible ) {
				currency = Entities.GOLD;
				price = itemData.unlockPrice;
				blockPanel.setBlockByLevel( minLvl );
			} else {
				currency = Entities.NUT;
				price = itemData.price;
			}
			Helper.getComponentManager().fillBuyLabelButton( priceBtn, price, currency );
		}
		
	}

}