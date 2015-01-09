<?php
include_once("../admin/classes/sacaDer.class.php");

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
	$ruta='buscar.php';
}
?>
<div align="center">
	<form action="index.php" method="get">
	Criterio de búsqueda:<br>
		<input type="hidden" name="ruta" value="<?php echo $ruta ?>">
		<input type="text" class="search rounded" name="criterio" size="22" maxlength="150"><br><br>
		<input type="submit" class="submit rounded_min" value="Buscar">
	</form>
</div>
	<div style="margin: 0px auto">
<?php 	
		$self=$_SERVER['PHP_SELF'];
		include_once("../admin/classes/buscador_ordenes.class.php");
		if($criterio!=''){
		$sql = "SELECT restaurante_clientes.id,restaurante_clientes.nombre,restaurante_clientes.email FROM restaurante_clientes LEFT JOIN restaurante_domicilios ON restaurante_domicilios.cliente = restaurante_clientes.id WHERE restaurante_clientes.id != 0 ";
		$celdas=array(0=>'id',1=>'nombre',2=>'email');
		$pez=" and restaurante_clientes.nombre like '%" . $criterio . "%' or restaurante_clientes.email like '%" . $criterio . "%' or restaurante_domicilios.direccion like '%" . $criterio . "%' or restaurante_domicilios.cruza1 like '%" . $criterio . "%' or restaurante_domicilios.cruza2 like '%" . $criterio . "%' or restaurante_domicilios.tel like '%" . $criterio . "%' or restaurante_domicilios.cp like '%" . $criterio . "%'";
		$set='domicilio_set.php';
		$ruta='buscar.php';
		$borra=1;
		$clPag = new paginacion();
		$clPag->cuantos($sql,$pez);
		$clPag->pagina($pag,$sql,$pez,$set,$borra,$celdas,$self);
		$clPag->pie($pag,$sql,$pez,$self);
	}
?>
	</div>