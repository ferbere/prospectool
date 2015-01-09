<?php
session_start();
if($_GET['muestra']){
	$muestra=$_GET['muestra'];
}
if($_GET['notas']){
	$notas=$_GET['notas'];
}
if($_GET['cliente']){
	$cliente=$_GET['cliente'];
}
if($_GET['reparte']){
	$reparte=$_GET['reparte'];
}
if($_GET['liga']){
	$liga=$_GET['liga'];
}
if($_SESSION['privilegioss_id']<5){
	$revisar=$reparte;
	$liga='&reparte='.$reparte;
}else{
	$revisar=$_SESSION['id'];
	$liga='';
}

include_once("../classes/mysql.php");
include_once("../classes/transito.class.php");
include("../classes/abre_cierra.class.php");
include_once("../classes/nota_fetch.class.php");
$mysql=new MySQL();
	$sql=$mysql->consulta("SELECT @rownum:=@rownum+1, restaurante_clientes.nombre,restaurante_domicilios.direccion,restaurante_domicilios.cruza1,restaurante_domicilios.cruza2,SUM(restaurante_index.precio*restaurante_consumo.cantidad) AS total,restaurante_consumo.cliente,restaurante_entrega.estatus,restaurante_entrega.id FROM restaurante_consumo INNER JOIN restaurante_index ON restaurante_consumo.consumo = restaurante_index.id INNER JOIN restaurante_clientes ON restaurante_consumo.cliente = restaurante_clientes.id INNER JOIN restaurante_domicilios ON restaurante_clientes.id = restaurante_domicilios.cliente INNER JOIN restaurante_entrega ON restaurante_clientes.id = restaurante_entrega.cliente, (SELECT @rownum := 0) r WHERE restaurante_entrega.repartidor = '$revisar' GROUP BY restaurante_consumo.cliente");
	
	$sql2=$mysql->consulta("SELECT user FROM usuario_index WHERE id = '$revisar'");
	$row2=$mysql->fetch_array($sql2);
?>
<table class="Table">
	<tr>
		<td class="Title" colspan="4">
	        <p>Reparto asignado a <?php echo $row2[0];?></p>
	    </td>
	</tr>
    <tr class="Heading">
        <td class="Cell">
            <p>orden</p>
        </td>
        <td class="Cell">
            <p>nombre</p>
        </td>
        <td class="Cell">
            <p>Dirección</p>
        </td>
        <td class="Cell">
            <p>Total</p>
        </td>
    </tr>
<?php	
	while($row=$mysql->fetch_array($sql)){
		if($row[7]==5){
			$styl='si';
		}elseif($row[7]==6){
			$styl='no';
		}else{
			$styl='';
		}
		
		$pedido=$row[8];
?>

    <tr class="Row">
        <td class="Cell" id="styl_<?php echo $styl ?>">
            <p><?php echo $row[0] ?></p>
        </td>
        <td class="Cell" id="styl_<?php echo $styl ?>">
            <p class="link_t"><a href="index.php?ruta=asignado.php&muestra=1&cliente=<?php echo $row[6].$liga?>">
				<?php echo $row[1] ?>
			</a></p>
        </td>
        <td class="Cell" id="styl_<?php echo $styl ?>">
            <p><?php echo $row[2].'. Entre '.$row[3].' y '.$row[4].'.' ?></p>
        </td>
        <td class="Cell" id="styl_<?php echo $styl ?>">
            <p><?php echo $row[5] ?></p>
        </td>
    </tr>
		<?php 
	if(($muestra==1)&&($cliente==$row[6])){
		echo 	'<tr>';
		echo		'<td class="Wide" colspan="4">';

				$transito=new transito($revisar,$row[6]);
				$sal= $transito->tRan();
		echo 		'</td>';
		echo 	'</tr>';
		if(($notas==1)||($notas==2)||($notas==3)){
		echo '<tr>';
		echo 	'<td colspan="4">';
					include("notas.php");
		echo 	'</td>';
		echo '</tr>';
		}else{
		echo '<tr>';
		echo 	'<td colspan="4">';
		echo nota_F($pedido);
		echo 	'</td>';
		echo '</tr>';
		}
	}
}
?>
</table>