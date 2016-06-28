<%-- 
    Document   : about
    Created on : 2013-12-23, 11:15:56
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

	<title>NJUST | 项目里程</title>

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

	<link href="../media/css/timeline.css" rel="stylesheet" type="text/css"/>

	<link rel="shortcut icon" href="../media/image/favicon.ico" />

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

								<i class="icon-angle-right"></i>

							</li>

							<li>

								<a href="#">关于我们</a>

								<i class="icon-angle-right"></i>

							</li>

							<li><a href="#">项目成长</a></li>

						</ul>

					</div>

				</div>

				<div class="row-fluid">

					<div class="span12">

						<ul class="timeline">

							<li class="timeline-yellow">

								<div class="timeline-time">

									<span class="date">16/09/13</span>

									<span class="time">18:30</span>

								</div>

								<div class="timeline-icon"><i class="icon-trophy"></i></div>

								<div class="timeline-body">

									<h2> 2013 课设初次会谈</h2>

									<div class="timeline-content">
<p>
										<img class="timeline-img pull-left" src="../media/image/2.jpg" alt="">

										小学期的半个月已经溜走了，我们还是什么都没动，除了需要提交的设计说明书。“老师要出国呢。我们时间好多呢。“听说已经有小组早出晚归了。好吧，我承认，这个组长有点慢半拍。
                                  初次会谈，主要明确了我们这个项目要求以及个人分工。结果如下：</p><img src="../media/image/123.PNG" width="300" height="65"></div>

									<div class="timeline-footer">

										
								  </div>

								</div>

							</li>

							<li class="timeline-blue">

								<div class="timeline-time">

									<span class="date">26/09/13</span>

									<span class="time">12:04</span>

								</div>

								<div class="timeline-icon"><i class="icon-facetime-video"></i></div>

								<div class="timeline-body">

									<h2>在国庆，战斗吧。。。</h2>

									<div class="timeline-content">
<p>
										<img class="timeline-img pull-right" src="../media/image/1.jpg" alt="">

										国庆是个好时间，在家中午后，一杯浓茶，手指在键盘上飞舞，这情景真是令人神往。于是大拉拉地制定了国庆计划</p><p>结果。。。。。。                                   </p> <img src="../media/image/234.PNG" width="300" height="80"></div>

								</div>

							</li>

							<li class="timeline-green">

								<div class="timeline-time">

									<span class="date">4/11/13</span>

									<span class="time">15:36</span>

								</div>

								<div class="timeline-icon"><i class="icon-comments"></i></div>

								<div class="timeline-body">

									<h2>总算开始动工了</h2>

									<div class="timeline-content">
