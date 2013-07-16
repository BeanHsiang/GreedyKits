package com.greedyint.oss
{
	import com.greedyint.utils.StringUtil;

	public class OssResource
	{
		public function OssResource(target:String="")
		{
			_target=target.toLowerCase();
		}
		public function set acl(value:Boolean):void
		{
			if(value)
			{
			    _subResources["acl"]="";
			}
		}
		
		public function set group(value:String):void
		{
			_subResources["group"]=value;
		}
		
		public function set uploadId(value:String):void
		{
			_subResources["group"]=value;
		}
		
		public function set partNumber(value:String):void
		{
			_subResources["partNumber"]=value;
		}
		
		public function set uploads(value:String):void
		{
			_subResources["uploads"]=value;
		}
		
		public function set logging(value:String):void
		{
			_subResources["logging"]=value;
		} 
		
		public function set responseContentType(value:String):void
		{
			_subResources["response-content-type"]=value;
		} 
		
		public function set responseContentLanguage(value:String):void
		{
			_subResources["response-content-language"]=value;
		} 
		
		public function set responseExpires(value:String):void
		{
			_subResources["response-expires"]=value;
		} 
		
		public function set reponseCacheControl(value:String):void
		{
			_subResources["reponse-cache-control"]=value;
		} 
		
		public function set responseContentDisposition(value:String):void
		{
			_subResources["response-content-disposition"]=value;
		} 
		
		public function set responseContentEncoding(value:String):void
		{
			_subResources["response-content-encoding"]=value;
		} 

		public function toString():String
		{
			var str:String=_target;
			var arr:Array=new Array();
			for each (var key:String in _subResources) 
			{
				arr.push(key);
			}
			arr.sort();
			var length:int=arr.length;
			if(length>0)
			{
				str=str+"?"+arr[0];					
				var val:String=_subResources[arr[0]];
				if(val.length>0)
				{
					str=str+"="+val;
				}
				for (var i:int = 1; i < arr.length; i++) 
				{				
					str=str+StringUtil.format("&{0}={1}",arr[i],_subResources[arr[i]]);
				}
			}
            return str;
		}
		
		private var _target:String;
		private var _subResources:Object;
	}
}