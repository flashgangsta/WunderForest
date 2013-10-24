package com.rr.api {
	import flash.events.ErrorEvent;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import com.adobe.crypto.MD5;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	/**
	 * Диспатчитая после того как запрос успешно завершён
	 * @eventType	flash.events.Event.COMPLETE
	 */
	[Event(name="complete", type="flash.events.Event")] 
	
	
	
	public class Connector extends EventDispatcher {
		
		/// Версия клиента
		private static const REVISION:String = "1";
		/// Адрес сервера
		private static const SERVER_URL:String = "http://85.25.119.18:8080/server-v1/game/roulette.jsp";
		
		/// Загрузчик
		private var loader:URLLoader;
		/// Запрос
		private var request:URLRequest = new URLRequest( SERVER_URL );
		/// Порядковый номер запроса
		private var sequence:int = 0;
		/// Последний отосланный метод запроса
		private var currentMethod:String = null;
		/// Объект с ответом на запрос
		private var response:Object;
		/// Стандартные параметры запроса
		private var defaultRequestParams:Object = {};
		
		/**
		 * Класс предназначен для общения клиента с сервером
		 * @param	user_id
		 * @param	access_token
		 */
		
		public function Connector( user_id:String, access_token:String ) {
			request.method = URLRequestMethod.POST;
			defaultRequestParams.flashRevision = Connector.REVISION;
			defaultRequestParams.userId = "13040"; //user_id; TODO: воостановить предачу id из вконтактика
			defaultRequestParams.token = access_token;
		}
		
		/**
		 * Отправляет запрос на сервер
		 * @param	method
		 * @param	params
		 * @param	...attributes
		 */
		
		public function send( method:String, params:Object = null, ...attributes ):void {
			sequence ++;
			currentMethod = method;
			
			if( loader ) {
				loader.close();
				removeLoader();
			}
			
			if ( !params ) params = { };
			
			params.sequence = sequence;
			params.functionName = "RouletteService." + method;
			params.params = attributes;
			
			defaultRequestParams.sigTime = Math.floor( new Date().getTime() / 1000 );
			
			loader = new URLLoader();
			request.data = getRequestParams( params );
			
			trace( "#### REQUEST: \n", request.data.json, "\n------------" );
			
			loader.addEventListener( Event.COMPLETE, onSended );
			loader.addEventListener( IOErrorEvent.IO_ERROR, onSendError );
			
			loader.load( request );
		}
		
		/**
		 * Возвращает объект содержащий в себе ответ
		 * @return
		 */
		
		public function getResponse():Object {
			return response;
		}
		
		private function getRequestParams( params ):URLVariables {
			var vars:URLVariables = new URLVariables();
			vars.json = JSON.stringify( [ "BaseService.dispatchBatch", {}, defaultRequestParams, [ params ], 0 ] );
			return vars;
		}
		
		private function onSended( event:Event ):void {
			var response:Object = JSON.parse( event.target.data );
			trace( "*** RESPONSE: \n", event.target.data, "\n-------------" );
			var success:Boolean = !Boolean( response.errorType );
			var responseData:Object = response.data[ 0 ];
			
			/// TODO: сделать нормально этот момент
			this.response = responseData ? responseData.data : {};
			
			removeLoader();
			
			if( success ) {
				//trace( "*** RESPONSE: \n", event.target.data, "\n-------------" );
				dispatchEvent( new Event( Event.COMPLETE ) );
			} else {
				//trace( "###", currentMethod, "error in response" );
				var errorEvent:ErrorEvent = new ErrorEvent( ErrorEvent.ERROR );
				errorEvent.text = "";
				dispatchEvent( errorEvent );
			}
		}
		
		private function onSendError( event:IOErrorEvent ):void {
			trace( "###", currentMethod, "send server error" );
			removeLoader();
			dispatchEvent( event );
		}
		
		private function removeLoader():void {
			loader.removeEventListener( Event.COMPLETE, onSended );
			loader.removeEventListener( IOErrorEvent.IO_ERROR, onSendError );
			loader = null;
		}
		
	}
	
}