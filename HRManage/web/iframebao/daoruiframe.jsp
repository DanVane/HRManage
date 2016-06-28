<%-- 
    Document   : daoruirame
    Created on : 2013-12-22, 14:58:56
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>NJUST | 导入用户</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<link href="../media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="../media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<link href="../media/css/jquery.fancybox.css" rel="stylesheet" />

	<link href="../media/css/jquery.fileupload-ui.css" rel="stylesheet" />

	<link rel="shortcut icon" href="../media/image/favicon.ico" />
        
       <link href="../media/css/bootstrap-fileupload.css" rel="stylesheet" type="text/css" />

	<link href="../media/css/chosen.css" rel="stylesheet" type="text/css" />
        
	<script src="../media2/js/vendor/modernizr-2.5.3.min.js"></script>
        
        <script type="text/javascript">
     function goto()
    {
        var fileNamem = document.getElementById("fileName").value;
        if(fileNamem == ""){
            alert("请先选中要导入的文件！");
        }else{
            form2.submit();
            $("#bar").css("display","block");
            $("#go").attr("disabled",true);
            $.ajax({
                   url:'intoDBAction'
                   ,type:'POST'
                   ,data:{x:Math.random()}
                   ,success:function(data){
                       $("#bar").css("display","none");
                    //设置按钮可用
                    $("#go").attr("disabled",false);
                    alert("数据导入成功！");
                  //  location="boat!getAllBoat.do";
                   }
                   ,error:function(){
                       alert("数据导入失败，请检查格式是否正确！");
                       $("#bar").css("display","none");
                   }
            });
        }
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
    
    <s:if test="%{#session.loginManager == null && #session.loginUser != null}">
         <script>
             alert("对不起，只有管理员可进入该模块，若有需要，请联系管理员！");
             window.location="zhuyeiframe.jsp";
         </script>
     </s:if>

  <div class="page-container row-fluid">

  <div>

			<div class="container-fluid">
                            
				<div class="row-fluid">

					<div class="span12">

						<ul class="breadcrumb">
						 <font face="华文楷体" color="#2A1F00">NJUST</font>
						  <li><a href="index.html"></a> 

								<i class="icon-angle-right"></i>

							</li>

							<li>

								<a href="#">系统设置</a>

								<i class="icon-angle-right"></i>

							</li>

							<li><a href="#">导入用户</a></li>

						</ul>

					</div>

				</div>

                
                </div>

				<div class="row-fluid">

					<div class="span12">
                                            
                                            						<div class="tabbable tabbable-custom boxless">


							<div class="tab-content">
				
								<div class="tab-pane active" >

									<div class="portlet box blue ">

						<div class="portlet-body">

						<br>
                                                
						 <iframe id="uploadFrameID" name="uploadFrame" height="0" width="0" frameborder="0" scrolling="yes"></iframe>
   <form action="importUserAction" method="post" name="form2" enctype="multipart/form-data" target="uploadFrame"  id="fileupload">
        
							                 <div class="fileupload fileupload-new" data-provides="fileupload">

																	<div class="input-append">

																		<div class="uneditable-input">

																			<i class="icon-file fileupload-exists"></i> 

																			<span class="fileupload-preview"></span>

																		</div>

																		<span class="btn btn-file">

																		
                                                                                                                                                <span class="green fileinput-button" >

									<i class="icon-plus icon-white"></i>

									<span class="fileupload-new">Add files...</span>

									</span>

																		<span class="fileupload-exists">Change</span>

                                                                                                                                                <s:file name="file"  id="fileName" ></s:file>

																		</span>
                                                                                                                                                   <button type="submit" class="btn blue start fileupload-exists" onclick="goto()">

									<i class="icon-upload icon-white"></i>

                                                                        <span onclick="">Start upload</span>

									</button>

																		<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>

																	</div>


						

							<div class="fileupload-loading"></div>

							<br>


						</form>
                                                                        
                  

						<br>

					

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

	<script src="../media/js/jquery.fancybox.pack.js"></script>

	<script src="../media/js/jquery.ui.widget.js"></script>

	<script src="../media/js/tmpl.min.js"></script>
        
	<script src="../media/js/load-image.min.js"></script>

	<script src="../media/js/canvas-to-blob.min.js"></script>

	<script src="../media/js/jquery.iframe-transport.js"></script>

	<script src="../media/js/jquery.fileupload.js"></script>

	<script src="../media/js/jquery.fileupload-fp.js"></script>

	<script src="../media/js/jquery.fileupload-ui.js"></script>
        
        <script type="text/javascript" src="../media/js/bootstrap-fileupload.js"></script>

	<script type="text/javascript" src="../media/js/chosen.jquery.min.js"></script>
        
	<script src="../media/js/app.js"></script>


	<script>

		jQuery(document).ready(function() {

		App.init();

		FormFileUpload.init();

		});

	</script>


</html>