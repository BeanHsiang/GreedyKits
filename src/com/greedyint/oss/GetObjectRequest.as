package com.greedyint.oss
{
	import com.greedyint.utils.StringUtil;	
	import flash.net.URLRequestMethod;	
	import mx.states.OverrideBase;

	public class GetObjectRequest extends OssRequest
	{
		public function GetObjectRequest(bucketName:String,start:uint, end:uint,objectName:String)
		{
			super(bucketName.toLowerCase());
			_start=start;
			_end=end;
			_objectName=objectName;
		}		
		
		protected override function get method():String
		{ 
			return URLRequestMethod.GET;
		}
		
		protected override function get MD5Content():String
		{
			return "";//_obj.getMD5Content();
		} 
		
		protected override function get contentLength():String
		{
			return "";
		}
		
		public override function get contentType():String
		{
			return "";
		}
		
		protected override function get ossMeta():String
		{
			return "";
		}
		
		protected override function get ossResource():String
		{
			return new OssResource(StringUtil.format("/{0}/{1}",_bucketName,_objectName)).toString();
			//			return new OssResource(StringUtil.format("/{0}",_obj.Name)).toString();
		}
		
		public override function getRequestUrl():String
		{
			//			return "http://oss.aliyuntest.com:13810/Home/Index2";
			//			return super.getRequestUrl();
			return StringUtil.format("http://{0}.oss.aliyuncs.com/{1}",_bucketName,_objectName);			
		}
		
		public override function getHeaders():OssHeaders
		{			
			if(_start>0 && _end>0 && _start<_end)
			{
			    _headers.addHeader("Range",StringUtil.format("bytes={0}-{1}",_start,_end));
			}
			return super.getHeaders();
		}
		
		private var _start:uint;
		private var _end:uint;
		private var _objectName:String;
		private var _ifModifiedSince:String;
		private var _ifUnmodifiedSince:String;
		private var _ifMatch:String;
		private var _ifNoneMatch:String;
		
	}
}