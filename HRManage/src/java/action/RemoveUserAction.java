/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import dao.LoginManageDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import po.User;

/**
 *
 * @author Administrator
 */
public class RemoveUserAction {
    
    private User user; 
    private LoginManageDao loginManageDao;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LoginManageDao getLoginManageDao() {
        return loginManageDao;
    }

    public void setLoginManageDao(LoginManageDao loginManageDao) {
        this.loginManageDao = loginManageDao;
    }
    
    
    
    public RemoveUserAction() {
    }
    
    @SuppressWarnings("unchecked")
    public String execute() throws Exception {
         HttpServletRequest request = ServletActionContext.getRequest();
         HttpSession session = request.getSession();
        try{
            System.out.println("removeAction");
            loginManageDao.removeUser(user.getUserId());
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
}
