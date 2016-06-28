/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import dao.LoginManageDao;
import dao.TeacherManageDao;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import po.Degrees;
import po.Honor;
import po.Manager;
import po.Parttimejob;
import po.Teacher;
import po.User;
import po.Workexprience;

/**
 *
 * @author Administrator
 */
public class GenerateExcel {
    
    private LoginManageDao loginManageDao;
    private TeacherManageDao teacherManageDao;
    private String downloadType;
    private int tt;

    public LoginManageDao getLoginManageDao() {
        return loginManageDao;
    }

    public void setLoginManageDao(LoginManageDao loginManageDao) {
        this.loginManageDao = loginManageDao;
    }


    public TeacherManageDao getTeacherManageDao() {
        return teacherManageDao;
    }

    public void setTeacherManageDao(TeacherManageDao teacherManageDao) {
        this.teacherManageDao = teacherManageDao;
    }

    public String getDownloadType() {
        return downloadType;
    }

    public void setDownloadType(String downloadType) {
        this.downloadType = downloadType;
        try{
            
        }catch(Exception e){
            System.out.println("转换错误");
        }
        System.out.println(downloadType);
    }
    
    
    
    public GenerateExcel() {
    }
    
    public InputStream getUserDownLoadFile(){
     if(downloadType=="xuewei"){
          System.out.println("xuewei");
         return getXueweiInputStream();
      }else if("xueshu".equals(downloadType) ){
           System.out.println("xueshu");
             return getXueshuInputStream();
        }else if("rongyu".equals(downloadType)){
             System.out.println("rongyu");
            return getRongyuInputStream();
        }else if("gongzuo".equals(downloadType)){
             System.out.println("gongzuo");
             return getGongzuoInputStream();
        }else if(downloadType=="yonghu"){
            System.out.println("yonghu");
             return getYonghuInputStream();
     }else if("guanliyuan".equals(downloadType)){
          System.out.println("guanliyuan");
           return getGuanliyuanInputStream();
      }else{
          System.out.println("null");
         return null;
     }
	}
	
