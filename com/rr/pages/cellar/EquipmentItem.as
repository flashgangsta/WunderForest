package com.rr.pages.cellar {
	import com.rr.ItemData;
	import com.rr.ui.ItemWithIcon;
	import com.rr.utils.InteractiveKiller;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Sergey Krivtsov
	 */
	
	public class EquipmentItem extends ItemWithIcon {
		
		private var crossIco:Sprite;
		private var crossShadow:Sprite;
		private var repairIco:Sprite;
		private var itemData:ItemData;
		
		internal var tooltipMessage:String;
		internal var placeOfUsing:String;
		
		public function EquipmentItem() {
			crossIco = getChildByName( "crossIco_mc" ) as Sprite;
			crossShadow = getChildByName( "crossShadow_mc" ) as Sprite;
			repairIco = getChildByName( "repairIco_mc" ) as Sprite;
			InteractiveKiller.kill( crossIco, crossShadow, icon, repairIco );
			
			repairIco.visible = false;
		}
		
		public function fill( itemData:ItemData ):void {
			clear();
			this.itemData = itemData;
			crossIco.visible = false;
			crossShadow.visible = false;
			loadIcon( itemData.previewPath );
		}
		
		public function clear():void {
			removeIcon();
			crossIco.visible = true;
			crossShadow.visible = true;
			itemData = null;
		}
		
		public function isEmpty():Boolean {
			return crossIco.visible;
		}
		
		public function getItemData():ItemData {
			return itemData;
		}
		
	}

}