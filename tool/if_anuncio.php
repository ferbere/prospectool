<?php
session_start();
if(($_SESSION["privilegioss"]=="ferbere")||($_SESSION["privilegioss"]=="admin")||($_SESSION["privilegioss"]=="gerencia")){
	$link=Conectarse();
	include("library/confirm.php");
	if(isset($_GET['capturado'])){
		$capturado=$_GET['capturado'];
	}
	if(empty($capturado)){
?>
		<h1>Agregar Anuncio</h1>
		<form method="post" action="tool.php" name="fvalida">
			<input type="hidden" name="ruta" value="ip_anuncio.php">
			<label>Nombre:</label>
			<input type="text" name="nombre">
			<label>Medidas:</label>
			<input type="text" name="medidas">
			<label>Precio:</label>
			<input type="number" name="precio" min="0" max="9999" size="4"/>
			<fieldset>
					<legend>Visible:</legend>
					<div class="radio">
						<label class="not" for="1">Sí</label>
						<input type="radio" name="visible" value="1" class="not2">
						<label class="not" for=0>No</label>
						<input type="radio" name="visible" value="0" class="not2" checked>
					</div>
			</fieldset><br><br>
			<input type="submit" value="enviar">	
		</form>
<?php
	}else{
		echo "El contenido ha sido capturado, debidamente. ¡Muy bien!";
	}
}else{
echo "Usted no tiene acceso a esta seccción";
}
?>