﻿package com.rr.pages.shop {		import caurina.transitions.Tweener;	import com.rr.events.ShopFilterEvent;	import com.rr.Helper;	import com.rr.ItemModelData;	import com.rr.ModelData;	import com.rr.pages.PopupPage;	import com.rr.ui.Paging;	import com.rr.utils.Definitier;	import flash.display.MovieClip;	import flash.display.Sprite;	import flash.events.Event;	import com.flashgangsta.managers.ButtonManager;	import com.rr.Main;	import com.flashgangsta.managers.MappingManager;	import flash.geom.Rectangle;	import fl.text.TLFTextField;	import com.rr.ItemModels;		/**	 * ...	 * @author Sergey Krivtsov	 */		public class Shop extends PopupPage {				/// Идентификатор вкладки магазина феи		public static const TAB_FAY:String = "fay";		/// Идентификатор вкладки магазина кабанов		public static const TAB_BOAR:String = "boars";				//TODO: проверить надобность доступа к internal переменным				/// Запоминает идентификатор последней открытой вкладки магазина		internal var currentTab:String = Shop.TAB_FAY;				/// Витрина		private var showcase:Showcase;		/// Текущая действующая кнопка магазина (противоположность отображаемого)		private var tabBtn:MovieClip;		/// Заголовок магазина кабанов		private var boarTabTitle:TLFTextField;		/// Заголовок названия магазина кабанов		private var boarTabName:TLFTextField;		/// Заголовок магазина феи		private var fayTabTitle:TLFTextField;		/// Заголовок названия магазина		private var fayTabName:TLFTextField;		/// Фильтры		private var shopFilters:ShopFilters;		/// Область магазина для центрирования при смене режима экрана		private var area:Sprite;				/**		 * Конструктор		 */				public function Shop() {			init();		}				/**		 * Инициализация		 * @param	event		 */				private function init():void {			boarTabTitle = getChildByName( "boarTabTitle_txt" ) as TLFTextField;			boarTabName = getChildByName( "boarTabName_txt" ) as TLFTextField;			fayTabTitle = getChildByName( "fayTabTitle_txt" ) as TLFTextField;			fayTabName = getChildByName( "fayTabName_txt" ) as TLFTextField;			showcase = getChildByName( "showcase_mc" ) as Showcase;			area = getChildByName( "area_mc" ) as Sprite;			shopFilters = getChildByName( "filters_mc" ) as  ShopFilters;						Helper.getDispatcher().addEventListener( Event.RESIZE, resize );						resize();						boarTabTitle.mouseChildren = false;			boarTabName.mouseChildren = false;			boarTabTitle.mouseEnabled = false;			boarTabName.mouseEnabled = false;			fayTabTitle.mouseChildren = false;			fayTabName.mouseChildren = false;			fayTabTitle.mouseEnabled = false;			fayTabName.mouseEnabled = false;						showShop();						shopFilters.addEventListener( ShopFilterEvent.FILTER_CHANGED, onFilterChanged );			shopFilters.addEventListener( ShopFilterEvent.SUBFILTER_CHANGED, onSubfilterChanged );						addEventListener( PopupPage.ADD_MOTION_COMPLETE, onAddMotionComplete );					}				/**		 * Устанавливает нужный разде магазина		 * @param	sectionID		 */				public function setShop( sectionID:String ):void {			if ( sectionID !== currentTab ) {				if ( tabBtn ) {					// Если магазин уже инициализирован					ButtonManager.callReleaseHandler( tabBtn );					trace( "isInit" );				} else {					// Если магазин не был инициализирован					currentTab = sectionID;				}			}		}				/**		 * Показывает магазин		 */				private function showShop():void {			gotoAndStop( currentTab );						if( currentTab === Shop.TAB_FAY ) {				tabBtn = getChildByName( "boarBtn_mc" ) as MovieClip;			} else {				tabBtn = getChildByName( "fayBtn_mc" ) as MovieClip;			}						ButtonManager.addButton( tabBtn, null, changeTab );		}				/**		 * Меняет таблицу магазина (кабан/фея)		 * @param	target		 */				private function changeTab( target:MovieClip = null ):void {			ButtonManager.removeButton( target );			currentTab = currentTab === Shop.TAB_FAY ? Shop.TAB_BOAR : Shop.TAB_FAY;			shopFilters.setFilter();			showShop();			}				/**		 * Срабатывает по завершению анимации появления магазина		 */				private function onAddMotionComplete( event:Event ):void {			Definitier.addDefinition( shopFilters.currentFilterBtns, shopFilters.currentSubFiltersBtns );		}				/**		 * Позиционирование при смене размера экрана		 */				private function resize( event:Event = null ):void {			if ( event && !parent ) return;			var screenRect:Rectangle = Helper.getScreenController().getScreenRect();			x = screenRect.x + MappingManager.getCentricPoint( screenRect.width, area.width );			y = screenRect.y + MappingManager.getCentricPoint( screenRect.height, area.height ) + 35;		}				/**		 * Обработка смены фильтра первого уровня		 * @param	event		 */				private function onFilterChanged( event:ShopFilterEvent ):void {			shopFilters.changeSubFilter( shopFilters.currentFilter.name );		}				/**		 * Обработка смены фильтра второго уровня		 * @param	event		 */				private function onSubfilterChanged( event:ShopFilterEvent ):void {			fillShowcase( Vector.<ItemModelData>( event.subfilterData ) );		}				/**		 * Заполняет витрину		 * @param	data		 */				private function fillShowcase( data:Vector.<ItemModelData> ):void {			showcase.fill( data );		}			}	}