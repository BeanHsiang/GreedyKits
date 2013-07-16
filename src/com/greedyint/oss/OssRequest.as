package com.greedyint.oss
{
	import com.adobe.crypto.HMAC;
	import com.adobe.crypto.SHA1;
	import com.greedyint.utils.ByteUtil;
	import com.greedyint.utils.DateUtil;
	import com.greedyint.utils.StringUtil;
	
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.utils.ByteArray;
	
	import mx.formatters.DateFormatter;
	import mx.utils.Base64Encoder;
	
	import org.httpclient.HttpHeader;
	
	public class OssRequest
	{
		public function OssRequest(bucketName:String)
		{
			_headers=new OssHeaders();
			_bucketName=bucketName;
			_date=new Date();			
			_date=DateUtil.addMinutes(_date,_date.getTimezoneOffset());
			_fmt=new DateFormatter()
			_fmt.formatString="EEE, DD MMM YYYY JJ:NN:SS";
		}

		protected function get method():String
		{
			throw new Error("need extends");
		}
		
		protected function get MD5Content():String
		{
			throw new Error("need extends");
		} 
		
		protected function get contentLength():String
		{
			throw new Error("need extends");
		}
		
		public function get contentType():String
		{
			throw new Error("need extends");
		}
		
		protected function get ossMeta():String
		{
			throw new Error("need extends");
		}
		
		protected function get ossResource():String
		{
			throw new Error("need extends");
		}
		
		private function generateSignature(secret:String,method:String,MD5Content:String,contentType:String,ossMeta:String,ossResource:String):String
		{
			var origin:String=StringUtil.format("{0}\n{1}\n{2}\n{3}\n{4}{5}",method,MD5Content,contentType,_fmt.format(_date)+" GMT",ossMeta,ossResource);
			trace(origin);
			var hmacStr:String=HMAC.hash(secret,origin,SHA1);			 
			var encoder:Base64Encoder=new Base64Encoder();
			encoder.encodeBytes(ByteUtil.getBytesFromHexString(hmacStr));
			var signature:String= encoder.flush();	
			trace(signature);
			return signature;
		}
		
		public function getRequestUrl():String
		{
			throw new Error("need extends");
		}
		
		public function getHeaders(id:String,secret:String):Array
		{
			_headers.addHeader("Authorization","OSS "+id+":"+generateSignature(secret,method,MD5Content,contentType,ossMeta,ossResource));
			_headers.addHeader("Content-Length",contentLength);
			_headers.addHeader("Content-Type",contentType);
			_headers.addHeader("Date",_fmt.format(_date)+" GMT");
			_headers.addHeader("Connection","Keep-Alive");
			_headers.addHeader("Host",StringUtil.format("{0}.oss.aliyuncs.com", _bucketName));	
			return _headers.headers;
		}
		
		private var _fmt:DateFormatter;  
		protected var _bucketName:String;
		protected var _headers:OssHeaders;
		protected var _date:Date;
		private const OSS_HOST:String="oss.aliyuncs.com";
	}
}