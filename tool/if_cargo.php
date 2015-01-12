<?php
session_start();
if(($_SESSION["privilegioss"]=="ferbere")||($_SESSION["privilegioss"]=="admin")||($_SESSION["privilegioss"]=="gerencia")){

include("library/confirm.php");
if(isset($_GET['capturado'])){
	$capturado=$_GET['capturado'];
}
if(empty($capturado)){
?>
	<form method="post" action="tool.php" name="fvalida">
	<input type="hidden" name="ruta" value="ip_cargo.php">
	<h1>Agregar Cargo</h1>
	<label>Nombre</label>
	<input type="text" name="nombre" size="80%"><br><br>
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