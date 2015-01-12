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
	$muestra=" AND prospecta_usuario.id = ".$_SESSION['id'];
}
$sql=$mysql->consulta("SELECT prospecta_usuario.user,prospecta_usuario.nombre,prospecta_usuario.nombramiento,prospecta_usuario.domicilio,general_municipios.nombre,general_estados.nombre,prospecta_usuario.cp,prospecta_usuario.rfc,prospecta_usuario.email,prospecta_usuario.telefono,prospecta_usuario.celular,prospecta_usuario.privilegios FROM prospecta_usuario INNER JOIN general_municipios ON prospecta_usuario.poblacion = general_municipios.id INNER JOIN general_estados ON prospecta_usuario.estado = general_estados.id WHERE prospecta_usuario.id = '$xyo' ".$muestra);
while($row=$mysql->fetch_array($sql)){
	$user=$row[0];
	$nombre=$row[1];
	$nombramiento=$row[2];
	$domicilio=$row[3];
	$poblacion=$row[4];
	$estado=$row[5];
	$cp=$row[6];
	$rfc=$row[7];
	$email=$row[8];
	$telefono=$row[9];
	$celular=$row[10];
	$privilegios=$row[11];
}
if($_SESSION['privilegioss_id']<=4){
	$button='<a href="javascript:preguntar()">Borrar</a>';
	switch ($privilegios) {
		case 1:
			$button_borra='';
			break;
		case 2:
			if(($_SESSION['privilegioss_id']==4)||($_SESSION['privilegioss_id']==1)){
				$button_borra=$button;
			}else{
				$button_borra='';				
			}
			break;
		case 3:
			if($_SESSION['privilegioss_id']==1){
				$button_borra=$button;
			}else{
				$button_borra='';				
			}
			break;
		case 4:
			if($_SESSION['privilegioss_id']==1){
				$button_borra=$button;
			}else{
				$button_borra='';				
			}
			break;
		default:
			$button_borra='<a href="javascript:preguntar()">Borrar</a>';
			break;
	}
}else{
	$button_borra='';
}
?>
<script language="Javascript">
	function preguntar(){
		eliminar=confirm("¿Realmente desea eliminar este registro?");
		if (eliminar)
			window.location.href = "vendedores.php?ruta=borra&borra=1&xyo=<?php echo $xyo ?>&s=<?php echo $s ?>";
		else
			alert('No se ha podido eliminar el registro...')
	}
</script>
	<h1>Directorio</h2>
	<label>Usuario: <b><?php echo $user;?></b></label>
	<label>Nombre: <b><?php echo $nombre;?></b></label>
	<label>Nombramiento: <b><?php echo $nombramiento;?></b></label>
	<label>Direccion: <b><?php echo $domicilio;?></b></label>
	<label>Población: <b><?php echo $poblacion;?></b></label>
	<label>Estado: <b><?php echo $estado;?></b></label>
	<label>Código Postal: <b><?php echo $cp;?></b></label>
	<label>RFC: <b><?php echo $rfc;?></b></label>
	<label>Correo-e: <b><?php echo $email;?></b></label>
	<label>Teléfono: <b><?php echo $telefono;?></b></label>
	<label>Celular: <b><?php echo $celular;?></b></label>
	<div id="visitas_seg2">
		<a href="<?php echo $_SERVER["PHP_SELF"];?>?ruta=directorio&form=5&xyo=<?php echo $xyo;?>">Modificar</a>
		<?php echo $button_borra; ?>
	</div>