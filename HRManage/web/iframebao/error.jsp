<%-- 
    Document   : error
    Created on : 2013-12-22, 14:59:55
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">
    <!--
    var duration=9900;
    var endTime = new Date().getTime() + duration + 100;
    function interval()
    {
        var n=(endTime-new Date().getTime())/1000;
        if(n<0) return;
        document.getElementById("timeout").innerHTML = n.toFixed(3);
        setTimeout(interval, 10);
    }
    window.onload=function()
        {
            setTimeout('location="../firstJsp/index.jsp"', duration);
            interval();
        }
    //-->
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8" />
<head runat="server">
    <title>等待10秒</title>
    <style type="text/css">
    body,td,th {
	font-family: "楷体",Verdana, Geneva, sans-serif;
	font-size: 24px;
        background-color: #D8E1EC;
    }
    body {
	background-image: url(../media/image/bg/2.jpg);
	background-repeat: norepeat;
	margin-top: 200px;
    }
    </style>
</head>
    
<body>
    
       <!--             确定已登录         -->
   <% if( session.getAttribute("loginUser")==null && session.getAttribute("loginManager")==null ) { %>

        <script>
             alert("您尚未登录，请先登录！");
             window.location="../firstJsp/userLogin.jsp";
           </script>
           
           <%  }%>
    <center>
        抱歉，此功能尚未开通！
        <br>
        <br>
        <form id="form1" runat="server">
            <div>
                 现在剩下 <span id="timeout">10.000</span> 秒后，将自动跳转至主界面        
            </div>
        </form>
        <br>
             南京理工大学独家出版！
    </center>
</body>
    
</html>


