<%-- 
    Document   : index
    Created on : 2013-12-22, 14:41:38
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>


<!DOCTYPE html>



<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->



<head>

	<meta charset="utf-8" />

	<title>NJUST | 院级综合业务处理系统</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
        
	<link href="../media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="../media/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	
	<link rel="shortcut icon" href="../media/image/favicon.ico" />

</head>

<body class="page-header-fixed" >
    
   <!--             确定已登录         -->
   <% if( session.getAttribute("loginUser")==null && session.getAttribute("loginManager")==null ) { %>

        <script>
             alert("您尚未登录，请先登录！");
             window.location="userLogin.jsp";
           </script>
           
           <%  }%>
           
           
           <% if( session.getAttribute("changeToUser")!=null && session.getAttribute("changeToUser").equals("done") ) { %>

        <script>
             alert("身份切换成功，您现在是用户身份！");
           </script>
           
           <% session.removeAttribute("changeToUser"); }%>
           
            <% if( session.getAttribute("changeToManager")!=null && session.getAttribute("changeToManager").equals("done") ) { %>

        <script>
             alert("身份切换成功，您现在是管理员身份！");
           </script>
           
           <% session.removeAttribute("changeToManager"); }%>
           
           <% if( session.getAttribute("changeToUser")!=null && session.getAttribute("changeToUser").equals("notdone") ) { %>

        <script>
             alert("身份切换失败，您仍是管理员身份！");
           </script>
           
           <% session.removeAttribute("changeToUser"); }%>
           
           <% if( session.getAttribute("changeToManager")!=null && session.getAttribute("changeToManager").equals("notdone") ) { %>

        <script>
             alert("身份切换失败，您仍是用户身份！");
           </script>
           
           <% session.removeAttribute("changeToManager"); }%>

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container-fluid">

				<p><a class="brand" href="index.html"><img src="../media/image/box_orange_24.png" width="24" height="24">院综合业务处理平台</a>
				  
				  <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
				    
			      <img src="../media/image/menu-toggler.png" alt="" />
				    
			      </a>               
				  
			  </p>
			  <ul class="nav pull-right">

					<li class="dropdown user">

						<a href="#" class="dropdown-toggle" data-toggle="dropdown">

						<img alt="" src="../media/image/mmm.jpg" />

                                                <span class="username">
                                                    
                                                    <% if(session.getAttribute("loginUser")!=null && session.getAttribute("loginManager")==null){%>
                                
                                                        <s:property value="#session.loginUser.userName"/>
                              
                                                    <%}%>
                                                    <% if(session.getAttribute("loginManager")!=null && session.getAttribute("loginUser")==null){%>
                                
                                                        <s:property value="#session.loginManager.Name"/>
                               
                                                    <% }%>
                                                    
                                                    
                                                </span>

						<i class="icon-angle-down"></i>

						</a>

						<ul class="dropdown-menu">
                                                    
                                                  

 <% if(session.getAttribute("loginManager")==null && session.getAttribute("loginUser")!=null){%>
 <li>        <s:a href="changeToManager.action?manager.managerId=#session.loginUser.UserID"><i class="icon-user"></i>Change To Manager</s:a></li>
                            <%}%>
                           <% if(session.getAttribute("loginManager")!=null && session.getAttribute("loginUser")==null){%>
 <li>      <s:a href="changeToUser.action?user.userId=#session.loginManager.ManagerID"><i class="icon-user"></i>Change To User</s:a></li>
                            <% }%>
							
							<li class="divider"></li>

							<li><a href="../iframebao/lock.jsp"><i class="icon-lock"></i> Lock Screen</a></li>
                                                         
                                                        <form action="" namespace="/" method="POST">
							<li><a href="exitAction.action"><i class="icon-key"></i> Log Out</a></li>
                                                        </form>

						</ul>

					</li>

			  </ul>

		  </div>

		</div>

	</div>

	<div class="page-container">

		<div class="page-sidebar nav-collapse collapse">

			<ul class="page-sidebar-menu">

				<li>

					<div class="sidebar-toggler hidden-phone"></div>

				</li>
                                
                                <div class="input-box">

							
                                    <br>
						

						</div>

				<li class="start active ">

					<a href="../iframebao/zhuyeiframe.jsp" target="BoardGeren">

					<i class="icon-home"></i>欢迎使用<span class="selected"></span>

					</a>

		    </li>

				<li>

					<a href="javascript:;">

					<i class="icon-folder-open"></i>个人信息
                    <span class="arrow "></span>

					</a>
				    <ul class="sub-menu">

						<li>

							<a href="javascript:;">

							<i class="icon-cogs"></i> 

							个人基本信息

									<span class="arrow"></span>


							</a>

							<ul class="sub-menu">
<li>

									<a href="../iframebao/jibenxinxiiframe.jsp" target="BoardGeren">

									<i class="icon-user"></i>

									基本信息
									</a>

									

								</li>

                                                                <li><a href="../iframebao/lishuiframe.jsp" target="BoardGeren"><i class="icon-user"></i>  隶属信息</a></li>

			          <li><a href="../iframebao/xueweiiframe.jsp" target="BoardGeren"><i class="icon-external-link"></i>  学位信息</a></li>

								<li><a href="../iframebao/gongzuoiframe.jsp" target="BoardGeren"><i class="icon-bell"></i> 工作信息</a></li>


