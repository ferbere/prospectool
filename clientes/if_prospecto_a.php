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

$sql=$mysql->consulta("SELECT prospecta_directorio.empresa,prospecta_directorio.nombre,prospecta_cargo.nombre,prospecta_directorio.direccion,general_municipios.nombre,general_estados.nombre,prospecta_directorio.cp,prospecta_directorio.rfc,prospecta_directorio.email,prospecta_directorio.telefono,prospecta_caracter.nombre,prospecta_perspectiva.nombre,prospecta_usuario.nombre FROM prospecta_directorio INNER JOIN prospecta_cargo ON prospecta_directorio.cargo = prospecta_cargo.id INNER JOIN general_municipios ON prospecta_directorio.ciudad = general_municipios.id INNER JOIN general_estados ON prospecta_directorio.estado = general_estados.id INNER JOIN prospecta_caracter ON prospecta_directorio.caracter = prospecta_caracter.id INNER JOIN prospecta_perspectiva ON prospecta_directorio.perspectiva = prospecta_perspectiva.id INNER JOIN prospecta_usuario ON prospecta_directorio.vendedor = prospecta_usuario.id WHERE prospecta_directorio.id = '$xyo' ".$muestra);
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
if($caracter=='No cliente'){
	$caract='prospectos';
}elseif($caracter=='Cliente'){
	$caract='directorio';
}
?>
<h1>Editar prospecto en el directorio</h2>
<form action="clientes.php" method="post">
	<input type="hidden" name="ruta" value="<?php echo $caract; ?>">
	<input type="hidden" name="form" value="6">
	<input type="hidden" name="xyo" value="<?php echo $xyo;?>">
	<label style="width:100%">
		Nombre del ejecutivo: <b><i><?php echo $vendedor;?></b></i>
	</label>
	<label>Empresa:</label>
	<input type="text" name="empresa" value="<?php echo $empresa;?>">
	<label>Persona que atendió:</label>
	<input type="text" name="nombre" value="<?php echo $persona;?>">
	<label>Cargo:</label>
	<?php
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
	?>
	</select>
	<label>Dirección:</label>
	<input type="text" name="direccion" value="<?php echo $direccion;?>">
	<label>Ciudad:</label>
	<?php
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
	?>
	<label>Estado:</label>
	<?php
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
	?>
	</select>
<!--	<label>País:</label>
	<input type="text" name="pais">-->
	<label>Código Postal:</label>
	<input type="text" name="cp" value="<?php echo $cp;?>">
	<label>RFC:</label>
	<input type="text" name="rfc" value="<?php echo $rfc;?>">
	<label>Correo-e:</label>
	<input type="text" name="email" value="<?php echo $email;?>">
	<label>Teléfono:</label>
	<input type="text" name="telefono" value="<?php echo $telefono;?>">
	<label>Carácter:</label>
	<?php
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
	?>
	<select>
	<label>Perspectiva:</label>
	<?php
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
	?>
	<select>
	<input type="submit" value="guardar" >
</form>