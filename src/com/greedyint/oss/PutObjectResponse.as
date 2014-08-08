package com.greedyint.oss
{
	public class PutObjectResponse extends OssResponse
	{
		public function PutObjectResponse(contentLength:uint,connection:String,date:String,eTag:String,server:String,xOssRequestId:String)
		{
			super(contentLength,connection,date,eTag,server,xOssRequestId);
		}
	}
}