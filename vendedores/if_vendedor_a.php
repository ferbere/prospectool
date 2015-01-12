<?php
session_start();
include_once("classes/mysql.php");
$mysql=new MySQL();

if(isset($_GET['xyo'])){
	$xyo=$_GET['xyo'];
}
if($_SESSION['privilegioss_id']<=4){
	$muestra='';
}else{
	$muestra=" AND prospecta_usuario.id = ".$_SESSION['id'];
}

$sql=$mysql->consulta("SELECT prospecta_usuario.user,prospecta_usuario.nombre,prospecta_usuario.nombramiento,prospecta_usuario.domicilio,prospecta_usuario.poblacion,prospecta_usuario.estado,prospecta_usuario.cp,prospecta_usuario.rfc,prospecta_usuario.email,prospecta_usuario.telefono,prospecta_usuario.celular,prospecta_usuario.privilegios FROM prospecta_usuario  WHERE prospecta_usuario.id = '$xyo' ".$muestra);
while($row=$mysql->fetch_array($sql)){
	$user=$row[0];
	$nombre=$row[1];
	$nombramiento=$row[2];
	$domicilio=$row[3];
	$poblacion=$row[4];
	$estado=$row[5];
	$cp=$row[6];
	$rfc=$row[7];
	$email=$row[8];
	$telefono=$row[9];
	$celular=$row[10];
	$privilegios=$row[11];
}
?>
<form action="vendedores.php" method="post">
	<input type="hidden" name="ruta" value="directorio">
	<input type="hidden" name="form" value="6">
	<input type="hidden" name="xyo" value="<?php echo $xyo;?>">
	<h1>Directorio</h2>
	<label>Usuario:</label>
	<input type="text" name="user" value="<?php echo $user;?>">
	<?php
	if(($_SESSION['privilegioss_id']==4)||($_SESSION['privilegioss_id']==1)){?>
		<label>Privilegios:</label>
		<?php
		$sql2=$mysql->consulta("SELECT id,nombre FROM usuario_privilegios WHERE id > 1");
			echo '<select name="privilegios">';
			while($row2=$mysql->fetch_array($sql2)){
				if($row2[0]==$privilegios){
					$slct2='selected';
				}else{
					$slct2='nain';
				}
				echo '<option value="'.$row2[0].'" '.$slct2.'>'.$row2[1].'</option>';
			}
			echo '</select>';
	}
	?>
	<label>Nombre:</label>
	<input type="text" name="nombre" value="<?php echo $nombre;?>">
	<label>Nombramiento:</label>
	<input type="text" name="nombramiento" value="<?php echo $nombramiento;?>">
	<label>Dirección:</label>
	<input type="text" name="domicilio" value="<?php echo $domicilio;?>">
	<label>Población:</label>
	<?php
	$sql3=$mysql->consulta("SELECT id,nombre FROM general_municipios WHERE visible = 1");
		echo '<select name="poblacion">';
		while($row3=$mysql->fetch_array($sql3)){
			if($row3[0]==$poblacion){
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
			if($row4[0]==$estado){
				$slct4='selected';
			}else{
				$slct4='nain';
			}
		echo '<option value="'.$row4[0].'" '.$slct4.'>'.$row4[1].'</option>';
	}
	?>
	</select>
	<label>Código Postal:</label>
	<input type="text" name="cp" value="<?php echo $cp;?>">
	<label>RFC:</label>
	<input type="text" name="rfc" value="<?php echo $rfc;?>">
	<label>Correo-e:</label>
	<input type="text" name="email" value="<?php echo $email;?>">
	<label>Teléfono:</label>
	<input type="text" name="telefono" value="<?php echo $telefono;?>">
	<label>Celular:</label>
	<input type="text" name="celular" value="<?php echo $celular;?>">
	<input type="submit" value="guardar" >
</form>
