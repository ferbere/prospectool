<?php
require("simplepie.inc");
require("simplepie_yahoo_weather.inc");

$code = "MXNT1032";
$path = "http://weather.yahooapis.com/forecastrss?u=c&p=";

$feed = new SimplePie();
$feed->set_feed_url($path.$code);
$feed->set_item_class('SimplePie_Item_YWeather');
$feed->init();

function time2minuts($time) {
	$minuts = 0;
	$atime = explode(" ", $time);
	if (strtolower($atime[1]) == "pm") {
		$minuts = 12*60;
	}
	$ttime = explode(":", $atime[0]);
	$minuts = $minuts + (int)$ttime[0]*60 + (int)$ttime[1];
	return $minuts;
}

$weather = $feed->get_item(0);
$fore = $weather->get_forecasts();
$unit = $weather->get_units_temp();
$ampm = "n";
$icon = $weather->get_condition_code();
$curday = 2*60 + time2minuts(date("g:i a"));
$iniday = time2minuts($weather->get_sunrise());
$endday = time2minuts($weather->get_sunset());

if ($curday > $iniday && $curday < $endday ) {
	$ampm = "d";
}  
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Yahoo Weather</title>
<style type="text/css">
<!--
body {
	font-family: "Trebuchet MS", Tahoma, Verdana;
	font-size: 12px;
	font-weight: normal;
	color: #777777;
	text-decoration: none;
	background-color: #FFFFFF;
}
#weather {
	width: 240px;
	height: 120px;
}
#current {
	width: 240px;
	height: 120px;
	text-align: right;
	color: #FFFFFF;
	font-weight: bold;
}
#current #temp {
	font-size: 24px;
	font-style: normal;
	padding-top: 40px;
	padding-right: 16px;
}
#current #fore {
	padding-right: 16px;
	font-size: 11px;
}
#current #city {
	padding-right: 16px;
}
-->
</style>
</head>
<body>
<div id="weather" style="background:url('icon<?php echo $ampm; ?>.png') no-repeat 40px 40px;">
	<div id="current" style="background:url('http://l.yimg.com/us.yimg.com/i/us/nws/weather/gr/<?php echo $icon.$ampm; ?>.png') no-repeat 0px -10px;">
		<div id="temp"><?php echo $weather->get_temperature(); ?>&deg;<?php echo $unit; ?></div>
		<div id="fore"><?php echo $fore[0]->get_low()."&deg;".$unit; ?> - <?php echo $fore[0]->get_high()."&deg;".$unit; ?></div>
		<div id="city"><?php echo $weather->get_city().", ".$weather->get_country(); ?></div>
	</div>
</div>
</body>
</html>