<p>
										<img class="timeline-img pull-left" src="../media/image/3.jpg" alt="">

									虽然比计划晚了很多，但总算踏出第一步了。那句话怎么说来着：虽然只是做了一个界面，但对整个项目来说，这是一个巨大的飞跃：
                                    </p><img src="../media/image/345.PNG" width="300" height="143"></div>


								</div>

							</li>

							<li class="timeline-purple">

								<div class="timeline-time">

									<span class="date">1/12/13</span>

									<span class="time">13:15</span>

								</div>

								<div class="timeline-icon"><i class="icon-music"></i></div>

								<div class="timeline-body">

									<h2>狂改界面阶段</h2>

									<div class="timeline-content">

										<div class="scroller" data-height="175px" data-always-visible="1" data-rail-visible1="1">

											<p>

												<img class="timeline-img pull-right" src="../media/image/4.jpg" alt="">

											阶段一：<img src="../media/image/456.PNG" width="350" height="213"> </p>

											
									  </div>
									</div>
								</div>
							</li>
							<li class="timeline-purple">
							  <div class="timeline-body">
							    <div class="timeline-content">
							      <div class="scroller" data-height="175px" data-always-visible="1" data-rail-visible1="1">
							        <p> 阶段二：<img src="../media/image/567.PNG" width="350" height="159"> </p>
							        
							        
							      </div>
							    </div>
							  </div>
						  </li>
							<li class="timeline-purple">
							  <div class="timeline-body">
							    <div class="timeline-content">
							      <div class="scroller" data-height="175px" data-always-visible="1" data-rail-visible1="1">
							        <p><img class="timeline-img pull-left" src="../media/image/6.jpg" alt="">                                    
							          
							          阶段三：<img src="../media/image/789.PNG" width="350" height="128"> </p>
							        
							       
							      </div>
							    </div>
							  </div>
						  </li>
							<li class="timeline-purple">
							  <div class="timeline-body">
							    <div class="timeline-content">
							      <div class="scroller" data-height="175px" data-always-visible="1" data-rail-visible1="1">
							        <p>阶段四：<img src="../media/image/890.PNG" width="350" height="158"> </p>
							        
						          </div>
							      
						        </div>
							    
							    
						      </div>
							  
						  </li>

							<li class="timeline-red">

								<div class="timeline-time">

									<span class="date">10/12/13</span>

									<span class="time">21:30</span>

								</div>

								<div class="timeline-icon"><i class="icon-rss"></i></div>

								<div class="timeline-body">

									<h2>It's Dan's show time！</h2>

									<div class="timeline-content">

									<p>	<img src="../media/image/902.jpg" width="186" height="300" class="pull-left" alt=""> &nbsp; &nbsp;&nbsp; &nbsp;	因为个人对NetBeans比较熟悉，所以决定采用NetBeans编写程序。网上有很多SSH的教程，但使用的编程平台不是Eclipse就是MyEclipse。于是只能克服万难，努力将MyEclipse的SSH教程在NetBeans上重新编译通过。这个过程真是虐心。半夜两点不睡觉，思来想去也不知道问题出在哪里，百度的时间比写代码的时间还多，只能感叹一句，学计算机真心不容易！</p>
                                    
							      <p>
						&nbsp; &nbsp;&nbsp; &nbsp;	   我们小组实力比较弱，只有3个女生，一开始分配任务是均分的，好吧，我承认，自己不是一个出色的领导者，当然，我会继续努力的。项目编写过程中，发现均分的分配模式实在是不行，既加重个人负担，拖延进度，又不能发挥个人特长。所以，又将任务重新分配，由曹沁负责界面，我和许电如编写后台。当然，要感谢她们的付出，真是跟着我受苦了。</p>
							      <p>&nbsp; &nbsp;&nbsp; &nbsp;
						          总的来说，这份课设也是对自己的一份考验。选择了计算机，就选择了代码的世界；选择了软工，就选择了一份忙碌与成长。我经常对自己说，既然是自己的选择，那么这条路从一开始就没有退路。曾经有一段时间，自己忙得忘了梦想。（这时候是不是应该抬头呈45度角，感叹一句"这就是人生"能显得自己很有哲学范儿）。但是，"行百里者半九十"，都走到这一步了，再过一年半就能出师了，怎么能轻言放弃？</p>
							      
						        </div>
							    
							    
							    
						      </div>
							  
						  </li>

							<li class="timeline-grey">

								<div class="timeline-time">

									<span class="date">11/12/13</span>

									<span class="time">12:11</span>

								</div>

								<div class="timeline-icon"><i class="icon-time"></i></div>

								<div class="timeline-body">

									<h2>It's Qin's show time！</h2>

									<div class="timeline-content">
<p><img src="../media/image/901.jpg" width="166" height="300"  class="pull-right" alt="">
										&nbsp; &nbsp;&nbsp; &nbsp; 通过此次课程设计的实践，我接触到了structs2，spring以及hibernate这些以前从来没有接触过的技术，感受到了使用框架编写的便利，也熟悉了Netbeans这一新的编译环境。同时，增强了自己html和CSS的编写能力，为今后在前台方面的继续钻研奠定了坚实的基础。也是这次实践后才发现：配置的问题是非常重要的，如果不解决好，可能直接导致无法编程，无法很好的参与进项目中去，实现自己的价值。此外，很多问题都是要动手编程后才会发现，很多函数、标签等的使用也只有在产生了相应的想法之后才会去看具体的实现如何完成。</p>
                                        <p>
