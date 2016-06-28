/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import others.MD5;
import po.Manager;
import po.Teacher;
import po.User;

/**
 *
 * @author Administrator
 */
public class LoginManageDao {
     private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
     
     
     
      @SuppressWarnings("unchecked")
    public User checkUser(String userName,String userPassword){
        Session session = sessionFactory.openSession();
        String hql = "from User where UserID = '"+userName+"' and Password = '"+userPassword+"'";
        User user = null;
        try{
            List<User> userList = session.createQuery(hql).list();
            if(userList.size() > 0){
                user = new User();
                user = userList.get(0);
            }
        }catch(RuntimeException re){
            re.printStackTrace();
        }
        session.close();
        return user;
    }
    
     public Manager checkManager(String managerID,String managerPassword){
        Session session = sessionFactory.openSession();
        Manager manager = null;
        String hql = "from Manager where ManagerID = '"+managerID+"' and Password = '"+managerPassword+"'";
        try{
            List<Manager> managerList = session.createQuery(hql).list();
            if(managerList.size() > 0){
                manager = new Manager();
                manager = managerList.get(0);
            }
        }catch(RuntimeException re){
            re.printStackTrace();
        }
        session.close();
        return manager;
    }
     
     public int updateManagerInfor(Manager manager){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        int i = 0;
        try{
            tx = session.beginTransaction();
            session.update(manager);
            i = 1;
            tx.commit();
        }catch (RuntimeException re) {
            tx.rollback();
            throw re;
        }
        session.close();
        return i;
    }
     
     public int updateUserInfor(User user){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        int i = 0;
        try{
            tx = session.beginTransaction();
            session.update(user);
            i = 1;
            tx.commit();
        }catch (RuntimeException re) {
            tx.rollback();
            throw re;
        }
        session.close();
        return i;
    }
     
      public User findUser(String userId){
        User user = null;
        Session session = sessionFactory.openSession();
        try{
            user = (User)session.get("po.User", userId);
            session.close();
            return user;
        }catch(RuntimeException re){
            throw re;
        }
    }
      
      public int addUser(User user){
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        int i = 0;
        try{
            tx=session.beginTransaction();
            session.save(user);
            i = 1;
            tx.commit();
        }catch(RuntimeException re){
            tx.rollback();
            throw re;
        }
        session.close();
        return i ;
    }
      
      public void resetUserPassword(String userId) {
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        try{
            User user = (User)session.get("po.User", userId);
            user.setPassword(MD5.MD5("111111"));
            tx = session.beginTransaction();
            session.update(user);
            tx.commit();
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        session.close();
    }
      
      public void removeUser(String userId) {
        Session session = sessionFactory.openSession();
        System.out.println(userId);
        Transaction tx= null;
        try{
            tx = session.beginTransaction();
            session.delete(session.get("po.User", userId));
            tx.commit();
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        session.close();
    }
      
       @SuppressWarnings("unchecked")
    public List<User> findUsersByCollege(String college) {
        Session session = sessionFactory.openSession();
        String hql="from User where College='"+college+"'";
       return (List<User>)session.createQuery(hql).list();
    }
    
    @SuppressWarnings("unchecked")
    public List<User> findAllUsrs() {
        Session session = sessionFactory.openSession();
        String hql="from po.User";
        return (List<User>)session.createQuery(hql);
    }
    
    @SuppressWarnings("unchecked")
    public List<User> findAllUsers() {
        Session session = sessionFactory.openSession();
        String hql="from User";
       return (List<User>)session.createQuery(hql).list();
    }
    
    public void resetPassword(String tid,String email){
        Session session = sessionFactory.openSession();
        String hql = "from Teacher where TeacherID = '"+tid+"' and FirstMail = '"+email+"'";
        try{
            List<Teacher> TeacherList = session.createQuery(hql).list();
            if(TeacherList.size() > 0){
                resetUserPassword(tid);
            }
        }catch(RuntimeException re){
            re.printStackTrace();
            System.out.println("没找到该用户"+re.getMessage());
        }
        session.close();
       
    }
    
    public int addManager(Manager manager){
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        int i = 0;
        try{
            tx=session.beginTransaction();
            session.save(manager);
            i = 1;
            tx.commit();
        }catch(RuntimeException re){
            tx.rollback();
            throw re;
        }
        session.close();
        return i ;
    }
    
    @SuppressWarnings("unchecked")
    public List<Manager> findAllManagers() {
        Session session = sessionFactory.openSession();
        String hql="from po.Manager";
        return (List<Manager>)session.createQuery(hql).list();
    }
    
    public String deleteManagerInfo(String mid){
         Session session = sessionFactory.openSession();
   Transaction tx= null;
        try{
            tx = session.beginTransaction();
            session.delete(session.get("po.Manager",mid));
            tx.commit();
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        session.close();
        return SUCCESS;
    }
    
    public void resetManagerPassword(String mid) {
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        try{
            Manager m = (Manager)session.get("po.Manager", mid);
            m.setPassword(MD5.MD5("111111"));
            tx = session.beginTransaction();
            session.update(m);
            tx.commit();
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        session.close();
    }
    
    public Manager findManager(String mid){
         Session session = sessionFactory.openSession();
    Manager m =null;
        try{
           m = (Manager)session.get("po.Manager", mid);
            session.close();
          
        }catch(Exception err){
            System.out.println(err.getMessage());
        } 
        return m;
    }
    
    
}
