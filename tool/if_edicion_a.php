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
		<h1>Modifica edición</h1>	
		<form method="post" action="tool.php">
		<input type="hidden" name="ruta" value="ip_edicion_a.php">
		<input type="hidden" name="rubro" value="<?php echo $rubro ?>">
<?php
		$sql= mysql_query("SELECT id,numero,desde,hasta,visible FROM prospecta_edicion WHERE id = '$rubro' ",$link);
		while ($row = mysql_fetch_array($sql)){
			$id=$row[0];
			$numero=$row[1];
			$desde=$row[2];
			$hasta=$row[3];
			$visible=$row[4];
		}
?>
		<label>Nombre de la edición</label>
		<input type="number" name="numero" value="<?php echo $numero ?>" />
		<label>Desde:</label>
		<input type="text" name="desde" value="<?php echo $desde ?>" /><br><br>
		<label>Hasta:</label>
		<input type="text" name="hasta" value="<?php echo $hasta ?>" /><br><br>
<?php
		if($visible==0){
			$publino="checked";
			$publisi="nain";
		}elseif($visible==1){
			$publino="nain";
			$publisi="checked";
		}
?>		<fieldset>
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

	}else{
		echo "El contenido ha sido capturado, debidamente. ¡Muy bien!";
	}
}else{
	echo "Usted no tiene acceso a esta sección";
}
?>
