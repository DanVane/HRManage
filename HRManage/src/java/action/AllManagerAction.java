/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import dao.LoginManageDao;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import po.Manager;
import po.User;

/**
 *
 * @author Administrator
 */
public class AllManagerAction {
    private Manager manager;
    private String newManagerId;
    private String newManagerName;
    private String newCollege;

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public String getNewManagerId() {
        return newManagerId;
    }

    public void setNewManagerId(String newManagerId) {
        this.newManagerId = newManagerId;
    }

    public String getNewManagerName() {
        return newManagerName;
    }

    public void setNewManagerName(String newManagerName) {
        this.newManagerName = newManagerName;
    }

    public String getNewCollege() {
        return newCollege;
    }

    public void setNewCollege(String newCollege) {
        this.newCollege = newCollege;
    }
    
    
    private LoginManageDao loginManageDao;

    public LoginManageDao getLoginManageDao() {
        return loginManageDao;
    }

    public void setLoginManageDao(LoginManageDao loginManageDao) {
        this.loginManageDao = loginManageDao;
    }
    
    public AllManagerAction() {
    }

  
    
    public String AddNewManager(){
        try{
            System.out.println("###################3");
            loginManageDao.addManager(manager);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public void ListManagers(){
        Map request=(Map) ActionContext.getContext().get("request");
        request.put("listManager", findManagersPre());
    }
    
    public List<Manager> findManagersPre(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        return loginManageDao.findAllManagers(); 
    }
    
    public String deleteManagerInfo(){
        String page = "fail";
        HttpServletRequest request = ServletActionContext.getRequest();
         HttpSession session = request.getSession();
        System.out.println("正在删除。。。");
   String change = request.getParameter("change");
        System.out.println(change);
       loginManageDao.deleteManagerInfo(change);
        page = "success";
        return page;
    }
    
    public String updatePManagerInfo(){
        String page = "fail";
        HttpServletRequest request = ServletActionContext.getRequest();
         HttpSession session = request.getSession();
  String mid = manager.getManagerId();
    Manager mm =  loginManageDao.findManager(mid);
    session.setAttribute("mm", mm);
        page = "success";
        return page;
    }
    
    public String updateManager() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
        //    System.out.println("selected id is"+newManagerId);
            manager = (Manager)session.getAttribute("mm");
            System.out.println("##########################");
        //    System.out.println(oldCollege+newUserName+newUserType+newDepartment);
         //   System.out.println("##########################");
            
            manager.setCollege(newCollege);
        //    manager.setIsSuper("系统管理员");
            manager.setName(newManagerName);
        //    manager.setPassword("111111");
            loginManageDao.updateManagerInfor(manager);
            System.out.println("##########################");
         
        }catch(Exception err){
            System.out.println("has Exception");
           
        }
        return SUCCESS;
    }
   
    
    public String resetmanagerPassword(){
         HttpServletRequest request = ServletActionContext.getRequest();
         HttpSession session = request.getSession();
         String change = request.getParameter("change");
        String page="fail";
        try{
            System.out.println("reseting");
            loginManageDao.resetManagerPassword(change);
            page = "success";
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return page;
    }
    
    public String exitAction(){
        String page = "fail";
         HttpServletRequest request = ServletActionContext.getRequest();
         HttpSession session = request.getSession();
         try{
             System.out.println("正在删除session。。。");
             session.invalidate();
             page="success";
         }catch(Exception e){
             System.out.println(e.getMessage());
         }
         return page;
    }
    
    public String changeToManager(){
        String page="fail"; 
        HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession(); 
        try{
          
            User u = (User) session.getAttribute("loginUser");
            String mid = u.getUserId();
            System.out.println("需要转换的用户ID"+mid);
            manager = loginManageDao.findManager(mid);
            if(manager != null){
                System.out.println("已找到相应的用户了");
                if(session.getAttribute("loginUser") != null){
                    session.removeAttribute("loginUser");
                }
                if(session.getAttribute("loginManager")!=null){
                     session.removeAttribute("loginManager");
                }
                 if(session.getAttribute("changeToManager")!=null){
                    session.removeAttribute("changeToManager");
                }
                  session.setAttribute("loginManager", manager);
                session.setAttribute("changeToManager", "done");
            }else{
                session.setAttribute("changeToManager", "notdone");
            }
            page ="success";
        }catch(Exception e){
           
            System.out.println(e.getMessage());
        }
        return page;
    }
    

}
