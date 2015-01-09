<?php
function linea($padre,$dos){
	include_once("classes/mysql.php");
	$mysql=new MySQL();
	$sql_linea=$mysql->consulta("SELECT parent_f,parentesco FROM genealogia_fili WHERE fili = '$dos' AND parentesco = 1");
	while($row_linea=$mysql->fetch_array($sql_linea)){
		$devuelve = array(1=>$row_linea[0],2=>$row_linea[1]);
	}
	return $devuelve;
}

function linea_nombre($rubro){
	include_once("classes/mysql.php");
	$ini='<strong>';
	$ter='</strong>';
	$mysql=new MySQL();
		$sql_cony=$mysql->consulta("SELECT genealogia_index.id,genealogia_index.nombre,genealogia_index.genero FROM genealogia_index INNER JOIN genealogia_conyuge ON genealogia_index.id = genealogia_conyuge.parent || genealogia_index.id = genealogia_conyuge.conyuge WHERE  genealogia_conyuge.conyuge = '$rubro' || genealogia_conyuge.parent = '$rubro'");
		while($row_cony=$mysql->fetch_array($sql_cony)){
			echo $ini.$row_cony[1].$ter.'<br>';
			if($row_cony[2]==0){
				$sql_fil=$mysql->consulta("SELECT genealogia_index.id,genealogia_index.nombre FROM genealogia_index INNER JOIN genealogia_fili ON genealogia_index.id = genealogia_fili.fili WHERE genealogia_fili.parent_f = '$row_cony[0]' ");
				echo '<div style="padding-left:20px">';
				while($row_fil=$mysql->fetch_array($sql_fil)){
					echo $row_fil[1].'<br>';
					$devuelve2=array(1=>$row_fili[1]);
				}
				echo '</div>';
			}
		}
}
?>