<?php
if(!isset($_GET["rubro"])&&!isset($_GET["xyo"])&&!isset($_GET["mesa"])&&!isset($_GET["abre"])&&!isset($_GET["cancelar"])){
header("Location: ".$_SERVER['PHP_SELF'].'?ruta=transito.php');
}

session_start();
include_once("../classes/navbar.class.php");
include_once("../classes/sesion_cliente.class.php");
include("../classes/abre_cierra.class.php");
include_once("../classes/mysql.php");
$mysql=new MySQL();
$naa=new navBar(4,'',4);
include_once("../classes/mesa.class.php");

if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
	$mes=new meSa($rubro,'if_a');
	$unset = $mes->meS_unset();//Borra las sesiones activas de mesa y cliente
	$messa = $mes->meS_msa();
	$_SESSION['mesa']=$rubro;
	$_SESSION['mesa_nom']=$messa[0];
	$_SESSION['mesa_personas']=$messa[1];
}
if(isset($_GET['personas'])){
	$mesa_personas=$_GET['personas'];
}
if(isset($_GET['xyo'])){
	$xyo=$_GET['xyo'];
}
if(isset($_GET['cancelar'])){
	$cancelar=$_GET['cancelar'];
}
if(!isset($mesa)){
	$mesa=$_SESSION['mesa'];
}
if(!isset($_SESSION['cliente_id'])){
	$_SESSION['cliente_id']=$xyo;
}
if(!isset($cliente_id)){
	$cliente_id=$_SESSION['cliente_id'];
}
if(!isset($_GET['abre'])){
	$abre='none';
}
?>
<div id="mesa">
	<div id="mesa_head">
	<div id="mesa_titulo">
		<?php
		if(empty($_SESSION['cliente_e'])){
			echo $_SESSION['mesa_nom'].'<br>';
			echo '<div id="mesa_subt">('.$_SESSION["mesa_personas"].' personas)</div>';
		}else{
//			sesionCliente($rubro,$cliente_id);	
		}
		?>

	</div>
		<div id="mesa_suma">

		</div>
	</div>
	<div id="mesa_body">
	<?php
	if($_SESSION['mesa']==0){
		$cliente=" AND restaurante_consumo.cliente = ".$cliente_id;
	}
	$sql2=$mysql->consulta("SELECT restaurante_consumo.id,restaurante_index.nombre,restaurante_index.precio,restaurante_consumo.cantidad,restaurante_index.precio*restaurante_consumo.cantidad as subcuenta,restaurante_categoria.nombre FROM restaurante_index INNER JOIN restaurante_consumo ON restaurante_index.id = restaurante_consumo.consumo INNER JOIN restaurante_categoria ON restaurante_index.categoria = restaurante_categoria.id WHERE restaurante_consumo.estatus = 0 AND restaurante_consumo.mesa = '$mesa' ".$cliente);
		echo '<span id="tomando-orden">--cuenta--</span>';
	$cuantos=$mysql->num_rows($sql2);
	if($cuantos>=1){

		while($row2=$mysql->fetch_array($sql2)){
			$categoria = $row2[5];
		    $subcuentas[$categoria][] = "<td><b>".$row2[1].'</b></td><td>'.$row2[3].'</td><td class="peq">x ($'.$row2[2].')</td><td>-></td><td>$'.$row2[4].'</td><td id="m_b_c"><a href="'.$_SERVER['PHP_SELF'].'?ruta=cancelar.php&cancelar='.$row2[0].'">cancelar</a></td>';
			$cuenta=$cuenta+$row2[4];
		}
			echo '<table id="if_a">';
		    foreach ($subcuentas as $categoria => $desglose){
				echo '<tr><td colspan="6"><h3>'.$categoria.'</h3></td></tr>';
				$suma=0;
		    	foreach ($desglose as $consumo){
					echo '<tr>'.$consumo.'</tr>';
		    	}		
		    }
			$sepe=$naa->nB();
			echo '<tr><td colspan=5><div id="nb_mesa">'.$sepe.'</div></td><td id="if_a-total">Total $'.$cuenta.'</td></tr>';

	    	echo '</table>';
			echo	'<div id="abre" style="display:'.$abre.';">';
			include("billetes.php");
			echo	'</div>';
	}else{
		echo 	'<script>window.location.href="'.$_SERVER['PHP_SELF'].'?ruta=ordenes_caja.php";</script>';
	}
?>
	</div>
</div>