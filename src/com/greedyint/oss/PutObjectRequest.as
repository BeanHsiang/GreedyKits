package com.greedyint.oss
{
	import com.greedyint.utils.StringUtil;
	
	import flash.net.URLRequestMethod;

	public class PutObjectRequest extends OssRequest
	{
		public function PutObjectRequest(bucketName:String,obj:OssObject)
		{
			super(bucketName.toLowerCase());
			_obj=obj;
		}
	
		public function get Object():OssObject
		{
		    return _obj;
		}
		
		protected override function get method():String
		{ 
			return URLRequestMethod.PUT;
		}
		
		protected override function get MD5Content():String
		{
			return "";//_obj.getMD5Content();
		} 
		
		protected override function get contentLength():String
		{
			return  _obj.contentLength.toString();
		}
		
		public override function get contentType():String
		{
			return _obj.mime;
		}
		
		protected override function get ossMeta():String
		{
			return _obj.ossMeta==null? "":_obj.ossMeta.toString();
		}
		
		protected override function get ossResource():String
		{
			return new OssResource(StringUtil.format("/{0}/{1}",_bucketName,_obj.name)).toString();
//			return new OssResource(StringUtil.format("/{0}",_obj.Name)).toString();
		}
		
		public override function getRequestUrl():String
		{
//			return "http://oss.aliyuntest.com:13810/Home/Index2";
//			return super.getRequestUrl();
			return StringUtil.format("http://{0}.oss.aliyuncs.com/{1}",_bucketName,_obj.name);			
		}
				
		private var _obj:OssObject;
		private var _cacheControl:String;
		private var _contentDisposition:String;
		private var _contentEncoding:String; 
		private var _Expires:uint;
		private var _xOssServerSideEncryption:String="AES256";	
	}
}