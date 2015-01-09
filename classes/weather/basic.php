<?php
session_start();

function basic(){
require_once("simplepie.inc");
require_once("simplepie_yahoo_weather.inc");
if(($_SESSION['lang']=='')||($_SESSION['lang']=='en')){
	$path = "http://weather.yahooapis.com/forecastrss?u=f&p=";
}else{
	$path = "http://weather.yahooapis.com/forecastrss?u=c&p=";
}
$code = "MXNT1032";
$feed = new SimplePie();
$feed->set_feed_url($path.$code);
$feed->set_item_class('SimplePie_Item_YWeather');
$feed->init();

$weather = $feed->get_item(0);

echo $weather->get_temperature(); ?>&deg;<?php echo $weather->get_units_temp();
}?>
