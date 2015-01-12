<?php
session_start();
include("library/confirm.php");
if(($_SESSION["privilegioss"]=="ferbere")||($_SESSION["privilegioss"]=="admin")||($_SESSION["privilegioss"]=="gerencia")){
	if(isset($_GET['capturado'])){
		$capturado=$_GET['capturado'];
	}
	if(empty($capturado)){
?>
		<div id="form-main">
		<form method="post" action="tool.php" name="fvalida">
			<input type="hidden" name="ruta" value="ip_perspectiva.php">
			<h1>Agrega perspectiva</h1>
			<label>Nombre</label>
			<input type="text" name="nombre" size="80%">
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