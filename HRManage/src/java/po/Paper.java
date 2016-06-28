package po;
// Generated 2013-12-21 21:53:49 by Hibernate Tools 3.6.0


import java.util.Date;

/**
 * Paper generated by hbm2java
 */
public class Paper  implements java.io.Serializable {


     private String paperNo;
     private String authorId;
     private String paperId;
     private String nameE;
     private String nameC;
     private String paperType;
     private String periodicalE;
     private String periodicalC;
     private String meetingE;
     private String mertingC;
     private String typeOne;
     private String typeTwo;
     private String issnIsbn;
     private String cn;
     private Date publicTime;
     private Integer reel;
     private Integer issue;
     private Integer startP;
     private Integer overP;
     private String location;
     private String organization;
     private String description;
     private int selfNo;
     private int otherNo;
     private Character esi;
     private String state;
     private String accesory;

    public Paper() {
    }

	
    public Paper(String paperNo, String authorId, String paperId, String nameE, String nameC, String paperType, Date publicTime, int selfNo, int otherNo) {
        this.paperNo = paperNo;
        this.authorId = authorId;
        this.paperId = paperId;
        this.nameE = nameE;
        this.nameC = nameC;
        this.paperType = paperType;
        this.publicTime = publicTime;
        this.selfNo = selfNo;
        this.otherNo = otherNo;
    }
    public Paper(String paperNo, String authorId, String paperId, String nameE, String nameC, String paperType, String periodicalE, String periodicalC, String meetingE, String mertingC, String typeOne, String typeTwo, String issnIsbn, String cn, Date publicTime, Integer reel, Integer issue, Integer startP, Integer overP, String location, String organization, String description, int selfNo, int otherNo, Character esi, String state, String accesory) {
       this.paperNo = paperNo;
       this.authorId = authorId;
       this.paperId = paperId;
       this.nameE = nameE;
       this.nameC = nameC;
       this.paperType = paperType;
       this.periodicalE = periodicalE;
       this.periodicalC = periodicalC;
       this.meetingE = meetingE;
       this.mertingC = mertingC;
       this.typeOne = typeOne;
       this.typeTwo = typeTwo;
       this.issnIsbn = issnIsbn;
       this.cn = cn;
       this.publicTime = publicTime;
       this.reel = reel;
       this.issue = issue;
       this.startP = startP;
       this.overP = overP;
       this.location = location;
       this.organization = organization;
       this.description = description;
       this.selfNo = selfNo;
       this.otherNo = otherNo;
       this.esi = esi;
       this.state = state;
       this.accesory = accesory;
    }
   
    public String getPaperNo() {
        return this.paperNo;
    }
    
    public void setPaperNo(String paperNo) {
        this.paperNo = paperNo;
    }
    public String getAuthorId() {
        return this.authorId;
    }
    
    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }
    public String getPaperId() {
        return this.paperId;
    }
    
    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }
    public String getNameE() {
        return this.nameE;
    }
    
    public void setNameE(String nameE) {
        this.nameE = nameE;
    }
    public String getNameC() {
        return this.nameC;
    }
    
    public void setNameC(String nameC) {
        this.nameC = nameC;
    }
    public String getPaperType() {
        return this.paperType;
    }
    
    public void setPaperType(String paperType) {
        this.paperType = paperType;
    }
    public String getPeriodicalE() {
        return this.periodicalE;
    }
    
    public void setPeriodicalE(String periodicalE) {
        this.periodicalE = periodicalE;
    }
    public String getPeriodicalC() {
        return this.periodicalC;
    }
    
    public void setPeriodicalC(String periodicalC) {
        this.periodicalC = periodicalC;
    }
    public String getMeetingE() {
        return this.meetingE;
    }
    
    public void setMeetingE(String meetingE) {
        this.meetingE = meetingE;
    }
    public String getMertingC() {
        return this.mertingC;
    }
    
    public void setMertingC(String mertingC) {
        this.mertingC = mertingC;
    }
    public String getTypeOne() {
        return this.typeOne;
    }
    
    public void setTypeOne(String typeOne) {
        this.typeOne = typeOne;
    }
    public String getTypeTwo() {
        return this.typeTwo;
    }
    
    public void setTypeTwo(String typeTwo) {
        this.typeTwo = typeTwo;
    }
    public String getIssnIsbn() {
        return this.issnIsbn;
    }
    
    public void setIssnIsbn(String issnIsbn) {
        this.issnIsbn = issnIsbn;
    }
    public String getCn() {
        return this.cn;
    }
    
    public void setCn(String cn) {
        this.cn = cn;
    }
    public Date getPublicTime() {
        return this.publicTime;
    }
    
    public void setPublicTime(Date publicTime) {
        this.publicTime = publicTime;
    }
    public Integer getReel() {
        return this.reel;
    }
    
    public void setReel(Integer reel) {
        this.reel = reel;
    }
    public Integer getIssue() {
        return this.issue;
    }
    
    public void setIssue(Integer issue) {
        this.issue = issue;
    }
    public Integer getStartP() {
        return this.startP;
    }
    
    public void setStartP(Integer startP) {
        this.startP = startP;
    }
    public Integer getOverP() {
        return this.overP;
    }
    
    public void setOverP(Integer overP) {
        this.overP = overP;
    }
    public String getLocation() {
        return this.location;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }
    public String getOrganization() {
        return this.organization;
    }
    
    public void setOrganization(String organization) {
        this.organization = organization;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public int getSelfNo() {
        return this.selfNo;
    }
    
    public void setSelfNo(int selfNo) {
        this.selfNo = selfNo;
    }
    public int getOtherNo() {
        return this.otherNo;
    }
    
    public void setOtherNo(int otherNo) {
        this.otherNo = otherNo;
    }
    public Character getEsi() {
        return this.esi;
    }
    
    public void setEsi(Character esi) {
        this.esi = esi;
    }
    public String getState() {
        return this.state;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    public String getAccesory() {
        return this.accesory;
    }
    
    public void setAccesory(String accesory) {
        this.accesory = accesory;
    }




}

