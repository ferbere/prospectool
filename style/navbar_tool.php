<?php
session_start();
include_once("../classes/navbar.class.php");
$eje=new navBar(7,null,1);
$dame_eje=$eje->dBin($_SESSION['privilegioss_id']);
$dame_eje2=$eje->bTn();
echo '<div id="nb_tool">';
echo $dame_eje2;
echo '</div>';
?>
