package com.greedyint.utils
{
	import flash.utils.ByteArray;

	public final class FileUtil
	{
		public static function GetFileExtension(data:ByteArray):String
		{
			data.position=0;
			var b0:int=data.readUnsignedByte();
			var b1:int=data.readUnsignedByte();
			var code:int=Number(String(b0)+String(b1));
//			trace(code.toString());
	        var ext:String=FileExtension.Unknown;			
			for(var name:String in FileExtension)
			{
				if(FileExtension[name]==code)
				{
					ext=name; 
				}
			}			
			return ext;			
		}
		
		public static function GetMime(ext:String):String
		{
			return MIME[ext];
		}
			
		private static const FileExtension:Object={ 
			UnKnown : 0,
			JPG : 255216,
			GIF : 7173,
			BMP : 6677,
			PNG : 13780,
			EXE : 7790,
			DLL : 7790,
			RAR : 8297, 
			ZIP : 8075, 
			XML : 6063,
			HTML : 6033,
			JS : 119105,
			TXT : 210187,
			PDF : 3780,
			CHM : 7384,
			DOC : 208207,
			XLS : 208207,
			DOCX : 208207,
			XLSX : 208207
		};
		
		private static const MIME:Object={ 
			JPG : "image/jpeg",
			GIF : "image/gif",
			BMP : "image/bmp",
			PNG : "image/png",
			EXE : "application/octet-stream",
			DLL : "application/x-msdownload",
			RAR : "application/x-rar-compressed", 
			ZIP : "application/zip", 
			XML : "text/xml",
			HTML : "image/bmp",
			JS : "application/x-javascript",
			TXT : "text/plain",
			PDF : "application/pdf",
			CHM : "application/x-chm",
			DOC : "application/msword",
			XLS : "application/vnd.ms-excel",
			DOCX : "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
			XLSX : "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
		};
	}
}   