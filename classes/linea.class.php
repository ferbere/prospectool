<?php
function linea($rubro,$generacion,$pertenece,$primero){/*Recibe 4 datos de la p�gina principal: 1.-$rubro, que es el id de la primera referencia geneal�gica (sobre quien hacemos la consulta, y va bajando de generaci�n en generaci�n (de ascendiente a ascendiente); 2.- $generacion, que es el n�mero de generaci�n a quien pertenece el consultado, este dato tambi�n va saltando; 3.-$pertenece este es una constante, sobre a qu� generaci�n pertenece la priemra referencia geneal�gica; y 4.- $primero, que es la constante de sobre qui�n se hizo la consulta */
	include_once("classes/mysql.php");
	$mysql=new MySQL();
	$sql_linea=$mysql->consulta("SELECT genealogia_index.id,genealogia_index.nombre FROM genealogia_index INNER JOIN genealogia_fili ON genealogia_index.id = genealogia_fili.parent_f WHERE genealogia_index.nombre LIKE '%zuloaga%' && genealogia_fili.fili = '$rubro' ");
	$parentesco=array(1=>'hijo de: ',2=>'nieto de: ',3=>'bisnieto de :',4=>'tataranieto de: ',5=>'chozno de:',6=>'bichozno de: ',7=>'tatara chozno');
	while($row_linea=$mysql->fetch_array($sql_linea)){
		$devuelve 		= array(1=>$row_linea[0],2=>$row_linea[1]);
		echo '<hr>';
		$potencia = ($pertenece-$generacion);
		echo $primero.' es '.$parentesco[$potencia].'<br>';
		echo '<strong>'.$row_linea[1].'</strong> y<br>';
		$sql_cony=$mysql->consulta("SELECT DISTINCT genealogia_index.nombre FROM genealogia_index INNER JOIN genealogia_conyuge ON genealogia_index.id = genealogia_conyuge.parent || genealogia_index.id = genealogia_conyuge.conyuge WHERE genealogia_index.id != '$row_linea[0]' AND genealogia_conyuge.parent = '$row_linea[0]' || genealogia_conyuge.conyuge = '$row_linea[0]' ");
		while($row_cony=$mysql->fetch_array($sql_cony)){
			$sql_hijos=$mysql->consulta("SELECT genealogia_index.id,genealogia_index.nombre FROM genealogia_index INNER JOIN genealogia_fili ON genealogia_index.id = genealogia_fili.fili WHERE genealogia_fili.parent_f = '$row_linea[0]' || genealogia_fili.parent_f = '$row_cony[0]' ORDER BY fecha_nac ASC");
			if($row_cony[0]!=$row_linea[1]){
				echo $row_cony[0].'<br>';
				echo '...de la '.$generacion.'a generaci�n, quienes en total tuvieron a:<br>';
				echo '<div style="padding-left:20px">';
				while($row_hijos=$mysql->fetch_array($sql_hijos)){
					if($rubro==$row_hijos[0]){
						$prev = '<b>';
						$post = '</b>';
					}else{
						$prev = '';
						$post = '';
					}
//					echo $rubro;
					echo $prev.$row_hijos[1].$post.'<br>';
				}
				echo '</div>';
			}
		}
	}
	return $devuelve;
}
?>