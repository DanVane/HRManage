/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import dao.LoginManageDao;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import others.MD5;
import po.Manager;
import po.User;

/**
 *
 * @author Administrator
 */
public class AllUserAction {
    
    private User user;
    private String oldUserId;
    private String oldCollege;
    private String newUserName;
    private String newUserType;
    private String newDepartment;
    private LoginManageDao loginManageDao;
    
    private File file;
    private String fileFileName;
    private String fileContentTypt;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getOldUserId() {
        return oldUserId;
    }

    public void setOldUserId(String oldUserId) {
        this.oldUserId = oldUserId;
    }

    public String getOldCollege() {
        return oldCollege;
    }

    public void setOldCollege(String oldCollege) {
        this.oldCollege = oldCollege;
    }

    public String getNewUserName() {
        return newUserName;
    }

    public void setNewUserName(String newUserName) {
        this.newUserName = newUserName;
    }

    public String getNewUserType() {
        return newUserType;
    }

    public void setNewUserType(String newUserType) {
        this.newUserType = newUserType;
    }

    public String getNewDepartment() {
        return newDepartment;
    }

    public void setNewDepartment(String newDepartment) {
        this.newDepartment = newDepartment;
    }

    public LoginManageDao getLoginManageDao() {
        return loginManageDao;
    }

    public void setLoginManageDao(LoginManageDao loginManageDao) {
        this.loginManageDao = loginManageDao;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentTypt() {
        return fileContentTypt;
    }

    public void setFileContentTypt(String fileContentTypt) {
        this.fileContentTypt = fileContentTypt;
    }
    
    
    
    public AllUserAction() {
    }
    
    public String updatePUser() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            user=loginManageDao.findUser(user.getUserId());
            session.setAttribute("User", user);
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public String updateUser() {
           try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
        //    System.out.println("selected id is"+newManagerId);
            User  user = (User)session.getAttribute("User");
            System.out.println("##########################");
          System.out.println(oldCollege+newUserName+newUserType+newDepartment +user.getUserId());
         //   System.out.println("##########################");
         
            user.setCollege(oldCollege);
            user.setDepartment(newDepartment);
            user.setUserName(newUserName);
            user.setUserType(newUserType);
        //    manager.setIsSuper("系统管理员");
           
        //    manager.setPassword("111111");
            loginManageDao.updateUserInfor(user);
            System.out.println("##########################");
         
        }catch(Exception err){
            System.out.println(err.getMessage());
            System.out.println("has Exception");
           
        }
        return SUCCESS;
    }
    
     public String AddNewUser(){
         System.out.println("Adding.....");
        try{
            loginManageDao.addUser(user);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
     
     public void ListUserByCollege(){
        Map request=(Map) ActionContext.getContext().get("request");
        request.put("listUsers", findUsersByCollegePre());
    }
    
    public List<User> findUsersByCollegePre() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String college = (String) session.getAttribute("managerCollege");
        return loginManageDao.findUsersByCollege(college); 
    }
    
    public void ListAllUsers(){
        Map request=(Map) ActionContext.getContext().get("request");
        request.put("listUsers", findAllUsers());
    }
    
    public List<User> findAllUsers() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        return loginManageDao.findAllUsers(); 
    }
    
    
     public String importUser() throws IOException{
         System.out.println("importing....");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String path = ServletActionContext.getServletContext().getRealPath(
        "/general");
        System.out.println(path);
        InputStream in = new FileInputStream(file);
        OutputStream out = new FileOutputStream(path+"/"+this.getFileFileName());
        System.out.println(this.getFileFileName());
        byte[] b = new byte[1024];
        int size = in.read(b);
        while (size>0){
            out.write(b,0,size);
            size = in.read(b);
        }  
        out.close();
        in.close();
        session.setAttribute("fileName", this.getFileFileName());
        return null;
    }
    //导入数据库
    public String intoDB() throws IOException, BiffException{
         System.out.println("0000");  
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String path = ServletActionContext.getServletContext().getRealPath(
        "/general");
        String fileName = null;
        while(fileName == null){
            fileName = (String)session.getAttribute("fileName");
            System.out.println(fileName);
        }
        File f = new File(path + "\\" + fileName);
            //用jxl解析excel2003
            if(fileName.indexOf(".xlsx") == -1){
                Workbook book = Workbook.getWorkbook(f); 
                Sheet sheet = book.getSheet(0); // 获得第一个工作表对象
                for (int i = 1; i < sheet.getRows(); i++) {
                    User userr = new User();
                    userr.setUserId(sheet.getCell(0, i).getContents());
                    userr.setUserName(sheet.getCell(1, i).getContents());
                    userr.setPassword(MD5.MD5("111111"));
                    userr.setCollege(sheet.getCell(2, i).getContents());
                    userr.setDepartment(sheet.getCell(3, i).getContents());
                    userr.setUserType(sheet.getCell(4, i).getContents());
                    //添加到数据库
                    loginManageDao.addUser(userr);
                }
            }else{
      XSSFWorkbook xwb = null;
        try {
         xwb = new XSSFWorkbook(new FileInputStream(f.getPath()));
        } catch (IOException e) {
            System.out.println(e.getMessage());
        } 
        XSSFSheet xSheet = xwb.getSheetAt(0);
        for (int rowNum = 0; rowNum <= xSheet.getLastRowNum(); rowNum++) {
            XSSFRow xRow = xSheet.getRow(rowNum);
            if (xRow == null) {
                continue;
            }
            User userr = new User(); 
            if (XSSFCell.CELL_TYPE_NUMERIC ==xRow.getCell(0).getCellType()) {     //对数字的处理                        
                       xRow.getCell(0).setCellType(XSSFCell.CELL_TYPE_STRING);
                               }   
             String uid =xRow.getCell(0).getStringCellValue();
              userr.setUserId(uid);
              userr.setPassword(MD5.MD5("111111"));
            userr.setUserName(xRow.getCell(1).getStringCellValue());
            userr.setCollege(xRow.getCell(2).getStringCellValue()); 
            if (XSSFCell.CELL_TYPE_NUMERIC ==xRow.getCell(3).getCellType()) {     //对数字的处理                       
                       xRow.getCell(3).setCellType(XSSFCell.CELL_TYPE_STRING);
                               } 
            String udp = xRow.getCell(3).getStringCellValue();
            userr.setDepartment(udp);
            userr.setUserType(xRow.getCell(4).getStringCellValue());
            //添加到数据库
            loginManageDao.addUser(userr);
        }
            }
        f.delete();
        session.removeAttribute("fileName");
        return null;
    }
    
    public String changeToUser(){
        String page="fail"; 
        HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession(); 
        try{
          
            Manager m = (Manager) session.getAttribute("loginManager");
            String uid = m.getManagerId();
            System.out.println("需要转换的管理员ID"+uid);
            user = loginManageDao.findUser(uid);
            if(user != null){
                System.out.println("已找到相应的用户了");
                if(session.getAttribute("loginUser") != null){
                    session.removeAttribute("loginUser");
                }
                if(session.getAttribute("loginManager")!=null){
                     session.removeAttribute("loginManager");
                }
                if(session.getAttribute("changeToUser")!=null){
                    session.removeAttribute("changeToUser");
                } 
                session.setAttribute("loginUser", user);
                session.setAttribute("changeToUser", "done");
            }else{
                   session.setAttribute("changeToUser", "notdone");
            }
            
            page ="success";
        }catch(Exception e){
            
        
            System.out.println(e.getMessage());
        }
        return page;
    }
    
}
