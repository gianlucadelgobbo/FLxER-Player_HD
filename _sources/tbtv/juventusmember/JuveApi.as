﻿package tbtv.juventusmember {	import flash.net.URLRequest;	import flash.net.URLLoader;	import flash.events.*;	import flash.net.URLRequestMethod;	import flash.net.URLVariables;	import com.adobe.serialization.json.JSON;	public class JuveApi {		private var _successCallback:Function;		private var _sessionId:String;		private var _action:String;		private var _params:Array;		private var showTrace:Boolean;		private var _numParams:int = 0;		private var BASE_URL = "http://www.juventusmember.com/_ajax.php";		public function JuveApi(successCallback:Function, sessionId:String,s=false):void {			_successCallback = successCallback;			_sessionId = sessionId;			showTrace = s;			_params = new Array();		}		public function setAction(action:String):void {			_action = action;		}		public function addParam(paramName:String, paramValue:String):void {			_params[paramName] = paramValue;			_numParams++;		}		public function run():void {			var loader:URLLoader = new URLLoader();			var req:URLRequest = new URLRequest();			req.url = BASE_URL;			req.method = URLRequestMethod.POST;			var paramsList:String = "";			var count = 1;			for (var key:String in _params) {				if (count == _numParams) {					paramsList +=  '"' + key + '": "' + _params[key] + '" ';				} else {					paramsList +=  '"' + key + '": "' + _params[key] + '", ';				}				count++;			}			req.data = new URLVariables();			req.data.request = '[{"name":"myreturn", "method":"' + _action + '", "params" : { ' + paramsList + ' } }]';			req.data.PHPSESSID = _sessionId;			loader.addEventListener(Event.COMPLETE, decodeJSON);			loader.load(req);		}		public function decodeJSON(event:Event):void {			var Json = JSON.decode(event.target.data) ;			if (showTrace) traceObj(Json);			_successCallback(Json.myreturn)		}		function traceObj(obj,basename=""):void {			for(var o in obj) {				if(!obj[o] is Object) trace(basename+o+" => "+obj[o]);				traceObj(obj[o],basename+o+".")			}		}	}}