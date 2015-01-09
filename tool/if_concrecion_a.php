<?php
session_start();
$sql=$mysql->consulta("SELECT prospecta_directorio.empresa,usuario_index.nombre,prospecta_concrecion.edicion,prospecta_concrecion.pagado FROM prospecta_concrecion INNER JOIN prospecta_directorio ON prospecta_concrecion.empresa = prospecta_directorio.id INNER JOIN usuario_index ON prospecta_concrecion.vendedor = usuario_index.id WHERE prospecta_concrecion.id = ".$_SESSION['rubro']);
while($row=$mysql->fetch_array($sql)){
	$empresa 	= $row[0];
	$vendedor 	= $row[1];
	$edicion	= $row[2];
	$pagado 	= $row[3];
	$id 		= $_SESSION['rubro'];
}
/* intento */
	echo '<h1>Venta concretada</h2>';
	echo '<form action="ver_visita.php" method="post">';
	echo '<input type="hidden" name="form" value="7">';
	echo '<input type="hidden" name="rubro" value="'.$id.'">';
	echo '<label style="width:100%">Nombre del ejecutivo: <b><i>'.$vendedor.'</b></i></label>';
	echo '<label>Edicion: '.$edicion.'</label>';
	echo '<label>Empresa: '.$empresa.'</label>';

	echo '<label>Pagado:</label>';
		if($pagado==0){
			$pagno="checked";
			$pagsi="nain";
		}elseif($pagado==1){
			$pagno="nain";
			$pagsi="checked";
		}
echo '<div class="radio">';
echo '<label class="not" for="1">S&iacute;</label><input type="radio" name="pagado" value="1" '.$pagsi.' class="not2">';
echo '<label class="not" for=0>No</label> <input type="radio" name="pagado" value="0" '.$pagno.' class="not2">';
echo '</div>';

	echo '<label>Anuncio:</label>';
	echo '<select name="anuncio">';
	$sql2=$mysql->consulta("SELECT id,nombre FROM prospecta_anuncio");
	while($row2=$mysql->fetch_Array($sql2)){
		echo '<option value="'.$row2[0].'">'.$row2[1].'</option>';
	}
	echo '</select>';

	echo '<input type="submit" value="guardar" >';
	echo '</form>';
?>