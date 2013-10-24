package com.rr {
	import com.rr.api.Connector;
	import flash.display.Sprite;
	import flash.events.Event;
	import vk.APIConnection;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class Roulette extends Sprite {
		
		/// Тип события вызова инициализации
		public static const INIT:String = "rouletteInit";
		
		/// Флешварс
		protected var flashvars:Object;
		/// Объект взаимодействующий с сервером
		protected var apiConnection:Connector;
		/// Объект взаимодействующий с API вКонтакте
		protected var vkConnection:APIConnection;
		/// Список статических игровых предметов
		protected var staticItems:Object;
		/// Список данных о пользователа из соц. сети
		protected var personalData:Object;
		/// Список игровых данных о профиле пользователя
		protected var userData:Object;
		/// Список друзей пользователя установивших приложение
		protected var appUsersProfilesList:Object;
		/// Список всех друзей пользователя
		protected var allFriendsProfilesList:Object;
		
		/**
		 * Конструктор
		 */
		
		public function Roulette() {
			super();
			if ( parent ) {
				var _flashvars:Object = DebugDatas.getFlashvars();
				var _apiConnection:Connector = new Connector( "1", "1" );
				var _vkConnection:APIConnection = new APIConnection( _flashvars );
				var _staticItems:Object = DebugDatas.getStaticItems();
				var _personalData:Object = DebugDatas.getVkProfiles()[ 0 ];
				var _userData:Object = DebugDatas.getProfile();
				var _appUsersProfilesList:Object = DebugDatas.getVkProfilesAppUsers();
				var _allFriendsProfilesList:Object = DebugDatas.getVkFriends();
				init( _flashvars, _apiConnection, _vkConnection, _staticItems, _personalData, _userData, _appUsersProfilesList, _allFriendsProfilesList );
			}
		}
		
		/**
		 * Инициаоизация клиента, принимает ссылки на необходимые данные полученные прелоадером
		 * @param	flashvars Флешварс
		 * @param	apiConnection Объект взаимодействующий с сервером
		 * @param	vkConnection Объект взаимодействующий с API вКонтакте
		 * @param	staticItems Список статических игровых предметов
		 * @param	personalData Список данных о пользователа из соц. сети
		 * @param	userData Список игровых данных о профиле пользователя
		 * @param	userItems Список купленных игроком предметов
		 * @param	appUsersProfilesList Список друзей пользователя установивших приложение
		 * @param	allFriendsProfilesList Список всех друзей пользователя
		 */
		
		internal function init( flashvars:Object, apiConnection:Connector, vkConnection:APIConnection, staticItems:Object, personalData:Object, userData:Object, appUsersProfilesList:Object, allFriendsProfilesList:Object ):void {
			this.flashvars = flashvars;
			this.apiConnection = apiConnection;
			this.vkConnection = vkConnection;
			this.staticItems = staticItems;
			this.personalData = personalData;
			this.userData = userData;
			this.appUsersProfilesList = appUsersProfilesList;
			this.allFriendsProfilesList = allFriendsProfilesList;
			
			dispatchEvent( new Event( Roulette.INIT ) );
		}
	}

}