<?php
session_start();
if(isset($_GET['xyo'])){
	$xyo=$_GET['xyo'];
}
if($_SESSION['privilegioss_id']<=4){
	$muestra='';
}else{
	$muestra=" AND prospecta_directorio.vendedor = ".$_SESSION['id'];
}

$sql=$mysql->consulta("SELECT prospecta_directorio.empresa,prospecta_directorio.nombre,prospecta_cargo.nombre,prospecta_directorio.direccion,general_municipios.nombre,general_estados.nombre,prospecta_directorio.cp,prospecta_directorio.rfc,prospecta_directorio.email,prospecta_directorio.telefono,prospecta_caracter.nombre,prospecta_perspectiva.nombre,usuario_index.nombre FROM prospecta_directorio INNER JOIN prospecta_cargo ON prospecta_directorio.cargo = prospecta_cargo.id INNER JOIN general_municipios ON prospecta_directorio.ciudad = general_municipios.id INNER JOIN general_estados ON prospecta_directorio.estado = general_estados.id INNER JOIN prospecta_caracter ON prospecta_directorio.caracter = prospecta_caracter.id INNER JOIN prospecta_perspectiva ON prospecta_directorio.perspectiva = prospecta_perspectiva.id INNER JOIN usuario_index ON prospecta_directorio.vendedor = usuario_index.id WHERE prospecta_directorio.id = '$xyo' ".$muestra);
while($row=$mysql->fetch_array($sql)){
	$empresa=$row[0];
	$persona=$row[1];
	$cargo=$row[2];
	$direccion=$row[3];
	$ciudad=$row[4];
	$estado=$row[5];
	$cp=$row[6];
	$rfc=$row[7];
	$email=$row[8];
	$telefono=$row[9];
	$caracter=$row[10];
	$perspectiva=$row[11];
	$vendedor_id=$row[12];
}
	echo '<h1>Editar prospecto en el directorio</h2>';
	echo '<form action="prospecto.php" method="post">';
	echo '<input type="hidden" name="form" value="6">';
	echo '<input type="hidden" name="xyo" value="'.$xyo.'">';
	echo '<label style="width:100%">Nombre del ejecutivo: <b><i>'.$vendedor.'</b></i></label>';
	echo '<label>Empresa:</label>';
	echo '<input type="text" name="empresa" value="'.$empresa.'">';
	echo '<label>Persona que atendi&oacute;:</label>';
	echo '<input type="text" name="nombre" value="'.$persona.'">';
	echo '<label>Cargo:</label>';
	$sql2=$mysql->consulta("SELECT prospecta_cargo.id,prospecta_cargo.nombre FROM prospecta_cargo WHERE prospecta_cargo.visible = 1");
	echo '<select name="cargo">';
	while($row2=$mysql->fetch_array($sql2)){
		if($cargo==$row2[1]){
			$hii='selected';
		}else{
			$hii='nain';
		}
	echo '<option value="'.$row2[0].'" '.$hii.'>'.$row2[1].'</option>';
}
	echo '</select>';
	echo '<label>Direcci&oacute;n:</label>';
	echo '<input type="text" name="direccion" value="'.$direccion.'">';
	echo '<label>Ciudad:</label>';
$sql3=$mysql->consulta("SELECT id,nombre FROM general_municipios WHERE visible = 1");
	echo '<select name="ciudad">';
	while($row3=$mysql->fetch_array($sql3)){
		if($row3[1]==$ciudad){
			$slct3='selected';
		}else{
			$slct3='nain';
		}
	echo '<option value="'.$row3[0].'" '.$slct3.'>'.$row3[1].'</option>';
}
	echo '</select>';
	echo '<label>Estado:</label>';
$sql4=$mysql->consulta("SELECT id,nombre FROM general_estados WHERE visible = 1");
	echo '<select name="estado">';
	while($row4=$mysql->fetch_array($sql4)){
		if($row4[1]==$estado){
			$slct4='selected';
		}else{
			$slct4='nain';
		}
	echo '<option value="'.$row4[0].'" '.$slct4.'>'.$row4[1].'</option>';
}
	echo '</select>';
//	echo '<label>Pa&iacute;s:</label>';
//	echo '<input type="text" name="pais">';
	echo '<label>C&oacute;digo Postal:</label>';
	echo '<input type="text" name="cp" value="'.$cp.'">';
	echo '<label>RFC:</label>';
	echo '<input type="text" name="rfc" value="'.$rfc.'">';
	echo '<label>Correo-e:</label>';
	echo '<input type="text" name="email" value="'.$email.'">';
	echo '<label>Tel&eacute;fono:</label>';
	echo '<input type="text" name="telefono" value="'.$telefono.'">';
	echo '<label>Car&aacute;cter:</label>';
	$sql5=$mysql->consulta("SELECT id,nombre FROM prospecta_caracter WHERE visible = 1");
	echo '<select name="caracter">';
	while($row5=$mysql->fetch_array($sql5)){
		if($caracter==$row5[1]){
			$slct5='selected';
		}else{
			$slct5='nain';
		}
	echo '<option value="'.$row5[0].'"'.$slct5.'>'.$row5[1].'</option>';
}
	echo '<select>';
	echo '<label>Perspectiva:</label>';
	$sql6=$mysql->consulta("SELECT id,nombre FROM prospecta_perspectiva WHERE visible = 1");
	echo '<select name="perspectiva">';
	while($row6=$mysql->fetch_array($sql6)){
		if($row6[1]==$perspectiva){
			$slct6='selected';
		}else{
			$slct6='nain';
		}
	echo '<option value="'.$row6[0].'"'.$slct6.'>'.$row6[1].'</option>';
}
	echo '<select>';
	echo '<input type="submit" value="guardar" >';
	echo '</form>';
?>