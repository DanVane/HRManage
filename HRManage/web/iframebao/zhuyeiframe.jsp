<%-- 
    Document   : zhuyeiframe
    Created on : 2013-12-22, 15:06:27
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">

	<!-- Use the .htaccess and remove these lines to avoid edge case issues.
			 More info: h5bp.com/i/378 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>Home</title>
	<meta name="description" content="">

	<!-- Mobile viewport optimized: h5bp.com/viewport -->
	<meta name="viewport" content="width=device-width">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->

	<link rel="stylesheet" href="../media2/css/bootstrap.css">
	<link rel="stylesheet" href="../media2/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="../media2/js/flexslider.css" type="text/css">
	<link rel="stylesheet" href="../media2/css/style.css">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>

	<!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->

	<!-- All JavaScript at the bottom, except this Modernizr build.
			 Modernizr enables HTML5 elements & feature detects for optimal performance.
			 Create your own custom Modernizr build: www.modernizr.com/download/ -->
	<script src="../media2/js/vendor/modernizr-2.5.3.min.js"></script>
</head>
<body>
    
       <!--             确定已登录         -->
   <% if( session.getAttribute("loginUser")==null && session.getAttribute("loginManager")==null ) { %>

        <script>
             alert("您尚未登录，请先登录！");
              window.location="../firstJsp/userLogin.jsp";
           </script>
           
           <%  }%>
	<!-- Prompt IE 6 users to install Chrome Frame. Remove this if you support IE 6.
			 chromium.org/developers/how-tos/chrome-frame-getting-started -->
	<!--[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->

<!-- Header --> 

<div class="container">
	
	<section class="promo_slider">

		<div class="slider_border">
			<div class="slides_container">
				<div><img src="../media2/img/111.jpg" height="500" /></div>
				<div><img src="../media2/img/222.jpg" height="500" /></div>
				<div><img src="../media2/img/333.jpg" height="500" /></div>        
			</div>
		</div>
		<div id="pagination">
			<ul class="pagination">
				<li class="current">
					<a href="#0"></a>
				</li>
				<li>
					<a href="#1"></a>
				</li>
				<li>
					<a href="#2"></a>
				</li>
			</ul>
			<div class="clear"></div>
		</div>    
		<a href="#" class="next"></a> <a href="#" class="prev"></a> 
	</section>
  <div class="h_line"></div>
<div class="h_line"></div>
<div class="h_line"></div>

</div>

<!-- footer --><!-- footer end -->


	<!-- JavaScript at the bottom for fast page loading: http://developer.yahoo.com/performance/rules.html#js_bottom -->

	<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../media2/js/vendor/jquery-1.7.2.min.js"><\/script>')</script>


	<script src="../media2/js/jquery-1.7.1.min.js"></script>

	<!-- jQuery tools start -->
	<script type="text/javascript" src="../media2/js/jquery.tools.min.js"></script>
	<!-- jQuery tools end -->

	<!-- FlexSlider start -->
	<script type="text/javascript" src="../media2/js/jquery.flexslider-min.js"></script>
	<!-- FlexSlider end -->

	<!-- PrettyPhoto start -->
	<link rel="stylesheet" href="../media2/js/prettyphoto/css/prettyPhoto.css" type="text/css"/>
	<script type="text/javascript" src="../media2/js/prettyphoto/jquery.prettyPhoto.js"></script>
	<!-- PrettyPhoto end -->

	<!-- scripts concatenated and minified via build script -->
	<script src="../media2/js/plugins.js"></script>
	<script src="../media2/js/slides.js"></script>
	<script src="../media2/js/main.js"></script>

	<script type="text/javascript">
    	/* testimonials initialization */
		$('#testimonials').flexslider({
			slideshow : false,
			controlNav : false,
			controlsContainer : '.testimonials_nav'
		});
	</script>

	<script type="text/javascript">
    	/* recent projects initialization */
		$('#recent_projects_gallery').flexslider({
			slideshow : false,
			directionNav : false,
			controlsContainer : '#pager_recent_projects_gallery'
		});
	</script>
	<!-- end scripts -->

	<!-- Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID.
			 mathiasbynens.be/notes/async-analytics-snippet -->
 
	<script>
		var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
		(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
		g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
		s.parentNode.insertBefore(g,s)}(document,'script'));
	</script>
	

</body>
</html>
