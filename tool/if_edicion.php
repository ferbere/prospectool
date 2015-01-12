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
		<form method="post" action="tool.php" name="fvalida">
			<h1>Agregar Edición</h1>
			<input type="hidden" name="ruta" value="ip_edicion.php"></label>
			<label>Número:<br></label>
			<input type="number" name="numero" size="80%"></label>
			<label>Desde:</label>
			<input type="date" name="desde" placeholder="AAAA/MM/DD">
			<label>Hasta:</label>
			<input type="date" name="hasta" placeholder="AAAA/MM/DD">

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