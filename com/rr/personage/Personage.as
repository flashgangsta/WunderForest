﻿package com.rr.personage {	import com.flashgangsta.managers.MappingManager;	import com.rr.PersonageModelData;	import com.rr.utils.MovieLoader;	import flash.display.DisplayObject;	import flash.display.DisplayObjectContainer;	import flash.display.MovieClip;	import flash.display.Sprite;	import flash.events.Event;	import flash.events.EventDispatcher;	import flash.geom.Point;	import flash.geom.Rectangle;	import flash.utils.getDefinitionByName;	import flash.utils.getQualifiedClassName;		/**	 * ...	 * @author Sergey Krivtsov (flashgangsta@gmail.com)	 */		public class Personage extends EventDispatcher {				/// Удовольствие		static public const PLEASURE:String = "Pleasure";		/// Большая радость		static public const VERY_HAPPY:String = "VeryHappy";		/// Машет ручкой		static public const WAVE_HAND:String = "WaveHand";		/// Крутит барабан		static public const SPINS_REEL:String = "SpinsReel";		/// Стреляет в голову без пули		static public const GUN_TO_HEAD:String = "GunToHead";		/// Стоит и моргает (дефолтное состояние)		static public const WITHOUT_GUN:String = "WithoutGun";		/// Недовольство		static public const UNHAPPINESS:String = "UnHappiness";		/// Оглушен		static public const STUNED:String = "Stuned";		/// Убивает себя		static public const KILLSITSELF:String = "KillsItself";		/// Хихикает		static public const LAUGHT:String = "Laught";				/// Женский пол		static public const FEMALE:int = 0;		/// Мужской пол		static public const MALE:int = 1;				private var poseInstance:MovieClip;		private var displayedPose:MovieClip;		private var eyesController:EyesController = new EyesController();		private var loader:MovieLoader;		private var placeBounds:Rectangle;		private var container:Sprite;		private var preloaderPoint:Point;		private var instance:PersonageInstance;		private var currentPoseID:String = WITHOUT_GUN;		private var personageData:Object; //TODO: изменить на PersonageData		private var equipmentController:EquipmentController;		private var modelData:Object; //TODO: изменить тип		private var loaded:Boolean = false;		private var bodyBoundsObject:DisplayObject;		private var eyelidRight:Sprite;		private var eyelidLeft:Sprite;		private var eyelashRight:Sprite;		private var eyelashLeft:Sprite;		private var sex:int = Personage.MALE;				/**		 * Конструктор		 * @param	placeBounds		 * @param	container		 */				public function Personage( placeBounds:Rectangle, container:Sprite ) { //TODO: Поменять тип на PersonageModelData			updatePlacement( placeBounds, container );			eyesController.addEventListener( Event.COMPLETE, onEyesControllerComplete );		}				/**		 * 		 * @param	placeBounds		 * @param	container		 */				public function updatePlacement( placeBounds:Rectangle, container:Sprite ):void {			if ( this.placeBounds === placeBounds && this.container === container ) {				return;			}			this.placeBounds = placeBounds;			this.container = container;			preloaderPoint = new Point();			preloaderPoint.x = Math.round( placeBounds.x + ( placeBounds.width / 2 ) );			preloaderPoint.y = Math.round( placeBounds.y + ( placeBounds.height / 2 ) );						if ( loaded ) {				locateAndScale();			}		}				/**		 * Возвращает идентификатор проигрываемой в данный момент позы		 * @param	personageData		 */				public function getPoseID():String {			return currentPoseID;		}				/**		 * Загрузить персонажа по данным о нем (одетый)		 */				public function loadByData( personageData:Object ):void { //TODO: изменить тип personageData на PersonageData			this.personageData = personageData;			modelData = personageData;			equipmentController = new EquipmentController( personageData.equipmentList, personageData.sex );			loader = new MovieLoader( personageData.path, container, preloaderPoint );			loader.addEventListener( Event.COMPLETE, onLoaded );		}				/**		 * Загрузить персонажа по модели (голый)		 * @param	modelData		 */				public function loadByModel( modelData:Object ):void { //TODO: изменить тип modelData на PersonageModelData			this.modelData = modelData;			loader = new MovieLoader( modelData.path, container, preloaderPoint );			loader.addEventListener( Event.COMPLETE, onLoaded );		}				/**		 * Показывает позу		 * @param	poseID идентификатор необходимой позы		 */				public function showPose( poseID:String ):void {			if ( currentPoseID === poseID ) {				return;			}			poseInstance = instance.getPoseInstance( poseID );			poseInstance.stop();						currentPoseID = poseID;						if ( !displayedPose.hasEventListener( Event.COMPLETE ) ) {				displayedPose.addEventListener( Event.COMPLETE, onPoseComplete );				if( getQualifiedClassName( displayedPose ) === Personage.WITHOUT_GUN ) {					eyesController.stopBlinking();				}			}		}				/**		 * Применяет цвет к персонажу		 * @param	color		 */				public function setColor( color:uint ):void {			instance.setColor( color );			searchColorablePartAndSetColor( poseInstance );		}				/**		 * 		 * @param	object		 */				public function equip( equipmentList:Array ):void {			if ( !equipmentController ) {				equipmentController =  new EquipmentController( equipmentList )			} else {				equipmentController.reequip( equipmentList );			}		}				/**		 * 		 */				public function lock():void {			eyesController.pause();		}				/**		 * 		 */				public function unlock():void {			eyesController.resume();		}				/**		 * 		 */				public function show():void {			if( instance ) {				instance.visible = true;				unlock();			}		}				/**		 * 		 */				public function hide():void {			instance.visible = false;			lock();		}				/**		 * 		 * @return		 */				public function getModelData():Object { //TODO: поменять тип			return modelData;		}				/**		 * 		 * @return		 */				public function getInstance():PersonageInstance {			return instance;		}				/**		 * 		 * @param	event		 */				public function setSex( value:int = Personage.MALE ):void {			sex = value;			updateSex();		}				/**		 * 		 */				private function updateSex():void {			eyelidRight = poseInstance.getChildByName( "eyelidRight_mc" ) as Sprite;			eyelidLeft = poseInstance.getChildByName( "eyelidLeft_mc" ) as Sprite;			eyelashRight = poseInstance.getChildByName( "eyelashRight_mc" ) as Sprite;			eyelashLeft = poseInstance.getChildByName( "eyelashLeft_mc" ) as Sprite;						eyelashLeft.visible = eyelashRight.visible = eyelidLeft.visible = eyelidRight.visible = !Boolean( sex );		}				/**		 * 		 * @param	event		 */				private function onEyesControllerComplete( event:Event ):void {			displayedPose.dispatchEvent( new Event( Event.COMPLETE ) );		}				/**		 * 		 * @param	event		 */				private function onPoseComplete( event:Event ):void {			instance.removeChild( displayedPose );			displayedPose.removeEventListener( Event.COMPLETE, onPoseComplete );			addNewPose();		}				/**		 * 		 */				private function addNewPose():void {			instance.addChild( poseInstance );			setColor( instance.getColor() );			updateSex();			displayedPose = poseInstance;			if ( equipmentController ) {				equipmentController.equip( poseInstance );			}						if( currentPoseID !== Personage.WITHOUT_GUN ) {				// Что-бы не начинал сразу моргать				poseInstance.gotoAndPlay( 2 );			}						dispatchEvent( new Event( Event.CHANGE ) );						switch( getQualifiedClassName( displayedPose ) ) {				case Personage.WITHOUT_GUN :					eyesController.startBlinking( poseInstance );					break;				case Personage.PLEASURE :				case Personage.UNHAPPINESS :				case Personage.VERY_HAPPY :					setFinalToFirstFrame();					break; 				default :					setFinalToLastFrame();			}					}				/**		 * 		 */				private function setFinalToLastFrame():void {			displayedPose.addFrameScript( displayedPose.totalFrames - 1, onPosePlayed );		}				/**		 * 		 */				private function setFinalToFirstFrame():void {			displayedPose.addFrameScript( displayedPose.totalFrames - 1, playBackwards );		}				/**		 * Запускает проигрывание назад		 */				private function playBackwards():void {			displayedPose.addFrameScript( displayedPose.totalFrames - 1, null );			displayedPose.addFrameScript( 0, onPosePlayed );			displayedPose.stop();			displayedPose.addEventListener( Event.ENTER_FRAME, onEnterBackwardFrame );		}				/**		 * Переход на кадр при проигрывании назад		 * @param	event		 */				private function onEnterBackwardFrame( event:Event ):void {			displayedPose.gotoAndStop( displayedPose.currentFrame - 2 );		}				/**		 * Окончание проигрывания позы		 */				private function onPosePlayed():void {			if ( displayedPose.hasEventListener( Event.ENTER_FRAME ) ) {				displayedPose.removeEventListener( Event.ENTER_FRAME, onEnterBackwardFrame );			}			displayedPose.addFrameScript( displayedPose.currentFrame - 1, null );			displayedPose.stop();			if ( poseInstance === displayedPose ) {				showPose( Personage.WITHOUT_GUN );			}			displayedPose.dispatchEvent( new Event( Event.COMPLETE ) );		}				/**		 * 		 * @param	child		 */				private function searchColorablePartAndSetColor( child:DisplayObjectContainer ):void {			for ( var i:int = 0; i < child.numChildren; i++ ) {				var currentChild:DisplayObject = child.getChildAt( i );				if ( currentChild is ColorablePart ) {					ColorablePart( currentChild ).setColor();				} else if( currentChild is DisplayObjectContainer ) {					searchColorablePartAndSetColor( currentChild as DisplayObjectContainer );				}			}		}				/**		 * 		 * @param	event		 */				private function onLoaded( event:Event ):void {			loaded = true;			instance = loader.getContent() as PersonageInstance;			bodyBoundsObject = instance.getChildAt( 0 );			bodyBoundsObject.visible = false;						if( personageData ) {				instance.setColor( personageData.color );				sex = personageData.sex;			} else {				instance.setColor( modelData.color );			}						initPersonage();		}				/**		 * 		 */				private function initPersonage():void {			locateAndScale();						currentPoseID = Personage.WITHOUT_GUN;			poseInstance = instance.getPoseInstance( Personage.WITHOUT_GUN );			displayedPose = poseInstance;			eyesController.init( poseInstance );						instance.addChild( poseInstance );			setColor( instance.getColor() );			updateSex();			if ( equipmentController ) {				equipmentController.equip( poseInstance );			}			eyesController.startBlinking();		}				/**		 * 		 */				private function locateAndScale():void {			instance.scaleX = instance.scaleY = 1;			instance.x = instance.y = 0;			var bodyBounds:Rectangle;			var poseInstance:DisplayObject;						if ( instance.numChildren > 1 ) {				poseInstance = instance.getChildAt( 1 );				instance.removeChild( poseInstance );			}									container.addChild( instance );			MappingManager.setScaleByArea( instance, placeBounds );			bodyBounds = instance.getBounds( container );						instance.x = Math.round( placeBounds.x - bodyBounds.x + ( placeBounds.width - bodyBounds.width ) / 2 );			instance.y = Math.round( placeBounds.y - bodyBounds.y + placeBounds.height - bodyBounds.height );						if ( poseInstance ) {				instance.addChild( poseInstance );			}					}			}}