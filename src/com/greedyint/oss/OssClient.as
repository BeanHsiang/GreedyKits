package com.greedyint.oss
{
	import com.adobe.net.URI;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.system.Security;
	import flash.utils.ByteArray;
	
	import org.httpclient.HttpClient;
	import org.httpclient.HttpHeader;
	import org.httpclient.HttpRequest;
	import org.httpclient.events.HttpDataEvent;
	import org.httpclient.events.HttpErrorEvent;
	import org.httpclient.events.HttpResponseEvent;
	import org.httpclient.events.HttpStatusEvent;
	
	public class OssClient extends EventDispatcher
	{
		public function OssClient()
		{
			super();			
		}
			
		public function putObject(req:PutObjectRequest):void
		{
			_client=new HttpClient();
			_client.listener.onComplete = function(event:HttpResponseEvent):void {				
				dispatchEvent(new Event(Event.COMPLETE));
				_client.listener.unregister();
			};
			_client.listener.onData = function(event:HttpDataEvent):void {
				// For string data
				var stringData:String = event.readUTFBytes();
				trace(stringData);
				// For data
//				var data:ByteArray = event.bytes;    
			};
            _client.listener.onStatus = function(event:HttpStatusEvent):void{
				_response=new PutObjectResponse(uint(event.header.getValue("Content-Length")),
					event.header.getValue("Connection"),
					event.header.getValue("Date"),
					event.header.getValue("ETag"),
					event.header.getValue("Server"),
					event.header.getValue("x-oss-request-id"));
			};
			_client.listener.onError = function(event:ErrorEvent):void{
				dispatchEvent(event);
				_client.listener.unregister();
			}			
			_client.put(new URI(req.getRequestUrl()),req.Object.content,req.contentType,req.getHeaders().headers);
		} 
		
		public function getObject(req:GetObjectRequest):void
		{
			var urlReq:URLRequest=new URLRequest(req.getRequestUrl());
			urlReq.requestHeaders=req.getHeaders().standardHeaders;				
			_loader=new URLLoader();
//			_loader.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS,onStatus);
			_loader.addEventListener(Event.COMPLETE,onComplete);
			_loader.load(urlReq);				
		}
		
		private function onStatus(event:HTTPStatusEvent):void
		{
			_response=new GetObjectResponse(uint(event.responseHeaders["Content-Length"]),
				event.responseHeaders["Connection"],
				event.responseHeaders["Date"],
				event.responseHeaders["ETag"],
				event.responseHeaders["Server"],
				event.responseHeaders["x-oss-request-id"]);
		}
		
		private function onComplete(event:Event):void
		{
			_response.data=_loader.data;
			_loader.removeEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS,onStatus);
			_loader.removeEventListener(Event.COMPLETE,onComplete);
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get response():OssResponse
		{
			return _response;
		}
		
		private var _client:HttpClient=null;
		private var _loader:URLLoader=null;
		private var _response:OssResponse;
	}
}