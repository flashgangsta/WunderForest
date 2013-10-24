package com.rr.popups {
	import com.rr.ui.ItemWithIcon;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class ItemActionConfirmation extends ConfirmationPopup {
		
		private var itemIco:ItemWithIcon;
		
		/**
		 * Конструктор
		 * @param	message сообщение выводимое на экран
		 * @param	iconPath путь к иконке предмета
		 */
		
		public function ItemActionConfirmation( message:String, iconPath:String ) {
			itemIco = getChildByName( "itemIco_mc" ) as ItemWithIcon;
			
			label.text = message;
			label.autoSize = TextFieldAutoSize.CENTER;
			
			var messageArea:DisplayObject = getChildByName( "messageArea_mc" );
			messageArea.visible = false;
			alignLabelByArea( messageArea.getRect( this ) );
			
			itemIco.loadIcon( iconPath );
			
			addEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
		}
		
		/**
		 * Обработка удаления окна из списка отображения
		 * @param	event
		 */
		
		private function onRemovedFromStage( event:Event ):void {
			removeEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
			
			itemIco.removeIcon();
			itemIco = null;
		}
		
	}

}