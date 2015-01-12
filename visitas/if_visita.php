<?php
session_start();
include_once("classes/mysql.php");
$mysql=new MySQL();

$sql=$mysql->consulta("SELECT numero FROM prospecta_edicion WHERE visible = 1 ORDER BY id DESC LIMIT 1");
while($row=$mysql->fetch_array($sql)){
	$numero=$row[0];
}
$date=date("d/m/Y");
/* Inicia resuelve el problema de repetir +invita sin control */
$sqel=$mysql->consulta("SELECT empresa FROM prospecta_visita");
$i=1;
$re='';
while($rowel=$mysql->fetch_array($sqel)){
	$re .= ' AND prospecta_directorio.id != '.$rowel[0];
}
/* Inicia resuelve el problema de repetir +invita sin control : agrega $re al query $sql2 */
$sql2=$mysql->consulta("SELECT prospecta_directorio.id,prospecta_directorio.empresa,prospecta_directorio.nombre,prospecta_cargo.nombre FROM prospecta_directorio INNER JOIN prospecta_cargo ON prospecta_directorio.cargo = prospecta_cargo.id WHERE prospecta_directorio.vendedor = ".$_SESSION['id'].$re);
?>
<h1>Añadir visita</h2>
<form action="visitas.php" method="post">
	<input type="hidden" name="form" value="ip3">
	<label style="width:100%">
		Nombre del ejecutivo: <b><i><?php echo $_SESSION['user'];?></b></i>
	</label>
	<label>Edición:</label>
	<input type="number" name="edicion" value="<?php echo $numero;?>" required>
	<fieldset style="background:rgba(50,50,50,0.1);border:1px dotted;border-radius:10px;margin:0px auto; width:80%">
		<legend>Se vendió:</legend>
<div class="radio">
	<label class="not" for="1">Sí</label>
	<input type="radio" name="concrecion" value="1" class="not2">
	<label class="not" for=0>No</label>
	<input type="radio" name="concrecion" value="0" class="not2">
</div>
	</fieldset>
<!--	<label>Fecha:</label>
	<input type="date" name="fecha" step required>-->
	<label>Empresa:</label>
	<select name="empresa">
<?php
while($row2=$mysql->fetch_array($sql2)){
//	$atendio=$row2[2];
//	$cargo=$row2[3];
	echo '<option value="'.$row2[0].'">'.$row2[1].'</option>';
}
?>
	</select>
	<label>Atendió:</label>
	<input type="text" name="atendio">
	<label>¿Se anuncia?</label>
<div class="radio">
	<label class="not" for="1">Sí</label>
	<input type="radio" name="anuncia" value="1" class="not2">
	<label class="not" for=0>No</label>
	<input type="radio" name="anuncia" value="0" class="not2">
</div>
	<label>Dónde se anuncia:</label>
	<input type="text" name="se_anuncia_d">
	<label>Se anuncia en Solo Ofertas:</label>
<div class="radio">
	<label class="not" for="1">Sí</label>
	<input type="radio" name="se_anuncia_so" value="1" class="not2">
	<label class="not" for=0>No</label>
	<input type="radio" name="se_anuncia_so" value="0" class="not2">
</div>
	<label>En cuántos días resuelve:</label>
	<input type="number" name="resuelve" range(1, 30)>
	<label>Le interesó:</label>
<div class="radio">
	<label class="not" for="1">Sí</label>
	<input type="radio" name="se_intereso" value="1" class="not2">
	<label class="not" for=0>No</label>
	<input type="radio" name="se_intereso" value="0" class="not2">
</div>
	<label>Qué le dijo el cliente:</label>
	<textarea name="que_dijo"></textarea>
	<label>Observaciones vendedor:</label>
	<textarea name="observaciones_v"></textarea>
	<input type="submit" value="guardar" >
</form>	