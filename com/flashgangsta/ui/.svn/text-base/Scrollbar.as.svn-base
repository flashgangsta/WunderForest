/*
 * Scrollbar
 * Class for quick setting personal scrollbar component
 *
 * @author		Sergei Krivtsov
 * @version		1.00.98
 * @e-mail		flashgangsta@gmail.com
 *
*/

package com.flashgangsta.ui {
	import flash.geom.Rectangle;
	import flash.display.MovieClip;
	import com.flashgangsta.managers.ButtonManager;
	import com.flashgangsta.display.Drawing;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.system.Capabilities;
	import flash.external.ExternalInterface;
	
	public class Scrollbar {
		
		private static const SCROLL_INTERVAL_START:int = 500;
		private static const SCROLL_INTERVAL:int = 100;
		
		private static var id:int = 0;
		private static var dataBase:Array = [];
		private static var scrollInterval:uint;
		private static var scrollingByInterval:Boolean = false;
		
		public function Scrollbar() {
			throw new Error( "Scrollbar is a static class and should not be instantiated." );
		}
		
		public static function setVertical( content:Object, scrollArea:Rectangle, up:MovieClip, down:MovieClip, carret:MovieClip, carretDragArea:Rectangle, wheelListenerObject:Object, scrollDrag:Boolean = false ):void {
			
			var data:Object = { id: id, content: content, scrollArea: scrollArea, up: up, down: down, carret: carret, carretRoad: Scrollbar.addCarretRoad( carret, carretDragArea ), carretDragArea: carretDragArea, wheelListenerObject: wheelListenerObject, locked: false };
			dataBase.push( data );
			up.id = id;
			down.id = id;
			carret.id = id;
			content.id = id;
			
			if( scrollDrag ) {
				ButtonManager.addButton( MovieClip( content ), null, Scrollbar.dropContent, Scrollbar.dropContent, Scrollbar.dragContent );
			}
			
			
			var idIdentificator:MovieClip;
			idIdentificator = new MovieClip();
			idIdentificator.id = id;
			wheelListenerObject.stage.addChild( idIdentificator );
			
			if( Capabilities.os.indexOf( "Mac" ) !== -1 && ExternalInterface.available ) {
				ExternalInterface.addCallback( "callWheelListener", Scrollbar.onMacWheel );
				var objectID:String = ExternalInterface.objectID;
				var js:String = <![CDATA[
					function() {
						var delta = 0;
						var browserType = navigator.appName;
						var objectID = ']]> + objectID + <![CDATA[';
						var target = (navigator.appName.indexOf('Microsoft') !== -1 ? window : document)[objectID];
						function wheel( event ) {
							if( !event ) { //IE
								event = window.event;
							} else if ( event.wheelDelta ) { // Opera, Chrome, Safari
								delta = event.wheelDelta / 40;
							} else if( event.detail ) { // Mozilla
								delta = -event.detail;
							}
							if( delta != 0 ) {
								delta = delta > 0 ? 3 : -3; //Macos
								target.callWheelListener( delta );
							}
						}
						if( browserType.indexOf('Netscape') !== -1 ) {
							window.addEventListener('DOMMouseScroll', wheel, false);
							window.onmousewheel = wheel;
						} else {
							document.onmousewheel = window.onmousewheel = wheel;
						}
					}]]>;
				ExternalInterface.call( js );
			} else {
				wheelListenerObject.addEventListener( MouseEvent.MOUSE_WHEEL, Scrollbar.onWheel );
			}
			
			Scrollbar.update( carret );
			
			ButtonManager.addButton( up, null, Scrollbar.clearScrollInterval, Scrollbar.clearScrollInterval, Scrollbar.scrollUp, null, null, false );
			ButtonManager.addButton( down, null, Scrollbar.clearScrollInterval, Scrollbar.clearScrollInterval, Scrollbar.scrollDown, null, null, false );
			ButtonManager.addButton( carret, null, Scrollbar.dropCarret, Scrollbar.dropCarret, Scrollbar.dragCarret, null, null, false );
			
			Scrollbar.reset( carret );
			
			++ id;
			
		}
		
		public static function removeVerticalScrollbar( carret:MovieClip ):void {
			var data:Object = Scrollbar.getData( carret.id );
			
			data.up.id = null;
			data.down.id = null;
			data.carret.id = null;
			data.content.id = null;
			data.carretRoad.id = null;
			
			ButtonManager.removeButton( MovieClip( data.content ) );
			ButtonManager.removeButton( data.up );
			ButtonManager.removeButton( data.down );
			ButtonManager.removeButton( data.carret );
			
			
			data.wheelListenerObject.removeEventListener( MouseEvent.MOUSE_WHEEL, Scrollbar.onWheel );
			
			trace( "Scrollbar", data.id, "removed." );
			
			Scrollbar.dataBase[data.id] = null;
			data = null;
		}
		
		public static function reset( carret:MovieClip ):void {
			var data:Object = Scrollbar.getData( carret.id );
			data.carret.y = data.carretDragArea.y;
			data.content.y = data.scrollArea.y;
			Scrollbar.setButtonsStates( data );
		}
		
		public static function update( carret:MovieClip ):void {
			var data:Object = Scrollbar.getData( carret.id );
			if( data.scrollArea.height > data.content.height ) {
				return;
			}
			var precent:int = Math.round( data.scrollArea.height / data.content.height * 100 );
			data.carret.height = Math.round( data.carretDragArea.height / 100 * precent );
		}
		
		public static function lock( carret:MovieClip ):void {
			var data:Object = Scrollbar.getData( carret.id );
			data.locked = true;
		}
		
		public static function unlock( carret:MovieClip ):void {
			var data:Object = Scrollbar.getData( carret.id );
			data.locked = false;
		}
		
		private static function setButtonsStates( data:Object ):void {
			if( data.carret.y === data.carretDragArea.y ) {
				ButtonManager.setButtonState( data.up, ButtonManager.STATE_NORMAL );
				ButtonManager.setButtonEnable( data.up, false, true );
				ButtonManager.setButtonEnable( data.down, true, true );
			} else if( !ButtonManager.getButtonEnable( data.up ) ) {
				ButtonManager.setButtonEnable( data.up, true, true );
			}
			
			if( data.carret.y === data.carretDragArea.y + data.carretDragArea.height - data.carret.height ) {
				ButtonManager.setButtonState( data.down, ButtonManager.STATE_NORMAL );
				ButtonManager.setButtonEnable( data.down, false, true );
				ButtonManager.setButtonEnable( data.up, true, true );
			} else if( !ButtonManager.getButtonEnable( data.down ) ) {
				ButtonManager.setButtonEnable( data.down, true, true );
			}
		}
		
		private static function dragCarret( target:MovieClip ):void {
			var data:Object = Scrollbar.getData( target.id );
			
			var idIdentificator:MovieClip = new MovieClip();
			idIdentificator.id = data.id;
			target.stage.addChild( idIdentificator );
			target.idIdentificator = idIdentificator;
			
			target.startDrag( false, new Rectangle( data.carretDragArea.x, data.carretDragArea.y, 0, data.carretDragArea.height - data.carret.height ) );
			target.stage.addEventListener( MouseEvent.MOUSE_MOVE, Scrollbar.onCarretDragged );
		}
		
		private static function dropCarret( target:MovieClip ):void {
			target.stopDrag();
			target.stage.removeEventListener( MouseEvent.MOUSE_MOVE, Scrollbar.onCarretDragged );
		}
		
		private static function onCarretDragged( event:MouseEvent ):void {
			var id:int = ( event.currentTarget.getChildAt( event.currentTarget.numChildren - 1 ) as MovieClip ).id;
			var data:Object = Scrollbar.getData( id );
			Scrollbar.setContentPosition( data );
		}
		
		private static function onMacWheel( delta:String ):void {
			Scrollbar.onWheel( new MouseEvent( "mouseWheel", true, false, 0, 0, null, false, false, false, false, parseInt( delta ) ) );
		}
		
		private static function onWheel( event:MouseEvent ):void {
			var id:int;
			id = ( event.currentTarget.getChildAt( event.currentTarget.numChildren - 1 ) as MovieClip ).id;
			var data:Object = Scrollbar.getData( id );
			
			if( data.locked ) return;
			data.content.y += ( event.delta * 40 );
			Scrollbar.setMargins( data );
			Scrollbar.setCarretPosition( data );
			Scrollbar.setButtonsStates( data );
		}
		
		private static function setMargins( data:Object ):void {
			if( data.content.y < data.scrollArea.y - ( data.content.height - data.scrollArea.height ) ) {
				data.content.y = data.scrollArea.y - ( data.content.height - data.scrollArea.height );
			}
			if( data.content.y > data.scrollArea.y ) {
				data.content.y = data.scrollArea.y;
			}
		}
		
		private static function setCarretPosition( data:Object ):void {
			var precent:int = Math.abs( Math.round( ( data.content.y - data.scrollArea.y ) / ( data.content.height - data.scrollArea.height ) * 100 ) );
			data.carret.y = Math.round( data.carretDragArea.y + ( ( data.carretDragArea.height - data.carret.height ) / 100 * precent ) );
		}
		
		private static function setContentPosition( data:Object ):void {
			var precent:int = Math.round( ( data.carret.y - data.carretDragArea.y ) / ( data.carretDragArea.height - data.carret.height ) * 100 );
			data.content.y = data.scrollArea.y - ( ( data.content.height - data.scrollArea.height ) / 100 * precent);
			Scrollbar.setButtonsStates( data );
		}
		
		private static function dragContent( target:MovieClip ):void {
			var idIdentificator:MovieClip = new MovieClip();
			var data:Object = Scrollbar.getData( target.id );
			idIdentificator.id = target.id;
			target.stage.addChild( idIdentificator );
			target.stage.addEventListener( MouseEvent.MOUSE_MOVE, Scrollbar.onContentDragged );
			target.startDrag( false, new Rectangle( data.scrollArea.x - ( data.content.width - data.scrollArea.width ), data.scrollArea.y - ( data.content.height - data.scrollArea.height ), data.content.width - data.scrollArea.width, data.content.height - data.scrollArea.height ) );
		}
		
		private static function dropContent( target:MovieClip ):void {
			target.stopDrag();
			target.stage.removeEventListener( MouseEvent.MOUSE_MOVE, Scrollbar.onContentDragged );
		}
		
		private static function onContentDragged( event:MouseEvent ):void {
			var id:int = ( event.currentTarget.getChildAt( event.currentTarget.numChildren - 1 ) as MovieClip ).id;
			var data:Object = Scrollbar.getData( id );
			Scrollbar.setCarretPosition( data );
			Scrollbar.setButtonsStates( data );
		}
		
		private static function scrollUp( target:MovieClip ):void {
			var data:Object = Scrollbar.getData( target.id );
			data.content.y += 30;
			Scrollbar.setMargins( data );
			Scrollbar.setCarretPosition( data );
			Scrollbar.setButtonsStates( data );
			Scrollbar.scrollInterval = setTimeout( Scrollbar.scrollUp, Scrollbar.scrollingByInterval ? Scrollbar.SCROLL_INTERVAL : Scrollbar.SCROLL_INTERVAL_START, target );
			Scrollbar.scrollingByInterval = true;
		}
		
		private static function scrollDown( target:MovieClip ):void {
			var data:Object = Scrollbar.getData( target.id );
			data.content.y -= 30;
			Scrollbar.setMargins( data );
			Scrollbar.setCarretPosition( data );
			Scrollbar.setButtonsStates( data );
			Scrollbar.scrollInterval = setTimeout( Scrollbar.scrollDown, Scrollbar.scrollingByInterval ? Scrollbar.SCROLL_INTERVAL : Scrollbar.SCROLL_INTERVAL_START, target );
			Scrollbar.scrollingByInterval = true;
		}
		
		private static function clearScrollInterval( target:MovieClip ):void {
			clearTimeout( Scrollbar.scrollInterval );
			Scrollbar.scrollingByInterval = false;
		}
		
		private static function addCarretRoad( carret:MovieClip, carretDragArea:Rectangle ):MovieClip {
			var carretRoad:MovieClip = new MovieClip();
			carretRoad.id = Scrollbar.id;
			carretRoad.x = carret.x;
			carretRoad.y = carretDragArea.y;
			Drawing.drawRectangle( carretRoad, 0, 0, carret.width, carretDragArea.height, 0, 0 );
			carret.parent.addChild( carretRoad );
			carret.parent.setChildIndex( carretRoad, carret.parent.getChildIndex( carret ) - 1 );
			ButtonManager.addButton( carretRoad, null, null, null, carredRoadClicked, null, null, false );
			return carretRoad;
		}
		
		private static function carredRoadClicked( target:MovieClip ):void {
			var data:Object = Scrollbar.getData( target.id );
			var precent:int = target.mouseY / target.height * 100;
			data.carret.y = Math.round( data.carretDragArea.y + ( ( data.carretDragArea.height - data.carret.height ) / 100 * precent ) );
			Scrollbar.setContentPosition( data );
		}
		
		private static function getData( id:int ):Object {
			return Scrollbar.dataBase[ id ];
		}
		
	}	
}