<?php
session_start();
if(isset($_POST['user'])){
	$user=addslashes(trim($_POST['user']));
}
if(isset($_POST['passwd'])){
	$passwd=md5(addslashes(trim($_POST['passwd'])));
}
include_once("classes/mysql.php");
$mysql = new MySQL();
$sql=$mysql->consulta("SELECT prospecta_usuario.id,prospecta_usuario.user,prospecta_usuario.passwd,prospecta_privilegios.nombre,prospecta_privilegios.id FROM prospecta_usuario,prospecta_privilegios WHERE prospecta_usuario.user = '$user' AND prospecta_usuario.passwd = '$passwd' AND prospecta_usuario.privilegios = prospecta_privilegios.id") or die (mysql_error());
while($row=$mysql->fetch_array($sql)){
	$row_id =	$row[0];
	$row_a =	$row[1];
	$row_p =	$row[2];
	$row_r =	$row[3];
	$row_ri =	$row[4];
}
?>
	<div align="center">
<?php
if(isset($_GET['loop'])){
	$loop=$_GET['loop'];
}
if(isset($_POST['loop'])){
	$loop=$_POST['loop'];
}
if(empty($loop)){
	$loop=1;
}
if($row_a!=$user OR $row_p!=$passwd){
	$loop = $loop+1;
	if($loop<=3){
		echo $row_a.'<br>';
		echo $row_p.'<br>';
		echo '¡Ooops! Ha ocurrido algo inadecuado<br>';
		echo '<a href="sesion.php?loop='.$loop.'">Intenta de nuevo.</a><br>';		
	}else{
		header("Location:sesion.php?capturado=1");
		$_SESSION['ip'] = $_SERVER['REMOTE_ADDR'];
	}
}else{
	$_SESSION['id']				=	$row_id;
	$_SESSION['user']				=	$row_a;
	$_SESSION['privilegioss']		=	$row_r;
	$_SESSION['privilegioss_id']	=	$row_ri;
}
?>
	</div>