<li><a href="../iframebao/xueshuiframe.jsp" target="BoardGeren"><i class="icon-external-link"></i> 学术兼职</a></li>

								<li><a href="../iframebao/rongyuiframe.jsp" target="BoardGeren"><i class="icon-bell"></i> 荣誉称号</a></li>
							</ul>

						</li>

						<li >

							<a href="../iframebao/lunwenP.jsp" target="BoardGeren">

						<i class="icon-remove"></i> 	学术论文奖励申报</a>

						</li>

						<li >

							<a href="../iframebao/404.jsp">

							成果信息</a>

						</li>

						<li >

							<a href="../iframebao/404.jsp">

							科研项目信息</a>

						</li>

						<li >

							<a href="../iframebao/404.jsp">

							承担的教学任务</a>

						</li>

						<li >

							<a href="../iframebao/404.jsp">

							研究生指导情况</a>

						</li>

						<li >

							<a href="../iframebao/404.jsp">

							年度科研成果申报</a>

						</li>

						<li >

							<a href="../iframebao/xiugaimima.jsp" target="BoardGeren">

						<i class="icon-pencil"></i>	修改个人密码</a>

						</li>

					</ul>

				</li>

				<li class="">

					<a href="../iframebao/error.jsp">

					<i class="icon-bookmark-empty"></i> 

					<span class="title">日常业务</span>


					</a>


				</li>

				<li class="">

					<a href="../iframebao/error.jsp">

					<i class="icon-table"></i> 

					<span class="title">学科建设</span>

					</a>

				</li>

				<li class="">

					<a href="../iframebao/error.jsp">

					<i class="icon-briefcase"></i> 

					<span class="title">人才培养</span>

					</a>

				</li>

				<li class="">

					<a href="../iframebao/error.jsp">

					<i class="icon-gift"></i>教学管理

					</a>
                    
				</li>

				<li>

					<a href="../iframebao/error.jsp">

					<i class="icon-sitemap"></i>科研管理

					</a>

				</li>

				<li>

					<a href="javascript:;">

					<i class="icon-folder-open"></i>系统设置<span class="arrow "></span>

					</a>

                    <ul class="sub-menu">

						<li>

							<a href="javascript:;">

							<i class="icon-cogs"></i> 

							用户管理

							<span class="arrow"></span>

							</a>

							<ul class="sub-menu">

							

								<li><a href="../iframebao/yonghuiframe.jsp" target="BoardGeren"><i class="icon-user"></i>  所有用户</a></li>

			          <li><a href="../iframebao/daoruiframe.jsp" target="BoardGeren"><i class="icon-external-link"></i>  导入用户</a></li>
                                  
                                  <li><a href="../iframebao/suoyouguanliyuaniframe.jsp" target="BoardGeren"><i class="icon-bell"></i> 所有管理员 </a></li>

                              

							</ul>

						</li>

						<li>

							<a href="../iframebao/404.jsp">

							<i class="icon-globe"></i> 

							权限管理


						  </a>


	          </li>

						<li>

							

						<a href="../iframebao/404.jsp">
                        
                        <i class="icon-bell"></i> 

							配置管理

						  </a>

						</li>

					</ul>

				</li>
                
				<li class="last">

					<a href="javascript:;">

					<i class="icon-user"></i>关于我们<span class="arrow "></span>

					</a>

                    <ul class="sub-menu">

						<li >

                                                    <a href="../iframebao/about.jsp" target="BoardGeren">

						<i class="icon-edit"></i>	王丹+曹沁+许电如</a>

						</li>

						<li >

							<a href="login_soft.html">

							2013-12-21</a>

						</li>

					</ul>

				</li>

			</ul>

		</div>

		<div class="page-content">
                    
			<div class="container-fluid">

				<div>
  <iframe name="BoardGeren" src="../iframebao/zhuyeiframe.jsp" frameborder=false scrolling="auto" width="1062" height="900" frameborder=no style="background-color:#3D3D3D" onload="document.all['BoardGeren'].style.height=BoardGeren.document.body.scrollHeight" ></iframe>

			</div>

		</div>

	</div>

	<div class="footer navbar-fixed-bottom">

		<div class="footer-inner">

			2013 &copy; All Rights Reserved.

		</div>

		<div class="footer-tools">

			<span class="go-top">

			<i class="icon-angle-up"></i>

			</span>

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
	
	<script src="../media/js/jquery.flot.js" type="text/javascript"></script>

	<script src="../media/js/jquery.flot.resize.js" type="text/javascript"></script>

	<script src="../media/js/jquery.pulsate.min.js" type="text/javascript"></script>

	<script src="../media/js/date.js" type="text/javascript"></script>

	<script src="../media/js/app.js" type="text/javascript"></script>

	<script src="../media/js/index.js" type="text/javascript"></script>    

	<script>

		jQuery(document).ready(function() {    

		   App.init(); 

		   Index.init();

		});

	</script>

	

</html>
