<%-- 
    Document   : xiugaixueweixinxiiframe
    Created on : 2013-12-23, 10:06:51
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

	<title>NJUST | 修改用户学位信息</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

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

							<li>

								<a href="#">个人信息</a>

								<span class="icon-angle-right"></span>

							</li>

							<li><a href="#">修改学位信息</a></li>

						</ul>

					</div>

				</div>

				<div class="row-fluid">

				  <div class="span12">

					</div>

				</div>

				<div class="row-fluid">

					<div class="span12">

						<div class="portlet box green">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>修改学位信息</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>
                                                                        
									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body form">
								
                                                                <form action="updateDegree" class="form-horizontal" namespace="/" method="POST">

									<div class="control-group">

										<label class="control-label">用户名<span class="required">*</span></label>

										<div class="controls">

                                                                                    <s:label  label="用户名"  value="%{#session.loginUser.userId}" theme="simple"></s:label>

										</div>

									</div>

									<div class="control-group">

										<label class="control-label">姓名<span class="required">*</span></label>

										<div class="controls">

                                                                                <s:label label="姓名"  value="%{#session.loginUser.userName}" theme="simple"></s:label>

										</div>

									</div>

									<div class="control-group">

										<label class="control-label">学位</label>

										<div class="controls">

                                                                                <s:textfield name="degree.degree" label="学位" value="%{#session.Degree.degree}" theme="simple"></s:textfield>

										</div>

									</div>

									<div class="control-group">

										<label class="control-label">学历<span class="required">*</span></label>

										<div class="controls">

                                                                                <s:textfield label="学历" name="degree.eduBack" value="%{#session.Degree.eduBack}" theme="simple"></s:textfield>

										</div>

									</div>

									<div class="control-group">

										<label class="control-label">毕业学校<span class="required">*</span></label>

										<div class="controls chzn-controls">

                                                                                <s:textfield label="毕业学校" name="degree.school" value="%{#session.Degree.school}" theme="simple"></s:textfield>

										</div>

									</div>

									<div class="control-group">

										<label class="control-label">专业<span class="required">*</span></label>

										<div class="controls">

                                                                                <s:textfield label="专业" name="degree.major" value="%{#session.Degree.major}" theme="simple"></s:textfield>

										</div>

									</div>

									<div class="control-group">

										<label class="control-label">开始攻读时间<span class="required">*</span></label>

										<div class="controls">

                                                                                <s:textfield label="开始攻读时间" name="degree.startTime" value="%{#session.Degree.startTime}" onclick="WdatePicker()"  theme="simple"></s:textfield>

										</div>

									</div>

									<div class="control-group">

										<label class="control-label">结束攻读时间<span class="required">*</span></label>

										<div class="controls">
                                                                                <s:textfield label="结束攻读时间" name="degree.overTime" value="%{#session.Degree.overTime}" onclick="WdatePicker()" theme="simple"></s:textfield>

										</div>

									</div>

<div class="control-group">

										<label class="control-label">高校层次<span class="required">*</span></label>

										<div class="controls">
                                                                                <s:combobox label="高校层次" name="degree.schoolLevel" list="{'','211','985','海外','其它'}" value="%{#session.Degree.schoolLevel}" readonly="true" theme="simple"/>

										</div>

									</div>

<div class="control-group">

										<label class="control-label">最高学位<span class="required">*</span></label>

										<div class="controls">
                                                                                    <s:combobox label="是否最高学位" name="degree.dhighest" list="{'','是','否'}" value="%{#session.Degree.dhighest}" readonly="true" theme="simple"/>

										</div>

									</div>


<div class="control-group">

										<label class="control-label">最高学历<span class="required">*</span></label>

										<div class="controls">
                                                                                    <s:combobox label="是否最高学历" name="degree.ehighest" list="{'','是','否'}" value="%{#session.Degree.ehighest}" readonly="true" theme="simple"/>

										</div>

									</div>

									<div class="form-actions">

										<button type="submit" class="btn green">提交</button>

										<button type="button" class="btn">取消</button>

									</div>

								</form>

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