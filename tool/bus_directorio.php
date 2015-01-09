<?php
session_start();
include_once("../classes/sacaDer.class.php");

if (isset($_GET['pag'])){
	$pag=$_GET['pag'];
}else{
	$pag=0;
}
if(isset($_GET['criterio'])){
	$criterio = $_GET['criterio'];
}else{
	$criterio='';
}
if(isset($_GET['ruta'])){
	$ruta = $_GET['ruta'];
}
if(empty($ruta)){
	$ruta='directorio.php';
}
?>
<div align="center">
	<form action="index.php" method="get">
	Criterio de b&uacute;squeda:<br>
		<input type="hidden" name="ruta" value="<?php echo $ruta ?>">
		<input type="text" class="search rounded" name="criterio" size="22" maxlength="150"><br><br>
		<input type="submit" class="submit rounded_min" value="Buscar">
	</form>
</div>
	<div style="margin: 0px auto">
<?php 	
		$self=$_SERVER['PHP_SELF'];
		include_once("../classes/buscador_directorio.class.php");
		if($criterio!=''){
		$sql = "SELECT prospecta_directorio.id,prospecta_directorio.empresa,general_municipios.nombre,prospecta_perspectiva.nombre,usuario_index.nombre FROM prospecta_directorio INNER JOIN general_municipios ON prospecta_directorio.ciudad = general_municipios.id INNER JOIN prospecta_perspectiva ON prospecta_directorio.perspectiva = prospecta_perspectiva.id INNER JOIN usuario_index ON prospecta_directorio.vendedor = usuario_index.id ";
		if($_SESSION['privilegioss_id']>4){
			$priv=	' WHERE prospecta_directorio.id != 0  AND prospecta_directorio.vendedor = '.$_SESSION['id'] ;
		}else{
			$priv=' WHERE prospecta_directorio.id != 0 ';
		}
		$celdas=array(0=>'id',1=>'empresa',2=>'ciudad',3=>'perspectiva',4=>'vendedor');
		//$pez=$priv." AND prospecta_directorio.nombre like '%" . $criterio . "%'";
		$pez=$priv." AND (prospecta_directorio.nombre like '%" . $criterio . "%' or prospecta_directorio.empresa like '%" . $criterio . "%' or prospecta_directorio.email like '%" . $criterio . "%' or prospecta_directorio.cargo like '%" . $criterio . "%' or general_municipios.nombre like '%" . $criterio . "%' or usuario_index.nombre like '%" . $criterio . "%' or prospecta_perspectiva.nombre like '%" . $criterio . "%')";
		$set='directorio.php&form=4';
		$ruta='directorio.php';
		$borra=1;
		$clPag = new paginacion();
		$clPag->cuantos($sql,$pez);
		$clPag->pagina($pag,$sql,$pez,$set,$borra,$celdas,$self);
		$clPag->pie($pag,$sql,$pez,$self);
	}
?>
	</div>