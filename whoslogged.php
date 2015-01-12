<?php
session_start();
if(empty($_SESSION['privilegioss_id'])){
//	include("enruta_admin.php");
	header("Location: sesion.php");
}
echo 'Usuario:: <b>'.$_SESSION['user'].'</b>';
?>