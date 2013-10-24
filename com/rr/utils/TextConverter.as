package com.rr.utils {
	
	import flash.globalization.NumberFormatter;
	import flash.globalization.LocaleID;
	
	public class TextConverter {
		
		public function TextConverter() {
			throw new Error( "TextConcerter is a static class" );
		}
		
		public static function getBold( text:String ):String {
			return "<b>" + text + "</b>";
		}
		
		public static function getNumber( number:Number ):String {
			var result:String;
			try {
				/// Какого-то хуя в Google Chrome, тут возникает ошибка.
				var nf:NumberFormatter = new NumberFormatter( LocaleID.DEFAULT );
				nf.trailingZeros = false;
				result = nf.formatNumber( number );
			} catch( error:Error ) {
				result = number.toString();
			}
			return result;
		}
		
	}
	
}
