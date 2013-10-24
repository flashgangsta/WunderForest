﻿package com.rr.pages.shop {		import com.rr.events.ShopFilterEvent;	import flash.display.MovieClip;	import flash.events.Event;	import com.flashgangsta.managers.ButtonManager;	import com.rr.ItemModels;	import com.rr.Helper;			public class ShopFilters extends MovieClip {				private var fayFilters:Array = [];		private var boarsFilters:Array = [];				private var subfilter:MovieClip;		private var shop:Shop;		private var currentFilterDatas:Array = [];				private var currentSubFilterData:Array;		private var filterEvent:ShopFilterEvent = new ShopFilterEvent( ShopFilterEvent.FILTER_CHANGED );				internal var currentFilter:MovieClip;		internal var currentSubFilter:MovieClip;		internal var currentSubFiltersBtns:Array = [];		internal var currentFilterBtns:Array = [];				/**		 * Конструктор		 */				public function ShopFilters() {			addEventListener( Event.ADDED_TO_STAGE, init );			shop = Shop( parent );		}				/**		 * Инициализация		 * @param	event		 */				private function init( event:Event ):void {			removeEventListener( Event.ADDED_TO_STAGE, init );						fayFilters[ 0 ] = {				filter: "fay_hole",				subfilters: [					{ lbl: "all", types: "" },					{ lbl: "moneybox", types: ItemModels.ITEM_MONEYBOX },					{ lbl: "door", types: ItemModels.ITEM_DOOR },					{ lbl: "cellar", types: ItemModels.ITEM_CELLAR },					{ lbl: "board", types: ItemModels.ITEM_BOARD },					{ lbl: "lights", types: ItemModels.ITEM_LIGHT + "," + ItemModels.ITEM_SWITCHER },					{ lbl: "windows", types: ItemModels.ITEM_WINDOW },					{ lbl: "floor", types: ItemModels.ITEM_FLOOR },					{ lbl: "wallpapers", types: ItemModels.ITEM_WALLPAPERS },					{ lbl: "pretinness", types: ItemModels.ITEM_PRETINNESS }				] 			};						fayFilters[ 1 ] = {				filter: "fay_pers",				subfilters: [ 					{ lbl: "all", types: "" },					{ lbl: "ear", types: ItemModels.ITEM_FAY_EAR },					{ lbl: "hands", types: ItemModels.ITEM_FAY_HAND },					{ lbl: "foots", types: ItemModels.ITEM_FAY_FOOT },					{ lbl: "glasses", types: ItemModels.ITEM_FAY_GLASSES },					{ lbl: "bows", types: ItemModels.ITEM_FAY_BOW },					{ lbl: "ties", types: ItemModels.ITEM_FAY_TIES }				]			}						fayFilters[ 2 ] = {				filter: "fay_upgraders",				subfilters: [					{ lbl: "all", types: ItemModels.ITEM_FAY_UPGRADES }				]			};						boarsFilters[ 0 ] = {				filter: "boars_battle",				subfilters: [					{ lbl: "all", types: "" },					{ lbl: "helmets", types: ItemModels.ITEM_HELMETS },					{ lbl: "healths", types: ItemModels.ITEM_HEALTH + "," + ItemModels.ITEM_CARDIO  + "," + ItemModels.ITEM_VALERIAN },					{ lbl: "bomb", types: ItemModels.ITEM_BOMB },					{ lbl: "poisons", types: ItemModels.ITEM_POISON },					{ lbl: "antidots", types: ItemModels.ITEM_ANTIDOTE },					{ lbl: "alco", types: ItemModels.ITEM_ALCO },					{ lbl: "eat", types: ItemModels.ITEM_EAT },					{ lbl: "bribe", types: ItemModels.ITEM_BRIBE },					{ lbl: "policy", types: ItemModels.ITEM_POLICY },					{ lbl: "bags", types: ItemModels.ITEM_BAG }				]			};						boarsFilters[ 1 ] = { 				filter: "boars_pers",				subfilters: [					{ lbl: "all", types: "" },					{ lbl: "ear", types: ItemModels.ITEM_BOARS_EAR },					{ lbl: "hands", types: ItemModels.ITEM_BOARS_HAND },					{ lbl: "foots", types: ItemModels.ITEM_BOARS_FOOT },					{ lbl: "glasses", types: ItemModels.ITEM_BOARS_GLASSES },					{ lbl: "bows", types: ItemModels.ITEM_BOARS_BOW },					{ lbl: "ties", types: ItemModels.ITEM_BOARS_TIES }				]			};						boarsFilters[ 2 ] = {				filter: "boars_hole",				subfilters : [					{ lbl: "all", types: "" },					{ lbl: "tv", types: ItemModels.ITEM_TV },					{ lbl: "carpets", types: ItemModels.ITEM_CARPET },					{ lbl: "souvenirs", types: ItemModels.ITEM_SOUVENIRS },					{ lbl: "exscess", types: ItemModels.ITEM_EXSCESS },				]			};			boarsFilters[ 3 ] = {				filter: "boars_bags",				subfilters: [					{ lbl: "all", types: ItemModels.ITEM_BAG }				]			};			boarsFilters[ 4 ] = {				filter: "boars_lottery",				subfilters: [					{ lbl: "all", types: ItemModels.ITEM_LOTTERY }				]			};			boarsFilters[ 5 ] = {				filter: "boars_upgraders",				subfilters: [					{ lbl: "all", types: ItemModels.ITEM_BOARS_UPGRADES }				]			};						for ( var i:int = 0; i < fayFilters.length; i++ ) {				if ( fayFilters[ i ].subfilters.length > 1 ) {					for ( var j:int = 1; j < fayFilters[ i ].subfilters.length; j++ ) {						fayFilters[ i ].subfilters[ 0 ].types += fayFilters[ i ].subfilters[ j ].types + ",";					}					var str:String = fayFilters[ i ].subfilters[ 0 ].types;					fayFilters[ i ].subfilters[ 0 ].types = str.substr( 0, str.length - 1 );				}			}						for ( i = 0; i < boarsFilters.length; i++ ) {				if ( boarsFilters[ i ].subfilters.length > 1 ) {					for ( j = 1; j < boarsFilters[ i ].subfilters.length; j++ ) {						boarsFilters[ i ].subfilters[ 0 ].types += boarsFilters[ i ].subfilters[ j ].types + ",";					}					str = boarsFilters[ i ].subfilters[ 0 ].types;					boarsFilters[ i ].subfilters[ 0 ].types = str.substr( 0, str.length - 1 );				}			}						subfilter = subfilter_mc;						setFilter();					}				/**		 * Обработка клика по фильтру		 * @param	target		 */				private function onFilterClicked( target:MovieClip ):void {			currentFilter = target;			filterEvent = new ShopFilterEvent( ShopFilterEvent.FILTER_CHANGED );			dispatchEvent( filterEvent );		}				/**		 * Обработка клика по подфильтру		 * @param	target		 */				private function onSubFilterClicked( target:MovieClip ):void {			currentSubFilter = target;			for ( var i:int = 0; i < currentSubFiltersBtns.length; i++ ) {				if ( currentSubFiltersBtns[ i ] === target ) {					var types:Vector.<int> = Vector.<int>( String( currentSubFilterData[ i ].types ).split( "," ) );					filterEvent = new ShopFilterEvent( ShopFilterEvent.SUBFILTER_CHANGED );					filterEvent.subfilterData = Helper.getItemModels().getModelsListByTypes( types );					break;				}			}			dispatchEvent( filterEvent );		}				/**		 * Очищает фильтр		 */				private function clearFilter():void {			if ( currentFilterBtns.length ) {				ButtonManager.resetSelectionOnGroup( currentFilterBtns[ 0 ] );				ButtonManager.removeButtonGroup( currentFilterBtns[ 0 ] );							}			currentFilter = null;			currentFilterBtns = [];						clearSubfilter();					}				/**		 * Очищает подфильтр		 */				private function clearSubfilter():void {			if( currentSubFiltersBtns.length ) {				ButtonManager.resetSelectionOnGroup( currentSubFiltersBtns[ 0 ] );				ButtonManager.removeButtonGroup( currentSubFiltersBtns[ 0 ] );			}						currentSubFilter = null;			currentSubFiltersBtns = [];					}				/**		 * Возвращает список подфильтров		 * @return		 */				private function getSubFilters():Array {			var key:String = currentFilter.name;			var subfilters:Array;						for ( var i:int = 0; i < currentFilterDatas.length; i++ ) {				if ( currentFilterDatas[ i ].filter === key ) {					subfilters = currentFilterDatas[ i ].subfilters;					break;				}			}			return subfilters;		}				/**		 * Проверяет, есть ли айтемы в разделе		 */ 				private function checkFilling( types:Array ):Boolean {			var result:Boolean = false;			for ( var i:int = 0; i < types.length; i++ ) {				result = Helper.getItemModels().getModelTypeEnabled( types[ i ] );				if ( result ) break;			}			return result;		}				/**		 * public methods		 */				public function setFilter():void {			clearFilter();						currentFilterDatas = shop.currentTab === Shop.TAB_FAY ? fayFilters : boarsFilters;						gotoAndStop( shop.currentTab );						for ( var i:int = 0; i < currentFilterDatas.length; i++ ) {				currentFilterBtns.push( this[ currentFilterDatas[ i ].filter ] );								var types:Array = String( currentFilterDatas[ i ].subfilters[ 0 ].types ).split( "," );				if ( !checkFilling( types ) ) {					ButtonManager.setButtonEnable( currentFilterBtns[ currentFilterBtns.length - 1 ], false, true, .4 );				}			}						ButtonManager.addButtonGroup( currentFilterBtns, true, currentFilter = currentFilterBtns[ 0 ], false, ButtonManager.STATE_PRESSED, onFilterClicked );						onFilterClicked( currentFilter );					}				/**		 * 		 * @param	subfilterID		 */				public function changeSubFilter( subfilterID:String ):void {			subfilter.gotoAndStop( subfilterID );						clearSubfilter();						currentSubFilterData = getSubFilters();						for ( var i:int = 0; i < currentSubFilterData.length; i++ ) {				currentSubFiltersBtns.push( subfilter[ currentFilter.name + "_" + currentSubFilterData[ i ].lbl ] );								var types:Array = String( currentSubFilterData[ i ].types ).split( "," );				if ( !checkFilling( types ) ) {					ButtonManager.setButtonEnable( currentSubFiltersBtns[ currentSubFiltersBtns.length - 1 ], false, true, .4 );				}			}						ButtonManager.addButtonGroup( currentSubFiltersBtns, true, currentSubFilter = currentSubFiltersBtns[ 0 ], false, ButtonManager.STATE_PRESSED, onSubFilterClicked );			ButtonManager.callReleaseHandler( currentSubFilter );		}			}	}