/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import po.Author;
import po.Degrees;
import po.Honor;
import po.Paper;
import po.Parttimejob;
import po.Teacher;
import po.Tsbelong;
import po.User;
import po.Workexprience;

/**
 *
 * @author Administrator
 */
public class TeacherManageDao {
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public Teacher findTeacher(String teacherId){
        Teacher teacher = null;
        Session session = sessionFactory.openSession();
        try{
            teacher = (Teacher)session.get("po.Teacher", teacherId);
            session.close();
            return teacher;
        }catch(RuntimeException re){
            throw re;
        }
    }
    
    
    public int addTeacherInfo(Teacher teacher){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        int i = 0;
        try{
            tx = session.beginTransaction();
            session.save(teacher);
            i = 1;
            tx.commit();
        }catch (RuntimeException re) {
            tx.rollback();
            throw re;
        }
        session.close();
        return i;
    }
    
    public int updateTeacherInfo(Teacher teacher){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        int i = 0;
        try{
            tx = session.beginTransaction();
            session.update(teacher);
            i = 1;
            tx.commit();
        }catch (RuntimeException re) {
            tx.rollback();
            throw re;
        }
        session.close();
        return i;
    }
    
    @SuppressWarnings("unchecked")
    public List<Honor> findHonorsByTeacherId(String teacherId) {
        Session session = sessionFactory.openSession();
        String hql="from po.Honor where TeacherID='"+teacherId+"'"; 
       List<Honor> h = (List<Honor>)session.createQuery(hql).list();
      session.close();
      return h;
    }
    
    public int addHonor(Honor honor){
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        int i = 0;
        try{
            tx=session.beginTransaction();
            session.save(honor);
            i = 1;
            tx.commit();
        }catch(RuntimeException re){
            tx.rollback();
            throw re;
        }
        session.close();
        return i ;
    }
    
    public Honor findHonor(int honorNo){
        Honor honor = null;
        Session session = sessionFactory.openSession();
        try{
            honor = (Honor)session.get("po.Honor", honorNo);
            session.close();
            return honor;
        }catch(RuntimeException re){
            throw re;
        }
    }
    
    public int updateHonorInfor(Honor honor){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        int i = 0;
        try{
            tx = session.beginTransaction();
            session.update(honor);
            i = 1;
            tx.commit();
        }catch (RuntimeException re) {
            tx.rollback();
            throw re;
        }
        session.close();
        return i;
    }
    
