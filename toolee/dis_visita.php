<?php
include_once("../classes/dis_visita.class.php");
$dis=new dis_visita('tool','ver_visita.php','null');
$disp=$dis->dv();
echo $disp;
?>