package com.rr.pages.personagesShop {
	import com.flashgangsta.managers.ButtonManager;
	import com.rr.BlockedItemPanel;
	import com.rr.Entities;
	import com.rr.events.ColorSliderEvent;
	import com.rr.Helper;
	import com.rr.personage.Personage;
	import com.rr.PersonageModelData;
	import com.rr.Profile;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 *
	 */
	
	public class PersBoard extends MovieClip {
		
		/// Кнопка М
		private var maleBtn:MovieClip; 
		/// Кнопка Ж
		private var femaleBtn:MovieClip;	
		/// Поле с именем зверя
		private var nameLabel:TextField;
		/// Инпут поле с прозвищем зверя
		private var nickLabel:TextField;
		/// Поле с hp зверя
		private var hpLabel:TextField;
		/// Поле с настроением звея
		private var moodLabel:TextField;
		/// Поле с нервами зверя
		private var nerveLabel:TextField;
		/// Поле с сытостью зверя
		private var satietyLabel:TextField;
		/// Слайдер выбора цвета
		private var colorSlider:ColorSlider;
		/// Поле описания зверя
		private var descriptionLabel:TextField;
		/// Панель блокировки покупки
		private var blockPanel:BlockedItemPanel;
		/// Кнопка покупки зверя
		private var buyBtn:MovieClip;
		/// Лейба нового персонажа
		private var newIco:Sprite;
		
		
		public function PersBoard() {
			nameLabel = getChildByName( "name_txt" ) as TextField;
			nickLabel = getChildByName( "nick_txt" ) as TextField;
			hpLabel = getChildByName( "hpLabel_txt" ) as TextField;
			moodLabel = getChildByName( "moodLabel_txt" ) as TextField;
			nerveLabel = getChildByName( "nerveLabel_txt" ) as TextField;
			satietyLabel = getChildByName( "satietyLabel_txt" ) as TextField;
			maleBtn = getChildByName( "male_mc" ) as MovieClip;
			femaleBtn = getChildByName( "female_mc" ) as MovieClip;
			colorSlider = getChildByName( "colorSlider_mc" ) as ColorSlider;
			descriptionLabel = getChildByName( "description_txt" ) as TextField;
			blockPanel = getChildByName( "blockPanel_mc" ) as BlockedItemPanel;
			buyBtn = getChildByName( "buyBtn_mc" ) as MovieClip;
			newIco = getChildByName( "newIco_mc" ) as Sprite;
			
			ButtonManager.addButtonGroup( [ maleBtn, femaleBtn ], false, Helper.getProfile().sex === 1 ? femaleBtn : maleBtn, false, ButtonManager.STATE_PRESSED, changeSex );
			ButtonManager.addButton( buyBtn );
			
			nickLabel.text = "";
			colorSlider.addEventListener( ColorSliderEvent.DRAGGED, changePersColor );
		}
		
		/**
		 * Выводит данные о персонаже
		 * @param	data
		 */
		
		public function fillPersParams( data:PersonageModelData ):void {
			// Вывод параметров
			nameLabel.text = data.name;
			hpLabel.text = data.hp.toString();
			moodLabel.text = data.mood.toString();
			nerveLabel.text = data.nerve.toString();
			satietyLabel.text = data.satiety.toString();
			// Вывод описания
			descriptionLabel.text = data.description;
			// Новый ли персонаж
			newIco.visible = data.isNew;
			// Установка цены
			var profile:Profile = Helper.getProfile();
			var currency:String;
			var price:int;
			blockPanel.visible = profile.currentPersonage.level < data.minLvl;
			if ( blockPanel.visible ) {
				currency = Entities.GOLD;
				price = data.unlockPrice;
				blockPanel.setBlockByLevel( data.minLvl );
			} else {
				currency = Entities.NUT;
				price = data.price;
			}
			Helper.getComponentManager().fillBuyLabelButton( buyBtn, price, currency );
		}
		
		/**
		 * 
		 * @private methods
		 * 
		 */
		
		private function changePersColor( event:ColorSliderEvent ):void {
			//_personage.setColor( event.color );
		}
		
		private function changeSex( target:MovieClip ):void {
			//_personage.changeSex( target === maleBtn ? Personage.SEX_MALE : Personage.SEX_FEMALE );
		}
		
	}

}