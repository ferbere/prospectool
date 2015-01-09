<?php

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
echo '<h1>A&ntilde;adir visita</h2>';
echo '<form action="visita.php" method="post">';
echo '<input type="hidden" name="form" value="1">';
echo '<label style="width:100%">Nombre del ejecutivo: <b><i>'.$vendedor.'</b></i></label>';
echo '<label>Edici&oacute;n:</label>';
echo '<input type="number" name="edicion" value="'.$numero.'" required>';
echo '<fieldset style="background:rgba(50,50,50,0.1);border:1px dotted;border-radius:10px;margin:0px auto; width:80%">';
echo '<legend>Se vendi&oacute;:</legend>';
echo '<div class="radio">';
echo '<label class="not" for="1">S&iacute;</label><input type="radio" name="concrecion" value="1" class="not2">';
echo '<label class="not" for=0>No</label> <input type="radio" name="concrecion" value="0" class="not2">';
echo '</div>';
echo '</fieldset>';

echo '<label>Fecha:</label>';
echo '<input type="date" name="fecha" step required>';
echo '<label>Empresa:</label>';
echo '<select name="empresa">';
while($row2=$mysql->fetch_array($sql2)){
//	$atendio=$row2[2];
//	$cargo=$row2[3];
	echo '<option value="'.$row2[0].'">'.$row2[1].'</option>';
}
echo '</select>';
//echo '<label>Atendi&oacute;: '.$atendio.', '.$cargo.'</label>';
echo '<label>&iquest;Se anuncia?</label>';
echo '<div class="radio">';
echo '<label class="not" for="1">S&iacute;</label><input type="radio" name="anuncia" value="1" class="not2">';
echo '<label class="not" for=0>No</label> <input type="radio" name="anuncia" value="0" class="not2">';
echo '</div>';
echo '<label>D&oacute;nde se anuncia:</label>';
echo '<input type="text" name="se_anuncia_d">';
echo '<label>Se anuncia en Solo Ofertas:</label>';
echo '<div class="radio">';
echo '<label class="not" for="1">S&iacute;</label><input type="radio" name="se_anuncia_so" value="1" class="not2">';
echo '<label class="not" for=0>No</label> <input type="radio" name="se_anuncia_so" value="0" class="not2">';
echo '</div>';
echo '<label>En cu&aacute;ntos d&iacute;as resuelve:</label>';
echo '<input type="number" name="resuelve" range(1, 30)>';
echo '<label>Le interes&oacute;:</label>';
echo '<div class="radio">';
echo '<label class="not" for="1">S&iacute;</label><input type="radio" name="se_intereso" value="1" class="not2">';
echo '<label class="not" for=0>No</label> <input type="radio" name="se_intereso" value="0" class="not2">';
echo '</div>';
echo '<label>Qu&eacute; le dijo el cliente:</label>';
echo '<textarea name="que_dijo"></textarea>';
echo '<label>Observaciones vendedor:</label>';
echo '<textarea name="observaciones_v"></textarea>';
echo '<input type="submit" value="guardar" >';
echo '</form>';
?>