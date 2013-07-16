package com.greedyint.oss
{	
	import com.adobe.crypto.MD5;
	import com.greedyint.utils.FileUtil;
	
	import flash.utils.ByteArray;

	public class OssObject
	{
		public function OssObject(name:String,content:ByteArray,ossMeta:OssObjectMeta=null)
		{			
			_content=content;
			var ext:String=FileUtil.GetFileExtension(content);			
			_mime=FileUtil.GetMime(ext);
			_name=name.toLocaleLowerCase().replace(/(?<=\.)\w+/g,ext.toLocaleLowerCase());
			_ossMeta=ossMeta;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get content():ByteArray
		{
			_content.position=0;
			var data:ByteArray=_content;
			return data;
		}
		
		public function get mime():String
		{
		    return _mime;
		}
		
		public function get ossMeta():OssObjectMeta
		{
			return _ossMeta;
		}
		
		public function getMD5Content():String
		{
			_content.position=0;
		    return MD5.hashBytes(content);
		}
		
		public function get contentLength():uint
		{
			_content.position=0;
			return _content.length
		}
		
		private var _name:String;
		private var _content:ByteArray;
		private var _mime:String;
		private var _ossMeta:OssObjectMeta;
	}
}