		public String execute() throws Exception
	{
		return SUCCESS;
	}
    
    
        public InputStream getYonghuInputStream()
	{
            System.out.println("setp1");
            HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        
        
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");

		HSSFRow row = sheet.createRow(0);

		HSSFCell cell = row.createCell((short) 0);
		//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("用户名");

		cell = row.createCell((short) 1);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("姓名");

		cell = row.createCell((short) 2);
		//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("学院");

		cell = row.createCell((short) 3);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("部门");
                
                cell = row.createCell((short) 4);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("用户类型");
System.out.println("setp1");
                List<User> list = null;
                Manager m = (Manager)session.getAttribute("loginManager");
                if(session.getAttribute("IsSuper").equals("yes")){
		 list = loginManageDao.findAllUsers();
                }else if(session.getAttribute("IsSuper").equals("no")){
            list = loginManageDao.findUsersByCollege(m.getCollege());
        }
System.out.println("setp1");
		for (int i = 0; i < list.size(); ++i)
		{
			User user = list.get(i);

			row = sheet.createRow(i + 1);

			cell = row.createCell((short) 0);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(user.getUserId());

			cell = row.createCell((short) 1);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(user.getUserName());

			cell = row.createCell((short) 2);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(user.getCollege());

			cell = row.createCell((short) 3);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(user.getDepartment());
                        
                        cell = row.createCell((short) 4);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(user.getUserType());
		}
                
                ByteArrayOutputStream os = new ByteArrayOutputStream();
		
		try
		{
			wb.write(os);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		
		byte[] content = os.toByteArray();
		
		InputStream is = new ByteArrayInputStream(content);
		
		return is;
                
                /*
System.out.println("setp1");
		File file = new File("testttttt.xls");
System.out.println("setp1");
		try
		{
			OutputStream os = new FileOutputStream(file);
			wb.write(os);
			os.close();
                        System.out.println("setp1");
		}
		catch (Exception e)
		{
                    System.out.println("setp1");
			e.printStackTrace();
		}

		InputStream is = null;
		try
		{
                    System.out.println("setp1");
			is = new FileInputStream(file);
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}

		return is;*/

	}
        
         public InputStream getXueweiInputStream()
	{
            
            HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        
        
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");

		HSSFRow row = sheet.createRow(0);

		HSSFCell cell = row.createCell((short) 0);
		//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("序号");

		cell = row.createCell((short) 1);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("学位");

		cell = row.createCell((short) 2);
		//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("学历");

		cell = row.createCell((short) 3);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("毕业学校");
                
                cell = row.createCell((short) 4);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("专业");
                
                cell = row.createCell((short) 5);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("开始攻读时间");
                
                cell = row.createCell((short) 6);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("结束攻读时间");
                
                cell = row.createCell((short) 7);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("最高学历");
                
                cell = row.createCell((short) 8);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("最高学位");
                
                cell = row.createCell((short) 9);
	//	cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue("最高学历");
                
                List<Degrees> list = null;
                Teacher t = (Teacher)session.getAttribute("loginTeacher");
               list = teacherManageDao.findDegreessByTeacherId(t.getTeacherId());

		for (int i = 0; i < list.size(); ++i)
		{
			Degrees degree= list.get(i);

			row = sheet.createRow(i + 1);

			cell = row.createCell((short) 0);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(i+1);

			cell = row.createCell((short) 1);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(degree.getDegree());

			cell = row.createCell((short) 2);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(degree.getEduBack());

			cell = row.createCell((short) 3);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(degree.getSchool());
                        
                        cell = row.createCell((short) 4);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(degree.getMajor());
                        
                        cell = row.createCell((short) 5);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(degree.getSchoolLevel());

			cell = row.createCell((short) 6);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(degree.getStartTime());
                        
                        cell = row.createCell((short) 7);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(degree.getOverTime());
                        
                        cell = row.createCell((short) 8);
			cell.setCellValue(degree.getDhighest());
                        
                        cell = row.createCell((short) 9);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue(degree.getEhighest());
		}

                
                ByteArrayOutputStream os = new ByteArrayOutputStream();
		
		try
		{
			wb.write(os);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		
		byte[] content = os.toByteArray();
		
		InputStream is = new ByteArrayInputStream(content);
		
		return is;
                /*
		File file = new File("testtttt.xls");

		try
		{
			OutputStream os = new FileOutputStream(file);
			wb.write(os);
			os.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		InputStream is = null;
		try
		{
			is = new FileInputStream(file);
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}

		return is;*/

	}
         
            public InputStream getXueshuInputStream()
	{
            
            HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        
        
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");

		HSSFRow row = sheet.createRow(0);

		HSSFCell cell = row.createCell((short) 0);
		cell.setCellValue("序号");

		cell = row.createCell((short) 1);;
		cell.setCellValue("兼职名称");

		cell = row.createCell((short) 2);
		cell.setCellValue("开始时间");

		cell = row.createCell((short) 3);
		cell.setCellValue("结束时间");
    

                List<Parttimejob> list = null;
               
  Teacher t = (Teacher)session.getAttribute("loginTeacher");
               list = teacherManageDao.findPartJobssByTeacherId(t.getTeacherId());
               
		for (int i = 0; i < list.size(); ++i)
		{
			Parttimejob job = list.get(i);

			row = sheet.createRow(i + 1);

			cell = row.createCell((short) 0);
			cell.setCellValue(i+1);

			cell = row.createCell((short) 1);
			cell.setCellValue(job.getName());

			cell = row.createCell((short) 2);
			cell.setCellValue(job.getStartTime());

			cell = row.createCell((short) 3);
			cell.setCellValue(job.getOverTime());
		}
                
                ByteArrayOutputStream os = new ByteArrayOutputStream();
		
		try
		{
			wb.write(os);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		
		byte[] content = os.toByteArray();
		
		InputStream is = new ByteArrayInputStream(content);
		
		return is;
                
                /*

		File file = new File("testttt.xls");

		try
		{
			OutputStream os = new FileOutputStream(file);
			wb.write(os);
			os.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		InputStream is = null;
		try
		{
			is = new FileInputStream(file);
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}

		return is;*/

	}
            
                   public InputStream getRongyuInputStream()
	{
            
            HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        
        
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");

		HSSFRow row = sheet.createRow(0);

		HSSFCell cell = row.createCell((short) 0);
		cell.setCellValue("序号");

		cell = row.createCell((short) 1);;
		cell.setCellValue("荣誉名");

		cell = row.createCell((short) 2);
		cell.setCellValue("获得时间");

		cell = row.createCell((short) 3);
		cell.setCellValue("批次");
                
                cell = row.createCell((short) 4);
		cell.setCellValue("级别");
    

                List<Honor> list = null;
               
  Teacher t = (Teacher)session.getAttribute("loginTeacher");
               list = teacherManageDao.findHonorsByTeacherId(t.getTeacherId());
               
		for (int i = 0; i < list.size(); ++i)
		{
			Honor honor = list.get(i);

			row = sheet.createRow(i + 1);

			cell = row.createCell((short) 0);
			cell.setCellValue(i+1);

			cell = row.createCell((short) 1);
			cell.setCellValue(honor.getName());

			cell = row.createCell((short) 2);
			cell.setCellValue(honor.getGotTime());

			cell = row.createCell((short) 3);
			cell.setCellValue(honor.getBatch());
                        
                        cell = row.createCell((short) 4);
			cell.setCellValue(honor.getLevel());
		}
                
                ByteArrayOutputStream os = new ByteArrayOutputStream();
		
		try
		{
			wb.write(os);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		
		byte[] content = os.toByteArray();
		
		InputStream is = new ByteArrayInputStream(content);
		
		return is;
                
                /*

		File file = new File("testtt.xls");

		try
		{
			OutputStream os = new FileOutputStream(file);
			wb.write(os);
			os.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		InputStream is = null;
		try
		{
			is = new FileInputStream(file);
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}

		return is;*/

	}
                   
                           public InputStream getGongzuoInputStream()
	{
            
            HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        
        
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");

		HSSFRow row = sheet.createRow(0);

		HSSFCell cell = row.createCell((short) 0);
		cell.setCellValue("序号");

		cell = row.createCell((short) 1);;
		cell.setCellValue("开始时间");

		cell = row.createCell((short) 2);
		cell.setCellValue("结束时间");

		cell = row.createCell((short) 3);
		cell.setCellValue("单位");
                
                cell = row.createCell((short) 4);
		cell.setCellValue("部门");
                
                 cell = row.createCell((short) 5);
		cell.setCellValue("任职");
    

                List<Workexprience> list = null;
               
  Teacher t = (Teacher)session.getAttribute("loginTeacher");
               list = teacherManageDao.findWorkssByTeacherId(t.getTeacherId());
               
		for (int i = 0; i < list.size(); ++i)
		{
			Workexprience work = list.get(i);

			row = sheet.createRow(i + 1);

			cell = row.createCell((short) 0);
			cell.setCellValue(i+1);

			cell = row.createCell((short) 1);
			cell.setCellValue(work.getStartTime());

			cell = row.createCell((short) 2);
			cell.setCellValue(work.getOverTime());

			cell = row.createCell((short) 3);
			cell.setCellValue(work.getOrginization());
                        
                        cell = row.createCell((short) 4);
			cell.setCellValue(work.getDepartment());
                        
                        cell = row.createCell((short) 5);
			cell.setCellValue(work.getPost());
		}

                
                ByteArrayOutputStream os = new ByteArrayOutputStream();
		
		try
		{
			wb.write(os);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		
		byte[] content = os.toByteArray();
		
		InputStream is = new ByteArrayInputStream(content);
		
		return is;
                
                /*
		File file = new File("testt.xls");

		try
		{
			OutputStream os = new FileOutputStream(file);
			wb.write(os);
			os.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		InputStream is = null;
		try
		{
			is = new FileInputStream(file);
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}

		return is;*/

	}
                   
                         public InputStream getGuanliyuanInputStream()
	{
            
            HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        
        
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");

		HSSFRow row = sheet.createRow(0);

		HSSFCell cell = row.createCell((short) 0);
		cell.setCellValue("序号");

		cell = row.createCell((short) 1);;
		cell.setCellValue("用户名");

		cell = row.createCell((short) 2);
		cell.setCellValue("姓名");

		cell = row.createCell((short) 3);
		cell.setCellValue("院系");
                
                cell = row.createCell((short) 4);
		cell.setCellValue("类型");
               
    

                List<Manager> list = null;

               list = loginManageDao.findAllManagers();
               
		for (int i = 0; i < list.size(); ++i)
		{
			Manager manager = list.get(i);

			row = sheet.createRow(i + 1);

			cell = row.createCell((short) 0);
			cell.setCellValue(i+1);

			cell = row.createCell((short) 1);
			cell.setCellValue(manager.getManagerId());

			cell = row.createCell((short) 2);
			cell.setCellValue(manager.getName());

			cell = row.createCell((short) 3);
			cell.setCellValue(manager.getCollege());
                        
                        cell = row.createCell((short) 4);
			cell.setCellValue(manager.getIsSuper());
		}

                ByteArrayOutputStream os = new ByteArrayOutputStream();
		
		try
		{
			wb.write(os);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		
		byte[] content = os.toByteArray();
		
		InputStream is = new ByteArrayInputStream(content);
		
		return is;
                
                /*
		File file = new File("test.xls");

		try
		{
			OutputStream os = new FileOutputStream(file);
			wb.write(os);
			os.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		InputStream is = null;
		try
		{
			is = new FileInputStream(file);
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}

		return is;*/

	}    
    
}
