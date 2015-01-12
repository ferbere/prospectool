<?php
error_reporting(0);

session_start();
include_once("../classes/navbar.class.php");
include_once("../classes/subtotal_general.class.php");
include_once("../classes/mysql.php");
$mysql=new MySQL();
unset($_SESSION['mesa']);
unset($_SESSION['cliente_id']);
unset($_SESSION['cliente_n']);
?>
<div id="transito_estatus"><h2><?php echo $_SESSION['cliente_e'] ?></h2></div>
<div id="mesa">
	<div id="mesa_head">
		<div id="mesa_titulo">
<!--			mesa <?php echo $_SESSION['mesa']?>-->
		</div>
		<div id="mesa_titulo2">
		</div>
		<div id="mesa_suma">

		</div>
	</div>
	<div id="mesa_body3">
		<ul>
	<?php
	$sql2=$mysql->consulta("SELECT restaurante_consumo.id,restaurante_index.nombre,restaurante_index.precio,restaurante_consumo.cantidad,restaurante_index.precio*restaurante_consumo.cantidad as subcuenta,restaurante_categoria.nombre,restaurante_clientes.nombre,restaurante_domicilios.direccion,restaurante_clientes.id,restaurante_estatus.nombre,restaurante_domicilios.cruza1,restaurante_domicilios.cruza2,restaurante_estatus.id FROM restaurante_index INNER JOIN restaurante_consumo ON restaurante_index.id = restaurante_consumo.consumo INNER JOIN restaurante_categoria ON restaurante_index.categoria = restaurante_categoria.id INNER JOIN restaurante_clientes ON restaurante_consumo.cliente = restaurante_clientes.id INNER JOIN restaurante_estatus ON restaurante_consumo.estatus = restaurante_estatus.id INNER JOIN restaurante_domicilios ON restaurante_clientes.id = restaurante_domicilios.cliente WHERE (restaurante_consumo.estatus = 0 OR restaurante_consumo.estatus = 3) AND restaurante_consumo.mesa = 0 ORDER BY restaurante_clientes.id DESC ");
		echo '<span id="tomando-orden">--en tránsito--</span>';
	$cuantos=$mysql->num_rows($sql2);
	if($cuantos>=1){
		$suma=0;
		while($row2=$mysql->fetch_array($sql2)){
			$id=$row2[8];//clientes.id
			$varia[]=$row2[8];
			if($row2[12]==3){//estatus.id
				$sql3=$mysql->consulta("SELECT restaurante_estatus.nombre,usuario_index.user,usuario_index.id,restaurante_estatus.id FROM restaurante_estatus INNER JOIN restaurante_entrega ON restaurante_estatus.id = restaurante_entrega.estatus INNER JOIN usuario_index ON restaurante_entrega.repartidor = usuario_index.id WHERE restaurante_entrega.cliente = '$id' ");
				$row3=$mysql->fetch_array($sql3);

				if($row3[3]==4){//estatus
					$estatus = $row3[0].' <small>(a <a href="index.php?ruta=asignado.php&reparte='.$row3[2].'">'.$row3[1].'</a>)</small>';
					$estatus_id[$id]=$row3[3];
				}else{
					$estatus=$row3[0];
					$estatus_id[$id]=$row3[3];
				}
			}else{
				$estatus=$row2[9];
				$estatus_id[$id]=$row2[12];
			}
			$nombre = '<a href="?ruta=if_a.php&rubro=0&xyo='.$id.'">'.$row2[6].'</a><br> <small>('.$row2[7].', entre '.$row2[10].' y '.$row2[11].')</small><br> <span id="estatus">'.$estatus.'</span>';
		    $subcuentas[$nombre][] = '<td><b>'.$row2[1].'</b></td><td>'.$row2[3].'</td><td class="peq">x ($'.$row2[2].')</td><td>-></td><td>$'.$row2[4].'</td><td><a href="'.$_SERVER['PHP_SELF'].'?ruta=cancelar.php&rubro='.$row2[0].'">cancelar</a></td>';
		}
			echo '<table id="if_a">';
		    foreach ($subcuentas as $nombre => $desglose){
				echo '<tr><td colspan="6"><h3>'.$nombre.'</h3></td></tr>';
		    	foreach ($desglose as $consumo){
					echo '<tr>'.$consumo.'</tr>';
		    	}	
				$soc=new sC($suma);
				$file=$soc->sCon();
				$elif=$soc->sCli();
					echo '<tr>';
					echo 	'<td colspan="5">';
					$varias=array_unique($varia);
					$variasd=array_values($varias);
					$naa=new navBar(5,$variasd[$suma],$estatus_id[$elif]);
					echo $naa->nB();
					echo 	'</td>';
					echo 	'<td id="if_a-total">';
					echo 		'Total $'.$file;
					echo 	'</td>';
					echo '</tr>';
					$suma=$suma+1;
		    }
	    	echo '</table>';
	}else{
//		echo 	'<script>window.location.href="'.$_SERVER['HTML_REFERER'].'?ruta=ordenes_caja.php";</script>';	
		echo '<br><br>No hay registros';
	}
?>
		</ul>
	</div>
</div>