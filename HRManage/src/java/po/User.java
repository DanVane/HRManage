package po;
// Generated 2013-12-21 21:53:49 by Hibernate Tools 3.6.0

import others.MD5;




/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private String userId;
     private String userName;
     private String password =MD5.MD5("111111");
     private String userType;
     private String college;
     private String department;

    public User() {
    }

    public User(String userId, String userName, String password, String userType, String college, String department) {
       this.userId = userId;
       this.userName = userName;
       this.password = password;
       this.userType = userType;
       this.college = college;
       this.department = department;
    }
   
    public String getUserId() {
        return this.userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUserType() {
        return this.userType;
    }
    
    public void setUserType(String userType) {
        this.userType = userType;
    }
    public String getCollege() {
        return this.college;
    }
    
    public void setCollege(String college) {
        this.college = college;
    }
    public String getDepartment() {
        return this.department;
    }
    
    public void setDepartment(String department) {
        this.department = department;
    }




}


