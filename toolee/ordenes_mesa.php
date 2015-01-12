<?php
session_start();
include_once("../classes/sesion_cliente.class.php");
include_once("../classes/mysql.php");
$mysql=new MySQL();
include_once("../classes/mesa.class.php");

if(isset($_GET['personas'])){
	$mesa_personas=$_GET['personas'];
}
if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
	$mes=new meSa($rubro,'ordenes_mesa');
	$unset = $mes->meS_unset();//Borra las sesiones activas de mesa y cliente
	$messa = $mes->meS_msa();
	$_SESSION['mesa']=$rubro;
	$_SESSION['mesa_nom']=$messa[0];
	$_SESSION['mesa_personas']=$mesa_personas;
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
				echo $_SESSION['mesa_nom'].'<br>';
				echo '<div id="mesa_subt">('.$_SESSION["mesa_personas"].' personas)</div>';
			}else{
				sesionCliente($rubro,$xyo);	
			}
			?>
		</div>
		<div id="mesa_suma">
			<?php //echo $suma?>
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