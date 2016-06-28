<%-- 
    Document   : yonghuiframe
    Created on : 2013-12-22, 15:06:00
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

	<title>NJUST | 所有用户</title>

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
           
           
           
              <%
        if(session.getAttribute("resetUP")!=null){
    %>
    <script language="javascript" type="text/javascript">
        alert("操作成功！");
    </script>
    <%   
            session.removeAttribute("resetUP");
    }
    %>
    
       
    
<s:if test="%{#session.loginManager == null && #session.loginUser != null}">
         <script>
             alert("对不起，只有管理员可进入该模块，若有需要，请联系管理员！");
             window.location="zhuyeiframe.jsp";
         </script>
     </s:if>
         <s:else>
    
    <% if(session.getAttribute("IsSuper").equals("no")){%>
    <s:action name="findUsersByCollegeAction" namespace="/"></s:action>
     <%}%>
     <% if(session.getAttribute("IsSuper").equals("yes")){%>
    <s:action name="findAllUsers" namespace="/"></s:action>
     <%}%>

  <div class="page-container row-fluid">

  <div>       

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

								<a href="#">系统设置</a>

								<i class="icon-angle-right"></i>

							</li>

							<li><a href="#">所有用户</a></li>

						</ul>
					</div>

				</div>

				<div class="row-fluid">

					<div class="span12">

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-edit"></i>User Table</div>

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
                                                                                    
                                                                                    <li>   <s:a href="generateUserExcel.action?downloadType='yonghu'">Export to Excel</s:a></li>

										</ul>

									</div>

								</div>

								<table class="table table-striped table-hover table-bordered" id="sample_editable_1">

									<thead>

										<tr>

											<th>用户名</th>

											<th>姓名</th>

											<th>用户类型</th>

											<th>学院</th>
                                            
                                                                                        <th>部门</th>

											<th>Edit</th>

											<th>Delete</th>
                                            
                                                                                        <th>Reset</th>

										</tr>

									</thead>

									<tbody>

										<s:iterator value="#request.listUsers" id="us">
                                                                                    <tr class="">
                                                                                        <td><s:property value="#us.userId"/></td>
                                                                                        <td><s:property value="#us.UserName"/></td>
                                                                                        <td><s:property value="#us.UserType"/></td>
                                                                                        <td><s:property value="#us.College"/></td>
                                                                                        <td><s:property value="#us.Department"/></td>
                                                                                        <td><s:a href="updatePUser.action?user.userId=%{#us.userId}" namespace="/">修改</s:a></td>
                                                                                         <% if(session.getAttribute("IsSuper").equals("yes")){%>
                                                                                        <td><s:a href="removeUser.action?user.userId=%{#us.userId}" namespace="/" onclick="return del()" >删除</s:a></td>
                                                                                       <%}else{%>
                                                                                       <td>无操作</td>
                                                                                       <%}%>
                                                                                            <td><s:a href="resetUserPassword.action?user.userId=%{#us.userId}"  namespace="/">重置密码</s:a></td>
                                                                                    </tr>
                                                                                </s:iterator>
									

									</tbody>

								</table>

							</div>

						</div>

					</div>
                                </div>
                        <div id="CollapsiblePanel8" class="CollapsiblePanel">
                                        <div class="CollapsiblePanelTab" tabindex="0">

										<button  class="btn green">

										Add New <i class="icon-plus"></i>

										</button>
                  </div>
                  <div class="CollapsiblePanelContent">
                      
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <s:form action="addNewUserAction" namespace="/" method="POST">
                    <tr>
                        <td>
                            <s:textfield label="工资号"  name="user.userId" ></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <s:textfield label="姓名"  name="user.userName" ></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <% if(session.getAttribute("IsSuper").equals("no")){%>
                        <s:select label="学院" name="user.college" list="{'',#session.managerCollege}"  readonly="true" />
                          <%}%>
                         <% if(session.getAttribute("IsSuper").equals("yes")){%>
                         <s:select label="学院" name="user.college" list="{'经济管理','环境与生物','自动化','计算机'}"  readonly="true" />
                          <%}%>
                    </tr>
                    <tr>
                        
                        <s:select label="部门" name="user.department" list="{'软件部','硬件部','外联部','宣传部'}"  readonly="true"/>
                    </tr>
                    <tr>
                        <s:select label="用户类型" name="user.userType" list="{'教师','学生'}" cssStyle="width:70px;" readonly="true" />
                    </tr>
                      <tr>
                        <td>
										<button type="submit" class="btn blue">保存</button>
                        
                        </td>
                        <td>
										<button type="button" class="btn">取消</button>
								
                        </td>
                      </tr>
                    </s:form>
                </table>
                      
            </div>
           
       
				</div>

			</div>

		</div>


	</div>
         </s:else>

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
var CollapsiblePanel8 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel8",{contentIsOpen:false});
</script>
<!-- END BODY -->

</html>
