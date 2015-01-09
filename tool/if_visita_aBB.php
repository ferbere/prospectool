<?php
session_start();
include_once("../classes/cambiaf_a_normal.class.php");
include_once("../classes/restaFechasD.class.php");
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
/* intento */
	$hoy=date('Y-m-d');
	$fecha_d=cambiaf_a_normal($fecha);
	$sfecha=date($fecha);
	$fecha_pactada=strtotime('+'.$resuelve.' day',strtotime($sfecha));
	$fecha_pactada = date ('Y-m-d',$fecha_pactada);
	if($resuelve==0){
		$resuelve_m='';
	}else{
		$resuelve_m=' Contactar el '.cambiaf_a_normal($fecha_pactada).'. <b>&iexcl;Faltan '.rEstaf($fecha_pactada).' d&iacute;as!</b>';
	}
	if($concrecion==0){
		echo '<div id="alerta">'.$resuelve_m.'</div>';
	}else{
		echo '<div id="vendido">vendido</div>';
	}
	/* ntento */
if($_SESSION['id']!=$vendedor_v){
	echo 'No es un contenido que usted pueda ver. Pero com&eacute;ntele sin pena a su jefe inmediato para obtener las licencias necesarias.';
}else{
	echo '<h1>Seguimiento de visita</h2>';
	echo '<form action="ver_visita.php" method="post">';
	echo '<input type="hidden" name="form" value="4">';
	echo '<input type="hidden" name="rubro" value="'.$rubro.'">';
	echo '<label style="width:100%">Nombre del ejecutivo: <b><i>'.$vendedor.'</b></i></label>';
	echo '<fieldset style="background:rgba(50,50,50,0.1);border:1px dotted;border-radius:10px;margin:0px auto; width:80%">';
	echo '<legend>Se vendi&oacute;:</legend>';
			if($concrecion==0){
				$concno="checked";
				$concsi="nain";
			}elseif($se_intereso==1){
				$concno="nain";
				$concsi="checked";
			}
	echo '<div class="radio">';
	echo '<label class="not" for="1">S&iacute;</label><input type="radio" name="concrecion" value="1" '.$concsi.' class="not2">';
	echo '<label class="not" for=0>No</label> <input type="radio" name="concrecion" value="0" '.$concno.' class="not2">';
	echo '</div>';
	echo '</fieldset>';
	echo '<label>Edici&oacute;n:</label>';
	echo '<input type="number" name="edicion" value="'.$edicion.'" required>';
	echo '<label>Empresa:</label>';
	echo '<select name="empresa">';
	while($row2=$mysql->fetch_array($sql2)){
	if($row2[0]==$empresa){
		$em='selected';
	}else{
		$em='nain';
	}
		echo '<option value="'.$row2[0].'" '.$em.'>'.$row2[1].'</option>';
	}
	echo '</select>';
	//echo '<label>Atendi&oacute;: '.$atendio.', '.$cargo.'</label>';
	echo '<label>&iquest;Se anuncia?</label>';
	echo '<div class="radio">';
	echo '<label class="not" for="1">S&iacute;</label>';
		if($se_anuncia==0){
			$seanunno="checked";
			$seanunsi="nain";
		}elseif($se_anuncia==1){
			$seanunno="nain";
			$seanunsi="checked";
		}

	echo '<input type="radio" name="anuncia" value="1" class="not2" '.$seanunsi.'>';
	echo '<label class="not" for="0">No</label>';
	echo '<input type="radio" name="anuncia" value="0" class="not2" '.$seanunno.'>';
	echo '</div>';
	echo '<label>D&oacute;nde se anuncia:</label>';
	echo '<input type="text" name="se_anuncia_d" value="'.$se_anuncia_d.'">';
	echo '<label>Se anuncia en Solo Ofertas:</label>';

		if($se_anuncia_so==0){
			$sesono="checked";
			$sesosi="nain";
		}elseif($se_anuncia_so==1){
			$sesono="nain";
			$sesosi="checked";
		}
	echo '<div class="radio">';
	echo '<label class="not" for="1">S&iacute;</label><input type="radio" name="se_anuncia_so" value="1" '.$sesosi.' class="not2">';
	echo '<label class="not" for=0>No</label> <input type="radio" name="se_anuncia_so" value="0" '.$sesono.'class="not2">';
	echo '</div>';

	echo '<label>En cu&aacute;ntos d&iacute;as resuelve:</label>';
	echo '<input type="number" name="resuelve" range(1, 30) value="'.$resuelve.'">';
	echo '<label>Le interes&oacute;:</label>';
		if($se_intereso==0){
			$seinno="checked";
			$seinsi="nain";
		}elseif($se_intereso==1){
			$seinno="nain";
			$seinsi="checked";
		}
echo '<div class="radio">';
echo '<label class="not" for="1">S&iacute;</label><input type="radio" name="se_intereso" value="1" '.$seinsi.' class="not2">';
echo '<label class="not" for=0>No</label> <input type="radio" name="se_intereso" value="0" '.$seinno.' class="not2">';
echo '</div>';

	echo '<label>Qu&eacute; le dijo el cliente:</label>';
	echo '<textarea name="que_dijo">'.$que_dijo.'</textarea>';
	echo '<label>Observaciones vendedor:</label>';
	echo '<textarea name="observaciones_v">'.$observaciones_v.'</textarea>';
	echo '<label>Observaciones Gerencia de ventas:</label>';
	echo '<label><b><small>'.$observaciones_g.'</small></b></label>';
	echo '<label>Observaciones Direcci&oacute;n General:</label>';
	echo '<label><b><small>'.$observaciones_dg.'</small></b></label>';
	echo '<input type="submit" value="guardar" >';
	echo '</form>';
}
?>