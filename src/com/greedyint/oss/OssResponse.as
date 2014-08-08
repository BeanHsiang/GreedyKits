package com.greedyint.oss
{
	public class OssResponse
	{
		
		public function OssResponse(contentLength:uint,connection:String,date:String,eTag:String,server:String,xOssRequestId:String)
		{
			_contentLength=contentLength;
			_connection=connection;
			_date=date;
			_eTag=eTag;
			_server=server;
			_xOssRequestId=xOssRequestId;
		}
		
		public function get contentLength():uint
		{
			return _contentLength;
		}
		
		public function get connection():String
		{
			return _connection;
		}
		
		public function get date():String
		{
			return _date;
		}
		
		public function get eTag():String
		{
			return _eTag;
		}
		
		public function get server():String
		{
			return _server;
		}
		
		public function get xOssRequestId():String
		{
			return _xOssRequestId;
		}
		
		public function get data():*
		{
			return _data;
		}
		
		public function set data(value:*):void
		{
			_data = value;
		}
		
		private var _data:*;
		private var _contentLength:uint;
		private var _connection:String;
		private var _date:String;
		private var _eTag:String;
		private var _server:String;
		private var _xOssRequestId :String;
	}
}