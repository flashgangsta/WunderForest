package com.rr.pages.cellar {
	import com.rr.utils.InteractiveKiller;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Sergey Krivtsov (flashgangsta@gmail.com)
	 */
	public class PlacementTooltip extends Sprite {
		
		static public const LEFT:String = "left";
		static public const RIGHT:String = "right";
		static private const BODY_LAPPING_SIZE:int = 3;
		static private const LABEL_MARGIN:int = 8;
		
		private var label:TextField;
		private var bodyRectangle:Sprite;
		private var bodyTriangle:Sprite;
		
		public function PlacementTooltip() {
			visible = false;
			label = getChildByName( "label_txt" ) as TextField;
			bodyRectangle = getChildByName( "rect_mc" ) as Sprite;
			bodyTriangle = getChildByName( "triangle_mc" ) as Sprite;
			InteractiveKiller.kill( this );
		}
		
		public function show( message:String, direction:String = PlacementTooltip.LEFT ):void {
			visible = true;
			
			label.text = message;
			label.autoSize = TextFieldAutoSize.LEFT;
			bodyRectangle.width = Math.round( label.width + LABEL_MARGIN * 2 );
			
			if ( direction === PlacementTooltip.LEFT ) {
				bodyTriangle.scaleX = 1;
				bodyTriangle.x = 0;
				bodyRectangle.x = bodyTriangle.width - BODY_LAPPING_SIZE;
			} else if( direction === PlacementTooltip.RIGHT ) {
				bodyTriangle.scaleX = -1;
				bodyRectangle.x = 0;
				bodyTriangle.x = bodyRectangle.width + bodyTriangle.width - BODY_LAPPING_SIZE;
			}
			label.x = bodyRectangle.x + LABEL_MARGIN;
		}
		
		public function hide():void {
			visible = false;
		}
		
	}

}