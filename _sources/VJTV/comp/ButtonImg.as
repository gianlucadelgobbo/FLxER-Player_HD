﻿package VJTV.comp {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	
	import VJTV.comp.MyLoader;
	import VJTV.comp.MyTween;
	import FlxerGallery.Preferences;
	public class ButtonImg extends Sprite {
		var fondo;
		var img;
		var rollRett
		var actRett
		var w;
		var h;
		var alt
		var fnz
		var param
		var roll
		
		var tweemRollSi
		var tweemRollNo
		var tweemFocusSi
		var tweemFocusNo
		
		
		public function ButtonImg(xx:Number,yy:Number,ww,hh,img,f:Function, p, aa:String, a) {
			
			alt=aa;
			
			x=xx;
			y=yy;
			w=ww;
			h=hh;
			fnz = f
			param = p;
			
			this.img= new MyLoader(0,0,w,h,img,"mask")
				this.addChild(this.img);
			this.img.alpha = 1
			
				
			abilita()
		}
		
		
		public function disabilita(){
			this.removeEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
			this.removeEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
			this.removeEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
			this.buttonMode=false;
			mouseOverHandler(null)
			//this.tweemFocusSi = new MyTween(this.actRett,"alpha",Regular.easeInOut,this.actRett.alpha,1,0.5,null)
			
			}
		public function abilita(){
			this.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
			this.buttonMode=true;
			this.mouseChildren = false;
			mouseOutHandler(null)
			//this.tweemFocusNo = new MyTween(this.actRett,"alpha",Regular.easeInOut,this.actRett.alpha,0,0.5,null)
			//this.actRett.alpha=0
			}
		
		
		
		
		public function mouseUpAcivation(f:Function) {
			this.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
			function mouseUpHandler(event):void {
				f();
			}
		}
		function mouseOverHandler(event):void {
			this.tweemRollSi = new MyTween(this.img,"alpha",Regular.easeInOut,this.img.alpha,0.4,0.5,null)
			if (alt) {
				Preferences.pref.myAlt.avvia(alt);
			}
			//this.tweemRollSi = new MyTween(this.rollRett,"alpha",Regular.easeInOut,this.rollRett.alpha,1,0.5,null)
			
			//this.rollRett.alpha=1
		}
		function mouseOutHandler(event):void {
			this.tweemRollNo = new MyTween(this.img,"alpha",Regular.easeInOut,this.img.alpha,1,0.5,null)
			if (alt) {
				Preferences.pref.myAlt.stoppa();
			}//this.tweemRollNo = new MyTween(this.rollRett,"alpha",Regular.easeInOut,this.rollRett.alpha,0,0.5,null)
			//this.rollRett.alpha=0
		}
		function mouseDownHandler(event):void {
			
			fnz(param);
			
			mouseOutHandler(event);
		}
		
		
		
		
		
		
	}
}