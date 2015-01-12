<?php
if (isset($_GET['pag'])){
	$pag=$_GET['pag'];
}else{
	$pag=0;
}
if(isset($_GET['criterio'])){
	$criterio = $_GET['criterio'];
}
if(isset($_GET['ruta'])){
	$ruta = $_GET['ruta'];
}
	if(empty($ruta)){
		$ruta='bus_anuncio.php';
	}
?>
	<h1>Edita anuncio</h1>
	<form action="tool.php" method="get">
	<h3>Criterio de búsqueda:</h3>
		<input type="hidden" name="ruta" value="<?php echo $ruta ?>">
		<input type="text" name="criterio">
		<input type="submit" value="Buscar">
	</form>
	<div style="margin: 0px auto; width:70%">
<?php
			include_once("classes/sacar.class.php");
			$self=sacar($_SERVER['PHP_SELF'],"prospecta/",".php");	
			include_once("classes/buscador.class.php");
			$sql = "SELECT prospecta_anuncio.id,prospecta_anuncio.nombre,prospecta_anuncio.medidas,prospecta_anuncio.precio,general_visible.nombre FROM prospecta_anuncio INNER JOIN general_visible ON prospecta_anuncio.visible = general_visible.id";
			$celdas=array(0=>'id',1=>'nombre',2=>'medidas',3=>'precio',4=>'visible');
			$pez=" where prospecta_anuncio.nombre like '%" . $criterio . "%' or prospecta_anuncio.medidas like '%" . $criterio . "%' or prospecta_anuncio.precio like '%" . $criterio . "%' or general_visible.nombre like '%" . $criterio . "%'";
			$set='if_anuncio_a.php';
			$borra=5;
			$clPag = new paginacion();
			$clPag->cuantos($sql,$pez);
			$clPag->pagina($pag,$sql,$pez,$set,$borra,$celdas,$self);
			$clPag->pie($pag,$sql,$pez,$self);
?>
	</div>