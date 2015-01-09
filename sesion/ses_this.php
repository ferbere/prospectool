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
$sql=$mysql->consulta("SELECT activismo_index.user,activismo_index.passwd,activismo_rango.nombre,activismo_rango.id FROM activismo_index,activismo_rango WHERE activismo_index.user = '$user' AND activismo_index.activated = 1 AND activismo_index.passwd = '$passwd' AND activismo_index.rango = activismo_rango.id") or die (mysql_error());
while($row=$mysql->fetch_array($sql)){
	$row_a =	$row[0];
	$row_p =	$row[1];
	$row_r =	$row[2];
	$row_ri =	$row[3];
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
	$_SESSION['activista']	=	$row_a;
	$_SESSION['rango']		=	$row_r;
	$_SESSION['rango_id']	=	$row_ri;
}
?>
	</div>