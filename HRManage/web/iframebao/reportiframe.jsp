<%-- 
    Document   : reportiframe
    Created on : 2013-12-13, 14:37:06
    Author     : Administrator
--%>

<%@page import="po.Paper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->
<head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<meta charset="utf-8" />

	<title>NJUST | 学术论文奖励申报表</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<link href="../media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="../media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<link rel="stylesheet" type="text/css" href="../media/css/select2_metro.css" />

	<link rel="stylesheet" href="../media/css/DT_bootstrap.css" />

	<link rel="shortcut icon" href="../media/image/favicon.ico" />

</head>

<body class="page-header-fixed">
    
       <!--             确定已登录         -->
   <% if( session.getAttribute("loginUser")==null && session.getAttribute("loginManager")==null ) { %>

        <script>
             alert("您尚未登录，请先登录！");
              window.location="../firstJsp/userLogin.jsp";
           </script>
           
           <%  }%>

    
    <% if(session.getAttribute("loginTeacher")==null){%>
     <s:action name="teacherCheckAction" namespace="/"></s:action>
     <%}%>

  <div class="page-container row-fluid">

  <div>

			<div class="container-fluid">

				<div class="row-fluid">

					<div class="span12">
                                                
						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="index.html">NJUST</a> 

								<i class="icon-angle-right"></i>

							</li>

							<li>

								<a href="#">个人信息</a>

								<i class="icon-angle-right"></i>

							</li>

							<li><a href="#">学术论文奖励申报表</a></li>

						</ul>

					</div>

				</div>
                            
				<div class="row-fluid">

					<div class="span12">

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-edit"></i>Paper  Table</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>

									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

					    <div class="portlet-body">

								<div class="clearfix">
								  <div class="btn-group pull-right">

									  <button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="icon-angle-down"></i>

									</button>

										<ul class="dropdown-menu pull-right">

                                                                                        <li><s:a href="saveAsWordAction.action" namespace="/">Save as Word</s:a></li>

										</ul>

								  </div>

							  </div>

                                       
                                   
                                     
                            
                                                                                        
                                                                                        <div align="center">                                   
<table width="70%" border="0" cellspacing="0" cellpadding="0">
   <tr>
       <td width="407" align="center"><strong>南京理工大学术论文奖励申报表</strong></td>
   </tr>
   <tr>
       <td align="right"><strong>校内编号：<s:label name="paperId" value="%{#session.Paper.paperId}" theme="simple"></s:label></strong></td>
   </tr>
</table>
<table width="70%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="120">论文题目</td>
    <td width="120" height="36" align="center">中文</td>
    <td><s:label name="nameC" value="%{#session.Paper.NameC}" theme="simple"></s:label></td>
  </tr>
  <tr>
    <td width="120" height="38" align="center">英文</td>
    <td><s:label name="nameE" value="%{#session.Paper.NameE}" theme="simple"></s:label></td>
  </tr>
</table>
<table width="70%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="3" align="center" width="120">&nbsp;申 <br />报<br />人</td>
    <td width="120" height="33" align="center">姓名</td>
    <td width="200"><s:label name="userName" value="%{#session.loginUser.UserName}" theme="simple"></s:label></td>
    <td width="120" align="center">签名</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="120" height="32" align="center">单位</td>
    <td width="200">南京理工大学<s:label label="college" value="%{#session.loginUser.College}" theme="simple"></s:label>学院</td>
    <td width="120" align="center">电话</td>
    <td><s:label label="telephone" value="%{#session.loginTeacher.telephone}" theme="simple"></s:label></td>
  </tr>
  <tr>
    <td height="32"><p align="center">校内工资号</p></td>
    <td colspan="3"><s:label name="teacherId" value="%{#session.loginUser.userId}" theme="simple"></s:label></td>
    </tr>
