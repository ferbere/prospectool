<?php
session_start();
echo '<div id="sesion_1" style="padding-top:5em">';
if($_SESSION['user']!=''){
	echo '<div align="center"><a href="index.php">Entrar al sistema</a><br><br>';
	echo '<br>'.$_SESSION['user'].', te bienvenimos.<br>';
	echo '<br><a href="sesion.php?ruta=destroy_sesion.php">Cerrar la sesión</a></div>';
}else{
	if(isset($_POST['capturado'])){
		$capturado=$_POST['capturado'];
	}
	if(isset($_GET['capturado'])){
		$capturado=$_GET['capturado'];
	}
	if(isset($_GET['adios'])){
		$adios=$_GET['adios'];
	}
	if(isset($_GET['created'])){
		$created=$_GET['created'];
	}
	if(empty($capturado)){
		if(!empty($created)){
			include_once("classes/mysql.php");
			$mysql = new MySQL();
			$sql = $mysql->consulta("SELECT contenido FROM corporativa_index WHERE id = 6");
			while ($row=$mysql->fetch_array($sql)){
				echo $row[0].'<br>';
			}			
		}else{
			include("sesion/login_this.php");
			echo 	'<div style="margin:0 auto; text-align:center">';
/*			echo 		'<a href="sesion.php?ruta=account.php">';
			echo 			'Crear cuenta';
			echo 		'</a>';*/
			echo 	'</div>';	
		}
	}elseif(!empty($capturado)&&($_SESSION['ip']=='')){
		include("sesion/ses_this.php");
	}elseif(!empty($capturado)&&($_SESSION['ip']!='')){
		echo '<div style="text-align:center">';
		echo '¡Demasiados intentos!<br> ¿Olvidaste la contraseña?<br>';
		echo '<a href="sesion.php?ruta=restore.php">Restaurar la contraseña</a>';
		echo '</div>';
	}else{
		
	}
}
echo '</div>';
?>