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
		<input type="hidden" name="ruta" value="ip_perspectiva_a.php">
		<input type="hidden" name="rubro" value="<?php echo $rubro ?>">
<?php
$sql= mysql_query("SELECT id,nombre,visible FROM prospecta_perspectiva WHERE id = '$rubro' ",$link);
while ($row = mysql_fetch_array($sql)){
	$id=$row[0];
	$nombre=$row[1];
	$visible=$row[2];
}
?>
		<label>Nombre</label>
		<input type="text" name="nombre" width="100%" value="<?php echo $nombre ?>" />
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
<?
}else{
	echo "El contenido ha sido capturado, debidamente. ¡Muy bien!";
}
}else{
echo "Usted no tiene acceso a esta sección";
}
?>
