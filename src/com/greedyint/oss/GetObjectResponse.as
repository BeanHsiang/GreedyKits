package com.greedyint.oss
{
	import flash.utils.ByteArray;

	public class GetObjectResponse extends OssResponse
	{
		public function GetObjectResponse(contentLength:uint, connection:String, date:String, eTag:String, server:String, xOssRequestId:String)
		{
			super(contentLength, connection, date, eTag, server, xOssRequestId);
		}
	}
}