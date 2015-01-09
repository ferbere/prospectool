<?php
session_start();
include_once("../classes/sumafechas.class.php");
$sql=$mysql->consulta("SELECT prospecta_visita.edicion,prospecta_visita.empresa,prospecta_visita.se_anuncia,prospecta_visita.se_anuncia_d,prospecta_visita.se_anuncia_so,prospecta_visita.resuelve,prospecta_visita.se_intereso,prospecta_visita.que_dijo,prospecta_visita.observaciones_v,prospecta_visita.vendedor,prospecta_visita.observaciones_g,prospecta_visita.observaciones_dg,prospecta_visita.concrecion,prospecta_visita.createtime FROM prospecta_visita WHERE prospecta_visita.id = '$rubro' AND prospecta_visita.vendedor = ".$_SESSION['id']);
$sql2=$mysql->consulta("SELECT id,empresa FROM prospecta_directorio");
while($row=$mysql->fetch_array($sql)){
	$edicion = $row[0];
	$empresa = $row[1];
	$se_anuncia=$row[2];
	$se_anuncia_d=$row[3];
	$se_anuncia_so=$row[4];
	$resuelve=$row[5];	
	$se_intereso=$row[6];
	$que_dijo=$row[7];
	$observaciones_v=$row[8];
	$vendedor_v=$row[9];
	$observaciones_g=$row[10];
	$observaciones_dg=$row[11];
	$concrecion=$row[12];
	$fecha=$row[13];
}
?>
<h2>Visita inicial</h2>
<h3><?php echo date("d-M-Y",strtotime($fecha));?></h3>
<form id="foo" action="ver_visita.php" method="post">
<input type="hidden" name="form" value="4">
<input type="hidden" name="rubro" value="<?php echo $rubro;?>">
<!--
<label>Edición: (cambiar)</label>
<input type="text" name="edicion" value="<?php echo $edicion;?>">-->
<label>Empresa: (cambiar)</label>
<select name="empresa">
<?php
while($row2=$mysql->fetch_array($sql2)){
if($row2[0]==$empresa){
	$em='selected';
}else{
	$em='nain';
}
	echo '<option value="'.$row2[0].'" '.$em.'>'.$row2[1].'</option>';
}
?>
</select>
<!--<label>Atendi&oacute;: <?php echo $atendio.', '.$cargo; ?></label>-->
<label>&iquest;Se anuncia?</label>
<div class="radio">
	<label class="not" for="1">S&iacute;</label>
<?php
	if($se_anuncia==0){
		$seanunno="checked";
		$seanunsi="nain";
	}elseif($se_anuncia==1){
		$seanunno="nain";
		$seanunsi="checked";
	}
?>
<input type="radio" name="se_anuncia" value="1" class="not2" <?php echo $seanunsi;?>>
<label class="not" for="0">No</label>
<input type="radio" name="se_anuncia" value="0" class="not2" <?php echo $seanunno;?>>
</div>
<label>D&oacute;nde se anuncia:</label>
<input type="text" name="se_anuncia_d" value="<?php echo $se_anuncia_d;?>">
<label>Se anuncia en Solo Ofertas:</label>
<div class="radio">
	<label class="not" for="1">S&iacute;</label>
<?php 
	if($se_anuncia_so==0){
		$sesono="checked";
		$sesosi="nain";
	}elseif($se_anuncia_so==1){
		$sesono="nain";
		$sesosi="checked";
	}
?>
	<input type="radio" name="se_anuncia_so" value="1" class="not2"<?php echo $sesosi;?>>
	<label class="not" for="0">No</label>
	<input type="radio" name="se_anuncia_so" value="0" class="not2"<?php echo $sesono;?>>
</div>
<label>En cu&aacute;ntos d&iacute;as resuelve:</label>
<input type="number" name="resuelve" range(1, 30) value="<?php echo $resuelve;?>">
<label>Le interes&oacute;:</label>
<?php 
	if($se_intereso==0){
		$seinno="checked";
		$seinsi="nain";
	}elseif($se_intereso==1){
		$seinno="nain";
		$seinsi="checked";
	}
?>
<div class="radio">
	<label class="not" for="1">S&iacute;</label><input type="radio" name="se_intereso" value="1" <?php echo $seinsi;?> class="not2">
	<label class="not" for=0>No</label> <input type="radio" name="se_intereso" value="0" <?php echo $seinno;?> class="not2">
</div>
<label>Qu&eacute; le dijo el cliente:</label>
<textarea name="que_dijo"><?php echo $que_dijo;?></textarea>
<label>Observaciones vendedor:</label>
<textarea name="observaciones_v"><?php echo $observaciones_v;?></textarea>
<label>Observaciones Gerencia de ventas:</label>
<label><b><small><?php echo $observaciones_g;?></small></b></label>
<label>Observaciones Direcci&oacute;n General:</label>
<label><b><small><?php echo $observaciones_dg;?></small></b></label>
<?php
/* modify { */
	$registro=date("Y-m-d",strtotime($fecha));
	$fut= sUmaf($registro,"+2 day");
	$futuro = date("Y-m-d",strtotime($fut));
	date_default_timezone_set('America/Chicago');
	$d_fut = new DateTime($futuro);
	$d_hoy = new DateTime();
	$vale=($d_fut > $d_hoy);
	if($vale==true){
		echo '<input type="submit" value="guardar" >';	
	}else{

	}
/* } modify */

?>
</form>