package com.greedyint.utils
{
	public final class StringUtil
	{		
		public static function format(str:String,... params):String
		{
			if(params.length==0)
			{
				return str;
			}
			var re:RegExp=/\{(\d+)\}/g;
			var getParam:Function=function(result:String,match:String,position:int,source:String):String
			{
				if(params[match]==null) throw new ArgumentError("参数数量不足");
				return params[match];
			}
			return str.replace(re,getParam);			
		}
	}
}