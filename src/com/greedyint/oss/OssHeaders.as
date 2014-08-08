package com.greedyint.oss
{
	import flash.net.URLRequestHeader;
	
	import org.httpclient.HttpHeader;

	public class OssHeaders
	{
		public function OssHeaders()
		{
			_headers=new Array();
		}
		
		public function addHeader(name:String,value:String):void
		{
			_headers.push({name:name,value:value});
		}
		
		public function get headers():Array
		{
		    return _headers;
		}
		
		public function get standardHeaders():Array
		{
			var arr:Array=new Array();
			for each (var obj:Object in _headers) 
			{
				arr.push(new URLRequestHeader(obj.name,obj.value));
			}
			return arr;
		}
		
	    private var _headers:Array;
	}
}