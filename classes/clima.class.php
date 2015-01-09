<?php
require("simplepie.inc");
require("simplepie_yahoo_weather.inc");
 
$code = "PEXX0011";
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
$ampm = "n";  // indica noche
$icon = $weather->get_condition_code();
// Calculamos la hora de Lima en minutos
$curday = 2*60 + time2minuts(date("g:i a"));
$iniday = time2minuts($weather->get_sunrise());
$endday = time2minuts($weather->get_sunset());
 
if ($curday> $iniday && $curday <$endday ) {
    $ampm = "d"; // indica dia
}
?>