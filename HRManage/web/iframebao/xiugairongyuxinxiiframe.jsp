<%-- 
    Document   : xiugairongyuxinxiiframe
    Created on : 2013-12-23, 9:13:45
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

	<title>NJUST | 修改用户荣誉信息</title>

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

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<div>

			<div class="container-fluid">

				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">

				<img src="media/image/menu-toggler.png" alt="" />

				</a>          

			  <ul class="nav pull-right">

				</ul>

			</div>

		</div>

	</div>


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

							<li><a href="#">修改荣誉信息</a></li>

						</ul>

					</div>

				</div>

				<div class="row-fluid">

					<div class="span12">

						<div class="tabbable tabbable-custom boxless">


							<div class="tab-content">
				
								<div class="tab-pane active"  id="tab_7">

									<div class="portlet box blue ">

										<div class="portlet-title">

											<div class="caption"><i class="icon-reorder"></i>修改荣誉信息</div>

											<div class="tools">

												<a href="javascript:;" class="collapse"></a>
                                                                                                
												<a href="javascript:;" class="reload"></a>

												<a href="javascript:;" class="remove"></a>

											</div>

										</div>

										<div class="portlet-body form">

                                                                                        <form action="updateHonor" class="form-horizontal form-bordered form-label-stripped" namespace="/" method="POST">

												<div class="control-group">

													<label class="control-label">用户名</label>

													<div class="controls">

                                                                                                            <s:label  label="用户名" name="honor.teacherId"  value="%{#session.Honor.teacherId}" theme="simple"></s:label>


													</div>

												</div>

												<div class="control-group">

													<label class="control-label">称号名</label>

													<div class="controls">

														<s:combobox label="称号名" name="honor.name" 
                                        list="{'','中国科学院/工程院院士','千人计划入选者','军队科技领军人才培养对象',
                                        '长江学者特聘/讲座教授','国家杰出青年基金获得者','973首席科学家','教育部高校青年教师奖',
                                        '教育部跨世纪人才','中科院百人计划入选者','国家百千万人才工程人选','新世纪优秀人才',
                                        '教学名师','省333工程人选','省双创人才','省特聘教授'}"  value="%{#session.Honor.name}" readonly="true" theme="simple"/>

													

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">获得时间</label>

													<div class="controls">

                                                                                                            <s:textfield label="获得时间" name="honor.gotTime" onclick="WdatePicker()" value="%{#session.Honor.gotTime}" theme="simple"></s:textfield>
														

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">批次</label>

													<div class="controls">
                                                                                                            
                                                                                                        <s:textfield label="批次" name="batch" value="%{#session.Honor.batch}" theme="simple"></s:textfield>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">级别</label>

													<div class="controls">
                                                                                                            
                                                                                                            <s:combobox label="级别" name="honor.level" list="{'','国家级','省部级','市级','校级'}"  readonly="true" value="%{#session.Honor.level}" theme="simple"/>

									

													</div>

												</div>

												
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

	<script src="../media/js/app.js"></script>

	<script src="../media/js/form-samples.js"></script>  

	<script>

		jQuery(document).ready(function() {    

		   App.init();

		   FormSamples.init();

		});

	</script>

</html>
