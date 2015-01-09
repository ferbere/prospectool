<?php
if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
}
if(empty($rubro)){
	$rubro=1;
}
include_once("classes/conex.php");
$link= Conectarse();  
 $consulta=mysql_query("SELECT titulo,contenido FROM corporativa  WHERE id = '$rubro'",$link);  
	  while($resultados=mysql_fetch_array($consulta)){  
		echo '<h1>'.$resultados['titulo'].'</h1>';
		echo $resultados['contenido'];  
	  } 
	if($rubro==10){
		echo '<h1>Envíenos un mail</h1>';
		include("admin/gadgets/mensajes/exe_if_mensaje.php");
	}
?>