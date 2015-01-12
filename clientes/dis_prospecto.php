<?php
session_start();
include_once("classes/mysql.php");

$mysql=new MySQL();
if(isset($_GET['xyo'])){
	$xyo=$_GET['xyo'];
}
if(isset($_GET['ruta'])){
	$s=$_GET['ruta'];
}
if(isset($_POST['ruta'])){
	$s=$_POST['ruta'];
}
if($_SESSION['privilegioss_id']<=4){
	$muestra='';
}else{
	$muestra=" AND prospecta_directorio.vendedor = ".$_SESSION['id'];
}

$sql=$mysql->consulta("SELECT prospecta_directorio.empresa,prospecta_directorio.nombre,prospecta_cargo.nombre,prospecta_directorio.direccion,general_municipios.nombre,general_estados.nombre,prospecta_directorio.cp,prospecta_directorio.rfc,prospecta_directorio.email,prospecta_directorio.telefono,prospecta_caracter.nombre,prospecta_perspectiva.nombre,prospecta_usuario.nombre FROM prospecta_directorio INNER JOIN prospecta_cargo ON prospecta_directorio.cargo = prospecta_cargo.id INNER JOIN general_municipios ON prospecta_directorio.ciudad = general_municipios.id INNER JOIN general_estados ON prospecta_directorio.estado = general_estados.id INNER JOIN prospecta_caracter ON prospecta_directorio.caracter = prospecta_caracter.id INNER JOIN prospecta_perspectiva ON prospecta_directorio.perspectiva = prospecta_perspectiva.id INNER JOIN prospecta_usuario ON prospecta_directorio.vendedor = prospecta_usuario.id WHERE prospecta_directorio.id = '$xyo' ".$muestra);
while($row=$mysql->fetch_array($sql)){
	$empresa=$row[0];
	$persona=$row[1];
	$cargo=$row[2];
	$direccion=$row[3];
	$ciudad=$row[4];
	$estado=$row[5];
	$cp=$row[6];
	$rfc=$row[7];
	$email=$row[8];
	$telefono=$row[9];
	$caracter=$row[10];
	$perspectiva=$row[11];
	$vendedor_id=$row[12];
}
?>
<script language="Javascript">
	function preguntar(){
		eliminar=confirm("¿Realmente desea eliminar este registro?");
		if (eliminar)
			window.location.href = "clientes.php?ruta=borra&borra=1&rubro=<?php echo $xyo ?>&s=<?php echo $s ?>";
		else
			alert('No se ha podido eliminar el registro...')
	}
</script>
	<h1>Directorio</h2>
	<label>Empresa: <b><?php echo $empresa;?></b></label>
	<label>Persona que atendió: <b><?php echo $persona;?></b></label>
	<label>Cargo: <b><?php echo $cargo;?></b></label>
	<label>Direccion: <b><?php echo $direccion;?></b></label>
	<label>Ciudad: <b><?php echo $ciudad;?></b></label>
	<label>Estado: <b><?php echo $estado;?></b></label>
	<label>Código Postal: <b><?php echo $cp;?></b></label>
	<label>RFC: <b><?php echo $rfc;?></b></label>
	<label>Correo-e: <b><?php echo $email;?></b></label>
	<label>Teléfono: <b><?php echo $telefono;?></b></label>
	<label>Carácter: <b><?php echo $caracter;?></b></label>
	<label>Perspectiva: <b><?php echo $perspectiva;?></b></label>
	<label>Nombre del ejecutivo: <b><i><?php echo $vendedor_id;?></b></i></label>
	<div id="visitas_seg2">
		<a href="<?php echo $_SERVER["PHP_SELF"];?>?ruta=directorio&form=5&xyo=<?php echo $xyo;?>">Modificar</a>
		<a href="javascript:preguntar()">Borrar</a>
	</div>