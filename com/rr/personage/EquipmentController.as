package com.rr.personage {
	import com.flashgangsta.utils.NumUtils;
	import com.rr.utils.MovieLoader;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class EquipmentController {
		
		static public const SLOT_HEAD:int = 0;
		static public const SLOT_GLASSES:int = 1;
		static public const SLOT_ACCESSORY:int = 2;
		static public const SLOT_BODY:int = 3;
		static public const SLOT_JAWELLERY:int = 4;
		static public const SLOT_HAND_RIGHT:int = 5;
		static public const SLOT_HAND_LEFT:int = 6;
		static public const SLOT_FOOT_RIGHT:int = 7;
		static public const SLOT_FOOT_LEFT:int = 8;
		
		private var sex:int;
		
		private var equipmentList:Array;
		private var helmetContainer:EquipmentContainer;
		private var glassesContainer:EquipmentContainer;
		private var accessoryContainer:EquipmentContainer;
		private var jawelleryContainer:EquipmentContainer;
		private var handRightContainer:EquipmentContainer;
		private var handLeftContainer:EquipmentContainer;
		private var footRightContainer:EquipmentContainer;
		private var footLeftContainer:EquipmentContainer;
		
		private var helmet:Sprite;
		private var glasses:Sprite;
		private var accessory:Sprite;
		private var jawellery:Sprite;
		private var handRight:Sprite;
		private var handLeft:Sprite;
		private var footRight:Sprite;
		private var footLeft:Sprite;
		
		
		private var helmetLoader:MovieLoader;
		private var glassesLoader:MovieLoader;
		private var accessoryLoader:MovieLoader;
		private var jawelleryLoader:MovieLoader;
		private var handRightLoader:MovieLoader;
		private var handLeftLoader:MovieLoader;
		private var footRightLoader:MovieLoader;
		private var footLeftLoader:MovieLoader;
		
		/**
		 * 
		 * @param	equipmentList
		 */
		
		public function EquipmentController( equipmentList:Array, sex:int = 1 ) {
			this.sex = sex;
			this.equipmentList = new Array().concat( equipmentList );
		}
		
		/**
		 * Одевает либо неодетого персонажа либо при смене позы
		 * @param	poseInstance
		 */
		
		public function equip( poseInstance:MovieClip ):void {
			helmetContainer = poseInstance.getChildByName( "helm_mc" ) as EquipmentContainer;
			glassesContainer = poseInstance.getChildByName( "glasses_mc" ) as EquipmentContainer;
			accessoryContainer = poseInstance.getChildByName( sex ? "accessory_mc" : "accessoryGirl_mc" ) as EquipmentContainer;
			jawelleryContainer = poseInstance.getChildByName( "jawellery_mc" ) as EquipmentContainer;
			handRightContainer = poseInstance.getChildByName( "handRight_mc" ) as EquipmentContainer;
			handLeftContainer = poseInstance.getChildByName( "handLeft_mc" ) as EquipmentContainer;
			footRightContainer = poseInstance.getChildByName( "footRight_mc" ) as EquipmentContainer;
			footLeftContainer = poseInstance.getChildByName( "footLeft_mc" ) as EquipmentContainer;
			
			
			trace( "equip:", equipmentList );
			
			for ( var i:int = 0; i < equipmentList.length; i++ ) {
				loadItem( i );
			}
		}
		
		/**
		 * 
		 */
		
		private function loadItem( slot:int ):void {
			var itemID:int = equipmentList[ slot ];
			var loader:MovieLoader;
			
			if ( !itemID ) return;
			
			switch( slot ) {
				case EquipmentController.SLOT_HEAD :
					if ( helmet ) {
						helmetContainer.addChild( helmet );
					} else {
						loader = helmetLoader = new MovieLoader( "items/helmets/helmet" + NumUtils.toTwoDigit( itemID ) + ".swf", helmetContainer );
						trace( "helmetLoader created" );
					}
					break;
				case EquipmentController.SLOT_GLASSES :
					if ( glasses ) {
						glassesContainer.addChild( glasses );
					} else {
						loader = glassesLoader = new MovieLoader( "items/glasses/glasses" + NumUtils.toTwoDigit( itemID ) + ".swf", glassesContainer );
						trace( "glassesLoader created" );
					}
					break;
				case EquipmentController.SLOT_ACCESSORY :
					if ( accessory ) {
						accessoryContainer.addChild( accessory );
					} else {
						loader = accessoryLoader = new MovieLoader( "items/bows/bow" + NumUtils.toTwoDigit( itemID ) + ".swf", accessoryContainer );
						trace( "accessoryLoader created" );
					}
					break;
				case EquipmentController.SLOT_JAWELLERY :
					if ( jawellery ) {
						jawelleryContainer.addChild( jawellery );
					} else {
						loader = jawelleryLoader = new MovieLoader( "items/chains/chain" + NumUtils.toTwoDigit( itemID ) + ".swf", jawelleryContainer );
						trace( "jawelleryLoader created" );
					}
					break;
				case EquipmentController.SLOT_HAND_RIGHT :
					if ( handRight ) {
						handRightContainer.addChild( handRight );
					} else {
						loader = handRightLoader = new MovieLoader( "items/handBracelets/handBracelet" + NumUtils.toTwoDigit( itemID ) + ".swf", handRightContainer );
						trace( "handRightLoaded created" );
					}
					break;
				case EquipmentController.SLOT_HAND_LEFT :
					if ( handLeft ) {
						handLeftContainer.addChild( handLeft );
					} else {
						loader = handLeftLoader = new MovieLoader( "items/handBracelets/handBracelet" + NumUtils.toTwoDigit( itemID ) + ".swf", handLeftContainer );
					}
					break;
				case EquipmentController.SLOT_FOOT_RIGHT :
					if ( footRight ) {
						footRightContainer.addChild( footRight );
					} else {
						loader = footRightLoader = new MovieLoader( "items/footBracelets/footBracelet" + NumUtils.toTwoDigit( itemID ) + ".swf", footRightContainer );
					}
					break;
				case EquipmentController.SLOT_FOOT_LEFT :
					if ( footLeft ) {
						footLeftContainer.addChild( footLeft );
					} else {
						loader = footLeftLoader = new MovieLoader( "items/footBracelets/footBracelet" + NumUtils.toTwoDigit( itemID ) + ".swf", footLeftContainer );
					}
					break;
			}
			if ( loader ) {
				loader.addEventListener( Event.COMPLETE, onItemLoaded );
			}
		}
		
		/**
		 * 
		 * @param	equipmentList
		 */
		
		public function reequip( equipmentList:Array ):void {
			var lastEquipmetList:Array = this.equipmentList;
			
			for ( var i:int = 0; i < equipmentList.length; i++ ) {
				if ( lastEquipmetList[ i ] !== equipmentList[ i ] ) {
					this.equipmentList[ i ] = equipmentList[ i ];
					
					switch( i ) {
						case EquipmentController.SLOT_HEAD :
							removeLoader( helmetLoader );
							helmetContainer.removeChildren();
							helmet = null;
							break;
						case EquipmentController.SLOT_GLASSES :
							removeLoader( glassesLoader );
							glassesContainer.removeChildren();
							glasses = null;
							break;
						case EquipmentController.SLOT_ACCESSORY :
							removeLoader( accessoryLoader );
							accessoryContainer.removeChildren();
							accessory = null;
							break;
						case EquipmentController.SLOT_JAWELLERY :
							removeLoader( jawelleryLoader );
							jawelleryContainer.removeChildren();
							jawellery = null;
							break;
						case EquipmentController.SLOT_HAND_RIGHT :
							removeLoader( handRightLoader );
							handRightContainer.removeChildren();
							handRight = null;
							break;
						case EquipmentController.SLOT_HAND_LEFT :
							removeLoader( handLeftLoader );
							handLeftContainer.removeChildren();
							handLeft = null;
							break;
						case EquipmentController.SLOT_FOOT_RIGHT :
							removeLoader( footRightLoader );
							footRightContainer.removeChildren();
							footRight = null;
							break;
						case EquipmentController.SLOT_FOOT_LEFT :
							removeLoader( footLeftLoader );
							footLeftContainer.removeChildren();
							footLeft = null;
							break;
					}
					
					loadItem( i );
				}
			}
		}
		
		/**
		 * 
		 * @param	event
		 */
		
		private function onItemLoaded( event:Event ):void {
			var loader:MovieLoader = event.currentTarget as MovieLoader;
			var content:Sprite = loader.getContent() as Sprite;
			
			switch( loader ) {
				case helmetLoader :
					helmet = content;
					trace( "helmet loaded" );
					break;
				case glassesLoader :
					glasses = content;
					trace( "glasses loaded" );
					break;
				case accessoryLoader :
					accessory = content;
					trace( "accessory loaded" );
					break;
				case jawelleryLoader :
					jawellery = content;
					trace( "jawellery loaded" );
					break;
				case handRightLoader :
					handRight = content;
					trace( "handRight loaded" );
					break;
				case handLeftLoader :
					handLeft = content;
					trace( "handLeft loaded" );
					break;
				case footRightLoader :
					footRight = content;
					trace( "footRight loaded" );
					break;
				case footLeftLoader :
					footLeft = content;
					trace( "footLeft loaded" );
					break;
			}
			
			removeLoader( loader );
		}
		
		/**
		 * 
		 */
		
		private function removeLoader( loader:MovieLoader ):void {
			if ( !loader ) return;
			loader.removeEventListener( Event.COMPLETE, onItemLoaded );
			loader.destroy();
			
			switch( loader ) {
				case helmetLoader :
					trace( "helmetLoader removed" );
					helmetLoader = null;
					break;
				case glassesLoader :
					trace( "glassesLoader removed" );
					glassesLoader = null;
					break;
				case accessoryLoader :
					trace( "accessoryLoader removed" );
					accessoryLoader = null;
					break;
				case jawelleryLoader :
					trace( "jawelleryLoader removed" );
					jawelleryLoader = null;
					break;
				case handRightLoader :
					trace( "handRightLoaded removed" );
					handRightLoader = null;
					break;
				case handLeftLoader :
					trace( "handLeftLoaded removed" );
					handLeftLoader = null;
					break;
				case footRightLoader :
					trace( "footRightLoader removed" );
					footRightLoader = null;
					break;
				case footLeftLoader :
					trace( "footLeftLoader removed" );
					footLeftLoader = null;
					break;
			}
			
			loader = null;
		}
	}

}