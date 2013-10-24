package com.rr.popups {
	import com.rr.ItemData;
	import com.rr.ui.ItemWithIcon;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class ChangeItemConfirmation extends ConfirmationPopup {
		
		private var oldIcon:ItemWithIcon;
		private var newIcon:ItemWithIcon;
		private var newItemData:ItemData;
		
		/**
		 * 
		 * @param	message
		 * @param	oldIconPath
		 * @param	newIconPath
		 */
		
		public function ChangeItemConfirmation( message:String, oldIconPath:String, newItemData:ItemData ) {
			
			oldIcon = getChildByName( "oldIcon_mc" ) as ItemWithIcon;
			newIcon = getChildByName( "newIcon_mc" ) as ItemWithIcon;
			this.newItemData = newItemData;
			
			label.text = message;
			label.autoSize = TextFieldAutoSize.CENTER;
			
			oldIcon.loadIcon( oldIconPath );
			newIcon.loadIcon( newItemData.previewPath );
			addEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
		}
		
		/**
		 * Возвращает данные нового предмета
		 * @return
		 */
		
		public function getNewItemData():ItemData {
			return newItemData;
		}
		
		/**
		 * Обработка удаления окна из списка отображения
		 * @param	event
		 */
		
		private function onRemovedFromStage( event:Event ):void {
			removeEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
			
			oldIcon.removeIcon();
			newIcon.removeIcon();
			oldIcon = null;
			newIcon = null;
			newItemData = null;
		}
		
	}

}