<?php
session_start();
include_once("classes/sacaDer.class.php");

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
	$ruta='directorio';
}
?>
<div align="center">
	<form action="clientes.php" method="get">
	Criterio de búsqueda:<br>
		<input type="hidden" name="ruta" value="<?php echo $ruta ?>">
		<input type="text" class="search rounded" name="criterio" size="22" maxlength="150"><br><br>
		<input type="submit" class="submit rounded_min" value="Buscar">
	</form>
</div>
	<div style="margin: 0px auto">
<?php 	
		$self=$_SERVER['PHP_SELF'];
		include_once("classes/buscador_directorio.class.php");
		if($criterio!=''){
		mysql_query('set @numero:=0');
		$sql = "SELECT @numero:=@numero+1 AS orden,prospecta_directorio.empresa,general_municipios.nombre,prospecta_perspectiva.nombre,usuario_index.nombre,prospecta_directorio.id FROM prospecta_directorio INNER JOIN general_municipios ON prospecta_directorio.ciudad = general_municipios.id INNER JOIN prospecta_perspectiva ON prospecta_directorio.perspectiva = prospecta_perspectiva.id INNER JOIN usuario_index ON prospecta_directorio.vendedor = usuario_index.id ";
		if($_SESSION['privilegioss_id']>4){
			$priv=	' WHERE prospecta_directorio.id != 0  AND prospecta_directorio.vendedor = '.$_SESSION['id'].' AND prospecta_directorio.caracter = 1';
		}else{
			$priv=' WHERE prospecta_directorio.id != 0 AND prospecta_directorio.caracter = 1';
		}
		$celdas=array(0=>'orden',1=>'empresa',2=>'ciudad',3=>'perspectiva',4=>'vendedor');
		//$pez=$priv." AND prospecta_directorio.nombre like '%" . $criterio . "%'";
		$pez=$priv." AND (prospecta_directorio.nombre like '%" . $criterio . "%' or prospecta_directorio.empresa like '%" . $criterio . "%' or prospecta_directorio.email like '%" . $criterio . "%' or prospecta_directorio.cargo like '%" . $criterio . "%' or general_municipios.nombre like '%" . $criterio . "%' or usuario_index.nombre like '%" . $criterio . "%' or prospecta_perspectiva.nombre like '%" . $criterio . "%')";
		$set='directorio&form=4';
		$ruta='directorio';
		$borra=1;
		$clPag = new paginacion($pez,$self);
		$clPag1=$clPag->cuantos($sql);
		$clPag2=$clPag->pagina($pag,$sql,$set,$borra,$celdas);
		$clPag3=$clPag->pie($pag,$sql);
		echo  $clPag1[0];
		echo  $clPag2;
		echo  $clPag3;
	}
?>
	</div>