<!DOCTYPE html>
<html>
<head>
<title>{title}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<link rel="stylesheet" type="text/css" href="style/style.css" />
<link rel="stylesheet" type="text/css" href="style/style_opinion.css" />
<link rel="stylesheet" type="text/css" href="style/{css}" />
<link rel="stylesheet" type="text/css" href="style/font-awesome.css" />
<script src="library/jquery-1.4.3.min.js" type="text/javascript"></script>
</head>
<body>
<!--		<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>-->
	<header>
		<div id="header">
			{navbar}
		</div>
	</header>
	<div id="bing">
	<div id="nivel1">{maincontent}</div>
	<div id="nivel2">{main_object}</div>
	</div>
	<footer>{footer}</footer>
</body>
</html>