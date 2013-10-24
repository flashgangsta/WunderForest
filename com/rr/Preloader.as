package com.rr {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.LoaderInfo;
	import com.rr.errors.VkErrors;
	import com.rr.api.Connector;
	import com.rr.api.Methods;
	import vk.APIConnection;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.ProgressEvent;
	import flash.system.Security;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;
	import flash.system.ApplicationDomain;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import fl.text.TLFTextField;
	import flash.net.URLLoader;
	import flash.text.TextField;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	
	public class Preloader extends MovieClip {
		
		/// Определяет в каком режиме запущено приложение: в режиме разработки или нет.
		public static var isDebugMode:Boolean;
		
		/// Адрес сервера на котором лежит приложение
		private static const APP_SERVER:String = "http://roulette.1gb.ru/";
		/// Название файла с приложенем
		private static const APP_URL:String = "russianRoulette.swf";
		
		private var preloader:MovieClip;
		private var appInstallRequestTimer:Timer;
		private var appInstallRequestBanned:Boolean = false;
		private var isAppUser:Boolean = false;
		private var sig:TLFTextField;
		private var loaderSigLabel:TLFTextField;
		private var logo:TextField;
		private var lastRequestTime:Number;
		private var requestInterval:Number = 1000;
		private var requestPause:Number;
		private var loader:Loader;
		
		private var flashvars:Object;
		/// Список статических игровых предметов
		private var staticItems:Object;
		/// Данные профиля игрока
		private var userData:Object;
		/// Список инфы о себе из вконтакта
		private var personalData:Object;
		/// Список id друзкй, установивших прилагу
		private var appUsersList:Object; 
		/// Список профайлов друзей, установивших прилагу
		private var appUsersProfilesList:Object;
		/// Список id всех друзей
		private var allFriendsList:Object;
		/// Список профайлов всех друзей
		private var allFriendsProfilesList:Object;
		/// Объект взаимодействующий с api вКонтакте
		private var vkConnection:APIConnection;
		/// Объект взаимодействующий с api игры
		private var apiConnection:Connector;
		
		public function Preloader() {
			Security.allowDomain( Preloader.APP_SERVER );
			Security.loadPolicyFile( Preloader.APP_SERVER );
			root.loaderInfo.addEventListener( Event.COMPLETE, init );
		}
		
		/**
		 * Инициализация
		 * @param	event
		 */
		
		private function init( event:Event ):void {
			root.loaderInfo.removeEventListener( Event.COMPLETE, init );
			
			Preloader.isDebugMode = loaderInfo.url.indexOf( "http" ) === -1;
			trace( "Mode:", isDebugMode ? "debug" : "release" );
			
			preloader = getChildByName( "preloader_mc" ) as MovieClip;
			sig = getChildByName( "loaderSig_txt" ) as TLFTextField;
			loaderSigLabel = getChildByName( "loaderSigLabel_txt" ) as TLFTextField;
			logo = getChildByName( "logo_txt" ) as TextField;
			flashvars = stage.loaderInfo.parameters;
			
			vkConnection = new APIConnection( flashvars );
			apiConnection = new Connector( flashvars.user_id, flashvars.access_token );
			authorization(); // Авторизация, стартует с проверки установки приложения
		}
		
		/**
		*	Проверка на установку приложения
		*/
		
		private function authorization():void {
			lastRequestTime = getTimer();
			if ( isDebugMode ) {
				isAppUserComplete( "1" );
			} else {
				vkConnection.api( "isAppUser", {}, isAppUserComplete, VkErrors.isApiUserError );
			}
			sig.text = "Установка соединения.";
		}
		
		/**
		 * Обраотка ответа на запрос проверки на установку приложения
		 * @param	response 0 - не установлено, 1 - установлено.
		 */
		
		private function isAppUserComplete ( response:String ):void { //Получение ответа добавил ли юзер приложение.
			if( response === "1" ) { //Приложение установлено
				isAppUser = true;
				requestPause = getTimer() - lastRequestTime;
				trace(  );
				if( requestPause >= requestInterval ) {
					loadPersonalData();
				} else {
					setTimeout( loadPersonalData, isDebugMode ? 1 : requestPause );
				}
			} else { //Приложение не установлено.
				isAppUser = false;
				vkConnection.callMethod( "showInstallBox" );// выводим окно предлагающее установть приложение
				appInstallRequestTimer = new Timer( 3000 );
				appInstallRequestBanned = true;
			}
			
			trace( "isAppUser = " +  Boolean( response ) );
		}
		
		/**
		*	Загрузка персональных данных пользователя
		*/
		
		private function loadPersonalData():void {
			lastRequestTime = getTimer();
			if ( isDebugMode ) {
				onPersonalData( DebugDatas.getVkProfiles().response );
			} else {
				vkConnection.api( "getProfiles", { uids: flashvars.viewer_id, fields: "uid, first_name, last_name, nickname, photo, photo_medium, photo_big, sex" }, onPersonalData, VkErrors.personalDataError );
			}
			sig.text = "Чтение данных";
		}
		
		/**
		 * Обработка ответа на запрос персональных данных пользователя
		 * @param	response
		 */
		
		private function onPersonalData( response:Object ):void {
			trace( "personal data:\n", response[ 0 ].sex );
			personalData = response[ 0 ];
			requestPause = getTimer() - lastRequestTime;
			
			if(  requestPause >= requestInterval ) {
				loadAppUsers();
			} else {
				setTimeout( loadAppUsers, isDebugMode ? 1 : requestPause );
			}
		}
		
		/**
		*	Загрузка списка id друзей, установивших приложение
		*/
		
		private function loadAppUsers():void {
			lastRequestTime = getTimer();
			if ( isDebugMode ) {
				onAppUsers( DebugDatas.getVkAppUsers() );
			} else {
				vkConnection.api( "friends.getAppUsers", { }, onAppUsers, VkErrors.appUsersError );
			}
		}
		
		/**
		 * Обработка ответа на запрос списка id друзей, установивших приложение
		 * @param	response
		 */
		
		private function onAppUsers( response:Object ):void {
			trace( "appUsers data:\n" );
			appUsersList = response;
			requestPause = getTimer() - lastRequestTime;
			if(  requestPause >= requestInterval ) {
				loadAppUsersProfiles();
			} else {
				setTimeout( loadAppUsersProfiles, isDebugMode ? 1 : requestPause );
			}
		}
		
		/**
		 * Загрузка профайлов друзей, установивших приложение
		 */
		
		private function loadAppUsersProfiles():void {
			lastRequestTime = getTimer();
			if( isDebugMode ) {
				onAppUsersProfiles( DebugDatas.getVkProfilesAppUsers() );
			} else {
				vkConnection.api( "getProfiles", { uids: appUsersList.toString(), fields: "uid, first_name, last_name, nickname, photo_medium" }, onAppUsersProfiles, VkErrors.appAppUsersProfiles );
			}
			
		}
		
		/**
		 * Обработка ответа на запрос персональных данных друзей, установивших себе приложение
		 * @param	response
		 */
		
		private function onAppUsersProfiles( response:Object ):void {
			trace( "appUsersProfiles: \n" );
			appUsersProfilesList = response;
			requestPause = getTimer() - lastRequestTime;
			if(  requestPause >= requestInterval ) {
				loadAllFriends();
			} else {
				setTimeout( loadAllFriends, isDebugMode ? 1 : requestPause );
			}
		}
		
		/**
		*	Загрузка списка всех друзей
		*/
		
		private function loadAllFriends():void {
			lastRequestTime = getTimer();
			if ( isDebugMode ) {
				onAllFriends( DebugDatas.getVkFriends() );
			} else {
				vkConnection.api( "friends.get", { fields: "uid, first_name, last_name, nickname, photo_medium" }, onAllFriends, VkErrors.allFriends );
			}
		}
		
		/**
		 * Обработка ответа на запрос о получении списка всех друзей
		 * @param	response
		 */
		
		private function onAllFriends( response:Object ):void {
			trace( "onAllFriendsProfilesList" );
			allFriendsProfilesList = response;
			loadAppParams();
		}
		
		
		/**
		*	Загрузка xml с данными о предметах
		*/
		
		private function loadAppParams():void {
			trace( "loadAppParams started" );
			if ( isDebugMode ) {
				paramsLoaded( null );
			} else {
				apiConnection.addEventListener( Event.COMPLETE, paramsLoaded );
				apiConnection.send( Methods.getStaticItems );
			}
			sig.text = "Загрузка параметров."
		}
		
		/**
		 * Данные о предметах успешно загружены
		 * @param	event
		 */
		
		private function paramsLoaded( event:Event ):void {
			if( isDebugMode ) {
				staticItems = DebugDatas.getStaticItems();
			} else {
				apiConnection.removeEventListener( Event.COMPLETE, paramsLoaded );
				staticItems = apiConnection.getResponse() as Object;
			}
			loadUserData();
		}
		
		/**
		*	Загрузка профайла юзера
		*/
		
		private function loadUserData():void {
			trace( "loadUserData started" );
			if ( isDebugMode ) {
				onUserData( null );
			} else {
				apiConnection.addEventListener( Event.COMPLETE, onUserData );
				apiConnection.send( Methods.getProfile );
			}
			sig.text = "Получение профайла."
		}
		
		/**
		 * Профайл юзера успешно загружен
		 * @param	params
		 */
		
		private function onUserData( event:Event ):void {
			if ( isDebugMode ) {
				userData = DebugDatas.getProfile();
			} else {
				apiConnection.removeEventListener( Event.COMPLETE, onUserData );
				userData = apiConnection.getResponse() as Array;
			}
			loadApp();
		}
		
		/**
		*	Загрузка приложения
		*/
		
		private function loadApp():void {
			trace( "loadApp started" );
			loader = new Loader();
			var request:URLRequest = new URLRequest( isDebugMode ? Preloader.APP_URL : Preloader.APP_SERVER + Preloader.APP_URL + "?rnd=" + new Date().getTime() );
			loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, appLoadProgerss );
			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, appLoaded );
			sig.text = "Загрузка приложения.";
			loader.load( request, isDebugMode ? null : new LoaderContext( false, ApplicationDomain.currentDomain, SecurityDomain.currentDomain ) );
		}
		
		/**
		 * Обработка обновления прогресса загрузки приложения
		 * @param	event
		 */
		
		private function appLoadProgerss( event:ProgressEvent ):void {
			var precent:Number = Math.round( event.bytesLoaded / event.bytesTotal * 100 );
			preloader.gotoAndStop( Math.round( preloader.totalFrames / 100 * precent ) );
			sig.text = "Загрузка приложения " + precent + "%.";
		}
		
		/**
		 * Обработка окончания загрузки приложения
		 * @param	event
		 */
		
		private function appLoaded( event:Event ):void {
			var content:Roulette = LoaderInfo( event.currentTarget ).content as Roulette;
			content.init( flashvars, apiConnection, vkConnection, staticItems, personalData, userData, appUsersProfilesList, allFriendsProfilesList );
			addChild( content );
			loader.contentLoaderInfo.removeEventListener( ProgressEvent.PROGRESS, appLoadProgerss );
			loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, appLoaded );
			trace( "app loaded" );
			removeChild( preloader );
			removeChild( loaderSig_txt );
			removeChild( loaderSigLabel );
			removeChild( logo );
			loader = null;
		}
	}
}
