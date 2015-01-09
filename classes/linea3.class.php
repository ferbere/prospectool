<?php
function uno($uno){
	include_once("classes/mysql.php");
	$mysql=new MySQL();
	$sql=$mysql->consulta("SELECT generacion FROM genealogia_index WHERE id = '$uno' ");
	$row=$mysql->fetch_array($sql);
	for($i=1;$i<$row[0];$i++){
		$sql_linea=$mysql->consulta("SELECT genealogia_fili.parent_f,genealogia_fili.fili,genealogia_index.nombre FROM genealogia_fili INNER JOIN genealogia_index ON genealogia_fili.parent_f = genealogia_index.id WHERE genealogia_fili.fili = '$uno' AND genealogia_fili.parentesco = 1 ");
		while($row_linea=$mysql->fetch_array($sql_linea)){
			$devuelve = array(1=>$row_linea[0],2=>$row_linea[2],3=>$row[0]);
		}
	}
	return $devuelve;
}
function dos($dos){
	include_once("classes/mysql.php");
	$mysql=new MySQL();
	$sql_dos=$mysql->consulta("SELECT genealogia_index.id,genealogia_index.nombre FROM genealogia_index INNER JOIN genealogia_fili ON genealogia_index.id = genealogia_fili.fili WHERE genealogia_fili.parent_f = '$dos'");
	$cuenta_dos=$mysql->num_rows($sql_dos);
	while($row_dos=$mysql->fetch_array($sql_dos)){
		$devuelve_dos = array(1=>$row_dos[0],2=>$row_dos[1]);
		echo $devuelve_dos[2].'<br>';
	}
//	return $devuelve_dos;
}

/*function corrido($rubro){
	include_once("classes/mysql.php");
	$mysql=new MySQL();
	
}*/
?>