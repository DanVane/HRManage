<%-- 
    Document   : gongzuoiframe
    Created on : 2013-12-22, 15:00:44
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

	<title>NJUST | 工作信息</title>

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
        
        <script language="javascript" type="text/javascript" src="../SpryAssets/My97DatePicker/WdatePicker.js"></script>
        <script src="../SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"></script>
        <link href="../SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css" />
        
        <script type="text/javascript">
            function del(){
                if(confirm("你真的想删除这一项吗？")){
                    return true;
                }
                return false;
            }
        </script>

</head>

<body class="page-header-fixed">
    
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
     
     <s:action name="findWorkssByTeacherIdAction" namespace="/"></s:action>

  <div class="page-container row-fluid">

  <div >   

			<div class="container-fluid">

				<div class="row-fluid">

					<div class="span12">

						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="../firstJsp/index.jsp">NJUST</a> 

								<i class="icon-angle-right"></i>

							</li>

							<li>

								<a href="#">个人信息</a>

								<i class="icon-angle-right"></i>

							</li>

							<li><a href="#">工作信息</a></li>

						</ul>

					</div>

				</div>

				<div class="row-fluid">

					<div class="span12">

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-edit"></i>Work Table</div>

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

											 <li>   <s:a href="generateGongzuoExcel.action?downloadType='gongzuo'">Export to Excel</s:a></li>

										</ul>

									</div>

								</div>

								<table class="table table-striped table-hover table-bordered" id="sample_editable_1">

									<thead>

										<tr>

											<th>开始时间</th>

											<th>结束时间</th>

											<th>工作单位</th>

											<th>工作部门</th>
                                            
                                            <th>任职情况</th>

											<th>Edit</th>

											<th>Delete</th>

										</tr>

									</thead>

									<tbody>

										<s:iterator value="#request.listWorks" id="her">
                                                                                     <tr class="">
                                                                                        <td><s:property value="#her.startTime"/></td>
                                                                                        <td><s:property value="#her.overTime"/></td>
                                                                                        <td><s:property value="#her.orginization"/></td>
                                                                                        <td><s:property value="#her.department"/></td>
                                                                                        <td><s:property value="#her.post"/></td>
                                                                                        <td><s:a href="updatePWork.action?work.workNo=%{#her.workNo}" namespace="/">修改</s:a></td>
                                                                                        <td><s:a href="removeWork.action?work.workNo=%{#her.workNo}" onclick="return del()" namespace="/">删除</s:a></td>
                                                                                     </tr>
                                                                                </s:iterator>
                                                                                     
									</tbody>

								</table>

							</div>

						</div>


					</div>
                                </div>
                                    
                                    
                                    <div id="CollapsiblePanel2" class="CollapsiblePanel">
                  <div class="CollapsiblePanelTab" tabindex="0">
                  
										<button  class="btn green">

										Add New <i class="icon-plus"></i>

										</button>

									
                  </div>
                  <div class="CollapsiblePanelContent">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" id="table4">
                        
                          <form action="addNewWorkAction" namespace="/" method="POST">
                              
                         

                      <tr>
                          <th scope="col"></th>
                        <th scope="col">
                        <s:textfield label="开始时间" name="work.startTime" onclick="WdatePicker()">
                        </s:textfield>
                       
                        </th>
                        <th align="center" scope="col">
                        <s:textfield label="结束时间" name="work.overTime" onclick="WdatePicker()" ></s:textfield>
                

                      </th>
                      </tr>
                      <tr>
                        <th scope="row"><s:textfield label="工作单位" name="work.orginization"></s:textfield></th>
                        <td align="center"><s:textfield label="工作部门" name="work.department"></s:textfield></td>
                      </tr>
                      <tr>
                        <th scope="row"><s:textfield label="任职情况" name="work.post"></s:textfield></th>
                        <td align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <th scope="row">
				<button type="submit" class="btn blue">保存</button>
                        
                        </th>
                        <td>
				<button type="button" class="btn">取消</button>
								
                        </td>
                      </tr>
                         
                        </form>
                  
                    </table>
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


<script type="text/javascript">
var CollapsiblePanel2 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel2", {contentIsOpen:false});
</script>
<!-- END BODY -->

</html>
