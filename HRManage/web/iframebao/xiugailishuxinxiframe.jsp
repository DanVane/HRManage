<%-- 
    Document   : xiugailishuxinxiiframe
    Created on : 2014-1-2, 13:14:03
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

	<title>NJUST | 修改隶属信息</title>

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

</head>

<body class="page-header-fixed">

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

							<li><a href="#">修改隶属信息</a></li>

						</ul>

					</div>

				</div>

				<div class="row-fluid">

					<div class="span12">

						<div class="portlet box blue" id="form_wizard_1">

							<div class="portlet-title">

								<div class="caption">

									<i class="icon-reorder"></i><span class="step-title">Step 1 of 1</span>

								</div>

								<div class="tools hidden-phone">

									<a href="javascript:;" class="collapse"></a>

									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body form">

                                                            <form action="updateTsbelong" class="form-horizontal"  namespace="/" method="POST">

									<div class="form-wizard">

										<div class="navbar steps">

											<div class="navbar-inner">

												<ul class="row-fluid">

													<li class="span3">

														<a href="#tab1" data-toggle="tab" class="step active">

														<span class="number">1</span>

														<span class="desc"><i class="icon-ok"></i> 学科</span>   

														</a>

													</li>

												</ul>

											</div>

										</div>

										<div id="bar" class="progress progress-success progress-striped">

											<div class="bar"></div>

										</div>

										<div class="tab-content">

											<div class="alert alert-error hide">

												<button class="close" data-dismiss="alert"></button>

												You have some form errors. Please check below.

											</div>

											<div class="alert alert-success hide">

												<button class="close" data-dismiss="alert"></button>

												Your form validation is successful!

											</div>

											<div class="tab-pane active" id="tab1">

												<div class="control-group">

													<label class="control-label">主一级学科<span class="required">*</span></label>

													<div class="controls">

														<s:select  name="tsbelong.mainFirst" list="{'计算机','软件工程','网络工程'}"  readonly="true" theme="simple" />

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">主二级学科1<span class="required">*</span></label>

													<div class="controls">

														<s:select  name="tsbelong.mainSecOne" list="{'计算机','软件工程','网络工程'}"  readonly="true" theme="simple" />

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">主二级学科2<span class="required">*</span></label>

													<div class="controls">

														<s:select  name="tsbelong.mainSecTwo" list="{'计算机','软件工程','网络工程'}"  readonly="true" theme="simple" />

													</div>

												</div>
                                                
												<div class="control-group">

													<label class="control-label">次一级学科<span class="required">*</span></label>

													<div class="controls">

														<s:select  name="tsbelong.nextFirst" list="{'计算机','软件工程','网络工程'}"  readonly="true" theme="simple" />


													</div>

												</div>

												<div class="control-group">

													<label class="control-label">次二级学科1<span class="required">*</span></label>

													<div class="controls">

														<s:select  name="tsbelong.nextSecOne" list="{'计算机','软件工程','网络工程'}"  readonly="true" theme="simple" />


													</div>

												</div>

												<div class="control-group">

													<label class="control-label">次二级学科2</label>

													<div class="controls">

														<s:select  name="tsbelong.nextSecTwo" list="{'计算机','软件工程','网络工程'}"  readonly="true" theme="simple" />

													</div>

												</div>

											</div>

  <div class="form-actions">

													<button type="submit" class="btn blue"><i class="icon-pencil"></i>保存</button>


								  </div>


										</div>

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

	<script type="text/javascript" src="../media/js/jquery.bootstrap.wizard.min.js"></script>

	<script type="text/javascript" src="../media/js/chosen.jquery.min.js"></script>

	<script type="text/javascript" src="../media/js/select2.min.js"></script>

	<script src="../media/js/app.js"></script>

	<script src="../media/js/form-wizard.js"></script>     

	<script>

		jQuery(document).ready(function() {   

		   App.init();

		   FormWizard.init();

		});

	</script>

	
</html>
