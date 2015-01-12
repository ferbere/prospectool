<?php
session_start();
include_once("classes/mysql.php");
$mysql=new MySQL();
$vendedor=$_SESSION['user'];
?>
<h1>Añadir prospecto al directorio</h2>
<form action="clientes.php" method="post">
	<input type="hidden" name="form" value="1">
	<input type="hidden" name="ruta" value="prospectos">
	<label style="width:100%">
		Nombre del ejecutivo: <b><i><?php echo $vendedor;?></b></i>
	</label>
	<label>Empresa:</label>
	<input type="text" name="empresa" required>
	<label>Persona que atendió:</label>
	<input type="text" name="nombre" required>
	<label>Cargo:</label>
<?php
$sql2=$mysql->consulta("SELECT prospecta_cargo.id,prospecta_cargo.nombre FROM prospecta_cargo WHERE prospecta_cargo.visible = 1");
?>
	<select name="cargo">
<?php 
while($row2=$mysql->fetch_array($sql2)){
	echo '<option value="'.$row2[0].'">'.$row2[1].'</option>';
}
?>
</select>
<label>Dirección:</label>
<input type="text" name="direccion">
<label>Ciudad:</label>
<?php 
$sql3=$mysql->consulta("SELECT id,nombre FROM general_municipios WHERE visible = 1");
?>
<select name="ciudad">
<?php 
while($row3=$mysql->fetch_array($sql3)){
	if($row3[0]==39){
		$slct3='selected';
	}else{
		$slct3='';
	}
		echo '<option value="'.$row3[0].'" '.$slct3.'>'.$row3[1].'</option>';
}
?>
</select>
<label>Estado:</label>
<?php
$sql4=$mysql->consulta("SELECT id,nombre FROM general_estados WHERE visible = 1");
?>
<select name="estado">
<?php
while($row4=$mysql->fetch_array($sql4)){
	if($row4[0]==15){
		$slct4='selected';
	}else{
		$slct4='';
	}
echo '<option value="'.$row4[0].'" '.$slct4.'>'.$row4[1].'</option>';
}
?>
</select>
<!--	<label>Pa&iacute;s:</label>
	<input type="text" name="pais">-->
<label>Código Postal:</label>
<input type="text" name="cp">
<label>RFC:</label>
<input type="text" name="rfc">
<label>Correo-e:</label>
<input type="text" name="email">
<label>Teléfono:</label>
<input type="text" name="telefono">
<label>Carácter:</label>
<?php 
$sql5=$mysql->consulta("SELECT id,nombre FROM prospecta_caracter WHERE visible = 1");
?>
<select name="caracter">
<?php
while($row5=$mysql->fetch_array($sql5)){
	if($row5[0]==2){
		$slct5='selected';
	}else{
		$slct5='';
	}
	echo '<option value="'.$row5[0].'"'.$slct5.'>'.$row5[1].'</option>';
}
?>
	<select>
	<label>Perspectiva:</label>
<?php 
$sql6=$mysql->consulta("SELECT id,nombre FROM prospecta_perspectiva WHERE visible = 1");
?>
	<select name="perspectiva">
<?php
while($row6=$mysql->fetch_array($sql6)){
	if($row6[0]==6){
		$slct6='selected';
	}else{
		$slct6='';
	}
	echo '<option value="'.$row6[0].'"'.$slct6.'>'.$row6[1].'</option>';
} ?>
	<select>
	<input type="submit" value="guardar" >
</form>
