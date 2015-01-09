<?php
	echo '<h1>A&ntilde;adir prospecto al directorio</h2>';
	echo '<form action="prospecto.php" method="post">';
	echo '<input type="hidden" name="form" value="1">';
	echo '<label style="width:100%">Nombre del ejecutivo: <b><i>'.$vendedor.'</b></i></label>';
	echo '<label>Empresa:</label>';
	echo '<input type="text" name="empresa" required>';
	echo '<label>Persona que atendi&oacute;:</label>';
	echo '<input type="text" name="nombre" required>';
	echo '<label>Cargo:</label>';
	$sql2=$mysql->consulta("SELECT prospecta_cargo.id,prospecta_cargo.nombre FROM prospecta_cargo WHERE prospecta_cargo.visible = 1");
	echo '<select name="cargo">';
	while($row2=$mysql->fetch_array($sql2)){
	echo '<option value="'.$row2[0].'">'.$row2[1].'</option>';
}
	echo '</select>';
	echo '<label>Direcci&oacute;n:</label>';
	echo '<input type="text" name="direccion">';
	echo '<label>Ciudad:</label>';
$sql3=$mysql->consulta("SELECT id,nombre FROM general_municipios WHERE visible = 1");
	echo '<select name="ciudad">';
	while($row3=$mysql->fetch_array($sql3)){
		if($row3[0]==39){
			$slct3='selected';
		}else{
			$slct3='';
		}
	echo '<option value="'.$row3[0].'" '.$slct3.'>'.$row3[1].'</option>';
}
	echo '</select>';
	echo '<label>Estado:</label>';
$sql4=$mysql->consulta("SELECT id,nombre FROM general_estados WHERE visible = 1");
	echo '<select name="estado">';
	while($row4=$mysql->fetch_array($sql4)){
		if($row4[0]==15){
			$slct4='selected';
		}else{
			$slct4='';
		}
	echo '<option value="'.$row4[0].'" '.$slct4.'>'.$row4[1].'</option>';
}
	echo '</select>';
//	echo '<label>Pa&iacute;s:</label>';
//	echo '<input type="text" name="pais">';
	echo '<label>C&oacute;digo Postal:</label>';
	echo '<input type="text" name="cp">';
	echo '<label>RFC:</label>';
	echo '<input type="text" name="rfc">';
	echo '<label>Correo-e:</label>';
	echo '<input type="text" name="email">';
	echo '<label>Tel&eacute;fono:</label>';
	echo '<input type="text" name="telefono">';
	echo '<label>Car&aacute;cter:</label>';
	$sql5=$mysql->consulta("SELECT id,nombre FROM prospecta_caracter WHERE visible = 1");
	echo '<select name="caracter">';
	while($row5=$mysql->fetch_array($sql5)){
		if($row5[0]==2){
			$slct5='selected';
		}else{
			$slct5='';
		}
	echo '<option value="'.$row5[0].'"'.$slct5.'>'.$row5[1].'</option>';
}
	echo '<select>';
	echo '<label>Perspectiva:</label>';
	$sql6=$mysql->consulta("SELECT id,nombre FROM prospecta_perspectiva WHERE visible = 1");
	echo '<select name="perspectiva">';
	while($row6=$mysql->fetch_array($sql6)){
		if($row6[0]==6){
			$slct6='selected';
		}else{
			$slct6='';
		}
	echo '<option value="'.$row6[0].'"'.$slct6.'>'.$row6[1].'</option>';
}
	echo '<select>';
	echo '<input type="submit" value="guardar" >';
	echo '</form>';
?>