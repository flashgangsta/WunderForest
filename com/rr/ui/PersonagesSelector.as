package com.rr.ui {
	import com.rr.events.ItemsListLineEvent;
	import com.rr.Helper;
	import com.rr.PersonageData;
	import com.rr.Profile;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * Срабатывает после того как пользвователь изменит выбранную
	 * страницу средствами клика по кнопки данного компонента
	 * @eventType	flash.events.Event.CHANGE
	 */
	[Event(name="change", type="flash.events.Event")]
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */

	public class PersonagesSelector extends ItemsListLine {
		
		/// Поле с именем персонажа
		private var label:TextField;
		/// Ссылка на профиль пользователя
		private var profile:Profile;
		/// Список данных о имеющихся у пользователя персонажах
		private var personagesList:Vector.<PersonageData>;
		
		/**
		 * Конструктор
		 */
		
		public function PersonagesSelector() {
			profile = Helper.getProfile();
			label = getChildByName( "label_txt" ) as TextField;
			update();
			addEventListener( ItemsListLineEvent.GO_TO_NEXT, change );
			addEventListener( ItemsListLineEvent.GO_TO_PREV, change );
		}
		
		/**
		 * Обновляет данные о списке персонажей и выстраивает работу компонента руководствуясь свежими данными
		 */
		
		public function update():void {
			reset();
			personagesList = profile.personagesList;
			maxStep = personagesList.length - 1;
			for ( var i:int = 0; i < personagesList.length; i++ ) {
				var currentPersonageData:PersonageData = personagesList[ i ];
				if ( currentPersonageData.pid === profile.currentPersonage.pid ) {
					step = i;
					break;
				}
			}
			setLabel();
		}
		
		/**
		 * Прячет компонент
		 */
		
		public function hide():void {
			visible = false;
		}
		
		/**
		 * Показывает компонент
		 */
		
		public function show():void {
			visible = true;
		}
		
		/**
		 * Возвращает данные выбранного персонажа
		 * @return
		 */
		
		public function getSelectedPersonage():PersonageData {
			return personagesList[ step ];
		}
		
		/**
		 * Показывает имя выбранного персонажа
		 */
		
		private function setLabel():void {
			label.text = personagesList[ step ].name;
		}
		
		/**
		 * Обработка нажатия кнопок "назад" и "вперед"
		 * @param	event
		 */
		
		private function change( event:ItemsListLineEvent ):void {
			setLabel();
			dispatchEvent( new Event( Event.CHANGE ) );
		}
		
	}

}