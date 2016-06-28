<%-- 
    Document   : lishuiframe
    Created on : 2013-12-22, 15:01:48
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>NJUST | 隶属信息</title>

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

	<link rel="shortcut icon" href="../media/image/favicon.ico" />
        
    <link href="../media/css/bootstrap-fileupload.css" rel="stylesheet" type="text/css" />
    
    <link href="../media/css/chosen.css" rel="stylesheet" type="text/css" />

	<link href="../media/css/profile.css" rel="stylesheet" type="text/css" />


</head>

<body>
    
      <!--             确定已登录         -->
   <% if( session.getAttribute("loginUser")==null && session.getAttribute("loginManager")==null ) { %>

        <script>
             alert("您尚未登录，请先登录！");
             window.location="../firstJsp/userLogin.jsp";
           </script>
           
           <%  }%>
             
    <s:if test="%{#session.loginUser == null && #session.loginManager != null}">
         <script>
           
             alert("您现在是管理员身份，若想操作该模块请以用户身份登录！");
             window.location="zhuyeiframe.jsp";
         </script>
     </s:if>
    
    <% if(session.getAttribute("loginTeacher")==null){%>
     <s:action name="teacherCheckAction" namespace="/"></s:action>
     <%}%>
     
     <s:action name="findTsbelongByTeacherIdAction" namespace="/"></s:action>


  <div>

  <div>
      
      <div class="container-fluid">

				<div class="row-fluid">

					<div class="span12">

						<ul class="breadcrumb">

						  <li>

								<i class="icon-home"></i>

								<a href="index.html">NJUST</a> 

								<span class="icon-angle-right"></span>

							</li>

							<li>

								<a href="#">个人信息</a>

								<span class="icon-angle-right"></span>

							</li>

							<li><a href="#">隶属信息</a></li>

						</ul>

					</div>

				</div>
          
				<div class="row-fluid">

					<div class="span12">

						<div class="tabbable tabbable-custom boxless">

							<ul class="nav nav-tabs">
                                <li><a href="#tab_1_2" data-toggle="tab">隶属信息</a></li>

							</ul>

							<div class="tab-content">
                                
                                <div class="tab-pane profile-classic row-fluid active" id="tab_1_2">

									<div class="span2"><img src="../media/image/mm.jpg" alt="" /> <a href="xiugaitouxiangiframe.jsp" class="profile-edit" >edit</a></div>

									<ul class="unstyled span10">

										<li><span>用户名:</span> <s:label name="teacherName" value="%{#session.loginUser.userId}" theme="simple"></s:label></li>

										<li><span>姓名:</span> <s:property value="#session.loginUser.userName"/></li>

										<li><span>隶属主一级学科:</span><s:property value="#session.ts.mainFirst"/></li>

										<li><span>隶属主二级学科1:</span> <s:property value="#session.ts.mainSecOne"/></li>

										<li><span>隶属主二级学科2:</span><s:property value="#session.ts.mainSecTwo"/></li>

										<li><span>隶属次一级学科:</span> <s:property value="#session.ts.nextFirst"/></li>

										<li><span>隶属次二级学科1:</span><s:property value="#session.ts.nextSecOne"/></li>

										<li><span>隶属次二级学科2:</span><s:property value="#session.ts.nextSecTwo"/></li>
									
									</ul>
                                    <div class="form-actions">

                                        <a href="xiugailishuxinxiframe.jsp"><button type="submit" class="btn blue"><i class="icon-pencil"></i> 修改</button></a>


								  </div>

								</div>

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
    
    <script type="text/javascript" src="../media/js/bootstrap-fileupload.js"></script>

	<script type="text/javascript" src="../media/js/chosen.jquery.min.js"></script>


	<script src="../media/js/app.js"></script>

	<script src="../media/js/form-samples.js"></script>   

	<script>

		jQuery(document).ready(function() {    

		   App.init();

		   FormSamples.init();

		});

	</script>


</html>