</table>
<table width="70%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="5" width="120"><p align="center">论文 作者</p>
      <p align="center">(请从第一作者填起)</p></td>
    <td width="100" height="32" align="center">姓名</td>
    <td width="250" align="center">单位</td>
    <td align="center">职别</td>
  </tr>
  <tr>
      <td height="33"><s:label name="authorOneName" value="%{#session.AuthorOneName}" theme="simple"></s:label></td>
    <td><s:label name="authorOneOrganization" value="%{#session.AuthorOneOrganization}" theme="simple"></s:label></td>
    <td align="center">
    <% 
  if(session.getAttribute("One").equals("have")){
if(session.getAttribute("AuthorOnePost").equals("教师"))  {%>
        教师（ √）、研究生（ ）
        <%}else{%>
        教师（ ）、研究生（√ ）
        <%}
  }else{%>
    <%}%></td>
  </tr>
  <tr>
   <td height="33"><s:label name="authorTwoName" value="%{#session.AuthorTwoName}" theme="simple"></s:label></td>
    <td><s:label name="authorTwoOrganization" value="%{#session.AuthorTwoOrganization}" theme="simple"></s:label></td>
    <td align="center">
    <% 
  if(session.getAttribute("Two").equals("have")){
if(session.getAttribute("AuthorTwoPost").equals("教师"))  {%>
        教师（ √）、研究生（ ）
        <%}else{%>
        教师（ ）、研究生（√ ）
        <%}
  }else{%>
    <%}%></td>
  </tr>
  <tr>
   <td height="33"><s:label name="authorThreeName" value="%{#session.AuthorThreeName}" theme="simple"></s:label></td>
    <td><s:label name="authorThreeOrganization" value="%{#session.AuthorThreeOrganization}" theme="simple"></s:label></td>
    <td align="center">
    <%
  if(session.getAttribute("Three").equals("have")){
if(session.getAttribute("AuthorThreePost").equals("教师"))  {%>
        教师（ √）、研究生（ ）
        <%}else{%>
        教师（ ）、研究生（√ ）
        <%}
  }else{%>
    <%}%></td>
  </tr>
  <tr>
   <td height="33"><s:label name="authorFourName" value="%{#session.AuthorFourName}" theme="simple"></s:label></td>
    <td><s:label name="authorFourOrganization" value="%{#session.AuthorFourOrganization}" theme="simple"></s:label></td>
    <td align="center">
    <%
 if(session.getAttribute("Four").equals("have")){ 
if(session.getAttribute("AuthorFourPost").equals("教师"))  {%>
        教师（ √）、研究生（ ）
        <%}else{%>
        教师（ ）、研究生（√ ）
        <%}
 }else{%>
    <%}%></td>
  </tr>
</table>
<table width="70%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="5" width="80"><p>论</p>
      <p>文</p></td>
    <td rowspan="2" width="120">刊物名称</td>
    <td width="120"><p align="center">中文</p></td>
    <td height="36"><s:label name="periodicalC" value="%{#session.Paper.PeriodicalC}" theme="simple"></s:label></td>
    <td rowspan="2" width="120">
    
    <% if(session.getAttribute("qiKan").equals("have")){
        
        if(session.getAttribute("typeOne").equals("guoji") ){
        %>
        
        <p>国际刊物（√ ） </p>
国内刊物（&nbsp;&nbsp;  ）
    <%}else{%>
    
    <p>国际刊物（ ） </p>
国内刊物（ √ ）
<%}
    }else{%>
    <p>国际刊物（ ） </p>
国内刊物（  ）
<%}%>
    </td>
  </tr>
  <tr>
    <td width="120"><p align="center">英文</p></td>
    <td height="36"><s:label name="periodicalE" value="%{#session.Paper.PeriodicalE}" theme="simple"></s:label></td>
    </tr>
  <tr>
    <td rowspan="2">会议名称</td>
    <td><p align="center">中文</p></td>
    <td height="36"><s:label name="meetC" value="%{#session.Paper.meetingC}" theme="simple"></s:label></td>
  <td rowspan="2"> <% if(session.getAttribute("qiKan").equals("none")){
        
        if(session.getAttribute("typeOne").equals("guoji")){
        %>
        
        <p>国际会议（√ ） </p>
国内会议（&nbsp;&nbsp;  ）
    <%}else{%>
    
    <p>国际会议（ ） </p>
国内会议（ √ ）
<%}
    }else{%>
    <p>国际会议（ ） </p>
国内会议（  ）
<%}%></td>
  </tr>
  <tr>
    <td><p align="center">英文</p></td>
    <td height="36"><s:label name="meetE" value="%{#session.Paper.meetingE}" theme="simple"></s:label></td>
    </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td height="35" align="center">发表时间</td>
    <td colspan="3" align="right"><u>  </u>年<u> </u>月<u><s:label value="%{#session.Paper.Reel}" theme="simple"/></u>卷<u><s:label value="%{#session.Paper.Issue}" theme="simple"/>   </u>期，
  自<u> <s:label name="startP" value="%{#session.Paper.StartP}" theme="simple"/></u>页至<u> <s:label name="overP" value="%{#session.Paper.OverP}" theme="simple"/></u>页。</td>
    </tr>
</table>
<table width="70%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td><p>院（系）审核意见： </p>
      <p>&nbsp;</p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;盖章：</td>
  </tr>
</table>
<table width="70%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td><p>科技处审定意见：</p>
      <p><br />
      </p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;盖章：&nbsp;&nbsp;年 &nbsp;&nbsp;月  &nbsp;&nbsp;日</td>
  </tr>
</table>
                                                                                        </div>
                                            </div>	
                                        </div>
                                </div>
  </div>
                        </div>			

		</div>

	</div>


<script src="../media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="../media/js/bootstrap.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="../media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery.uniform.min.js" type="text/javascript" ></script>

	<script type="text/javascript" src="../media/js/select2.min.js"></script>

	<script type="text/javascript" src="../media/js/jquery.dataTables.js"></script>

	<script type="text/javascript" src="../media/js/DT_bootstrap.js"></script>

	<script src="../media/js/app.js"></script>

	<script src="../media/js/table-editable.js"></script>    

	<script>

		jQuery(document).ready(function() {       

		   App.init();

		   TableEditable.init();

		});

	</script>


</html>