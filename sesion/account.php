<?php
session_start();

$link=Conectarse();
if(isset($_GET['created'])){
	$created=$_GET['created'];
}
if(empty($created)){
?>
<div id="form-main">
<div class="fa-angle-double-left" id="btn_source"><a href="index.php"> regresar</a></div>
<form method="post" action="sesion.php?ruta=ip_account.php" enctype="multipart/form-data">
<input type="hidden" name="MAX_FILE_SIZE" value="1000000"> 
<h1>Dar de alta activista</h1>
	<div id="b">
		<div id="b1">
			Usuario:<br>
			<input type="text" name="user" size="50">
		</div>
		<div id="b2">
			Contraseña:<br>
			<input type="password" name="passwd"><br><br>
		</div>
	</div>
	<div id="c">
		<div id="c1">
			Nombre completo:<br>
			<input type="text" name="nombre" size="50">
		</div>
		<div id="c2">
			Imagen:<br>
			<input type="file" name="imagen"><br><br>
		</div>
	</div>
	<div id="d">
		<div id="d1">
			Rango: <br>
			<select name="rango">
<?php
$sql_ran=mysql_query("SELECT id,nombre FROM activismo_rango",$link);
while($row_ran=mysql_fetch_array($sql_ran)){
echo '<option value="'.$row_ran[0].'">'.$row_ran[1].'</option>';
}
?>
			</select>
		</div>
		<div id="d2">
			Domicilio:<br>
			<input type="text" name="domicilio" size="50"><br><br>
		</div>
	</div>
		<div id="e">
			<div id="e1">
			Estado:
			<select name="estado">
<?php
$sql_est=mysql_query("SELECT id,nombre FROM geo_estados",$link);
while($row_est=mysql_fetch_array($sql_est)){
echo '<option value="'.$row_est[0].'">'.$row_est[1].'</option>';
}
?>
			</select>
		</div>
		<div id="e2">
			Población: <select name="municipio">
<?php
$sql_mun=mysql_query("SELECT id,nombre FROM geo_municipios_jal",$link);
while($row_mun=mysql_fetch_array($sql_mun)){
echo '<option value="'.$row_mun[0].'">'.$row_mun[1].'</option>';
}
?>
			</select>
		</div>
		<div id="e3">
			e-mail:
			<input type="text" name="email" size="25"><br><br><br>
		</div>
	</div>
	<div id="f">
		<div id="f1">
			Teléfono:
			<input type="text" name="telefono" size="15"><br><br>
		</div>
		<div id="f2">
			Teléfono celular:
			<input type="text" name="celular" size="15">
		</div>
	</div>
	<div id="g">
		<input type="submit" onClick="MM_popupMsg('Guardar');return false" value="enviar">
		</form>
	</div>
</div>
<?php
}else{
	header("Location:sesion.php?created=1");
}
?>