<!DOCTYPE html>
<html>
<head>
<title>Prospecta</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="style/style_preindex.css" />
<script type="text/javascript">  
var num=3;
function contador() {  
  num--;  
  if(num==0) location='../admin';
  document.getElementById('seg').innerHTML=num;  
}  
</script>
</head>
<body onload="setInterval('contador()',1000)">
<!--	<header>
		<div id="header1">
			<div id="header-1"><img src="../style/images/{logo}"></div>
			<div id="header-2">{header}</div>
		</div>
		<div id="header2">{navbar}</div>
	</header>-->
<div id="bing">
			<div id="main"><img src="style/images/so.png"></div>
			<div style="margin:0px auto; text-align:center"><p>Redirecci&oacute;n en <span id="seg">3</span> segundos.</p></div>
			<div id="foot"></div>
</div><!--termina bing-->
</body>
</html>
<?php
//include("main.php");

?>