     public void removeHonor(int honorNo) {
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        try{
            tx = session.beginTransaction();
            session.delete(session.get("po.Honor", honorNo));
            tx.commit();
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        session.close();
    }
     
     @SuppressWarnings("unchecked")
    public List<Parttimejob> findPartJobssByTeacherId(String teacherId) {
        Session session = sessionFactory.openSession();
        String hql="from po.Parttimejob where TeacherID='"+teacherId+"'"; 
       List<Parttimejob> p= (List<Parttimejob>)session.createQuery(hql).list();
       session.close();
      return p;
    }
    
    public int addJob(Parttimejob job){
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        int i = 0;
        try{
            tx=session.beginTransaction();
            session.save(job);
            i = 1;
            tx.commit();
        }catch(RuntimeException re){
            tx.rollback();
            throw re;
        }
        session.close();
        return i ;
    }
    
    public void removeJob(int jobNo) {
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        try{
            tx = session.beginTransaction();
            session.delete(session.get("po.Parttimejob", jobNo));
            tx.commit();
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        session.close();
    }
    
   public Parttimejob findJob(int jobNo){
        Parttimejob job = null;
        Session session = sessionFactory.openSession();
        try{
            job = (Parttimejob)session.get("po.Parttimejob", jobNo);
            session.close();
            return job;
        }catch(RuntimeException re){
            throw re;
        }
    }
   
   public int updateJobInfor(Parttimejob job){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        int i = 0;
        try{
            tx = session.beginTransaction();
            session.update(job);
            i = 1;
            tx.commit();
        }catch (RuntimeException re) {
            tx.rollback();
            throw re;
        }
        session.close();
        return i;
    }
   
   @SuppressWarnings("unchecked")
    public List<Workexprience> findWorkssByTeacherId(String teacherId) {
        Session session = sessionFactory.openSession();
        String hql="from po.Workexprience where TeacherID='"+teacherId+"'"; 
       List<Workexprience> w= (List<Workexprience>)session.createQuery(hql).list();
      session.close();
      return w;
    }
    
    public int addWork(Workexprience work){
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        int i = 0;
        try{
            tx=session.beginTransaction();
            session.save(work);
            i = 1;
            tx.commit();
        }catch(RuntimeException re){
            tx.rollback();
            throw re;
        }
        session.close();
        return i ;
    }
    
    public void removeWork(int workNo) {
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        try{
            tx = session.beginTransaction();
            session.delete(session.get("po.Workexprience", workNo));
            tx.commit();
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        session.close();
    }
    
    public Workexprience findWork(int workNo){
        Workexprience work = null;
        Session session = sessionFactory.openSession();
        try{
            work = (Workexprience)session.get("po.Workexprience", workNo);
            session.close();
            return work;
        }catch(RuntimeException re){
            throw re;
        }
    }
    
    public int updateWorkInfor(Workexprience work){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        int i = 0;
        try{
            tx = session.beginTransaction();
            session.update(work);
            i = 1;
            tx.commit();
        }catch (RuntimeException re) {
            tx.rollback();
            throw re;
        }
        session.close();
        return i;
    }
    
     @SuppressWarnings("unchecked")
    public List<Degrees> findDegreessByTeacherId(String teacherId) {
        Session session = sessionFactory.openSession();
        String hql="from Degrees where TeacherID='"+teacherId+"'"; 
       List<Degrees> d=(List<Degrees>)session.createQuery(hql).list();
       session.close();
       return d;
      
    }
    
    public int addDegree(Degrees degree){
        Session session = sessionFactory.openSession();
        Transaction tx= null;
        int i = 0;
        try{
            tx=session.beginTransaction();
            session.save(degree);
            i = 1;
            tx.commit();
        }catch(RuntimeException re){
            tx.rollback();
            throw re;
        }
        session.close();
        return i ;
    }
    
    public void removeDegree(int degreeNo) {
        Session session = sessionFactory.openSession();
        System.out.println(degreeNo);
        Transaction tx= null;
        try{
            tx = session.beginTransaction();
            session.delete(session.get("po.Degrees", degreeNo));
            tx.commit();
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        session.close();
    }
    
    public Degrees findDegree(int degreeNo){
        Degrees degree = null;
        Session session = sessionFactory.openSession();
        try{
            degree = (Degrees)session.get("po.Degrees", degreeNo);
            session.close();
            return degree;
        }catch(RuntimeException re){
            throw re;
        }
    }
    
    public int updateDegreeInfor(Degrees degree){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        int i = 0;
        try{
            tx = session.beginTransaction();
            session.update(degree);
            i = 1;
            tx.commit();
        }catch (RuntimeException re) {
            tx.rollback();
            throw re;
        }
        session.close();
        return i;
    }
    
    @SuppressWarnings("unchecked")
    public List<Paper> findPapersByAuthorID(String teacherId) {
        Session session = sessionFactory.openSession();
        String hql="from po.Paper where AuthorID='"+teacherId+"'"; 
       List<Paper> p= (List<Paper>)session.createQuery(hql).list();
       session.close();
      return p;
    } 
    
    
    
     public Paper findPaperByPaperId(String paperId){
        Paper  paper = null;
        Session session = sessionFactory.openSession();
        try{
             String hql="from po.Paper where PaperID='"+paperId+"'"; 
         List<Paper> paperList = session.createQuery(hql).list();
            if(paperList.size() > 0){
                paper = new Paper();
                paper = paperList.get(0);
            }
            session.close();
            return paper;
        }catch(RuntimeException re){
            throw re;
        }
        
        
         
    }
    
    @SuppressWarnings("unchecked")
    public List<Author> findAuthorsByPaperId(String paperId) {
        Session session = sessionFactory.openSession();
        String hql="from po.Author where PaperID='"+paperId+"'"; 
       List<Author> p= (List<Author>)session.createQuery(hql).list();
       session.close();
      return p;
    } 
    
     public Tsbelong findTsbelongByTeacherId(String tid){
        Tsbelong ts = null;
        Session session = sessionFactory.openSession();
        try{
            ts = (Tsbelong)session.get("po.Tsbelong", tid);
            session.close();
            return ts;
        }catch(RuntimeException re){
            throw re;
        }
    }
     
      public int updateTsbelongInfor(Tsbelong  ts){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        int i = 0;
        try{
            tx = session.beginTransaction();
            session.update(ts);
            i = 1;
            tx.commit();
        }catch (RuntimeException re) {
            tx.rollback();
            throw re;
        }
        session.close();
        return i;
    }
}
