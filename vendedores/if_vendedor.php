<?php
session_start();
include_once("classes/mysql.php");
$mysql=new MySQL();
?>
<form action="vendedores.php" method="post">
	<input type="hidden" name="ruta" value="directorio">
	<input type="hidden" name="form" value="1">
	<h1>Directorio</h2>
	<label>Usuario:</label>
	<input type="text" name="user">
	<label>Password:</label>
	<input type="password" name="contrasenya">
	<label>Nombre:</label>
	<input type="text" name="nombre">
	<label>Nombramiento:</label>
	<input type="text" name="nombramiento">
	<label>Dirección:</label>
	<input type="text" name="domicilio">
	<label>Población:</label>
	<?php
	$sql3=$mysql->consulta("SELECT id,nombre FROM general_municipios WHERE visible = 1");
		echo '<select name="poblacion">';
		while($row3=$mysql->fetch_array($sql3)){
			echo '<option value="'.$row3[0].'">'.$row3[1].'</option>';
	}
		echo '</select>';
	?>
	<label>Estado:</label>
	<?php
	$sql4=$mysql->consulta("SELECT id,nombre FROM general_estados WHERE visible = 1");
		echo '<select name="estado">';
		while($row4=$mysql->fetch_array($sql4)){
			echo '<option value="'.$row4[0].'">'.$row4[1].'</option>';
	}
	?>
	</select>
	<label>Código Postal:</label>
	<input type="text" name="cp">
	<label>RFC:</label>
	<input type="text" name="rfc">
	<label>Correo-e:</label>
	<input type="text" name="email">
	<label>Teléfono:</label>
	<input type="text" name="telefono">
	<label>Celular:</label>
	<input type="text" name="celular">
	<input type="submit" value="guardar" >
</form>
