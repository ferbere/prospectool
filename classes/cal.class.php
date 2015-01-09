<?php
/* EMPIEZA CALCULA DÍA DE LA SEMANA */
function calcula_numero_dia_semana($dia,$mes,$ano){
	$numerodiasemana = date('w', mktime(0,0,0,$mes,$dia,$ano));
	if ($numerodiasemana == 0){ 
		$numerodiasemana = 6;
	}else{
		$numerodiasemana--;
	}
	return $numerodiasemana;
}
/* TERMINA CALCULA DÍA DE LA SEMANA */
/* EMPIEZA CALCULA ÚLTIMO DÍA DEL AÑO */
function ultimoDia($mes,$ano){ 
    $ultimo_dia=28; 
    while (checkdate($mes,$ultimo_dia + 1,$ano)){ 
       $ultimo_dia++; 
    } 
    return $ultimo_dia; 
} 
/* TERMINA CALCULA ÚLTIMO DÍA DEL AÑO */
/* EMPIEZA EL NOMBRE DEL MES */
function dame_nombre_mes($mes){
	session_start();
	if($_SESSION['lang']=='es'){
	$nombre_mes = array(1=>'Enero',2=>'Febrero',3=>'Marzo',4=>'Abril',5=>'mayo',6=>'Junio',7=>'Julio',8=>'Agosto',9=>'Septiembre',10=>'Octubre',11=>'Noviembre',12=>'Diciembre');
	}elseif(($_SESSION['lang']=='en')||($_SESSION['lang']=='')){
		$nombre_mes = array(1=>'January',2=>'February',3=>'March',4=>'April',5=>'May',6=>'June',7=>'July',8=>'August',9=>'September',10=>'October',11=>'November',12=>'December');
	}
	for($i=1;$i<=12;$i++){
		if($mes == $i){
			 $nombre_mes2 = $nombre_mes[$i]; 
		}
	}
	return $nombre_mes2;
}
/* TERMINA EL NOMBRE DEL MES */
/* EMPIEZA HOJA DE ESTILO A USAR */
function dame_estilo($dia_imprimir){
	global $mes,$ano,$dia_solo_hoy,$tiempo_actual;
	//dependiendo si el día es Hoy, Domigo o Cualquier otro, devuelvo un estilo
	if ($dia_solo_hoy == $dia_imprimir && $mes==date("n", $tiempo_actual) && $ano==date("Y", $tiempo_actual)){
		//si es hoy
		$estilo = " class='hoy'";
	}else{
		$fecha=mktime(12,0,0,$mes,$dia_imprimir,$ano);
		if (date("w",$fecha)==0){
			//si es domingo 
			$estilo = " class='domingo'";
		}else{
			//si es cualquier dia
			$estilo = " class='diario'";
		}
	}
	return $estilo;
}
/* EMPIEZA HOJA DE ESTILO A USAR */
/* EMPIEZA CALENDARIO */
function mostrar_calendario($mes,$ano){
	session_start();
	if($_SESSION['lang']=='es'){
		$ds = array(1=>'L',2=>'M',3=>'M',4=>'J',5=>'V',6=>'S',7=>'D');
	}elseif(($_SESSION['lang']=='en')||($_SESSION['lang']=='')){
		$ds = array(1=>'M',2=>'T',3=>'W',4=>'T',5=>'F',6=>'S',7=>'S');
	}
	if(isset($_GET['nuevo_mes'])){
		$nou_mes=$_GET['nuevo_mes'];
	}else{
		$nou_mes=$mes;
	}
	if(isset($_GET['nuevo_ano'])){
		$nou_ano=$_GET['nuevo_ano'];
	}else{
		$nou_ano=$ano;
	}
	global $parametros_formulario;
	//tomo el nombre del mes que hay que imprimir
	$nombre_mes = dame_nombre_mes($mes);
	//construyo la tabla general
	echo '<table class="tablacalendario" cellspacing="3" cellpadding="2" border="0">';
	echo '<tr><td colspan="7" class="tit">';
	//tabla para mostrar el mes el año y los controles para pasar al mes anterior y siguiente
	echo '<table id="cal_tits" width="100%" cellspacing="2" cellpadding="2" border="0"><tr><td class="messiguiente">';
	//calculo el mes y ano del mes anterior
	$mes_anterior = $mes - 1;
	$ano_anterior = $ano;
	if ($mes_anterior==0){
		$ano_anterior--;
		$mes_anterior=12;
	}
	echo "<a href='".$_SERVER['PHP_SELF']."?$parametros_formulario&nuevo_mes=$mes_anterior&nuevo_ano=$ano_anterior'><span>&lt;&lt;</span></a></td>";
	echo "<td class='titmesano'>$nombre_mes $ano</td>";
	echo "<td class='mesanterior'>";
	//calculo el mes y ano del mes siguiente
	$mes_siguiente = $mes + 1;
	$ano_siguiente = $ano;
	if ($mes_siguiente==13){
		$ano_siguiente++;
		$mes_siguiente=1;
	}
	echo "<a href='".$_SERVER['SELF_PHP']."?$parametros_formulario&nuevo_mes=$mes_siguiente&nuevo_ano=$ano_siguiente'><span>&gt;&gt;</span></a></td></tr></table></td></tr>";
	echo '	<tr>
			    <td width=14% class="diasemana">'.$ds[1].'</td>
			    <td width=14% class="diasemana">'.$ds[2].'</td>
			    <td width=14% class="diasemana">'.$ds[3].'</td>
			    <td width=14% class="diasemana">'.$ds[4].'</td>
			    <td width=14% class="diasemana">'.$ds[5].'</td>
			    <td width=14% class="diasemana">'.$ds[6].'</td>
			    <td width=14% class="diasemana">'.$ds[7].'</td>
			</tr>';
	
	//Variable para llevar la cuenta del dia actual
	$dia_actual = 1;
	
	//calculo el numero del dia de la semana del primer dia
	$numero_dia = calcula_numero_dia_semana(1,$mes,$ano);
	//echo "Numero del dia de demana del primer: $numero_dia <br>";
	
	//calculo el último dia del mes
	$ultimo_dia = ultimoDia($mes,$ano);
	
	//escribo la primera fila de la semana
	echo "<tr>";
	for ($i=0;$i<7;$i++){
		if ($i < $numero_dia){
			//si el dia de la semana i es menor que el numero del primer dia de la semana no pongo nada en la celda
			echo '<td class="diainvalido"><span></span></td>';
		} else {
			echo "<td class='diavalido'><span><a href='".$_SERVER['PHP_SELF']."?nuevo_mes=".$nou_mes."&nuevo_ano=".$nou_ano."&dia_actual=".$dia_actual."'". dame_estilo($dia_actual) .">$dia_actual</a><span></td>";
			$dia_actual++;
		}
	}
	echo "</tr>";
	
	//recorro todos los demás días hasta el final del mes
	$numero_dia = 0;
	while ($dia_actual <= $ultimo_dia){
		//si estamos a principio de la semana escribo el <TR>
		if ($numero_dia == 0)
			echo "<tr>";
		echo "<td class='diavalido'><span><a href='".$_SERVER['PHP_SELF']."?nuevo_mes=".$nou_mes."&nuevo_ano=".$nou_ano."&dia_actual=".$dia_actual."'". dame_estilo($dia_actual) .">$dia_actual</a><span></td>";
		$dia_actual++;
		$numero_dia++;
		//si es el uñtimo de la semana, me pongo al principio de la semana y escribo el </tr>
		if ($numero_dia == 7){
			$numero_dia = 0;
			echo "</tr>";
		}
	}
	
	//compruebo que celdas me faltan por escribir vacias de la última semana del mes
	for ($i=$numero_dia;$i<7;$i++){
		echo '<td class="diainvalido"><span></span></td>';
	}
	
	echo "</tr>";
	echo "</table>";
}
/* TERMINA CALENDARIO */
/* EMPIEZA FORMULARIO CALENDARIO */
function formularioCalendario($mes,$ano){
	global $parametros_formulario;
	session_start();
	if($_SESSION['lang']=='es'){
	$nombre_mes = array(1=>'Enero',2=>'Febrero',3=>'Marzo',4=>'Abril',5=>'mayo',6=>'Junio',7=>'Julio',8=>'Agosto',9=>'Septiembre',10=>'Octubre',11=>'Noviembre',12=>'Diciembre');
	$go='ir a mes';
	$ms = 'Mes';
	$ys = 'Año';
	}elseif(($_SESSION['lang']=='en')||($_SESSION['lang']=='')){
		$nombre_mes = array(1=>'January',2=>'February',3=>'March',4=>'April',5=>'May',6=>'June',7=>'July',8=>'August',9=>'September',10=>'October',11=>'November',12=>'December');
	$go='Go to month';
	$ms = 'Month';
	$ys = 'Year';
	}

echo '
	<br>
	<table align="center" cellspacing="2" cellpadding="2" border="0" class=tform>
	<tr><form action="availability.php?' . $parametros_formulario . '" method="POST">';
echo '
    <td align="center" valign="top">
		'.$ms.': <br>
		<select name=nuevo_mes>';
		for($i = 1; $i<=12;$i++){
			if($mes==$i){
				$sel = 'selected';
			}else{
				$sel = '';
			}
			echo '<option value="'.$i.'"'.$sel.'>'.$nombre_mes[$i].'</option>';
		}
echo '	</select>
		</td>
	    <td align="center" valign="top">
		'.$ys.': <br>
		<select name=nuevo_ano>';

for ($cont=1900;$cont<$ano+3;$cont++){
	echo "<option value='$cont'";
	if ($ano==$cont) 
   		echo " selected";
   	echo ">$cont";
}
echo '
	</select>
		</td>';
echo '
	</tr>
	<tr>
	    <td colspan="2" align="center"><input type="Submit" value="'.$go.'"></td>
	</tr>
	</table><br>
	
	<br>
	
	</form>';
}
/* TERMINA CALENDARIO */