/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import dao.LoginManageDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import po.Manager;
import po.User;

/**
 *
 * @author Administrator
 */
public class LoginAction {
    private LoginManageDao loginManageDao;

    public LoginManageDao getLoginManageDao() {
        return loginManageDao;
    }

    public void setLoginManageDao(LoginManageDao loginManageDao) {
        this.loginManageDao = loginManageDao;
    }
    
    
    public LoginAction() {
    }
    
    public String loginCheck(){
        String page = "fail";
        User user = new User();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String userName= request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(password);
        System.out.println(userName + password);
        user = loginManageDao.checkUser(userName, password);
        if(user != null){
            page = "success";
            if(session.getAttribute("loginUser") != null){
                session.removeAttribute("loginUser");
            }
            session.setAttribute("loginUser", user);
        }
        return page;
    }
    
    public String managerLoginCheck(){
        System.out.println("管理员登录");
        String page = "fail";
        Manager manager = new Manager();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String userName= request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(userName + password);
        manager = loginManageDao.checkManager(userName, password);
        if(manager!=null){
            page = "success";
            if(session.getAttribute("loginManager") != null){
                session.removeAttribute("loginManager");
            }
            if(session.getAttribute("loginUser") != null){
                session.removeAttribute("loginUser");
            }
            session.setAttribute("loginManager", manager);
            session.setAttribute("managerCollege", manager.getCollege());
            session.setAttribute("loginPassword",manager.getPassword());
            System.out.println(manager.getIsSuper());
            if("超级管理员".equals(manager.getIsSuper())){
                System.out.println("超级管理员");
                session.setAttribute("IsSuper", "yes");
                 System.out.println(session.getAttribute("IsSuper").toString());
            }else{
                session.setAttribute("IsSuper", "no");
                System.out.println("超级管理员");
                System.out.println(session.getAttribute("IsSuper").toString());
            }
        }
        return page;
    }
    
    public String lockReturnCheck(){
        String page = "fail";
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String password = request.getParameter("password");
        System.out.println(password);
        User u =null;
        Manager m = null;
        if(session.getAttribute("loginUser")!=null){
            u = (User)session.getAttribute("loginUser");
            if(password.equals(u.getPassword())) page="success";
        }else{
            m = (Manager)session.getAttribute("loginManager");
            if(password.equals(m.getPassword())) page = "success";
        }
       
        return page;
    }
    
    public String exitAction(){
        String page = "fail";
         HttpServletRequest request = ServletActionContext.getRequest();
         HttpSession session = request.getSession();
         try{
             session.invalidate();
             page="success";
         }catch(Exception e){
             System.out.println(e.getMessage());
         }
         return page;
    }
    
}
