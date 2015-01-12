<?php
session_start();
include_once("../classes/mysql.php");
include_once("../classes/sesion_cliente.class.php");
$mysql=new MySQL();

if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
	unset($_SESSION['cliente_e']);
	unset($_SESSION['cliente_n']);
	unset($_SESSION['cliente_id']);
}
if(isset($_GET['xyo'])){
	$xyo=$_GET['xyo'];
}

if(!isset($_SESSION['mesa'])){
	$_SESSION['mesa']=$rubro;
}
$sql=$mysql->consulta("SELECT restaurante_consumo.mesa,SUM(restaurante_consumo.cantidad*restaurante_index.precio) FROM restaurante_consumo INNER JOIN restaurante_index ON restaurante_consumo.consumo = restaurante_index.id WHERE restaurante_consumo.mesa = 5".$_SESSION['mesa'] );

while($row=$mysql->fetch_array($sql)){
	$mesa = $row[0];
	$suma = $row[1];
}
if(($_SESSION['mesa']!=null)||($_SESSION['mesa']!=0)){
	$navegacion='Atención en mesas'; 
}else{
	$navegacion=$_SESSION['cliente_e']; 
}
?>
<div id="transito_estatus"><h2><?php echo $navegacion ?></h2></div>
<div id="mesa">
	<div id="mesa_head">
		<div id="mesa_titulo">
			<?php
			if(empty($_SESSION['cliente_e'])){
				echo 'mesa '.$_SESSION['mesa'];
			}else{
				sesionCliente($rubro,$xyo);	
			}
			?>
		</div>
		<div id="mesa_suma">
			<?php echo $suma?>
		</div>
	</div>
	<div id="mesa_body">
		<ul>
	<?php
	$sql2=$mysql->consulta("SELECT id,nombre FROM restaurante_categoria");
		echo '<span id="tomando-orden">--tomando orden--</span>';
	while($row2=$mysql->fetch_array($sql2)){
		echo '<li><a href="'.$_SERVER['PHP_SELF'].'?ruta=if.php&tipo='.$row2[1].'">'.$row2[1].'</a></li>';
	}
	?>
		</ul>
	</div>
</div>