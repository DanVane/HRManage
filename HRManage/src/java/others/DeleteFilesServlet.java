package others;


import java.io.File;
import java.io.FileFilter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class DeleteFilesServlet extends HttpServlet
{

	public void destroy()
	{
		
	}

	public void init() throws ServletException
	{
//		File file = new File(".");
//		
//		File[] subFiles = file.listFiles();
//		
//		for(File f : subFiles)
//		{
//			if(f.getName().endsWith("xls"))
//			{
//				f.delete();
//			}
//		}
		
		File file = new File(".");
		
		File[] subFiles = file.listFiles(new FileFilter()
		{
			public boolean accept(File pathname)
			{
				if(pathname.getName().endsWith("doc"))
				{
					return true;
				}
				
				return false;
			}
		}
		);
		
		for(File f : subFiles)
		{
			f.delete();
		}
	}

}
