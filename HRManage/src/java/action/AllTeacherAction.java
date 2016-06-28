/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import dao.TeacherManageDao;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
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
public class AllTeacherAction {
    
    private TeacherManageDao teacherManageDao;
    private Teacher teacher;
     private String teacherId;
     private Date birthdate;
     private String polity;
     private String hometown;
     private String nation;
     private String identity;
     private String post;
     private String techPost;
     private String workAddress;
     private String telephone;
     private String firstMail;
     private String secondMail;
     private String thirdMail;
     private String mobile;
     private String mailAddress;
     private String direction;
     private String tutorType;
     private String postcode;
     private Degrees degree;
     private Workexprience work;
     private Parttimejob job;
     private Honor honor;
     private String batch;
     private String paperId;
     private Tsbelong tsbelong;
           
    
    public AllTeacherAction() {
    }

    public Tsbelong getTsbelong() {
        return tsbelong;
    }

    public void setTsbelong(Tsbelong tsbelong) {
        this.tsbelong = tsbelong;
    }
    
    

    public String getHometown() {
        return hometown;
    }

    public void setHometown(String hometown) {
        this.hometown = hometown;
        System.out.println(this.hometown);
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getPolity() {
        return polity;
    }

    public void setPolity(String polity) {
        this.polity = polity;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getTechPost() {
        return techPost;
    }

    public void setTechPost(String techPost) {
        this.techPost = techPost;
    }

    public String getWorkAddress() {
        return workAddress;
    }

    public void setWorkAddress(String workAddress) {
        this.workAddress = workAddress;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getFirstMail() {
        return firstMail;
    }

    public void setFirstMail(String firstMail) {
        this.firstMail = firstMail;
    }

    public String getSecondMail() {
        return secondMail;
    }

    public void setSecondMail(String secondMail) {
        this.secondMail = secondMail;
    }

    public String getThirdMail() {
        return thirdMail;
    }

    public void setThirdMail(String thirdMail) {
        this.thirdMail = thirdMail;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMailAddress() {
        return mailAddress;
    }

    public void setMailAddress(String mailAddress) {
        this.mailAddress = mailAddress;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getTutorType() {
        return tutorType;
    }

    public void setTutorType(String tutorType) {
        this.tutorType = tutorType;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public Degrees getDegree() {
        return degree;
    }

    public void setDegree(Degrees degree) {
        this.degree = degree;
    }

    public Workexprience getWork() {
        return work;
    }

    public void setWork(Workexprience work) {
        this.work = work;
    }

    public Parttimejob getJob() {
        return job;
    }

    public void setJob(Parttimejob job) {
        this.job = job;
    }

    public Honor getHonor() {
        return honor;
    }

    public void setHonor(Honor honor) {
        this.honor = honor;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    
    
    public TeacherManageDao getTeacherManageDao() {
        return teacherManageDao;
    }

    public void setTeacherManageDao(TeacherManageDao teacherManageDao) {
        this.teacherManageDao = teacherManageDao;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
    
    
    
    public String teacherCheck(){
        String page = "fail";
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("loginUser");
        String teacherId = user.getUserId();
        teacher = teacherManageDao.findTeacher(teacherId);
        if(teacher != null){
            page = "success";
            if(session.getAttribute("loginTeacher") != null){
                session.removeAttribute("loginTeacher");
            }
            session.setAttribute("loginTeacher", teacher);
        }
       return page;
    }
   
    public String updateUserOwnInfo(){
       String page = "fail";
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            teacher = (Teacher)session.getAttribute("loginTeacher");
            if(teacher == null){
                System.out.println("Teacher is null!");
                return addTeacherOwnInfo();
            }else{
            System.out.println("##########################");
            System.out.println("##########################");
            System.out.println(teacher.getHometown());
            teacher.setBirthdate(birthdate);
            teacher.setDirection(direction);
            teacher.setFirstMail(firstMail);
            teacher.setHometown(hometown);
            teacher.setIdentity(identity);
            teacher.setMailAddress(mailAddress);
            teacher.setMobile(mobile);
            teacher.setNation(nation);
            teacher.setPolity(polity);
            teacher.setPost(post);
            teacher.setPostcode(postcode);
            teacher.setSecondMail(secondMail);
            teacher.setTechPost(techPost);
            teacher.setTelephone(telephone);
            teacher.setThirdMail(thirdMail);
            teacher.setTutorType(tutorType);
            teacher.setWorkAddress(workAddress);
            int i = teacherManageDao.updateTeacherInfo(teacher);
            System.out.println("##########################");
            if(i>0){
                page ="success";
            }
            }
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return page;
    }
    
    public String addTeacherOwnInfo(){
        String page = "fail";
        try{
             HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User u = (User)session.getAttribute("loginUser");
        teacherId = u.getUserId();
        System.out.println(teacherId);
            System.out.println("##########################");
            System.out.println("##########################");
            Teacher teacher = new Teacher();
            teacher.setTeacherId(teacherId);
            teacher.setBirthdate(birthdate);
            teacher.setDirection(direction);
            teacher.setFirstMail(firstMail);
            teacher.setHometown(hometown);
            teacher.setIdentity(identity);
            teacher.setMailAddress(mailAddress);
            teacher.setMobile(mobile);
            teacher.setNation(nation);
            teacher.setPolity(polity);
            teacher.setPost(post);
            teacher.setPostcode(postcode);
            teacher.setSecondMail(secondMail);
            teacher.setTechPost(techPost);
            teacher.setTelephone(telephone);
            teacher.setThirdMail(thirdMail);
            teacher.setTutorType(tutorType);
            teacher.setWorkAddress(workAddress);
            int i = teacherManageDao.addTeacherInfo(teacher);
            System.out.println("##########################");
            if(i>0){
                page ="success";
            }
         
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return page;
    }
    
    public void findHonorsByTeacherId(){
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
        Map request=(Map) ActionContext.getContext().get("request");
        request.put("listHonor", findHonorssByTeacherId());
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
    }
    
    public List<Honor> findHonorssByTeacherId() {
         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Teacher tech = (Teacher) session.getAttribute("loginTeacher");
        String teacherId = tech.getTeacherId();
         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$"+teacherId);
        return teacherManageDao.findHonorsByTeacherId(teacherId); 
    }
    
    public String addNewHonor(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("loginUser");
        String teacherId = u.getUserId();
        honor.setTeacherId(teacherId);
        try{
            teacherManageDao.addHonor(honor);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    
    public String updatePHonor() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            System.out.println("selected id is"+honor.getHonorNo());
            int honorNo = honor.getHonorNo();
            honor=teacherManageDao.findHonor(honorNo);
            session.setAttribute("Honor", honor);
            session.setAttribute("HonorNo", honor.getHonorNo());
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public String updateHonor() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            User u = (User)session.getAttribute("loginUser");
            String hNo = session.getAttribute("HonorNo").toString();
            int n = Integer.parseInt(hNo);
            String teId = u.getUserId();
            System.out.println(teId);
            honor.setTeacherId(teId);
            honor.setHonorNo(n);
            System.out.println("********************dapUpdateHono***********r");
            System.out.println(honor.getHonorNo());
            int b=Integer.parseInt(batch);
            honor.setBatch(b);
            teacherManageDao.updateHonorInfor(honor);
            System.out.println("##########################");
            session.setAttribute("DONE", "YES");
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    @SuppressWarnings("unchecked")
    public String removeHonor() throws Exception {
        try{
            System.out.println("removeAction");
            int honorNo = honor.getHonorNo();
            System.out.println(honorNo);
            teacherManageDao.removeHonor(honorNo);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public void findPartJobsByTeacherId(){
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
        Map request=(Map) ActionContext.getContext().get("request");
        request.put("listJob", findPartJobssByTeacherId());
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
    }
    
    public List<Parttimejob> findPartJobssByTeacherId() {
         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Teacher tech = (Teacher) session.getAttribute("loginTeacher");
        String teacherId = tech.getTeacherId();
         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$"+teacherId);
        return teacherManageDao.findPartJobssByTeacherId(teacherId); 
    }
    
    public String addNewJob(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("loginUser");
        String teacherId = u.getUserId();
        job.setTeacherId(teacherId);
        try{
            teacherManageDao.addJob(job);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
     @SuppressWarnings("unchecked")
    public String removeJob() throws Exception {
        try{
            System.out.println("removeAction");
            int jobNo = job.getJobNo();
            System.out.println(jobNo);
            teacherManageDao.removeJob(jobNo);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
     public String updatePJob() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            System.out.println("selected id is"+job.getJobNo());
            int jobNo = job.getJobNo();
            job=teacherManageDao.findJob(jobNo);
            session.setAttribute("Job", job);
            session.setAttribute("JobNo", job.getJobNo());
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public String updateJob() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            User u = (User)session.getAttribute("loginUser");
            String jNo = session.getAttribute("JobNo").toString();
            int j = Integer.parseInt(jNo);
            String teId = u.getUserId();
            System.out.println(teId);
            job.setTeacherId(teId);
            job.setJobNo(j);
            System.out.println("********************dapUpdateHono***********r");
            System.out.println(job.getJobNo());
            teacherManageDao.updateJobInfor(job);
            System.out.println("##########################");
            session.setAttribute("DONE", "YES");
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public void findWorksByTeacherId(){
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
        Map request=(Map) ActionContext.getContext().get("request");
        request.put("listWorks", findWorkssByTeacherId());
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
    }
    
    public List<Workexprience> findWorkssByTeacherId() {
         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Teacher tech = (Teacher) session.getAttribute("loginTeacher");
        String teacherId = tech.getTeacherId();
         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$"+teacherId);
        return teacherManageDao.findWorkssByTeacherId(teacherId); 
    }
    
    public String addNewWork(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("loginUser");
        String teacherId = u.getUserId();
        work.setTeacherId(teacherId);
        try{
            teacherManageDao.addWork(work);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    @SuppressWarnings("unchecked")
    public String removeWork() throws Exception {
        try{
            System.out.println("removeAction");
            int workNo = work.getWorkNo();
            System.out.println(workNo);
            teacherManageDao.removeWork(workNo);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public String updatePWork() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            System.out.println("selected id is"+work.getWorkNo());
            int workNo = work.getWorkNo();
            work=teacherManageDao.findWork(workNo);
            session.setAttribute("Work", work);
            session.setAttribute("WorkNo", work.getWorkNo());
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public String updateWork() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            User u = (User)session.getAttribute("loginUser");
            String wNo = session.getAttribute("WorkNo").toString();
            int w = Integer.parseInt(wNo);
            String teId = u.getUserId();
            System.out.println(teId);
            work.setTeacherId(teId);
            work.setWorkNo(w);
            System.out.println("********************dapUpdateHono***********r");
            System.out.println(work.getWorkNo());
            teacherManageDao.updateWorkInfor(work);
            System.out.println("##########################");
            session.setAttribute("DONE", "YES");
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
     public void findDegreesByTeacherId(){
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
        Map request=(Map) ActionContext.getContext().get("request");
        request.put("listDegree", findDegreessByTeacherId());
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
    }
    
    public List<Degrees> findDegreessByTeacherId() {
         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Teacher tech = (Teacher) session.getAttribute("loginTeacher");
        String teacherId = tech.getTeacherId();
         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$"+teacherId);
        return teacherManageDao.findDegreessByTeacherId(teacherId); 
    }
    
    public String addNewDegree(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("loginUser");
        String teacherId = u.getUserId();
        degree.setTeacherId(teacherId);
        try{
            teacherManageDao.addDegree(degree);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    @SuppressWarnings("unchecked")
    public String removeDegree() throws Exception {
        try{
            System.out.println("removeAction");
            int degreeNo = degree.getDegreeNo();
            System.out.println(degreeNo);
            teacherManageDao.removeDegree(degreeNo);
        }catch(Exception err){
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public String updatePDegree() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            System.out.println("selected id is"+degree.getDegreeNo());
            int degreeNo = degree.getDegreeNo();
            degree=teacherManageDao.findDegree(degreeNo);
            session.setAttribute("Degree", degree);
            session.setAttribute("DegreeNo", degree.getDegreeNo());
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public String updateDegree() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            User u = (User)session.getAttribute("loginUser");
            String dNo = session.getAttribute("DegreeNo").toString();
            int d = Integer.parseInt(dNo);
            String teId = u.getUserId();
            System.out.println(teId);
            degree.setTeacherId(teId);
            degree.setDegreeNo(d);
            System.out.println("********************dapUpdateHono***********r");
            teacherManageDao.updateDegreeInfor(degree);
            System.out.println("##########################");
            session.setAttribute("DONE", "YES");
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }
    
    public void reportP(){
        Map request=(Map) ActionContext.getContext().get("request");
        request.put("listPaper", findPapersByTeacherId());
        }
    
    
    public List<Paper> findPapersByTeacherId() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("loginUser");
        if(u == null){
            System.out.println("!!!!!!!!!!!!!!!!session is null!!!!!!!!!!!!11");
        }
        String uid = u.getUserId();
        System.out.println("userId is " + uid);
    //    String teaId = tech.getTeacherId();
        return teacherManageDao.findPapersByAuthorID(uid); 
    }
    
    public String report(){
        HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            session.setAttribute("Paper", teacherManageDao.findPaperByPaperId(paperId));
            Paper p = (Paper)session.getAttribute("Paper");
            if(p.getPeriodicalC()!=null){
                session.setAttribute("qiKan", "have");
            }else
            {
                session.setAttribute("qiKan", "none");
            }
            if(p.getTypeOne()=="国际"){
                session.setAttribute("typeOne", "guoji");
            }else{
                session.setAttribute("typeOne", "guonei");
            }
            
            Author o =null;
           List<Author> au =  getAuthors();
           for(int i =0;i<au.size();i++){
               o = au.get(i);
               if(o.getRanking()==1){
                   session.setAttribute("One", "have");
                   session.setAttribute("AuthorOneName", o.getAuthorName());
                   session.setAttribute("AuthorOneOrganization", o.getOrganization());
                   session.setAttribute("AuthorOnePost", o.getPost());
               }
               if(o.getRanking()==2){
                   session.setAttribute("One", "have");
                   session.setAttribute("Two", "have");
                   session.setAttribute("AuthorTwoName", o.getAuthorName());
                   session.setAttribute("AuthorTwoOrganization", o.getOrganization());
                   session.setAttribute("AuthorTwoPost", o.getPost());
               }
               if(o.getRanking()==3){
                   session.setAttribute("One", "have");
                   session.setAttribute("Two", "have");
                   session.setAttribute("Three", "have");
                   session.setAttribute("AuthorThreeName", o.getAuthorName());
                   session.setAttribute("AuthorThreeOrganization", o.getOrganization());
                   session.setAttribute("AuthorThreePost", o.getPost());
               }
               if(o.getRanking()==4){
                   session.setAttribute("One", "have");
                   session.setAttribute("Two", "have");
                   session.setAttribute("Three", "have");
                   session.setAttribute("Four", "have");
                   session.setAttribute("AuthorFourName", o.getAuthorName());
                   session.setAttribute("AuthorFourOrganization", o.getOrganization());
                   session.setAttribute("AuthorFourPost", o.getPost());
               }
           }
            return SUCCESS;
    }
    
     public List<Author> getAuthors(){
         Map request=(Map) ActionContext.getContext().get("request");
        request.put("listAuthor", teacherManageDao.findAuthorsByPaperId(paperId));
        List<Author> au =(List<Author>) request.get("listAuthor");
        return au;
     }
     
     
      private Configuration configuration = null;
      
      
     public void saveAsWord(){
  
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
File outFile = new File("F:/temp/outFile.docx");
 Writer out = null; 
try {
 out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream (outFile))); 
 if(out!=null){
     System.out.println("777777777777777777777777777777777");
 }else{
     System.out.println("77777777777777777777777777777777888888888888887");
 }
} catch (FileNotFoundException e1) { 
e1.printStackTrace();
 } 
try {
 t.process(dataMap, out); 
 out.close();
} catch (TemplateException e) {
    System.out.println("template  ***********************");
 e.printStackTrace(); 
} catch (IOException e) { 
     System.out.println("template%%%%%%%%%%%%"
             + "  ***********************");
e.printStackTrace(); 
}
System.out.println("OK!!!!!!!!!!!!!!!!!!!!!!!!");
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




public String findTsbelongByTeacherId(){
        String page = "fail";
        Tsbelong ts = new Tsbelong();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
         Teacher tech = (Teacher) session.getAttribute("loginTeacher");
        String teacherId = tech.getTeacherId();
         System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$"+teacherId);
       ts =  teacherManageDao.findTsbelongByTeacherId(teacherId);
        if(ts != null){
            page = "success";
            if(session.getAttribute("ts") != null){
                session.removeAttribute("ts");
            }
            session.setAttribute("ts", ts);
        }
        return page;
    }

 public String updateTsbelong() {
        try{
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            User u = (User)session.getAttribute("loginUser");
            String tid = u.getUserId();
            tsbelong.setTeacherId(tid);
            teacherManageDao.updateTsbelongInfor(tsbelong);
            System.out.println("##########################");
            session.setAttribute("DONE", "YES");
        }catch(Exception err){
            System.out.println("has Exception");
            System.out.println(err.getMessage());
        }
        return SUCCESS;
    }


}
