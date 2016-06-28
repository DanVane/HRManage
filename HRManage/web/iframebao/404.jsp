<%-- 
    Document   : 404
    Created on : 2013-12-22, 14:54:57
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>NJUST | 404  </title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<link href="../media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="../media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/error.css" rel="stylesheet" type="text/css"/>

	<link rel="shortcut icon" href="../media/image/favicon.ico" />

</head>

<body class="page-404-3">
    
       <!--             确定已登录         -->
   <% if( session.getAttribute("loginUser")==null && session.getAttribute("loginManager")==null ) { %>

        <script>
             alert("您尚未登录，请先登录！");
             window.location="../firstJsp/userLogin.jsp";
           </script>
           
           <%  }%>

	<div class="page-inner">

		<img src="../media/image/earth.jpg" alt="">

	</div>

	<div class="container error-404">

		<h1>404</h1>

		<h2>对不起，我们遇到了一些问题。</h2>

		<p>

			实际上，您查看的网页并不存在。。。。。 

		</p>

		<p>

			<a href="../firstJsp/index.jsp">返回主页</a>

			<br>

		</p>

	</div>

	<script src="../media/js/jquery-1.8.3.min.js" type="text/javascript"></script>   
        
	<script src="../media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="../media/js/bootstrap.min.js" type="text/javascript"></script>

	<script src="../media/js/breakpoints.js" type="text/javascript"></script>  

	<script src="../media/js/jquery.uniform.min.js" type="text/javascript" ></script> 

	<script src="../media/js/app.js"></script>  

	<script>

		jQuery(document).ready(function() {    

		   App.init();

		});

	</script>

</html>