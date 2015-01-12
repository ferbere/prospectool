<?php
session_start();
include("library/confirm.php");
if(($_SESSION["privilegioss"]=="ferbere")||($_SESSION["privilegioss"]=="admin")||($_SESSION["privilegioss"]=="gerencia")){
	if(isset($_GET['capturado'])){
		$capturado=$_GET['capturado'];
	}
	if(empty($capturado)){
		$link=Conectarse();
		if(isset($_GET['rubro'])){
			$rubro=$_GET['rubro'];
		}
?>
		<h1>Editar perspectiva</h1>
		<form method="post" action="tool.php">
			<input type="hidden" name="ruta" value="ip_anuncio_a.php">
			<input type="hidden" name="rubro" value="<?php echo $rubro ?>">
<?php
$sql= mysql_query("SELECT id,nombre,medidas,precio,visible FROM prospecta_anuncio WHERE id = '$rubro' ",$link);
	while ($row = mysql_fetch_array($sql)){
		$id=$row[0];
		$nombre=$row[1];
		$medidas=$row[2];
		$precio=$row[3];
		$visible=$row[4];
?>
			<h1>Editar Anuncio</h1>
			<label>Nombre</label>
			<input type="text" name="nombre" value="<?php echo $row[1] ?>" />
			<label>Medidas:</label>
			<input type="text" name="medidas" value="<?php echo $row[2] ?>" />
			<label>Precio:</label>
			<input type="number" name="precio" value="<?php echo $row[3] ?>" min="0" max="9999" size="4"/>
<?php
			if($row[4]==0){
				$publino="checked";
				$publisi="nain";
			}elseif($row[4]==1){
				$publino="nain";
				$publisi="checked";
			}
?>			<fieldset>
				<legend>Visible:</legend>
				<div class="radio">
					<label class="not" for="1">Sí</label>
					<input type="radio" name="visible" value="1" class="not2" <?php echo $publisi ?>>
					<label class="not" for=0>No</label>
					<input type="radio" name="visible" value="0" class="not2" <?php echo $publino ?>>
				</div>
			</fieldset><br><br>
			<input type="submit"  value="enviar">
		</form>
<?php
	}
}else{
	echo "El contenido ha sido capturado, debidamente. ¡Muy bien!";
}
}else{
echo "Usted no tiene acceso a esta sección";
}
?>
