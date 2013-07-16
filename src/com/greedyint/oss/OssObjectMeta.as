package com.greedyint.oss
{
	import com.greedyint.utils.StringUtil;
	
	import flash.net.URLRequestHeader;

	public class OssObjectMeta extends OssHeaders
	{
		public function OssObjectMeta()
		{
			super();
		}
		
		public function toString():String
		{
			var arr:Array=new Array();
//			var map:Object=new Object();			
			for each (var header:Object in headers) 
			{
//				var name:String=header.name.toLocaleLowerCase();
//			    arr.push(name);
//				map[name]=header.value;
				arr.push(StringUtil.format("{0}:{1}\n",header.name.toLocaleLowerCase(),header.value))
			}
			arr.sort();
//		    var str:String="";
//			for (var i:int = 0; i < arr.length; i++) 
//			{
//				str=str+StringUtil.format("{0}:{1}\n",arr[i],map[arr[i]]);
//			}
			return arr.join("\n");
		}
	}
}