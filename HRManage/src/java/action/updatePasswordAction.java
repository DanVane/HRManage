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
public class updatePasswordAction {
    
    private LoginManageDao loginManageDao;

    public LoginManageDao getLoginManageDao() {
        return loginManageDao;
    }

    public void setLoginManageDao(LoginManageDao loginManageDao) {
        this.loginManageDao = loginManageDao;
    }
    
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    private Manager manager;

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }
    
    
    
    private String rusername;
    private String email;

    public String getRusername() {
        return rusername;
    }

    public void setRusername(String rusername) {
        this.rusername = rusername;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
    public updatePasswordAction() {
    }
    
   public String updatePassword(){
        String page="fail";
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String newpassword = request.getParameter("oldPassword");
        System.out.println(newpassword);
        String oldpassword = request.getParameter("password");
        System.out.println(oldpassword);
        Manager m = (Manager)session.getAttribute("loginManager");
        User u  = (User) session.getAttribute("loginUser");
        if(m != null){
            System.out.println(m.getPassword());
            if(m.getPassword().equals(oldpassword)){
                m.setPassword(newpassword);
                int i = 0;
                i = loginManageDao.updateManagerInfor(m);
                if( i == 1){
                    page="success";
                    session.removeAttribute("loginManager");
                    session.setAttribute("loginManager", m);
                    session.setAttribute("MYES", "yes");
                }
                if(i == 0){
                    session.setAttribute("MFALSE", "FAIL");
                }
            }else{
                session.setAttribute("FALSEP", "true");
            }
        }else if(u !=null){
            System.out.println(u.getPassword());
            if(u.getPassword().equals(oldpassword)){
                u.setPassword(newpassword);
                int i = 0;
                i = loginManageDao.updateUserInfor(u);
                if( i == 1){
                    page="success";
                    session.removeAttribute("loginUser");
                    session.setAttribute("loginUser", u);
                    session.setAttribute("UYES", "yes");
                }
                if(i == 0){
                    session.setAttribute("UFALSE", "FAIL");
                }
            }else{
                session.setAttribute("FALSEP", "true");
            }
        }
        return page;
    }
   
   public String resetUserPassword(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String page="fail";
        try{
            loginManageDao.resetUserPassword(user.getUserId());
            page = "success";
            session.setAttribute("resetUP", "yes");
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return page;
    }
   
   public String resetPassword(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String page="fail";
        try{
            loginManageDao.resetPassword(rusername,email);
            page = "success";
            session.setAttribute("OK", "yes");
        }catch(Exception err){
            System.out.println(err.getMessage());
            session.setAttribute("OK", "fail");
        }
        return page;
    }
   
   public String resetManagerPassword(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String page="fail";
        try{
            loginManageDao.resetManagerPassword(manager.getManagerId());
            page = "success";
            session.setAttribute("resetMP", "yes");
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return page;
    }
    
}
