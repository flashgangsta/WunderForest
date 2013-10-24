package com.rr.ui {
	import com.flashgangsta.managers.ButtonManager;
	import com.rr.events.ItemsListLineEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Срабатывает после того как пользвователь нажмает кнопку "Вперед"
	 * @eventType	com.rr.events.ItemsListLineEvent.GO_TO_NEXT
	 */
	[ItemsListLineEvent( name = "gotoNext", type = "com.rr.events.ItemsListLineEvent" )];
	
	/**
	 * Срабатывает после того как пользвователь нажмает кнопку "Назад"
	 * @eventType	com.rr.events.ItemsListLineEvent.GO_TO_PREV
	 */
	[ItemsListLineEvent(name = "gotoPrev", type = "com.rr.events.ItemsListLineEvent" )];
	
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
	public class ItemsListLine extends Sprite {
		
		protected const DISABLE_ARROW_ALPHA:Number = .2;
		
		/// Кнопка назад
		protected var prevBtn:MovieClip;
		/// Кнопка вперед
		protected var nextBtn:MovieClip;
		/// Предыдущий шаг
		protected var oldStep:int;
		
		/// Текущий шаг
		private var _step:int = 0;
		/// Максимальнй шаг
		private var _maxStep:int;
		
		/**
		 * Конструктор
		 */
		
		public function ItemsListLine() {
			prevBtn = getChildByName( "prev_mc" ) as MovieClip;
			nextBtn = getChildByName( "next_mc" ) as MovieClip;
			ButtonManager.addButton( prevBtn, null, prevBtnClicked );
			ButtonManager.addButton( nextBtn, null, nextBtnClicked );
			ButtonManager.setButtonEnable( prevBtn, false, true, DISABLE_ARROW_ALPHA );
			ButtonManager.setButtonEnable( nextBtn, false, true, DISABLE_ARROW_ALPHA );
		}
		
		/**
		 * Сбрасывает значения шагов на ноль
		 */
		
		protected function reset():void {
			step = 0;
			maxStep = 0;
			oldStep = 0;
		}
		
		/**
		 * Устанавливает значение максимального шага.
		 * Показывает или прячет кнопки если шаг есть или нету
		 * Если шаг есть устанавливает доступность кнопки "Вперед"
		 */
		
		protected function set maxStep( value:int ):void {
			_maxStep = value;
			prevBtn.visible = nextBtn.visible = Boolean( _maxStep );
			ButtonManager.setButtonEnable( nextBtn, nextBtn.visible, true, DISABLE_ARROW_ALPHA );
		}
		
		protected function get maxStep():int {
			return _maxStep;
		}
		
		protected function set step( value:int ):void {
			oldStep = _step;
			_step = value;
			
			if ( _step === 0 && prevBtn.enabled ) {
				ButtonManager.setButtonState( prevBtn, ButtonManager.STATE_OUT );
				ButtonManager.setButtonEnable( prevBtn, false, true, DISABLE_ARROW_ALPHA );
			}
			
			if ( _step < _maxStep && !nextBtn.enabled ) {
				ButtonManager.setButtonEnable( nextBtn, true, true, DISABLE_ARROW_ALPHA );
			}
			
			if ( _step === _maxStep && nextBtn.enabled ) {
				ButtonManager.setButtonState( nextBtn, ButtonManager.STATE_OUT );
				ButtonManager.setButtonEnable( nextBtn, false, true, DISABLE_ARROW_ALPHA );
			}
			
			if ( _step > 0 && !prevBtn.enabled ) {
				ButtonManager.setButtonEnable( prevBtn, true, true, DISABLE_ARROW_ALPHA );
			}
		}
		
		/**
		 * Возвращает текущий шаг страницы
		 */
		
		protected function get step():int {
			return _step;
		}
		
		/**
		 * Считает и возвращает максимально возможное количесто шагов
		 * @param	displayedLength кол-во отбъектов отображающееся на экане
		 * @param	itemsLength общее кол-во имеющихся объектов
		 * @return
		 */
		
		protected function calculateMaxStep( displayedLength:int, itemsLength:int ):int {
			return Math.max( 0, Math.ceil( ( itemsLength - displayedLength ) / displayedLength ) );
		}
		
		private function prevBtnClicked( target:MovieClip ):void {
			oldStep = step;
			step --;
			dispatchEvent( new ItemsListLineEvent( ItemsListLineEvent.GO_TO_PREV ) );
		}
		
		private function nextBtnClicked( target:MovieClip ):void {
			oldStep = step;
			step ++;
			dispatchEvent( new ItemsListLineEvent( ItemsListLineEvent.GO_TO_NEXT ) );
		}
		
	}

}