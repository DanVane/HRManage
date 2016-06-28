<%-- 
    Document   : suoyouguanliyuaniframe
    Created on : 2013-12-23, 20:37:30
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

	<title>NJUST | 所有管理员</title>

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
        if(session.getAttribute("resetMP")!=null){
    %>
    <script language="javascript" type="text/javascript">
        alert("操作成功！");
    </script>
    <%   
            session.removeAttribute("resetMP");
    }
    %>
    
<s:if test="%{#session.loginManager == null && #session.loginUser != null}">
         <script>
             alert("对不起，只有管理员可进入该模块，若有需要，请联系管理员！");
             window.location="zhuyeiframe.jsp";
         </script>
     </s:if>
         <s:else>
    
       <s:action name="findAllManagers" namespace="/"></s:action>

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

								<a href="#">系统设置</a>

								<i class="icon-angle-right"></i>

							</li>

							<li><a href="#">所有管理员</a></li>

						</ul>

					</div>

				</div>

				<div class="row-fluid">

					<div class="span12">

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-edit"></i>Manager Table</div>

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

											 <li>   <s:a href="generateManagerExcel.action?downloadType='guanliyuan'">Export to Excel</s:a></li>

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

											<th>Edit</th>

											<th>Delete</th>
                                            
                                                                                        <th>Reset</th>

										</tr>

									</thead>

									<tbody>
<s:iterator value="#request.listManager" id="ours">
    <tr class="">
										 <td><s:property value="#ours.managerId" /></td>
             <td><s:property value="#ours.name"/></td>
            <td><s:property value="#ours.isSuper"/></td>
            <td><s:property value="#ours.college"/></td>
          
                <% if(session.getAttribute("IsSuper").equals("yes")){%>  
                <td> 
              <s:a href="updatemanagerInfoAction.action?manager.managerId=%{#ours.managerId}" namespace="/">修改</s:a>
                </td>
                 <%}else{%>
            <td>无操作</td>
                 <% }%>
                
            
           
                <% if(session.getAttribute("IsSuper").equals("yes")){%>
                 <td>  <s:a href="removeManager.action?manager.managerId=%{#ours.managerId}" namespace="/">删除</s:a> </td>
               <%}else{%>
            <td>无操作</td>
                 <% }%>
                 
           
          
                <% if(session.getAttribute("IsSuper").equals("yes")){%>
               <td>      <s:a href="resetManagerPassword.action?manager.managerId=%{#ours.managerId}" namespace="/">重置密码</s:a> </td>
               <%}else{%>
            <td>无操作</td>
                 <% }%>
           
    </tr>
									
                                                                </s:iterator>
									</tbody>

								</table>

							</div>

						</div>


					</div>
                                </div>
                        
                 
                 
       <% if(session.getAttribute("IsSuper").equals("yes")){%>                   
                 <div id="CollapsiblePanel10" class="CollapsiblePanel">
                  
                                        <div class="CollapsiblePanelTab" tabindex="0">

										<button  class="btn green">

										Add New <i class="icon-plus"></i>

										</button>
                                                                              
                  </div>
                  <div class="CollapsiblePanelContent">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <s:form action="addNewManager" namespace="/" method="POST">
                    <tr>
                        <td>
                            <s:textfield label="工资号"  name="manager.managerId" ></s:textfield>
                        </td>
                    </tr>
                    <tr>
                        <td>
                         <s:textfield label="姓名"  name="manager.name" ></s:textfield>
                        </td>
                    </tr>
                    <tr>
                         <s:combobox label="学院" name="manager.college" list="{'','经济管理学院','环境生物学院','设计传媒学院','自动化学院'}" cssStyle="width:70px;" readonly="true"/>
                    </tr>
                    
                    <tr>
                        <s:combobox label="用户类型" name="manager.isSuper" list="{'','系统管理员'}"  cssStyle="width:70px;" readonly="true" />
                    </tr>
                     <tr>
                        <td>
										<button type="submit" class="btn blue">Save</button>
                        
                        </td>
                        <td>
										<button type="button" class="btn">Cancel</button>
								
                        </td>
                      </tr>
                    </s:form>
                </table>
                 
            </div>
           
      
				</div>
                 
  <% }%> 

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
var CollapsiblePanel10 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel10",{contentIsOpen:false});
</script>
<!-- END BODY -->

</html>

