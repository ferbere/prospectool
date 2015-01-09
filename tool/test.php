<?php
session_start();
echo 'Memoria usada en bytes '.memory_get_usage().'<br>';
//$privilegios=$_SESSION['privilegioss_id'];
$privilegios=5;
echo '<h1>Valores</h1>';
echo 'privilegios del usuario actual: '.$privilegios.'<br><br>';

include_once("../classes/test3.class.php");
$eje=new tT3(7,null,1);
$dame_eje=$eje->T3($privilegios);
$dame_eje2=$eje->cCa();
echo $dame_eje2;
?>
