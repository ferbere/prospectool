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
	<form action="vendedores.php" method="get">
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
		mysql_query('set @numero=0');
		$sql = "SELECT @numero:=@numero+1 AS orden,prospecta_usuario.user,prospecta_privilegios.nombre,prospecta_usuario.id FROM prospecta_usuario INNER JOIN prospecta_privilegios ON prospecta_usuario.privilegios = prospecta_privilegios.id ";
		if($_SESSION['privilegioss_id']>4){
			$priv=	' WHERE prospecta_usuario.id != 0  AND prospecta_usuario.id = '.$_SESSION['id'];
		}else{
			$priv=' WHERE prospecta_usuario.privilegios >= '.$_SESSION['privilegioss_id'];
		}
		$celdas=array(0=>'orden',1=>'usuario',2=>'privilegios');
		//$pez=$priv." AND prospecta_usuario.nombre like '%" . $criterio . "%'";
		$pez=$priv." AND (prospecta_usuario.nombre like '%" . $criterio . "%' or prospecta_usuario.nombramiento like '%" . $criterio . "%' or prospecta_usuario.email like '%" . $criterio . "%' or prospecta_usuario.user like '%" . $criterio . "%' or prospecta_usuario.domicilio like '%" . $criterio . "%' or prospecta_privilegios.nombre like '%" . $criterio . "%')";
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