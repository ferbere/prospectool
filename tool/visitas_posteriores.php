<?php
include_once("../classes/mysql.php");
include_once("../classes/sumafechas.class.php");
$mysql=new MySQL();
if(isset($_GET['visita_s'])){
	$visita_s=$_GET['visita_s'];
}
$sql=$mysql->consulta("SELECT id,visita,resultado,resuelve,createtime AS fecha FROM prospecta_visita_seg WHERE visita = '$visita' AND id = '$visita_s'");
while($row=$mysql->fetch_array($sql)){
	$id = $row[0];
	$resultado = $row[2];
	$resuelve = $row[3];
	$fecha = $row[4];
}
?>
<h2>Visita posterior</h2>
<h3><?php echo date("d-M-Y",strtotime($fecha));?></h3>
<form action="ver_visita.php" method="post">
<input type="hidden" name="form" value="10">
<input type="hidden" name="rubro" value="<?php echo $rubro;?>">
<label>Resultado:</label>
<textarea name="resultado"><?php echo $resultado;?></textarea>
<label>En cuántos días resuelve:</label>
<input type="number" name="resuelve" range(1, 180) value="<?php echo $resuelve;?>">
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