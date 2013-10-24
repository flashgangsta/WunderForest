﻿package com.rr {	import flash.utils.Dictionary;	/**	 * ...	 * @author Sergey Krivtsov (flashgangsta@gmail.com)	 */	public class Models {				/// Полный список моделей		protected var models:Vector.<ModelData> = new Vector.<ModelData>();				/// Список моделей отсортированный по их идентификатору		private var modelsByID:Dictionary = new Dictionary();		/// Список доступных типов моделей		private var modelTypeEnabled:Dictionary = new Dictionary();		/// Список списков моделей отсортированный по типу предмета		private var modelsListByTypes:Dictionary = new Dictionary();		/// Класс объекта модели		private var modelClass:Class;						/**		 * Конструктор		 * @param	modelClass класс моделей		 */				public function Models( modelClass:Class ) {			this.modelClass = modelClass;		}				/**		 * Возвращает количество моделей		 */				public function get length():int {			return models.length;		}				/**		 * Записывает модели всех существующих в игре персонажей или предметов		 * @param	list список базовых данных модели		 */				public function record( list:Array ):void {			for ( var i:int = 0; i < list.length; i++ ) {				var model:ModelData = new modelClass( list[ i ] );				var type:int = list[ i ].type;								modelsByID[ model.id ] = model;								if ( !modelTypeEnabled[ type ] ) {					modelsListByTypes[ type ] = new Vector.<ModelData>();					modelsListByTypes[ type ].push( model );					modelTypeEnabled[ type ] = true;				} else {					modelsListByTypes[ type ].push( model );				}								models.push( model );			}		}				/**		 * Возвразает модель по идентификатору		 * @param	идентификатор модели		 * @return 		 */				public function getModelByID( id:int ):ModelData {			var currentModel:ModelData = modelsByID[ id ];						if ( !currentModel ) {				throw new Error( "Модель объекта " + modelClass + " с идентификатором '" + id + "' отсутствует." );				return;			}						return currentModel;		}				/**		 * Возвращает модель из списка по индексу		 * @param	index		 * @return		 */				public function getModelByIndex( index:int ):ModelData {			return models[ index ];		}				/**		 * Возвразает список моделей по списку идентификаторов		 * @param	idList вектор содержащий в себе список идентификаторов необходимых моделей		 * @return		 */				public function getModelsListByID( idList:Vector.<int> ):Vector.<ModelData> {						var modelsList:Vector.<ModelData> = new Vector.<ModelData>();			for ( var i:int = 0; i < idList.length; i++ ) {				var model:ModelData = modelsByID[ idList[ i ] ];				if ( model ) {					modelsList.push( model );				} else {					throw new Error( "Модель объекта " + modelClass + " с идентификатором '" + idList[ i ] + "' отсутствует." );					return;				}			}			return modelsList;		}				/**		 * Возращает список моделей по списку типов		 * @param	typesList список типов необходимых моделей		 * @return		 */				public function getModelsListByTypes( typesList:Vector.<int> ):Vector.<ModelData> {			var modelsList:Vector.<ModelData> = new Vector.<ModelData>();			for ( var i:int = 0; i < typesList.length; i++ ) {				var list:Vector.<ModelData> = modelsListByTypes[ typesList[ i ] ];				if( list ) modelsList = modelsList.concat( list );			}			return modelsList;		}				/**		 * Возвращает имеется ли в базе предмет данного типа		 * @param	type		 * @return		 */				public function getModelTypeEnabled( type:int ):Boolean {			return modelTypeEnabled[ type ];		}			}}