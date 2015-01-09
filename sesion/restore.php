<div id="session_1" style="; padding-top:15%">
<?php
if(isset($_GET['mail'])){
	$mail=$_GET['mail'];
}
if(isset($_GET['restored'])){
	$restored=$_GET['restored'];
}
if(empty($mail)&&(empty($restored))){
	echo '<div style="margin:0 auto; text-align:center">';
	echo 	'<form method="GET" action="sesion.php">';
	echo 	'<input type="hidden" name="ruta" value="restore.php">';
	echo 	'<input type="email" name="mail" placeholder="Type your mail">';
	echo 	'<input type="submit" value="send">';
	echo '</div>';
}elseif(!empty($mail)&&(empty($restored))){
	include_once("classes/passwd.class.php");
	include_once("classes/mysql.php");
	$mysql = new MySQL();
	$sql = $mysql->consulta("SELECT id,mail,name FROM comprar_directorio WHERE mail = '$mail' ");
	$cuenta = $mysql->num_rows($sql);
	$row=$mysql->fetch_array($sql);
		if($cuenta>0){
			$clave = generar_clave(10);
			if(!isset($passwd)){
				$passwd=md5(addslashes(trim($clave)));
			}
			$sql2 = $mysql->consulta("UPDATE comprar_directorio SET passwd = '$passwd' WHERE mail = '$mail' ");
			unset($_SESSION['ip']);
			header("Location:sesion.php?ruta=restore.php&restored=1&clave=$clave");
		}else{
			echo 'Sorry, There aren´t matches in our records to '.$mail.'<br>';
		}
}elseif(!empty($restored)){
	if(isset($_GET['clave'])){
		$clave=($_GET['clave']);
	}
	echo "La contraseña es ".$clave.'<br>';
	echo 'Your new password has been successfully restored! Please, check your email to find it (If You don´t, You should take a look in your spam folder)';
}
?>
</div>