&nbsp; &nbsp;&nbsp; &nbsp;在我看来，这种亲自动手编写的任务才是真正能锻炼人的，因为每次做出了一点改动，都能在程序中反映出来，每一个小细节里都包含着程序员们智慧的结晶。然而，大家在编写时处于无人指导的状态，只能互相借鉴或上网搜索也是一个问题。然而，即使老师来指导，也无法顾及这么多同学，因此，还是要鼓励大家互相帮助。有人去咨询了比较厉害的人帮助自己解决了问题，最好还是分享一下经验，因为大家极有可能遇到类似的问题。或者可以建立一个平台，用以交流讨论，有利于大家的共同成长。
</p>

								  </div>

								
								</div>

							</li>

							<li class="timeline-blue">

								<div class="timeline-time">

									<span class="date">11/12/13</span>

									<span class="time">19:56</span>

								</div>

								<div class="timeline-icon"><i class="icon-bar-chart"></i></div>

								<div class="timeline-body">

									<h2>It's Ru's show time！</h2>

									<div class="timeline-content">
<p>
										<img class="timeline-img pull-left" src="../media/image/2.jpg" alt="">

								&nbsp; &nbsp;&nbsp; &nbsp;		这时自己的新的问题出现了：理论上是清楚了hibernate框架，但如何用netbeans去实现一个有hibernate框架的例子自己不是很清楚。开始看的实例教程发现hibernate都与其他技术结合使用，比如struts1.x、struts2、spring,导致我看到hibernate实例教程用到struts技术，自己去学习struts,看到又有用到spring技术，自己又去学习spring，我们开始的打算是用jsp、servlet技术去完成课设，没有确定用S2SH框架。自己花了一段时间去理解它们之间怎么完成一个案例的开发。但是我那时想找的是在Netbeans只应用hibernate技术的实例，多加练习。此时组长给了一个网址，是教如何在NetBeans中使用Hibernate，让我们按步骤一步步做一遍，体会一下。自己马上跟着教程在NetBeans里一步一步做下来，用hibernate对Sakila Sample Database操作。做的前两遍浏览器都没有成功跳出相应的页面，但在第三遍时终于发现问题所在并解决，浏览器终于出现了正确的页面，进行相应操作也是没问题，都有正确的页面出来，原因是自己太粗心，在某个jsp页面遗漏了相应的代码。在这个实例操作过程中自己也对hibernate技术有了清晰的认识。</p>
                                        
                          <p>     &nbsp; &nbsp;&nbsp; &nbsp;         前期组长给我们的任务分配是每个人负责一部分功能，以让我们都有所锻炼收获。自己负责的是管理员对教师信息的增删改功能，自己知道这是锻炼。因此很积极去解决自己负责的问题。慢慢地，组长依据组员各自的专长调整了任务分配，自己还是对后台功能感兴趣，因此自己还是在增删改功能方面继续锻炼。任务是明确了，接下来轮到怎么去实现这些功能。但这个问题很快解决了，组长给了我们一份很好的学习资料，是一个使用S2SH框架开发简单案例的视频教程。自己跟着教程去做，学到了很多，基本实现了简单的增删改功能。自己在完成编码后，Netbeans一直报错，说某个模块尚未部署。自己的编程水平有限，也不知道问题在哪里，便向组长请教，组长耐心解答我的疑问，帮我调程序。在调程序的过程中，发现了很多问题，比如版本过旧问题、架包冲突、缺少架包等等，知道错在哪里后，就采取相应的对策，比如升级版本、删除冲突架包中的其中一个、增加struts2-spring-plugin架包等等。在组长的帮助下，问题都得以解决，自己也学到了好多，对S2SH框架的实际应用有了更深了解。</p>
									</div>

								</div>

							</li>

						</ul>

					</div>

				</div>

			</div>

		</div>

	</div>

	<div class="footer"></div>

	<script src="../media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
        
	<script src="../media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="../media/js/bootstrap.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="../media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="../media/js/jquery.uniform.min.js" type="text/javascript" ></script>

	<script src="../media/js/app.js"></script>      

	<script>

		jQuery(document).ready(function() {   

		   App.init();

		});

	</script>
</html>
