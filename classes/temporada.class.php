<?php
	function temporada($fecha,$catalogo){
		include_once("mysql.php");
		$mysql = new MySQL();
		$sql = $mysql->consulta("SELECT id,nombre FROM catalogo_temporadas WHERE '$fecha' BETWEEN desde AND hasta ");
		$row= $mysql->fetch_array($sql);
			$id 		=	$row[0];
			$nombre 	=	$row[1];
			$sel		= 'precio_'.$nombre;
			$sql2 = $mysql->consulta("SELECT ".$sel.",nombre FROM catalogo_index WHERE id = '$catalogo' ");
			$row2 = $mysql->fetch_array($sql2);
			$precio 	= $row2[0];
			$villa	 	= $row2[1];	
			return $temporada = array(1=>$villa,2=>$nombre,3=>$precio);
	}
	
?>