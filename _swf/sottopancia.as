﻿package {	import flash.display.MovieClip;	import flash.xml.XMLDocument;	import flash.events.*;	import flash.utils.*;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.display.Loader;	public class sottopancia extends MovieClip {		public var cnt;		var fnz,n,myXml;		public function sottopancia() {			//but.mouseChildren = false;			cnt.but.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);			trace("sottopancia")		}		public function avvia(f):void {			fnz = f;		}		public function parti():void {			cnt.play();		}		public function riempi(xml,nn):void {			n = nn;			myXml = xml;			/*			trace("img "+myXml.childNodes[2].childNodes[0])			trace("tit "+myXml.childNodes[1].childNodes[0])			trace("dat "+myXml.childNodes[1].childNodes[1].childNodes[0]);			trace("dur "+Preferences.pref.interfaceTrgt.myTime(myXml.childNodes[1].childNodes[2].childNodes[0]));			trace("txt "+myXml.childNodes[1].childNodes[3].childNodes[0])			trace("aut "+myXml.childNodes[1].childNodes[4].childNodes[0])			trace("cat "+myXml.childNodes[1].childNodes[5].childNodes[0])			trace("tag "+myXml.childNodes[1].childNodes[6].childNodes[0])			trace(this.tit)			*/			cnt.tit.htmlText = myXml.childNodes[1].childNodes[0]			cnt.dat.htmlText = myXml.childNodes[1].childNodes[1].childNodes[0].toString().split(" ")[0];			cnt.dur.htmlText = myTime(int(parseInt(myXml.childNodes[1].childNodes[2].childNodes[0])/1000));			cnt.txt.htmlText = myXml.childNodes[1].childNodes[3].childNodes[0];			cnt.aut.htmlText = myXml.childNodes[1].childNodes[4].childNodes[0];			cnt.cat.htmlText = myXml.childNodes[1].childNodes[5].childNodes[0];			/*dur.x = 488-dur.textWidth			cat.x = 488-cat.textWidth			imgLoader.load(new URLRequest(myXml.childNodes[2].childNodes[0].toString()));			loadingProgress = true;*/			//tag.htmlText = myXml.childNodes[3].childNodes[0];		}		function mouseDownHandler(e) {			fnz(myXml,n);		}		public function myTime(mm) {			var min;			var tmp;			var tmp2;			var sec;			if (mm>60) {				tmp = int(mm/60);				if (tmp.toString().length<2) {					min = "0"+tmp;				} else {					min = tmp;				}				tmp2 = int(mm-(60*tmp));				if (tmp2.toString().length<2) {					sec = "0"+tmp2;				} else {					sec = tmp2;				}			} else {				min = "00";				if (int(mm).toString().length<2) {					sec = "0"+int(mm);				} else {					sec = int(mm);				}			}			return min+":"+sec;		}	}}