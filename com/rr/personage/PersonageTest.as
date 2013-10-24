package com.rr.personage {
	import com.flashgangsta.utils.NumUtils;
	import com.rr.DebugDatas;
	import com.rr.utils.BitmapLoader;
	import fl.controls.Button;
	import fl.controls.ColorPicker;
	import fl.controls.Slider;
	import fl.events.ColorPickerEvent;
	import fl.events.ComponentEvent;
	import fl.events.SliderEvent;
	import flash.display.Bitmap;
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flashx.textLayout.property.StringPropertyHandler;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	
	public class PersonageTest extends Sprite {
		
		static private const HELMETS_LENGTH:int = 45;
		static private const GLASSES_LENGTH:int = 10;
		static private const TIES_LENGTH:int = 5;
		static private const BOWTIES_LENGTH:int = 5;
		
		private var personageData:Object = { };
		private var personage:Personage;
		private var personage2:Personage;
		private var controlledPersonage:Personage;
		private var selectedBtn:Button;
		private var withoutGunBtn:Button;
		private var waveHand:Button;
		private var gunToHead:Button;
		private var stuned:Button;
		private var pleasure:Button;
		private var veryHappy:Button;
		private var spinsReel:Button;
		private var laught:Button;
		private var killsItself:Button;
		private var unHappiness:Button;
		private var pauseBtn:Button;
		private var changeContainerBtn:Button;
		private var colorPicker:ColorPicker;
		private var fpsSlider:Slider;
		private var loadedHelms:int = 0;
		private var loadedGlasses:int = 0;
		private var loadedTies:int = 0;
		private var loadedBowties:int = 0;
		private var helmets:Vector.<Sprite> = new Vector.<Sprite>();
		private var glasses:Vector.<Sprite> = new Vector.<Sprite>();
		private var ties:Vector.<Sprite> = new Vector.<Sprite>();
		private var bowties:Vector.<Sprite> = new Vector.<Sprite>();
		private var currentHelm:Sprite;
		private var currentGlasses:Sprite;
		private var currentTie:Sprite;
		private var currentBowtie:Sprite;
		private var place:Sprite;
		private var place2:Sprite;
		private var place3:Sprite;
		private var placeBounds:Rectangle;
		private var placeBounds2:Rectangle;
		private var placeBounds3:Rectangle;
		private var currentPlaceBounds:Rectangle;
		
		public function PersonageTest() {
			var modelData:Object = DebugDatas.getStaticItems().personages[ 0 ];
			personageData = createPersonageData( modelData );
			place = getChildByName( "place_mc" ) as Sprite;
			place2 = getChildByName( "place2_mc" ) as Sprite;
			place3 = getChildByName( "place3_mc" ) as Sprite;
			placeBounds = place.getBounds( this );
			placeBounds2 = place2.getBounds( this );
			placeBounds3 = place3.getBounds( this );
			currentPlaceBounds = placeBounds2;
			personage2 = new Personage( placeBounds2, this );
			personage2.loadByData( personageData );
			personage = new Personage( placeBounds, this );
			controlledPersonage = personage2;
			controlledPersonage.addEventListener( Event.CHANGE, onPoseChanged );
			personage.loadByModel( modelData );
			addEventListener( Event.ADDED_TO_STAGE, init );
			
			withoutGunBtn = getChildByName( "withoutGunBtn_mc" ) as Button;
			waveHand = getChildByName( "waveHandBtn_mc" ) as Button;
			gunToHead = getChildByName( "gunToHeadBtn_mc" ) as Button;
			stuned = getChildByName( "stunedBtn_mc" ) as Button;
			pleasure = getChildByName( "pleasureBtn_mc" ) as Button;
			veryHappy = getChildByName( "veryHappyBtn_mc" ) as Button;
			spinsReel = getChildByName( "spinsReelBtn_mc" ) as Button;
			laught = getChildByName( "laughtBtn_mc" ) as Button;
			killsItself = getChildByName( "killsItselfBtn_mc" ) as Button;
			unHappiness = getChildByName( "unHappinessBtn_mc" ) as Button;
			colorPicker = getChildByName( "colorPicker_mc" ) as ColorPicker;
			fpsSlider = getChildByName( "fpsSlider_mc" ) as Slider;
			pauseBtn = getChildByName( "pauseBtn_mc" ) as Button;
			changeContainerBtn = getChildByName( "changeContainerBtn_mc" ) as Button;
			
			withoutGunBtn.addEventListener( MouseEvent.CLICK, onBtnClicked );
			waveHand.addEventListener( MouseEvent.CLICK, onBtnClicked );
			gunToHead.addEventListener( MouseEvent.CLICK, onBtnClicked );
			stuned.addEventListener( MouseEvent.CLICK, onBtnClicked );
			pleasure.addEventListener( MouseEvent.CLICK, onBtnClicked );
			veryHappy.addEventListener( MouseEvent.CLICK, onBtnClicked );
			spinsReel.addEventListener( MouseEvent.CLICK, onBtnClicked );
			laught.addEventListener( MouseEvent.CLICK, onBtnClicked );
			killsItself.addEventListener( MouseEvent.CLICK, onBtnClicked );
			unHappiness.addEventListener( MouseEvent.CLICK, onBtnClicked );
			
			colorPicker.addEventListener( ColorPickerEvent.CHANGE, onColorSelected );
			fpsSlider.addEventListener( SliderEvent.CHANGE, onFPSSliderChanged );
			pauseBtn.addEventListener( MouseEvent.CLICK, onPauseClicked );
			changeContainerBtn.addEventListener( MouseEvent.CLICK, onChangeContainerCalled );
			
			colorPicker.selectedColor = 0x66ccff;
			//stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
			
			loadHelmets();
			loadGlasses();
			loadTies();
			loadBowties();
		}
		
		private function onChangeContainerCalled( event:MouseEvent ):void {
			if ( currentPlaceBounds === placeBounds3 ) {
				currentPlaceBounds = placeBounds2;
			} else {
				currentPlaceBounds = placeBounds3;
			}
			controlledPersonage.updatePlacement( currentPlaceBounds, this );
		}
		
		private function onPauseClicked( event:MouseEvent ):void {
			if( pauseBtn.label === "Приостановить" ) {
				controlledPersonage.lock();
				pauseBtn.label = "Возобновить";
			} else {
				controlledPersonage.unlock();
				pauseBtn.label = "Приостановить";
			}
		}
		
		private function loadHelmets():void {
			var path:String = "items/helmets/";
			for ( var i:int = 1; i <= HELMETS_LENGTH; i++ ) {
				var num:String = i < 10 ? "0" + i : i.toString();
				var fileName:String = "helmet" + num + ".swf";
				var ico:Sprite = new Sprite();
				var bg:Sprite = new BG();
				helmets.push( ico );
				ico.addEventListener( MouseEvent.CLICK, onHelmSelected );
				ico.buttonMode = true;
				ico.name = i.toString();
				bg.name = "bg_mc";
				bg.width = bg.height = 20;
				ico.x = 27 + ( ( bg.width + 13 ) * ( (i - 1) % 23 ) );
				ico.y = 430 + ( int( (i-1) / 23 ) * 33 );
				ico.addChild( bg );
				addChild( ico );
				var loader:BitmapLoader = new BitmapLoader( path + fileName, ico, BitmapLoader.SCALE_REDUCE, BitmapLoader.ALIGN_CENTER_CENTER );
				loader.addEventListener( Event.COMPLETE, onHelmLoaded );
			}
		}
		
		private function loadGlasses():void {
			var path:String = "items/glasses/";
			for ( var i:int = 1; i <= GLASSES_LENGTH; i++ ) {
				var num:String = i < 10 ? "0" + i : i.toString();
				var fileName:String = "glasses" + num + ".swf";
				var ico:Sprite = new Sprite();
				var bg:Sprite = new BG();
				glasses.push( ico );
				ico.addEventListener( MouseEvent.CLICK, onGlassesSelected );
				ico.buttonMode = true;
				ico.name = i.toString();
				bg.name = "bg_mc";
				bg.width = bg.height = 20;
				ico.x = 27 + ( ( bg.width + 13 ) * ( (i - 1) % 23 ) );
				ico.y = 540 + ( int( (i-1) / 23 ) * 33 );
				ico.addChild( bg );
				addChild( ico );
				var loader:BitmapLoader = new BitmapLoader( path + fileName, ico, BitmapLoader.SCALE_REDUCE, BitmapLoader.ALIGN_CENTER_CENTER );
				loader.addEventListener( Event.COMPLETE, onGlassesLoaded );
			}
		}
		
		private function loadTies():void {
			var path:String = "items/ties/";
			for ( var i:int = 1; i <= TIES_LENGTH; i++ ) {
				var num:String = NumUtils.toTwoDigit( i );
				var fileName:String = "tie" + num + ".swf";
				var ico:Sprite = new Sprite();
				var bg:Sprite = new BG();
				ties.push( ico );
				ico.addEventListener( MouseEvent.CLICK, onTieSelected );
				ico.buttonMode = true;
				ico.name = i.toString();
				bg.name = "bg_mc";
				bg.width = bg.height = 20;
				ico.x = 27 + ( ( bg.width + 13 ) * ( (i - 1) % 23 ) );
				ico.y = 615 + ( int( (i-1) / 23 ) * 33 );
				ico.addChild( bg );
				addChild( ico );
				var loader:BitmapLoader = new BitmapLoader( path + fileName, ico, BitmapLoader.SCALE_REDUCE, BitmapLoader.ALIGN_CENTER_CENTER );
				loader.addEventListener( Event.COMPLETE, onTieLoaded );
			}
		}
		
		private function loadBowties():void {
			var path:String = "items/bowties/";
			for ( var i:int = 1; i <= BOWTIES_LENGTH; i++ ) {
				var num:String = NumUtils.toTwoDigit( i );
				var fileName:String = "bowtie" + num + ".swf";
				var ico:Sprite = new Sprite();
				var bg:Sprite = new BG();
				bowties.push( ico );
				ico.addEventListener( MouseEvent.CLICK, onBowtieSelected );
				ico.buttonMode = true;
				ico.name = i.toString();
				bg.name = "bg_mc";
				bg.width = bg.height = 20;
				ico.x = 27 + ( ( bg.width + 13 ) * ( (i - 1) % 23 ) );
				ico.y = 690 + ( int( (i-1) / 23 ) * 33 );
				ico.addChild( bg );
				addChild( ico );
				var loader:BitmapLoader = new BitmapLoader( path + fileName, ico, BitmapLoader.SCALE_REDUCE, BitmapLoader.ALIGN_CENTER_CENTER );
				loader.addEventListener( Event.COMPLETE, onBowtieLoaded );
			}
		}
		
		private function onHelmSelected( event:MouseEvent ):void {
			currentHelm.mouseEnabled = currentHelm.mouseChildren = true;
			currentHelm.alpha = 1;
			currentHelm = event.currentTarget as Sprite;
			currentHelm.mouseEnabled = currentHelm.mouseChildren = false;
			currentHelm.alpha = .5;
			personageData.equipmentList[ 0 ] = int( currentHelm.name );
			controlledPersonage.equip( personageData.equipmentList );
		}
		
		private function onGlassesSelected( event:MouseEvent ):void {
			currentGlasses.mouseEnabled = currentGlasses.mouseChildren = true;
			currentGlasses.alpha = 1;
			currentGlasses = event.currentTarget as Sprite;
			currentGlasses.mouseEnabled = currentGlasses.mouseChildren = false;
			currentGlasses.alpha = .5;
			personageData.equipmentList[ 1 ] = int( currentGlasses.name );
			controlledPersonage.equip( personageData.equipmentList );
		}
		
		private function onTieSelected( event:MouseEvent ):void {
			currentTie.mouseEnabled = currentTie.mouseChildren = true;
			currentTie.alpha = 1;
			currentTie = event.currentTarget as Sprite;
			currentTie.mouseEnabled = currentTie.mouseChildren = false;
			currentTie.alpha = .5;
			personageData.equipmentList[ 2 ] = int( currentTie.name );
			controlledPersonage.equip( personageData.equipmentList );
		}
		
		private function onBowtieSelected( event:MouseEvent ):void {
			currentBowtie.mouseEnabled = currentBowtie.mouseChildren = true;
			currentBowtie.alpha = 1;
			currentBowtie = event.currentTarget as Sprite;
			currentBowtie.mouseEnabled = currentBowtie.mouseChildren = false;
			currentBowtie.alpha = .5;
			personageData.equipmentList[ 2 ] = int( currentBowtie.name );
			controlledPersonage.equip( personageData.equipmentList );
		}
		
		private function onHelmLoaded( event:Event ):void {
			var loader:BitmapLoader = event.currentTarget as BitmapLoader;
			var bitmap:Bitmap = loader.getBitmap();
			var ico:Sprite = bitmap.parent as Sprite;
			var bg:Sprite = ico.getChildByName( "bg_mc" ) as Sprite;
			bg.width = bg.height = 30;
			bitmap.x += 5;
			bitmap.y += 5;
			loadedHelms ++;
			if ( loadedHelms === HELMETS_LENGTH ) {
				allHelmetsLoaded();
			}
		}
		
		private function onGlassesLoaded( event:Event ):void {
			var loader:BitmapLoader = event.currentTarget as BitmapLoader;
			var bitmap:Bitmap = loader.getBitmap();
			var ico:Sprite = bitmap.parent as Sprite;
			var bg:Sprite = ico.getChildByName( "bg_mc" ) as Sprite;
			bg.width = bg.height = 30;
			bitmap.x += 5;
			bitmap.y += 5;
			loadedGlasses ++;
			if ( loadedGlasses === GLASSES_LENGTH ) {
				allGlassesLoaded();
			}
		}
		
		private function onTieLoaded( event:Event ):void {
			var loader:BitmapLoader = event.currentTarget as BitmapLoader;
			var bitmap:Bitmap = loader.getBitmap();
			var ico:Sprite = bitmap.parent as Sprite;
			var bg:Sprite = ico.getChildByName( "bg_mc" ) as Sprite;
			bg.width = bg.height = 30;
			bitmap.x += 5;
			bitmap.y += 5;
			loadedTies ++;
			if ( loadedTies === TIES_LENGTH ) {
				allTiesLoaded();
			}
		}
		
		private function onBowtieLoaded( event:Event ):void {
			var loader:BitmapLoader = event.currentTarget as BitmapLoader;
			var bitmap:Bitmap = loader.getBitmap();
			var ico:Sprite = bitmap.parent as Sprite;
			var bg:Sprite = ico.getChildByName( "bg_mc" ) as Sprite;
			bg.width = bg.height = 30;
			bitmap.x += 5;
			bitmap.y += 5;
			loadedBowties ++;
			if ( loadedBowties === BOWTIES_LENGTH ) {
				allBowtiesLoaded();
			}
		}
		
		private function allHelmetsLoaded():void {
			currentHelm = helmets[ 0 ];
			currentHelm.alpha = .5;
			currentHelm.mouseEnabled = currentHelm.mouseChildren = false;
		}
		
		private function allGlassesLoaded():void {
			currentGlasses = glasses[ 0 ];
			currentGlasses.alpha = .5;
			currentGlasses.mouseEnabled = currentGlasses.mouseChildren = false;
		}
		
		private function allTiesLoaded():void {
			currentTie = ties[ 0 ];
			currentTie.alpha = .5;
			currentTie.mouseEnabled = currentTie.mouseChildren = false;
		}
		
		private function allBowtiesLoaded():void {
			currentBowtie = bowties[ 0 ];
			currentBowtie.alpha = .5;
			currentBowtie.mouseEnabled = currentBowtie.mouseChildren = false;
		}
		
		private function createPersonageData( modelData:Object ):Object {
			var data:Object = DebugDatas.getProfile().personages[ 1 ];
			var personageData:Object = { };
			personageData.name = data.name;
			personageData.level = data.lvl;
			personageData.pid = data.pid;
			personageData.wins = data.wins;
			personageData.loss = data.loss;
			personageData.battleCount = data.wins + data.loss;
			personageData.equipmentList = data.equipment;
			personageData.color = data.color;
			personageData.path = modelData.path;
			personageData.sex = data.sex;
			
			return personageData;
		}
		
		private function onPoseChanged( event:Event ):void {
			
			var poseID:String = controlledPersonage.getPoseID();
			var btnName:String = poseID.charAt( 0 ).toLowerCase();
			btnName += poseID.substr( 1 ) + "Btn_mc";
			
			selectedBtn.enabled = true;
			selectedBtn = Button( getChildByName( btnName ) );
			selectedBtn.enabled = false;
		}
		
		private function onFPSSliderChanged( event:SliderEvent ):void {
			stage.frameRate = fpsSlider.value;
		}
		
		private function onMouseMove( event:MouseEvent ):void {
			controlledPersonage.setColor( Math.round( Math.random() * 0xFFFFFF ) );
		}
		
		private function onColorSelected( event:ColorPickerEvent ):void {
			controlledPersonage.setColor( colorPicker.selectedColor );
		}
		
		private function init( event:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );
			//stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			selectedBtn = withoutGunBtn;
			withoutGunBtn.enabled = false;
			
		}
		
		private function onBtnClicked( event:MouseEvent ):void {
			var target:Button = event.currentTarget as Button;
			var targetName:String = target.name;
			var poseID:String = targetName.charAt( 0 ).toUpperCase();
			poseID += targetName.substr( 1, targetName.length - 7 );
			
			selectedBtn.enabled = true;
			selectedBtn = target;
			selectedBtn.enabled = false;
			
			controlledPersonage.showPose( poseID );
			
		}
		
	}
}