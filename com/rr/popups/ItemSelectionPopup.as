package com.rr.popups {
	import com.flashgangsta.managers.ButtonManager;
	import com.rr.ItemData;
	import com.rr.pages.cellar.CellarItemsContainer;
	import com.rr.utils.InteractiveKiller;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class ItemSelectionPopup extends ConfirmationPopup {
		
		private var container:CellarItemsContainer;
		private var notItemsLabel:TextField;
		
		public function ItemSelectionPopup( title:String, itemsList:Vector.<ItemData> ) {
			container = getChildByName( "container_mc" ) as CellarItemsContainer;
			notItemsLabel = getChildByName( "notItemsLabel_txt" ) as TextField;
			
			InteractiveKiller.kill( notItemsLabel );
			
			label.text = "Вещи " + title.toLowerCase();
			
			notItemsLabel.text = "У вас нет предметов " + title.toLowerCase();
			
			if ( itemsList ) {
				container.fill( itemsList );
				notItemsLabel.visible = false;
			}
			
			ButtonManager.setButtonEnable( yesBtn, false, true );
			container.addEventListener( Event.SELECT, onItemSelect );
			
			addEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
		}
		
		/**
		 * 
		 * @param	event
		 */
		
		private function onRemovedFromStage( event:Event ):void {
			removeEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
			container.destroy();
		}
		
		/**
		 * 
		 * @param	event
		 */
		
		private function onItemSelect( event:Event ):void {
			container.removeEventListener( Event.SELECT, onItemSelect );
			ButtonManager.setButtonEnable( yesBtn, true, true );
		}
		
		/**
		 * 
		 * @return
		 */
		
		public function getSelectedItem():ItemData {
			return container.getSelectedItem();
		}
		
	}

}