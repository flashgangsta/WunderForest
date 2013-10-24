package com.rr {
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class DebugDatas {
		
		public function DebugDatas() {
			
		}
		
		/**
		 * Профиль игрока из соц сети
		 * Эмуляция ответа на запрос getProfiles
		 * @return
		 */
		
		public static function getVkProfiles():Array {
			var response:Array = [];
			var user:Object = { };
			user.uid = 7010535;
			user.first_name = "Сергей";
			user.last_name = "Кривцов";
			user.nickname = "никнейм";
			user.photo = "../bitmaps/avatars/e_9b0da00f.jpg";
			user.photo_medium = "../bitmaps/avatars/b_f9a2c368.jpg";
			user.photo_big = "../bitmaps/avatars/a_5e780b31.jpg";
			user.sex = 2;
			response.push( user );
			return response;
		}
		
		/**
		 * Получение списка профилей прользователей установивших приложение
		 * @return
		 */
		
		public static function getVkProfilesAppUsers():Array {
			var response:Array = [];
				var friend1:Object = { };
				var friend2:Object = { };
				var friend3:Object = { };
				var friend4:Object = { };
				var friend5:Object = { };
				
				friend1.uid = 4116901;
				friend1.first_name = "Костя";
				friend1.last_name = "Цзю";
				friend1.photo_medium = "../bitmaps/avatars/b_1910da68.jpg";
				
				friend2.uid = 4116902;
				friend2.first_name = "Мик";
				friend2.last_name = "Джагер";
				friend2.photo_medium = "../bitmaps/avatars/b_a65e6479.jpg";
				
				friend3.uid = 4116903;
				friend3.first_name = "Тото";
				friend3.last_name = "Кутуньо";
				friend3.photo_medium = "../bitmaps/avatars/b_6495bff0.jpg";
				
				friend4.uid = 4116904;
				friend4.first_name = "Марк";
				friend4.last_name = "Шагал";
				friend4.photo_medium = "../bitmaps/avatars/b_bff84665.jpg";
				
				friend5.uid = 4116905;
				friend5.first_name = "Александр";
				friend5.last_name = "Лукашенко";
				friend5.photo_medium = "../bitmaps/avatars/b_1418a99c.jpg";
				
				response.push( friend1, friend2, friend3, friend4, friend5 );
				
				return response;
		}
		
		/**
		 * Получение полного списка друзей
		 * Эмуляция запроса friends.get
		 * @return
		 */
		
		public static function getVkFriends():Array {
			var response:Array = [];
				var friend1:Object = { };
				var friend2:Object = { };
				var friend3:Object = { };
				var friend4:Object = { };
				var friend5:Object = { };
				var friend6:Object = { };
				var friend7:Object = { };
				var friend8:Object = { };
				
				friend1.uid = 4116901;
				friend1.first_name = "Костя";
				friend1.last_name = "Цзю";
				friend1.photo_medium = "../bitmaps/avatars/b_1910da68.jpg";
				
				friend2.uid = 4116902;
				friend2.first_name = "Мик";
				friend2.last_name = "Джагер";
				friend2.photo_medium = "../bitmaps/avatars/b_a65e6479.jpg";
				
				friend3.uid = 4116903;
				friend3.first_name = "Тото";
				friend3.last_name = "Кутуньо";
				friend3.photo_medium = "../bitmaps/avatars/b_6495bff0.jpg";
				
				friend4.uid = 4116904;
				friend4.first_name = "Марк";
				friend4.last_name = "Шагал";
				friend4.photo_medium = "../bitmaps/avatars/b_bff84665.jpg";
				
				friend5.uid = 4116905;
				friend5.first_name = "Александр";
				friend5.last_name = "Лукашенко";
				friend5.photo_medium = "../bitmaps/avatars/b_1418a99c.jpg";
				
				friend6.uid = 4116906;
				friend6.first_name = "Роберто";
				friend6.last_name = "Карлос";
				friend6.photo_medium = 	"../bitmaps/avatars/b_1418a99c.jpg";
				
				friend7.uid = 4116907;
				friend7.first_name = "Роберто";
				friend7.last_name = "Карлос";
				friend7.photo_medium = "../bitmaps/avatars/b_1418a99c.jpg";
				
				friend8.uid = 4116908;
				friend8.first_name = "Роберто";
				friend8.last_name = "Карлос";
				friend8.photo_medium = "../bitmaps/avatars/b_1418a99c.jpg";
				
				response.push( friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8 );
				
				return response;
		}
		
		/**
		 * Список друзей установивших приложение
		 * Эмуляция ответа на запрос friends.getAppUsers
		 * @return
		 */
		
		public static function getVkAppUsers():Array {
			var users:Array = [ 4116907, 4322875, 5185087, 7217232, 25513832 ];
			return users;
		}
		
		/**
		 * Статические предметы
		 * Эмуляция ответа на запрос getStaticItems.
		 * @return
		 */
		
		public static function getStaticItems():Object {
			var staticItems:Object = createObject();
			var dataArray:Array = staticItems.data;
			var data:Object = staticItems.data[ 0 ].data;
			var items:Array;
			var personages:Array;
			var item:Object = { };
			data.items = items = [];
			data.personages = personages = [];
			
			// Копилки
			
			item = { };
			item.id = 1;
			item.name = "Копилка «Порося»";
			item.path = "items/moneybox/pig.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 1;
			item.description = "Описание дефолтной копилки";
			items.push( item );
			
			item = { };
			item.id = 2;
			item.name = "Копилка «Порося-нигга»";
			item.path = "items/moneybox/pig2.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 1;
			item.description = "Описание дефолтной копилки";
			items.push( item );
			
			item = { };
			item.id = 3;
			item.name = "Копилка «Бледный порося»";
			item.path = "items/moneybox/pig3.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 1;
			item.description = "Описание дефолтной копилки";
			items.push( item );
			
			item = { };
			item.id = 4;
			item.name = "Копилка «Порося-любовник»";
			item.path = "items/moneybox/pig4.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 1;
			item.description = "Описание дефолтной копилки";
			items.push( item );
			
			item = { };
			item.id = 5;
			item.name = "Копилка «Звездный порося»";
			item.path = "items/moneybox/pig5.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 1;
			item.description = "Описание дефолтной копилки";
			items.push( item );
			
			item = { };
			item.id = 6;
			item.name = "Копилка «Порося тигрик»";
			item.path = "items/moneybox/pig6.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 1;
			item.description = "Описание дефолтной копилки";
			items.push( item );
			
			item = { };
			item.id = 7;
			item.name = "Копилка «Порося в горошек»";
			item.path = "items/moneybox/pig7.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 1;
			item.description = "Описание дефолтной копилки";
			items.push( item );
			
			// Двери
			
			item = { };
			item.id = 8;
			item.name = "Дверь «Эконом-10»";
			item.path = "items/doors/door.png";
			item.price = 10;
			item.unlockPrice = 0;
			item.minLvl = 0;
			item.durability = 50;
			item.previewPath;
			item.type = 2;
			item.description = "Описание дефольной двери";
			items.push( item );
			
			item = { };
			item.id = 9;
			item.name = "Дверь «Модник-GT»";
			item.path = "items/doors/door2.png";
			item.price = 10;
			item.unlockPrice = 0;
			item.minLvl = 0;
			item.durability = 50;
			item.previewPath;
			item.type = 2;
			item.description = "Описание предмета";
			items.push( item );
			
			item = { };
			item.id = 10;
			item.name = "Дверь с засовом";
			item.path = "items/doors/door3.png";
			item.price = 10;
			item.unlockPrice = 0;
			item.minLvl = 0;
			item.durability = 50;
			item.previewPath;
			item.type = 2;
			item.description = "Описание предмета";
			items.push( item );
			
			item = { };
			item.id = 11;
			item.name = "Дверь с собачкой";
			item.path = "items/doors/door4.png";
			item.price = 10;
			item.unlockPrice = 0;
			item.minLvl = 0;
			item.durability = 50;
			item.previewPath;
			item.type = 2;
			item.description = "Описание предмета";
			items.push( item );
			
			item = { };
			item.id = 12;
			item.name = "Бронерованная дверь «Гангстер»";
			item.path = "items/doors/door5.png";
			item.price = 10;
			item.unlockPrice = 0;
			item.minLvl = 0;
			item.durability = 50;
			item.previewPath;
			item.type = 2;
			item.description = "Описание предмета";
			items.push( item );
			
			// Крышки погреба
			
			item = { };
			item.id = 13;
			item.name = "Крышка погреба «Стандарт-400»";
			item.path = "items/cellar/repo_cover.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 3;
			item.description = "Описание предмета id: 13";
			items.push( item );
			
			item = { };
			item.id = 14;
			item.name = "Крышка погреба «Стандарт-Ультра»";
			item.path = "items/cellar/repo_cover2.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 3;
			item.description = "Описание предмета id: 14";
			items.push( item );
			
			item = { };
			item.id = 15;
			item.name = "Крышка погреба «Кругляш-80»";
			item.path = "items/cellar/repo_cover3.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 3;
			item.description = "Описание предмета id: 14";
			items.push( item );
			
			item = { };
			item.id = 16;
			item.name = "Крышка погреба «Кругляш-200»";
			item.path = "items/cellar/repo_cover4.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 3;
			item.description = "Описание предмета id: 14";
			items.push( item );
			
			item = { };
			item.id = 17;
			item.name = "Крышка погреба «Броне-ганкстер-60»";
			item.path = "items/cellar/repo_cover5.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath ;
			item.type = 3;
			item.description = "Описание предмета id: 14";
			items.push( item );
			
			// Доски
			
			item = { };
			item.id = 18;
			item.name = "Доска «Школьник-410М»";
			item.path = "items/boards/board.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 4;
			item.description = "Описание предмета id: 4";
			items.push( item );
			
			item = { };
			item.id = 19;
			item.name = "Доска «Школьник-Ganja style»";
			item.path = "items/boards/board2.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 4;
			item.description = "Описание предмета id: 4";
			items.push( item );
			
			item = { };
			item.id = 20;
			item.name = "Доска «Школьник-Glamour style»";
			item.path = "items/boards/board3.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 4;
			item.description = "Описание предмета id: 4";
			items.push( item );
			
			item = { };
			item.id = 21;
			item.name = "Доска «Школьник-Gay style»";
			item.path = "items/boards/board4.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 4;
			item.description = "Описание предмета id: 4";
			items.push( item );
			
			item = { };
			item.id = 22;
			item.name = "Доска «Школьник-Summer style»";
			item.path = "items/boards/board5.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 4;
			item.description = "Описание предмета id: 4";
			items.push( item );
			
			item = { };
			item.id = 23;
			item.name = "Доска «Школьник-Mathematician style»";
			item.path = "items/boards/board6.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 4;
			item.description = "Описание предмета id: 4";
			items.push( item );
			
			item = { };
			item.id = 24;
			item.name = "Доска «Школьник-Philologist style»";
			item.path = "items/boards/board7.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 4;
			item.description = "Описание предмета id: 4";
			items.push( item );
			
			// Лампы
			
			item = { };
			item.id = 25;
			item.name = "Лампочка Ильича";
			item.path = "items/lamps/lamp01.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath = "previews/lamps/lamp01.png";
			item.type = 5;
			item.description = "Описание предмета 25";
			items.push( item );
			
			// Выключатели
			item = { };
			item.id = 26;
			item.name = "Выключатель «Лох-20»";
			item.path = "items/switchers/switcher01.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath = "previews/switchers/switcher01.png";
			item.type = 39;
			item.description = "Описание предмета 26";
			items.push( item );
			
			item = { };
			item.id = 27;
			item.name = "Выключатель «Дабл»";
			item.path = "items/switchers/switcher02.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath = "previews/switchers/switcher02.png";
			item.type = 39;
			item.description = "Описание предмета 27";
			items.push( item );
			
			item = { };
			item.id = 28;
			item.name = "Выключатель «Круглый-40»";
			item.path = "items/switchers/switcher03.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath = "previews/switchers/switcher03.png";
			item.type = 39;
			item.description = "Описание предмета 28";
			items.push( item );
			
			// Окна
			
			item = { };
			item.id = 29;
			item.name = "Круглое окно";
			item.path = "items/windows/window.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 6;
			item.description = "Описание предмета id: 6";
			items.push( item );
			
			item = { };
			item.id = 30;
			item.name = "Квадратное окно";
			item.path = "items/windows/window2.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 6;
			item.description = "Описание предмета id: 7";
			items.push( item );
			
			item = { };
			item.id = 31;
			item.name = "Трехугольное окно";
			item.path = "items/windows/window3.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 6;
			item.description = "Описание предмета id: 8";
			items.push( item );
			
			item = { };
			item.id = 32;
			item.name = "Ромбовидное окно";
			item.path = "items/windows/window4.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 6;
			item.description = "Описание предмета 9";
			items.push( item );
			
			// Покрытия пола
			
			item = { };
			item.id = 33;
			item.name = "Пол 1";
			item.path = "items/floors/floor1.gif";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 7;
			item.description = "Описание предмета 33";
			items.push( item );
			
			item = { };
			item.id = 34;
			item.name = "Пол 2";
			item.path = "items/floors/floor2.gif";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 7;
			item.description = "Описание предмета 34";
			items.push( item );
			
			item = { };
			item.id = 35;
			item.name = "Пол 3";
			item.path = "items/floors/floor3.gif";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 7;
			item.description = "Описание предмета 41";
			items.push( item );
			
			item = { };
			item.id = 36;
			item.name = "Пол 4";
			item.path = "items/floors/floor4.gif";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 7;
			item.description = "Описание предмета 42";
			items.push( item );
			
			item = { };
			item.id = 37;
			item.name = "Пол 5";
			item.path = "items/floors/floor5.gif";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 7;
			item.description = "Описание предмета 43";
			items.push( item );
			
			// Обои
			
			item = { };
			item.id = 38;
			item.name = "Обои «Эконом-59»";
			item.path = "items/wallpapers/wallpaper1.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 40;
			item.description = "Описание предмета 35";
			items.push( item );
			
			item = { };
			item.id = 39;
			item.name = "Обои «Мода-87»";
			item.path = "items/wallpapers/wallpaper2.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 40;
			item.description = "Описание предмета 36";
			items.push( item );
			
			item = { };
			item.id = 40;
			item.name = "Обои «Любовник-280»";
			item.path = "items/wallpapers/wallpaper3.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 40;
			item.description = "Описание предмета 37";
			items.push( item );
			
			item = { };
			item.id = 41;
			item.name = "Обои «Усы-40»";
			item.path = "items/wallpapers/wallpaper4.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 40;
			item.description = "Описание предмета 38";
			items.push( item );
			
			item = { };
			item.id = 42;
			item.name = "Обои «Звездный час 8»";
			item.path = "items/wallpapers/wallpaper5.png";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 40;
			item.description = "Описание предмета 39";
			items.push( item );
			
			item = { };
			item.id = 43;
			item.name = "Обои «Хуйпойми что 60»";
			item.path = "items/wallpapers/wallpaper6.gif";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 40;
			item.description = "Описание предмета 40";
			items.push( item );
			
			// Очки
			
			item = { };
			item.id = 44;
			item.name = "Очки гангстера";
			item.path = "items/glasses/glasses01.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 41";
			items.push( item );
			
			item = { };
			item.id = 45;
			item.name = "Очки «Слепец»";
			item.path = "items/glasses/glasses02.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 46;
			item.name = "Очки «Слепец-Модник»";
			item.path = "items/glasses/glasses03.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 47;
			item.name = "Очки «Ботаник-гей»";
			item.path = "items/glasses/glasses04.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 48;
			item.name = "Очки «Хассла-17»";
			item.path = "items/glasses/glasses05.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 49;
			item.name = "Очки «Сердечки-40»";
			item.path = "items/glasses/glasses06.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 50;
			item.name = "Круглые очки";
			item.path = "items/glasses/glasses07.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 51;
			item.name = "Пираты очки";
			item.path = "items/glasses/glasses08.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 52;
			item.name = "Большие очки";
			item.path = "items/glasses/glasses09.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 53;
			item.name = "Ла-ла-лей-ли-е";
			item.path = "items/glasses/glasses10.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 12;
			item.description = "Описание предмета 40";
			items.push( item );
			
			// Галстуки
			
			item = { };
			item.id = 54;
			item.name = "";
			item.path = "items/ties/tie01.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 55;
			item.name = "";
			item.path = "items/ties/tie02.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 56;
			item.name = "";
			item.path = "items/ties/tie03.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 57;
			item.name = "";
			item.path = "items/ties/tie04.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 58;
			item.name = "";
			item.path = "items/ties/tie05.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			// Бабочки
			
			item = { };
			item.id = 59;
			item.name = "";
			item.path = "items/bowties/bowtie01.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 60;
			item.name = "";
			item.path = "items/bowties/bowtie02.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 61;
			item.name = "";
			item.path = "items/bowties/bowtie03.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 62;
			item.name = "";
			item.path = "items/bowties/bowtie04.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 63;
			item.name = "";
			item.path = "items/bowties/bowtie05.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 14;
			item.description = "Описание предмета 40";
			items.push( item );
			
			// Браслеты на руки
			
			item = { };
			item.id = 64;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet01.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 65;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet02.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 66;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet03.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 67;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet04.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 68;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet05.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 69;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet06.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 70;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet07.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 71;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet08.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 72;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet09.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 73;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet10.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 74;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet11.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 75;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet12.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 76;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet13.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 77;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet14.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 78;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet15.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 79;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet16.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 80;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet17.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 81;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet18.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 82;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet19.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			item = { };
			item.id = 83;
			item.name = "";
			item.path = "items/handBraceletes/handBracelet20.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 10;
			item.description = "Описание предмета 40";
			items.push( item );
			
			// Шлемы
			
			item = { };
			item.id = items.length + 1;
			item.name = "Ржавая каска пехотинца";
			item.path = "../publish/items/helmets/helmet01.swf";
			item.price = 67;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Ржавая каска с ремешком";
			item.path = "../publish/items/helmets/helmet02.swf";
			item.price = 150;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Полированная ржавая каска";
			item.path = "../publish/items/helmets/helmet03.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Оловянная каска пехотинца";
			item.path = "../publish/items/helmets/helmet04.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Оловянная каска с гребнем";
			item.path = "../publish/items/helmets/helmet05.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Двуслойная оловянная каска";
			item.path = "../publish/items/helmets/helmet06.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Оловянная каска с железным налобником";
			item.path = "../publish/items/helmets/helmet07.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Железная каска пехотинца";
			item.path = "../publish/items/helmets/helmet08.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Клёпанная железная каска";
			item.path = "../publish/items/helmets/helmet09.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Железная каска с подшлемником";
			item.path = "../publish/items/helmets/helmet10.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Стальная каска пехотинца";
			item.path = "../publish/items/helmets/helmet11.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Cтальная каска с прибором наблюдения";
			item.path = "../publish/items/helmets/helmet12.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Стальная каска с укреплением";
			item.path = "../publish/items/helmets/helmet13.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Стальная каска с амортизатором";
			item.path = "../publish/items/helmets/helmet14.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Хромированная стальная каска";
			item.path = "../publish/items/helmets/helmet15.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Закалённая стальная каска";
			item.path = "../publish/items/helmets/helmet16.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Шлем пожарного";
			item.path = "../publish/items/helmets/helmet17.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Шлем пожарного с никелевой вставкой";
			item.path = "../publish/items/helmets/helmet18.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Каркасный шлем пожарного";
			item.path = "../publish/items/helmets/helmet19.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Прорезиненный шлем пожарного";
			item.path = "../publish/items/helmets/helmet20.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Шлем пожарного-ветерана";
			item.path = "../publish/items/helmets/helmet21.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Шлем скаута";
			item.path = "../publish/items/helmets/helmet22.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Облегченный шлем скаута";
			item.path = "../publish/items/helmets/helmet23.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Шлем скаута с визорами";
			item.path = "../publish/items/helmets/helmet24.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Маскировочный шлем скаута";
			item.path = "../publish/items/helmets/helmet25.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Шлем скаута-следопыта";
			item.path = "../publish/items/helmets/helmet26.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Титановый шлем";
			item.path = "../publish/items/helmets/helmet27.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Титановый шлем со стабилизатором";
			item.path = "../publish/items/helmets/helmet28.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Титановый шлем с магнитным распределителем";
			item.path = "../publish/items/helmets/helmet29.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Боевой шлем";
			item.path = "../publish/items/helmets/helmet30.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Боевой шлем из баллистической брони";
			item.path = "../publish/items/helmets/helmet31.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Десантный боевой шлем";
			item.path = "../publish/items/helmets/helmet32.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Боевой шлем с платиновым напылением";
			item.path = "../publish/items/helmets/helmet33.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Боевой шлем с тепловизором";
			item.path = "../publish/items/helmets/helmet34.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Биомеханический шлем";
			item.path = "../publish/items/helmets/helmet35.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Биомеханический шлем из органической брони";
			item.path = "../publish/items/helmets/helmet36.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Управляемый биомеханический шлем";
			item.path = "../publish/items/helmets/helmet37.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Техношлем";
			item.path = "../publish/items/helmets/helmet38.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Техношлем с навигационным модулем";
			item.path = "../publish/items/helmets/helmet39.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Микроэлектронный техношлем";
			item.path = "../publish/items/helmets/helmet40.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Техношлем с плазма-компрессором";
			item.path = "../publish/items/helmets/helmet41.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Техношлем с энергомаской";
			item.path = "../publish/items/helmets/helmet42.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Экзошлем";
			item.path = "../publish/items/helmets/helmet43.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Экзошлем с фантомной бронёй";
			item.path = "../publish/items/helmets/helmet44.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			item = { };
			item.id = items.length + 1;
			item.name = "Легендарный экзошлем";
			item.path = "../publish/items/helmets/helmet45.swf";
			item.price = 10;
			item.unlockPrice = 10;
			item.minLvl = 1;
			item.durability = 70;
			item.previewPath;
			item.type = 16;
			item.description = "Описание предмета 16";
			items.push( item );
			
			// Персонажи
			
			data.personages[0] = { };
			data.personages[0].id = 1;
			data.personages[0].name = "Зайка";
			data.personages[0].path = "personages/zayac.swf";
			data.personages[0].price = 2450;
			data.personages[0].unlockPrice = 0;
			data.personages[0].minLvl = 0;
			data.personages[0].previewPath = "personages/previews/personage1.swf";
			data.personages[0].color = "0xFF00FF";
			data.personages[0].hp = 115;
			data.personages[0].mood = 21;
			data.personages[0].nerve = 315;
			data.personages[0].satiety = 121;
			data.personages[0].defence = 60;
			data.personages[0].description = "Зайка самый лошара из всех, у него красивые ноги, но он слишком любит кальмары, что вызывает у него диатез, который требует длительного лечения.";
			data.personages[0].isNew = 0;
			
			data.personages[1] = { };
			data.personages[1].id = 2;
			data.personages[1].name = "Ёжик";
			data.personages[1].path = "personages/ejik.swf";
			data.personages[1].price = 105;
			data.personages[1].unlockPrice = 7;
			data.personages[1].minLvl = 2;
			data.personages[1].previewPath = "personages/previews/personage1.swf";
			data.personages[1].color = "0xFF00FF";
			data.personages[1].hp = 148;
			data.personages[1].mood = 35;
			data.personages[1].nerve = 436;
			data.personages[1].satiety = 244;
			data.personages[1].defence = 60;
			data.personages[1].description = "Ёжик нормальный пацан, вот только тянет его к суициду временами. Ещё у него предрасположенность к скарлотине и парадонтозу. Ну а в целом, чуак он нормальный. Без хуйни такой.";
			data.personages[1].isNew = 1;
			
			return data;
		}
		
		/**
		 * Возвращает данные профайла игрока
		 * @return
		 */
		
		public static function getProfile():Object {
			var profileData:Object = createObject();
			var dataArray:Array = profileData.data;
			var data:Object = profileData.data[ 0 ].data;
			var items:Array;
			var personages:Array;
			var hole:Array;
			data.items = items = [];
			data.personages = personages = [];
			data.hole = hole = [];
			
			data.gold = 100;
			data.nuts = 75;
			data.rating = 100500;
			data.currentPid = 2;
			data.showTutorial = 1;
			
			personages[0] = { };
			personages[0].id = 1;
			personages[0].pid = 1;
			personages[0].name = "Валерий";
			personages[0].sex = 1;
			personages[0].color = 0xFFFF99;
			personages[0].level = 4;
			personages[0].loss = 5;
			personages[0].wins = 23;
			personages[0].equipment = [ 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			
			personages[1] = { };
			personages[1].id = 1;
			personages[1].pid = 2;
			personages[1].name = "Шамаич";
			personages[1].sex = 0;
			personages[1].color = 0x32BBCF;
			personages[1].level = 2;
			personages[1].loss = 6;
			personages[1].wins = 1;
			personages[1].equipment = [ 0, 0, 3, 0, 3, 3, 9, 3, 8 ];
			
			items[items.length] = { id: 70, iid: 1 };
			items[items.length] = { id: 71, iid: 2 };
			items[items.length] = { id: 85, iid: 3 };
			items[items.length] = { id: 85, iid: 4 };
			items[items.length] = { id: 89, iid: 5 };
			items[items.length] = { id: 88, iid: 6 };
			items[items.length] = { id: 65, iid: 7 };
			items[items.length] = { id: 61, iid: 8 };
			items[items.length] = { id: 69, iid: 9 };
			items[items.length] = { id: 76, iid: 10 };
			items[items.length] = { id: 58, iid: 11 };
			items[items.length] = { id: 50, iid: 12 };
			items[items.length] = { id: 45, iid: 13 };
			items[items.length] = { id: 53, iid: 14 };
			items[items.length] = { id: 52, iid: 15 };
			items[items.length] = { id: 51, iid: 16 };
			items[items.length] = { id: 51, iid: 17 };
			items[items.length] = { id: 70, iid: 18 };
			items[items.length] = { id: 2, iid: 19 };
			items[items.length] = { id: 1, iid: 20 };
			items[items.length] = { id: 1, iid: 21 };
			items[items.length] = { id: 1, iid: 22 };
			items[items.length] = { id: 1, iid: 23 };
			items[items.length] = { id: 1, iid: 24 };
			items[items.length] = { id: 1, iid: 25 };
			items[items.length] = { id: 1, iid: 26 };
			items[items.length] = { id: 1, iid: 27 };
			items[items.length] = { id: 1, iid: 28 };
			items[items.length] = { id: 1, iid: 29 };
			items[items.length] = { id: 1, iid: 30 };
			items[items.length] = { id: 1, iid: 31 };
			items[items.length] = { id: 1, iid: 32 };
			items[items.length] = { id: 1, iid: 33 };
			items[items.length] = { id: 1, iid: 34 };
			items[items.length] = { id: 1, iid: 35 };
			items[items.length] = { id: 1, iid: 36 };
			items[items.length] = { id: 1, iid: 37 };
			items[items.length] = { id: 1, iid: 38 };
			items[items.length] = { id: 1, iid: 39 };
			items[items.length] = { id: 1, iid: 41 };
			items[items.length] = { id: 1, iid: 42 };
			items[items.length] = { id: 1, iid: 43 };
			items[items.length] = { id: 1, iid: 44 };
			items[items.length] = { id: 1, iid: 45 };
			items[items.length] = { id: 1, iid: 46 };
			items[items.length] = { id: 1, iid: 47 };
			items[items.length] = { id: 1, iid: 48 };
			items[items.length] = { id: 1, iid: 49 };
			items[items.length] = { id: 1, iid: 51 };
			items[items.length] = { id: 1, iid: 52 };
			items[items.length] = { id: 1, iid: 53 };
			items[items.length] = { id: 1, iid: 54 };
			items[items.length] = { id: 1, iid: 55 };
			items[items.length] = { id: 1, iid: 56 };
			items[items.length] = { id: 1, iid: 57 };
			items[items.length] = { id: 1, iid: 58 };
			items[items.length] = { id: 1, iid: 59 };
			items[items.length] = { id: 1, iid: 61 };
			items[items.length] = { id: 1, iid: 62 };
			items[items.length] = { id: 1, iid: 63 };
			items[items.length] = { id: 1, iid: 64 };
			items[items.length] = { id: 1, iid: 65 };
			items[items.length] = { id: 1, iid: 66 };
			items[items.length] = { id: 1, iid: 67 };
			items[items.length] = { id: 1, iid: 68 };
			items[items.length] = { id: 1, iid: 69 };
			items[items.length] = { id: 1, iid: 71 };
			items[items.length] = { id: 1, iid: 72 };
			items[items.length] = { id: 1, iid: 73 };
			items[items.length] = { id: 1, iid: 74 };
			items[items.length] = { id: 1, iid: 75 };
			items[items.length] = { id: 1, iid: 76 };
			items[items.length] = { id: 1, iid: 77 };
			items[items.length] = { id: 1, iid: 78 };
			items[items.length] = { id: 1, iid: 79 };
			items[items.length] = { id: 1, iid: 80 };
			items[items.length] = { id: 1, iid: 81 };
			items[items.length] = { id: 1, iid: 82 };
			items[items.length] = { id: 10, iid: 83 };
			items[items.length] = { id: 10, iid: 84 };
			items[items.length] = { id: 17, iid: 85 };
			items[items.length] = { id: 11, iid: 86 };
			items[items.length] = { id: 11, iid: 87 };
			items[items.length] = { id: 11, iid: 88 };
			
			data.hole[0] = { };
			data.hole[0].pid = 1;
			data.hole[0].items = [];
			data.hole[0].items[0] = 	{ id: 1,	 x: 466,	y: 520 }; 		// Копилка
			data.hole[0].items[1] = 	{ id: 13,	 x: 334,	y: 508 }; 		// Крышка погреба
			data.hole[0].items[2] = 	{ id: 18,	 x: 440,	y: 338 }; 		// Доска
			data.hole[0].items[3] = 	{ id: 8,	 x: 814,	y: 333 }; 		// Дверь
			data.hole[0].items[4] = 	{ id: 29,	 x: 984,	y: 250 }; 		// Окно
			data.hole[0].items[5] = 	{ id: 1,	 x: 760,	y: 515 };		// Телевизор
			data.hole[0].items[6] = 	{ id: 25,	 x: 0,	 	y: 0 };			// Лампа
			data.hole[0].items[7] = 	{ id: 26,	 x: 783,	y: 405 };		// Выключатель
			data.hole[0].items[8] = 	{ id: 33,	 x: 0,		y: 0 };			// Покрытие пола
			data.hole[0].items[9] = 	{ id: 35,	 x: 0,		y: 0 };			// Обои
			
			data.hole[1] = { };
			data.hole[1].pid = 2;
			data.hole[1].items = [];
			data.hole[1].items[0] = 	{ id: 2,	 x: 466,	y: 520 };		// Копилка
			data.hole[1].items[1] = 	{ id: 17,	 x: 334,	y: 508 }; 		// Крышка погреба
			data.hole[1].items[2] = 	{ id: 22,	 x: 440,	y: 338 }; 		// Доска
			data.hole[1].items[3] = 	{ id: 12,	 x: 814,	y: 333 }; 		// Дверь
			data.hole[1].items[4] = 	{ id: 31,	 x: 984,	y: 250 }; 		// Окно
			data.hole[1].items[5] = 	{ id: 1,	 x: 760,	y: 515 };		// Телевизор
			data.hole[1].items[6] = 	{ id: 25,	 x: 0,	 	y: 0 };			// Лампа
			data.hole[1].items[7] = 	{ id: 28,	 x: 783, 	y: 405 };		// Выключатель
			data.hole[1].items[8] = 	{ id: 34,	 x: 0,		y: 0 };			// Покрытие пола
			data.hole[1].items[9] = 	{ id: 40,	 x: 0,		y: 0 };			// Обои
			
			/*data.hole[2] = { pid: 3 };
			data.hole[3] = { pid: 4 };
			data.hole[4] = { pid: 5 };
			data.hole[5] = { pid: 6 };
			data.hole[6] = { pid: 7 };
			data.hole[7] = { pid: 8 };
			data.hole[8] = { pid: 9 };
			data.hole[9] = { pid: 10 };
			data.hole[10] = { pid: 11 };
			data.hole[11] = { pid: 12 };
			data.hole[12] = { pid: 13 };
			data.hole[13] = { pid: 14 };
			data.hole[14] = { pid: 15 };
			data.hole[15] = { pid: 16 };
			data.hole[16] = { pid: 17 };
			data.hole[17] = { pid: 18 };
			data.hole[18] = { pid: 19 };
			data.hole[19] = { pid: 20 };
			data.hole[20] = { pid: 21 };*/
			
			return data;
		}
		
		/**
		 * Возвращает flashvars
		 * @return
		 */
		
		public static function getFlashvars():Object {
			var data:Object = { };
			data.lc_name = "1";
			data.api_id = "1";
			data.sid = "1";
			data.secret = "1";
			data.viewer_id = "1";
			return data;
		}
		
		/**
		 * Создаёт скилет ответа с дефолтными параметрами
		 * @return
		 */
		
		private static function createObject():Object {
			var object = new Object();
			object.errorType = 0;
			object.errorData = null;
			object.serverTime = 1234567898;
			object.data = [];
			object.data[ 0 ] = {};
			object.data[ 0 ].errorType = 0;
			object.data[ 0 ].errorData = null;
			object.data[ 0 ].serverTime = 1343320982;
			object.data[ 0 ].data = {};
			return object;
		}
		
	}

}