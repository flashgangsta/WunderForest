﻿package com.rr.ui {	import com.rr.utils.BitmapLoader;	import com.rr.utils.InteractiveKiller;	import flash.display.Bitmap;	import flash.display.MovieClip;	import flash.display.Sprite;	import flash.events.Event;		/**	 * ...	 * @author Sergey Krivtsov (flashgangsta@gmail.com)	 */	public class ItemWithIcon extends MovieClip {				/// Контейнер иконки предмета		protected var icon:Sprite;		/// Загрузчик картинок		private var loader:BitmapLoader;		/// Картинка		private var bitmap:Bitmap;				/**		 * Constructor		 */				public function ItemWithIcon() {			icon = getChildByName( "icon_mc" ) as Sprite;			InteractiveKiller.kill( icon );		}				/**		 * Загружает картинку		 * @param	path		 */				public function loadIcon( path:String ):void {			loader = new BitmapLoader( path, icon, BitmapLoader.SCALE_REDUCE, BitmapLoader.ALIGN_CENTER_CENTER );			loader.addEventListener( Event.COMPLETE, onLoaded );		}				/**		 * Удаляет картинку		 */				public function removeIcon():void {			if ( bitmap ) icon.removeChild( bitmap );			if( loader ) {				loader.destroy();				loader = null;			}			bitmap = null;		}				/**		 * Окончание загрузки картинки		 * @param	event		 */				private function onLoaded( event:Event ):void {			bitmap = loader.getBitmap();		}			}}