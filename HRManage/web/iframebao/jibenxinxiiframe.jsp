<%-- 
    Document   : jibenxinxiiframe
    Created on : 2013-12-22, 15:01:17
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>NJUST | 用户基本信息</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
        
        <script language="javascript" type="text/javascript" src="../SpryAssets/My97DatePicker/WdatePicker.js"></script>

	<link href="../media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="../media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<link rel="stylesheet" type="text/css" href="../media/css/select2_metro.css" />
        
         <link href="../media/css/bootstrap-fileupload.css" rel="stylesheet" type="text/css" />
    
    <link href="../media/css/chosen.css" rel="stylesheet" type="text/css" />

	<link href="../media/css/profile.css" rel="stylesheet" type="text/css" />

	<link rel="shortcut icon" href="../media/image/favicon.ico" />
        
         <script language="javascript" type="text/javascript" src="../SpryAssets/My97DatePicker/WdatePicker.js"></script>

</head>

<body>
    
       <!--             确定已登录         -->
   <% if( session.getAttribute("loginUser")==null && session.getAttribute("loginManager")==null ) { %>

        <script>
             alert("您尚未登录，请先登录！");
             window.location="../firstJsp/userLogin.jsp";
           </script>
           
           <%  }%>
    <!--    
    
        确认以用户身份登录
    
    -->
    
    <s:if test="%{#session.loginUser == null && #session.loginManager != null}">
         <script>
            
             alert("您现在是管理员身份，若想操作该模块请以用户身份登录！");
             window.location="zhuyeiframe.jsp";
         </script>
     </s:if>
         
         
         <!--    
         
            查找用户基本信息
         
         -->
    
         <% 
             if(session.getAttribute("loginTeacher")!= null){
    session.removeAttribute("loginTeacher");
             }%>
     <s:action name="teacherCheckAction" namespace="/"></s:action>

  <div>

  <div>

			<div class="container-fluid">

				<div class="row-fluid">

					<div class="span12">


						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="../firstJsp/index.jsp">NJUST</a> 

								<span class="icon-angle-right"></span>

							</li>

							<li>

								<a href="#">个人信息</a>

								<span class="icon-angle-right"></span>

							</li>

							<li><a href="#">基本信息</a></li>

						</ul>

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">

					<div class="span12">

						<div class="tabbable tabbable-custom boxless">

							<ul class="nav nav-tabs">

								<li><a href="#tab_1" data-toggle="tab">修改基本信息</a></li>

								<li class="active"><a href="#tab_2" data-toggle="tab">查看基本信息</a></li>
                                                              

							</ul>

							<div class="tab-content">

								<div class="tab-pane " id="tab_1">

									<div class="portlet box blue">

										<div class="portlet-title">

											<div class="caption"><i class="icon-reorder"></i>Update Person Info</div>

											<div class="tools">

												<a href="javascript:;" class="collapse"></a>
                                                                                                
												<a href="javascript:;" class="reload"></a>

												<a href="javascript:;" class="remove"></a>

											</div>

										</div>

										<div class="portlet-body form">

                                                                                        <form action="updateUserOwnInfoAction" namespace="/" method="POST" >

												<h3 class="form-section">Person Info</h3>

												<div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" for="firstName">姓名：</label>

															<div class="controls">

																<s:label name="teacherName" value="%{#session.loginUser.userName}" theme="simple"></s:label>

														

															</div>

														</div>

													</div>

												

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" for="lastName">籍贯：</label>

															<div class="controls">

                                                                                                                        <s:textfield  id="hometown" class="m-wrap span12" placeholder="江苏" name="hometown"/>

					

															</div>

														</div>

													</div>

													

												</div>

												

												<div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >民族</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" id="nation" class="m-wrap span12" placeholder="汉" name="nation"/>

																
															</div>

														</div>

													</div>

													

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >出生年月：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12"  placeholder="yyyy//mm//dd" name="birthdate" onclick="WdatePicker()"/>

															</div>

														</div>

													</div>

												

												</div>

											    

												<div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >政治面貌：</label>

															<div class="controls">
                                                                                                                            
                                                                                                                            <s:select name="polity" list="{'群众','党员','团员','无党派人士'}" class="m-wrap span12"/>
            
                                                                                                                         
															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >身份证：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12" name="identity"/>

															</div>

														</div>

													</div>

													<!--/span-->

												</div>

												<!--/row--> 

												<h3 class="form-section">Address</h3>

												<div class="row-fluid">

													<div class="span12 ">

														<div class="control-group">

															<label class="control-label" >办公地址：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12"  name="workAddress"/>

															</div>

														</div>

													</div>

												</div>

												<div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >办公电话：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text"  class="m-wrap span12" name="telephone" placeholder="025-81111111"/> 

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >移动电话</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text"  class="m-wrap span12" name="mobile" placeholder="138-1111-1111"/> 

															</div>

														</div>

													</div>

													<!--/span-->

												</div>

												<!--/row-->           

												<div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >邮政编码：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12" name="postcode"/> 

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >通信地址：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12"  name="mailAddress" />

															</div>

														</div>

														</div>

													</div>

													<!--/span-->
                                                                                                        
                                                                                                        <h3 class="form-section">Polity</h3>
                                                                                                        
                                                                                                        <div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >行政职务：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12" name="post"/> 

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

                                                                                                                    <label class="control-label" >职称：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12"  name="techPost" placeholder="正科级" />

															</div>

														</div>

														</div>

													</div>
                                                                                                        
                                                                                                        <div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >研究方向：</label>

															<div class="controls">
                                                                                                                            
                                                                                                                             <s:select name="direction" list="{'智能计算','软件方法学','人工智能','网络安全'}" class="m-wrap span12"/>

                     

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >导师类型：</label>

															<div class="controls">
                                                                                                                            
                                                                                                                             <s:select name="tutorType" list="{'博士生导师','研究生导师'}" class="m-wrap span12"/>

                                                                                                                         

															</div>

														</div>

														</div>

													</div>
                                                                                                        
                                                                                                        <div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >邮件1：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12" name="firstMail" placeholder="****@***.com"/> 

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >邮件2：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12"  name="secondMail" placeholder="****@***.com"/>

															</div>

														</div>

														</div>

													</div>
                                                                                                        
                                                                                                        <div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >邮件3：</label>

															<div class="controls">

                                                                                                                            <s:textfield type="text" class="m-wrap span12" name="thirdMail" placeholder="****@***.com"/> 

															</div>

														</div>

													</div>

													<!--/span-->

											

													</div>

												

												<div class="form-actions">

													<button type="submit" class="btn blue"><i class="icon-ok"></i> Save</button>

													<button type="reset" class="btn">Cancel</button>

												</div>

											</form>

											

										</div>

									</div>

								</div>

								<div class="tab-pane active" id="tab_2">

									<div class="portlet box blue">

										<div class="portlet-title">

											<div class="caption"><i class="icon-reorder"></i>基本信息如下：</div>

											<div class="tools">

												<a href="javascript:;" class="collapse"></a>

												<a href="javascript:;" class="reload"></a>

												<a href="javascript:;" class="remove"></a>

											</div>

										</div>

										<div class="portlet-body form">

											<!-- BEGIN FORM-->

											<div class="form-horizontal form-view">
                                                                                            
												<h3 class="form-section">Person Info</h3>

												<div class="row-fluid">
                                                                                                    

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" for="firstName">姓名：</label>

															<div class="controls">

																<span class="text">
                                                                                                                                <s:property value="#session.loginUser.userName"/>
                                                                                                                                </span>

															</div>

														</div>

													</div>
                                                                                                                           
		

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" for="lastName">籍贯：</label>

															<div class="controls">

																<span class="text">
                                                                                                                                <s:property value="#session.loginTeacher.hometown"/>
                                                                                                                                </span>

															</div>

														</div>

													</div>

													<!--/span-->

												</div>

												<!--/row-->

												<div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >民族</label>

															<div class="controls">

                                                                                                                            <span class="text">
                                                                                                                                <s:property value="#session.loginTeacher.nation"/>
                                                                                                                            </span> 

															</div>

														</div>

													</div>

													

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >出生年月：</label>

															<div class="controls">

                                                                                                                            <span class="text">
                                                                                                                                
                                                                                                                                <s:property value="#session.loginTeacher.birthdate"/>
                                                                                                                            </span>

															</div>

														</div>

													</div>

													<!--/span-->

												</div>

												<!--/row-->        

												<div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >政治面貌：</label>

															<div class="controls">

                                                                                                                            <span class="text">
                                                                                                                                
                                                                                                                                <s:property value="#session.loginTeacher.polity"/>
                                                                                                                                
                                                                                                                            </span>

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >身份证：</label>

															<div class="controls">                                                

                                                                                                                            <span class="text">
                                                                                                                                
                                                                                                                                <s:property value="#session.loginTeacher.identity"/>
                                                                                                                                
                                                                                                                            </span>

															</div>

														</div>

													</div>

													<!--/span-->

												</div>

												<!--/row-->                

												<h3 class="form-section">Address</h3>

												<div class="row-fluid">

													<div class="span12 ">

														<div class="control-group">

															<label class="control-label" >办公地址:</label>

															<div class="controls">

																<span class="text"><s:property value="#session.loginTeacher.workAddress"/></span>

															</div>

														</div>

													</div>

												</div>

												<div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >办公电话:</label>

															<div class="controls">

																<span class="text"><s:property value="#session.loginTeacher.telephone"/></span>

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6">

														<div class="control-group">

															<label class="control-label" >移动电话:</label>

															<div class="controls">

																<span class="text"><s:property value="#session.loginTeacher.mobile"/></span>

															</div>

														</div>

													</div>

													<!--/span-->

												</div>

												<!--/row-->           

												<div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >邮政编码:</label>

															<div class="controls">

																<span class="text">
                                                                                                                                    
                                                                                                                                    <s:property value="#session.loginTeacher.postcode"/>
                                                                                                                                
                                                                                                                                
                                                                                                                                </span>

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >通信地址：</label>

															<div class="controls">

                                                                                                                            <span class="text">
                                                                                                                                
                                                                                                                                <s:property value="#session.loginTeacher.mailAddress"/>
                                                                                                                                
                                                                                                                            </span>

															</div>

														</div>

													</div>
                                                                                                                                
                                                                                                    

													<!--/span-->
												</div>
												

											
                                                                                                                                
                                                                                                    <h3 class="form-section">Polity</h3>
                                                                                        <div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >行政职务:</label>

															<div class="controls">

																<span class="text">
                                                                                                                                    
                                                                                                                                    <s:property value="#session.loginTeacher.post"/>
                                                                                                                                
                                                                                                                                
                                                                                                                                </span>

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >职称：</label>

															<div class="controls">

                                                                                                                            <span class="text">
                                                                                                                                
                                                                                                                                <s:property value="#session.loginTeacher.techPost"/>
                                                                                                                                
                                                                                                                            </span>

															</div>

														</div>

													</div>
                                                                                                                                
                                                                                                    

													<!--/span-->
												</div>
                                                                                                                                
                                                                                                                                <div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >研究方向:</label>

															<div class="controls">

																<span class="text">
                                                                                                                                    
                                                                                                                                    <s:property value="#session.loginTeacher.direction"/>
                                                                                                                                
                                                                                                                                
                                                                                                                                </span>

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >导师类型：</label>

															<div class="controls">

                                                                                                                            <span class="text">
                                                                                                                                
                                                                                                                                <s:property value="#session.loginTeacher.tutorType"/>
                                                                                                                                
                                                                                                                            </span>

															</div>

														</div>

													</div>
                                                                                                                                
                                                                                                    

													<!--/span-->
												</div>
                                                                                                                                
                                                                                                <div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >邮件1:</label>

															<div class="controls">

																<span class="text">
                                                                                                                                    
                                                                                                                                    <s:property value="#session.loginTeacher.firstMail"/>
                                                                                                                                
                                                                                                                                
                                                                                                                                </span>

															</div>

														</div>

													</div>

													<!--/span-->

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >邮件2：</label>

															<div class="controls">

                                                                                                                            <span class="text">
                                                                                                                                
                                                                                                                                <s:property value="#session.loginTeacher.secondMail"/>
                                                                                                                                
                                                                                                                            </span>

															</div>

														</div>

													</div>
                                                                                                                                
                                                                                                    

													<!--/span-->
												</div>
                                                                                                                                
                                                                                                                                <div class="row-fluid">

													<div class="span6 ">

														<div class="control-group">

															<label class="control-label" >邮件3:</label>

															<div class="controls">

																<span class="text">
                                                                                                                                    
                                                                                                                                    <s:property value="#session.loginTeacher.thirdMail"/>
                                                                                                                                
                                                                                                                                
                                                                                                                                </span>

															</div>

														</div>

													</div>

													<!--/span-->

												</div>
                                                                                        </div>
												

											</div>
											<!-- END FORM-->  

										</div>

									</div>
                                     

								</div>

							</div>

						</div>

					</div>

				</div>

				<!-- END PAGE CONTENT-->         

			</div>

			<!-- END PAGE CONTAINER-->

		</div>

		<!-- END PAGE -->  

	</div>

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->


	<!-- END FOOTER -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="../media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="../media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="../media/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="media/js/excanvas.min.js"></script>

	<script src="media/js/respond.min.js"></script>  

	<![endif]-->   

	<script src="../media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="../media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery.uniform.min.js" type="text/javascript" ></script>
        
         <script type="text/javascript" src="../media/js/bootstrap-fileupload.js"></script>

	<script type="text/javascript" src="../media/js/chosen.jquery.min.js"></script>


	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL PLUGINS -->

	<script type="text/javascript" src="../media/js/select2.min.js"></script>

	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->

	<script src="../media/js/app.js"></script>

	<script src="../media/js/form-samples.js"></script>   

	<!-- END PAGE LEVEL SCRIPTS -->

	<script>

		jQuery(document).ready(function() {    

		   // initiate layout and plugins

		   App.init();

		   FormSamples.init();

		});

	</script>

	<!-- END JAVASCRIPTS -->   

<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>

<!-- END BODY -->

</html>
