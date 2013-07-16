package com.greedyint.oss
{
	import com.adobe.net.URI;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.net.URLRequestMethod;
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
				// Notified when complete (after status and data)
				trace("over");
				dispatchEvent(new Event(Event.COMPLETE));
			};
			_client.listener.onData = function(event:HttpDataEvent):void {
				// For string data
				var stringData:String = event.readUTFBytes();
				trace(stringData);
				// For data
				var data:ByteArray = event.bytes;    
			};
            _client.listener.onStatus = function(event:HttpStatusEvent):void{
				trace(event.header.content);				
			};
			
			_client.put(new URI(req.getRequestUrl()),req.Object.content,req.contentType,req.getHeaders(ACCESS_KEY_ID,ACCESS_KEY_SECRET));
		} 
		
		private const ACCESS_KEY_ID:String="";
		private const ACCESS_KEY_SECRET:String="";
		private var _client:HttpClient=null;
	}
}