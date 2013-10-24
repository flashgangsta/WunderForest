package com.rr.personage {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class EyesController extends EventDispatcher {
		
		/// Минимальная пауза между морганиями
		static private const MIN_BLINK_PAUSE:int = 3000;
		/// Максимальная пауза между морганиями
		static private const MAX_BLINK_PAUSE:int = 5000; // Частота моргания глаза составляет в норме 12—20 раз в минуту (одно моргание каждые 3-5 секунды) 
		/// отклонение от нормы
		static private const ABERRATION:int = 500;
		
		/// Максимальное выдаваемое случайное значение паузы между морганиями
		private var maxRandomTwinkValue:int = ( MAX_BLINK_PAUSE + ABERRATION ) - ( MIN_BLINK_PAUSE + ABERRATION );
		/// Таймер отсчета 
		private var timer:Timer = new Timer( 0, 1 );
		/// Ссылка на клип с анимацией позы
		private var instance:MovieClip;
		/// Номер последнего кадра
		private var lastFrame:int;
		/// Первый кадр паузы между морганиями
		private var noBlinkBegin:int;
		/// Последний кадр паузы между морганиями
		private var noBlinkEnd:int;
		/// Длина паузы между морганиями
		private var noBlinkLength:int;
		
		/**
		 * Конструктор
		 */
		
		public function EyesController() {
			timer.addEventListener( TimerEvent.TIMER, onTimer );
		}
		
		/**
		 * Начинает отсчет и воспроизведение моргания глаз
		 * @param	instance
		 */
		
		public function startBlinking( poseInstance:MovieClip = null ):void {
			if ( poseInstance ) instance = poseInstance;
			instance.addFrameScript( lastFrame, onLastFrame );
			instance.gotoAndStop( 1 );
			startBlinkTimer();
		}
		
		/**
		 * Проигрываеит последний цикли и останавливает отсчет и воспроизведение моргание глаз
		 */
		
		public function stopBlinking():void {
			if ( timer.running ) {
				timer.stop();
				trace( "Последний кадр, таймер запущен" );
				onLastFrameAndStopCalled();
				// Последний кадр, таймер запущен
			} else {
				var currentFrame:int = instance.currentFrame;
				if ( currentFrame >= noBlinkBegin && currentFrame <= noBlinkEnd ) {
					// Между морганиями
					trace( "Между морганиями" );
					onLastFrameAndStopCalled();
				} else {
					if ( currentFrame < noBlinkBegin ) {
						// В процессе моргания, допаузы между морганиями
						trace( "В процессе моргания, до паузы между морганиями" );
						instance.addEventListener( Event.ENTER_FRAME, onEnterFrame );
					} else {
						// В процессе моргания, после паузы между морганиями
						trace( "В процессе моргания, после паузы между морганиями" );
						instance.addFrameScript( instance.totalFrames - 1, onLastFrameAndStopCalled );
					}
				}
			}
		}
		
		/**
		 * Приостанавливает проигрывание моргания персонажа
		 */
		
		public function pause():void {
			trace( timer.running );
			if ( timer.running ) {
				timer.stop();
			} else {
				instance.stop();
			}
		}
		
		/**
		 * Возобновляет проигрывание моргания персонажа
		 */
		
		public function resume():void {
			if ( instance.currentFrame === instance.totalFrames ) {
				timer.start();
			} else {
				instance.play();
			}
		}
		
		/**
		 * 
		 * @param	poseInstance
		 */
		
		public function init( poseInstance:MovieClip ):void {
			instance = poseInstance;
			lastFrame = instance.totalFrames - 1;
			instance.gotoAndStop( "noBlinkBegin" );
			noBlinkBegin = instance.currentFrame;
			instance.gotoAndStop( "noBlinkEnd" );
			noBlinkEnd = instance.currentFrame;
			noBlinkLength = noBlinkEnd - noBlinkBegin;
		}
		
		/**
		 * Слушает проигрывание до перехода на кадр начала паузы между морганием, убивает слушатель, и диспатчит событие о завершении работы контроллера глаз
		 * @param	event
		 */
		
		private function onEnterFrame( event:Event ):void {
			if ( instance.currentFrame === noBlinkBegin ) {
				trace( "на кадре между морганиями" );
				instance.removeEventListener( Event.ENTER_FRAME, onEnterFrame );
				onLastFrameAndStopCalled();
			}
		}
		
		/**
		 * Диспатчит событие об окончании и остановке отсчета и проигрывания моргания глаз
		 */
		
		private function onLastFrameAndStopCalled():void {
			instance.stop();
			instance.addFrameScript( instance.totalFrames - 1, null );
			trace( "Моргание отработано, можно менять позу" );
			dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
		/**
		 * Обработка окончания проигрывания цикла моргания глаз
		 */
		
		private function onLastFrame():void {
			instance.stop();
			startBlinkTimer();
		}
		
		/**
		 * Запускает отсчет паузы между морганиями
		 */
		
		private function startBlinkTimer():void {
			var delay:Number = getRandomDelay();
			timer.delay = delay;
			timer.start();
		}
		
		/**
		 * Высчитывает значение паузы между морганием
		 * @return
		 */
		
		private function getRandomDelay():int {
			var randomValue:int = Math.round( Math.random() * maxRandomTwinkValue );
			return MIN_BLINK_PAUSE + randomValue;
		}
		
		/**
		 * Обработка истечения времени выделенного на паузу между морганием глаз
		 * @param	event
		 */
		
		private function onTimer( event:TimerEvent ):void {
			var frame:int;
			if ( Math.random() > .5 ) {
				frame = 2;
			} else {
				frame = noBlinkBegin + Math.round( Math.random() * noBlinkLength );
			}
			instance.gotoAndPlay( frame );
		}
		
	}

}