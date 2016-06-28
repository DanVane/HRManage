<%-- 
    Document   : xiugaixueshuxinxiiframe
    Created on : 2013-12-23, 10:00:13
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

	<title>NJUST | 修改学术兼职信息</title>

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

	<link rel="stylesheet" type="text/css" href="../media/css/chosen.css" />

	<link rel="shortcut icon" href="../media/image/favicon.ico" />
        
         <script language="javascript" type="text/javascript" src="../SpryAssets/My97DatePicker/WdatePicker.js"></script>

</head>

<body class="page-header-fixed">
    
       <!--             确定已登录         -->
   <% if( session.getAttribute("loginUser")==null && session.getAttribute("loginManager")==null ) { %>

        <script>
             alert("您尚未登录，请先登录！");
             window.location="../firstJsp/userLogin.jsp";
           </script>
           
           <%  }%>

	<div class="page-container row-fluid">

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

			  <li><a href="#">个人信息</a>

								<span class="icon-angle-right"></span>

							</li>

							<li><a href="#">修改学术兼职信息</a></li>

						</ul>

					</div>

				</div>

				<div class="row-fluid">

					<div class="span12">

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>修改学术兼职信息</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>
                                                                        
									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body form">
                                                            
                                                                <form action="updateJob" class="form-horizontal" namespace="/" method="POST">

									<div class="control-group warning">

										<label class="control-label" for="inputWarning">用户名</label>

										<div class="controls">

											<s:label  label="用户名"  value="%{#session.loginUser.userId}" theme="simple"></s:label>

										</div>

									</div>

									<div class="control-group error">

										<label class="control-label" for="inputError">姓名</label>

										<div class="controls">

                                                                                <s:label label="姓名"  value="%{#session.loginUser.userName}" theme="simple"></s:label>

										</div>

									</div>

									<div class="control-group success">

										<label class="control-label" for="inputSuccess">兼职名称</label>

										<div class="controls">

											<s:textfield label="兼职名称"  value="%{#session.Job.name}" name="job.name" theme="simple"></s:textfield>

										</div>

									</div>

									<div class="control-group warning">

										<label class="control-label">开始时间</label>

										<div class="controls input-icon">

                                                                                <s:textfield label="开始时间" name="job.startTime" value="%{#session.Job.startTime}" onclick="WdatePicker()" theme="simple"></s:textfield>

											</span>

										</div>

									</div>

									<div class="control-group error">

										<label class="control-label">结束时间</label>

										<div class="controls input-icon">

                                                                                <s:textfield label="结束时间" name="job.overTime" value="%{#session.Job.overTime}" onclick="WdatePicker()" theme="simple"></s:textfield>

											</span>

										</div>

									</div

									<div class="form-actions">

                                                                            <button type="submit" class="btn blue"><i class="icon-ok"></i>提交</button>

										<button type="button" class="btn">取消</button>

									</div>

								</form>

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

	<script type="text/javascript" src="../media/js/jquery.validate.min.js"></script>

	<script type="text/javascript" src="../media/js/additional-methods.min.js"></script>

	<script type="text/javascript" src="../media/js/select2.min.js"></script>

	<script type="text/javascript" src="../media/js/chosen.jquery.min.js"></script>

	<script src="../media/js/app.js"></script>

	<script src="../media/js/form-validation.js"></script> 

	<script>

		jQuery(document).ready(function() {   

		   App.init();

		   FormValidation.init();

		});

	</script>

</html>