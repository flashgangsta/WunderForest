﻿package com.rr {		import flash.display.MovieClip;	import flash.events.Event;			public class MiniPreloader extends MovieClip {						private var arrow:MovieClip;				public function MiniPreloader() {			addEventListener( Event.ADDED_TO_STAGE, init );			arrow = getChildByName( "arrow_mc" ) as MovieClip;		}				private function init( event:Event ):void {			removeEventListener( Event.ADDED_TO_STAGE, init );			arrow.rotation = Math.round( Math.random() * 360 );			addEventListener( Event.ENTER_FRAME, rotateArrow );		}				private function rotateArrow( event:Event ):void {			arrow.rotation += 4;		}				public function destroy():void {			removeEventListener( Event.ENTER_FRAME, rotateArrow );			parent.removeChild( this );		}			}	}