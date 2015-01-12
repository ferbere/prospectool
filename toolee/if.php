<?php
session_start();
include_once("../classes/mysql.php");
$mysql=new MySQL();

if(isset($_GET['tipo'])){
	$tipo=$_GET['tipo'];
}
if(isset($_GET['producto'])){
	$producto=$_GET['producto'];
}
if(empty($_SESSION['mesa_nom'])){
	$mesa0 = 'cliente: '.$_SESSION['cliente_n'];
}else{
	$mesa0 = $_SESSION['mesa_nom'].'<br>
	 		<div id="mesa_subt">('.$_SESSION["mesa_personas"].' personas)</div>';
}
?>
<div id="mesa">
	<div id="mesa_head">
		<div id="mesa_titulo">
			<?php
			echo $mesa0;
			?>
		</div>
		<div id="mesa_suma">

		</div>
	</div>
	<div id="mesa_body2">
			<div id="mesa_body-listado">
		<ul>
			<table>
	<?php
	if(empty($producto)&&(empty($tipo))){//Para seleccionar tipo de platillo
		$sql=$mysql->consulta("SELECT id,nombre FROM restaurante_categoria");
		while($row=$mysql->fetch_array($sql)){
			echo '<li><a href="'.$_SERVER['PHP_SELF'].'?ruta=if.php&tipo='.$row[1].'">'.$row[1].'</a></li>';
		}
	}elseif(empty($producto)&&(!empty($tipo))){//Para seleccionar platillo concreto
		$sql2=$mysql->consulta("SELECT restaurante_index.id,restaurante_index.nombre,restaurante_index.precio,restaurante_categoria.nombre,restaurante_index.subnombre FROM restaurante_index INNER JOIN restaurante_categoria ON restaurante_index.categoria = restaurante_categoria.id WHERE restaurante_categoria.nombre = '$tipo'");
		$i=0;
		$v=array();
		echo '<span id="tomando-orden">--tomando orden--</span>';
		echo '<br>'.$tipo.'<br>';
		echo '<form method="get" action="'.$_SERVER['PHP_SELF'].'">';
		echo '<input type="hidden" name="ruta" value="ip.php">';
		echo '<input type="hidden" name="tipo" value="'.$tipo.'">';
		echo '<input type="hidden" name="iden" value="'.$iden.'">';
		echo '<input type="hidden" name="personas" value="'.$_SESSION['mesa_personas'].'">';
		while($row2=$mysql->fetch_array($sql2)){
			$v[$i['producto']]=$row2[0];
			echo '<tr><td>';
			echo '<li>';
			echo 		$row2[1].' <small>'.$row2[4].'</small>';
			echo '</td>';
			echo '<td>';
			echo '<input type="hidden" name="producto'.$i.'" value="'.$v[$i['producto']].'">';
			echo '</td>';
			echo '<td>';
			echo 		" <small>($".$row2[2].')</small>';
			echo '</td>';
			echo '<td>';

			echo '<input type="number" name="cantidad'.$i.'" placeholder="0" min="0" >';
			echo '</li>';
			echo '</td></tr>';
			$i=$i+1;
		}
			echo '<tr><td colspan="4" align="center">';
			echo '<input type="hidden" name="i" value="'.$i.'">';
			echo '<input type="submit" class="submit rounded_min" value="ordenar">';
			echo '</form>';
			echo '</td></tr>';
			echo '</table>';
	}
	?>
		</ul>
		</div>
	</div>
</div>