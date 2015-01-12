<?php
session_start();

unset($_SESSION['cliente']);
unset($_SESSION['cliente_n']);
unset($_SESSION['cliente_id']);
unset($_SESSION['mesa']);

if($_SESSION['privilegioss_id']==1){
	include("visita.php");
}elseif($_SESSION['privilegioss_id']==2){
	include("");	
}elseif($_SESSION['privilegioss_id']==3){
	include("");	
}elseif($_SESSION['privilegioss_id']==4){
	include("");
}elseif($_SESSION['privilegioss_id']==5){
	include("visita.php");
}else{
	include("");
}



?>