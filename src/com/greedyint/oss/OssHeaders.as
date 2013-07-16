package com.greedyint.oss
{
	import flash.net.URLRequestHeader;

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
		
	    private var _headers:Array;
	}
}