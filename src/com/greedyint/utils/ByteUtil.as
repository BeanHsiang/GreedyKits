package com.greedyint.utils
{
	import flash.utils.ByteArray;

	public class ByteUtil
	{
		public function ByteUtil()
		{
		}
		
		public static function getBytesFromHexString(hexStr:String):ByteArray
		{
			var blocks:ByteArray=new ByteArray();
			for (var i:int=0; i<hexStr.length; i+=2)
			{
				var n:int=parseInt(hexStr.substr(i,2),16);
				blocks.writeByte(n);
			}			
			return blocks;
		}
	}
}