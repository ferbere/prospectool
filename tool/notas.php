<?php
if($_GET['notas']){
	$notas=$_GET['notas'];
}
if($_POST['notas']){
	$notas=$_POST['notas'];
}
if($_GET['cliente']){
	$cliente=$_GET['cliente'];
}
if($_POST['cliente']){
	$cliente=$_POST['cliente'];
}
if($_GET['muestra']){
	$muestra=$_GET['muestra'];
}
if($_POST['muestra']){
	$muestra=$_POST['muestra'];
}
if($_POST['id']){
	$id=$_POST['id'];
}
if($_POST['lanota']){
	$lanota=$_POST['lanota'];
}
if($notas==1){
?>
	<form action="index.php?ruta=asignado.php&muestra=1&notas=2&cliente=<?php echo $cliente ?>" method="post">
		<fieldset>
			<legend>Nota</legend>
		<textarea name="lanota" cols="100" rows="5" placeholder="Agrega o modifica"></textarea><br>
		<input type="submit" name="guardar" width="20%">
		</fieldset>
	</form>
<?php
}elseif($notas==2){
		header("Location: index.php?ruta=asignado.php&muestra=1&notas=3&cliente=". $cliente);
		$mysql=new MySQL();
		$sql=$mysql->consulta("UPDATE restaurante_entrega SET nota = '$lanota' WHERE id = '$pedido' ");
}elseif($notas==3){
	echo nota_F($pedido);
}
?>