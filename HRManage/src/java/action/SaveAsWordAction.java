/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.struts2.ServletActionContext;
import po.Paper;
import po.Teacher;
import po.User;

/**
 *
 * @author Administrator
 */
public class SaveAsWordAction {
    
    public SaveAsWordAction() {
    }
    
   	public String execute() throws Exception
	{
		return SUCCESS;
	}
      private Configuration configuration = null;
    
     public InputStream getDownloadFile() throws UnsupportedEncodingException{
  
         configuration = new Configuration(); 
        configuration.setDefaultEncoding("UTF-8"); 
            Map dataMap=new HashMap();
            getData(dataMap);
     
   configuration.setClassForTemplateLoading(this.getClass(), "../example");
 Template t=null;

      
      try {
 //test.ftl 为要装载的模板 
t = configuration.getTemplate("lunwen.ftl");
if(t!=null){
    System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTT");
}else{
    System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTTNULL!!!!");
}
 } catch (IOException e) {
 e.printStackTrace(); 
} 
//输出文档路径及名称 
      
      String ff = RandomStringUtils.randomAlphanumeric(10);
		
		ff = new StringBuffer(ff).append(".doc").toString();
      
File file = new File(ff);
 Writer out = null; 
   try {     
   FileOutputStream fos = new FileOutputStream(file);
   OutputStreamWriter oWriter = new OutputStreamWriter(fos,"UTF-8");//这个地方对流的编码不可或缺，
//使用main（）单独调用时，应该可以，但是如果是web请求导出时导出后word文档就会打不开，并且包XML文件错误。主要是编码格式不正确，无法解析。
   out = new BufferedWriter(oWriter);   
   } catch (FileNotFoundException e1) { 
    e1.printStackTrace();      
    } 
 
try {
 t.process(dataMap, out); 
 out.close();
} catch (Exception e) {
    System.out.println("template  ***********************");
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

		return is;

     }

private void getData(Map dataMap) {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            User u = (User)session.getAttribute("loginUser");
            Paper p = (Paper) session.getAttribute("Paper");
            Teacher t = (Teacher) session.getAttribute("loginTeacher");
 dataMap.put("PaperID",p.getPaperId() );
 dataMap.put("NameC", p.getNameC());
 dataMap.put("NameE", p.getNameE());
 dataMap.put("UserName", u.getUserName());
 dataMap.put("College", "南京理工大学"+u.getCollege());
dataMap.put("Telephone", t.getTelephone());
dataMap.put("TeacherID", t.getTeacherId());
if(session.getAttribute("One").equals("have")){
    dataMap.put("AuthorOne", session.getAttribute("AuthorOneName").toString());
    dataMap.put("AuthorOneOrganization", session.getAttribute("AuthorOneOrganization").toString());
    if(session.getAttribute("AuthorOnePost").equals("教师")){
        dataMap.put("OneisTeacher", "√");
        dataMap.put("OneisStudent","");
    }else{
        dataMap.put("OneisTeacher", "");
        dataMap.put("OneisStudent","√");
    }
}else{
    dataMap.put("AuthorOne","无");
    dataMap.put("AuthorOneOrganization","无");
    
        dataMap.put("OneisTeacher", "");
        dataMap.put("OneisStudent","");
   
}

if(session.getAttribute("Two").equals("have")){
    dataMap.put("AuthorTwo", session.getAttribute("AuthorTwoName").toString());
    dataMap.put("AuthorTwoOrganization", session.getAttribute("AuthorTwoOrganization").toString());
    if(session.getAttribute("AuthorTwoPost").equals("教师")){
        dataMap.put("TwoisTeacher", "√");
        dataMap.put("TwoisStudent","");
    }else{
         dataMap.put("TwoisTeacher", "");
        dataMap.put("TwoisStudent","√");
    }
}else{
    dataMap.put("AuthorTwo","无");
    dataMap.put("AuthorTwoOrganization","无");
    
        dataMap.put("TwoisTeacher", "");
        dataMap.put("TwoisStudent","");
   
}

if(session.getAttribute("Three").equals("have")){
    dataMap.put("AuthorThree", session.getAttribute("AuthorThreeName").toString());
    dataMap.put("ThreeOrganization", session.getAttribute("AuthorThreeOrganization").toString());
    if(session.getAttribute("AuthorThreePost").equals("教师")){
        dataMap.put("ThreeisTeacher", "√");
        dataMap.put("ThreeisStudent","");
    }else{
        dataMap.put("ThreeisTeacher", "");
        dataMap.put("ThreeisStudent","√");
    }
}else{
    dataMap.put("AuthorThree","无");
    dataMap.put("ThreeOrganization","无");
    
        dataMap.put("ThreeisTeacher", "");
        dataMap.put("ThreeisStudent","");
   
}

if(session.getAttribute("Four").equals("have")){
    dataMap.put("AuthorFour", session.getAttribute("AuthorFourName").toString());
    dataMap.put("FourOrganization", session.getAttribute("AuthorFourOrganization").toString());
    if(session.getAttribute("AuthorFourPost").equals("教师")){
        dataMap.put("FourisTeacher", "√");
        dataMap.put("FourisStudent","");
    }else{
         dataMap.put("FourisTeacher", "");
        dataMap.put("FourisStudent","√");
    }
}else{
    dataMap.put("AuthorFour","无");
    dataMap.put("FourOrganization","无");
    
        dataMap.put("FourisTeacher", "");
        dataMap.put("FourisStudent","");
   
}

if(session.getAttribute("qiKan").equals("hava")){
    dataMap.put("PeriodicalC", p.getPeriodicalC());
    dataMap.put("PeriodicalE", p.getPeriodicalE());
    if(session.getAttribute("typeOne").equals("guoji")){
        dataMap.put("isnotGuonei", "√");
        dataMap.put("isGuonei", "");
    }else{
         dataMap.put("isnotGuonei", "");
        dataMap.put("isGuonei", "√");
    }
    dataMap.put("MeetingC", "");
    dataMap.put("MaaetingE","");
    dataMap.put("isGuojiMeetting", "");
    dataMap.put("isGuoneiMeetting", "");
}else{
     dataMap.put("MeetingC", p.getMertingC());
    dataMap.put("MeetingE", p.getMeetingE());
    if(session.getAttribute("typeOne").equals("guoji")){
         dataMap.put("isGuojiMeetting", "√");
    dataMap.put("isGuoneiMeetting", "");
    }else{
         dataMap.put("isGuojiMeetting", "");
    dataMap.put("isGuoneiMeetting", "√");
         dataMap.put("isnotGuonei", "");
        dataMap.put("isGuonei", "√");
    }
    dataMap.put("PeriodicalC", "");
    dataMap.put("PeriodicalE","");
    dataMap.put("isnotGuonei", "");
        dataMap.put("isGuonei", "");
}


dataMap.put("Year", "2001");
dataMap.put("Month","09");
dataMap.put("Reel",p.getReel());
dataMap.put("Issue",p.getIssue());
dataMap.put("StartP",p.getStartP());
dataMap.put("OverP", p.getOverP());
 }

    
}
