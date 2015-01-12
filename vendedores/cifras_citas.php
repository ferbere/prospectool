<?php
session_start();
include_once('classes/dis_data.class.php');
if(isset($_POST['ruta'])){
	$ruta=$_POST['ruta'];
}
if(isset($_GET['ruta'])){
	$ruta=$_GET['ruta'];
}
if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}
if(isset($_GET['orden'])){
	$orden=$_GET['orden'];
}
if(isset($_GET['xyo'])){
	$xyo=$_GET['xyo'];
}
if(isset($_GET['date'])){
	$date=$_GET['date'];
}
$depart='Citas programadas';
$priv=$_SESSION['privilegioss_id'];


/*** Los querys y/o arrays { ***/
include_once("classes/dis_data.class.php");

$sql_tits=array(0=>"Orden",1=>"Empresa",2=>"Reportarse en... días",3=>"Vendedor");
mysql_query('set @numero=0');
$sql_ord=array(0=>"prospecta_visita.id",1=>"prospecta_directorio.empresa",2=>"prospecta_visita.resuelve",3=>"prospecta_usuario.nombre");
$sql="SELECT @numero:=@numero+1,prospecta_directorio.empresa,prospecta_visita.resuelve,prospecta_usuario.nombre,date_format(prospecta_visita.createtime,'%W %d, %M %Y'),prospecta_visita.createtime,prospecta_visita.concrecion,prospecta_visita.id FROM prospecta_visita INNER JOIN prospecta_directorio ON prospecta_visita.empresa = prospecta_directorio.id INNER JOIN prospecta_usuario ON prospecta_visita.vendedor = prospecta_usuario.id ";
$pez=" AND prospecta_visita.resuelve !=''";
$query=' ';
if(empty($orden)){
	$query=" ";
}else{
	$query=' ORDER BY '.$sql_ord[$orden].' ASC ';
}
/*** } Los querys y/o arrays ***/
		/* Query{
			0=Orden (un contador autoincremental);
			1=empresa;
			6=resuelve; ahora = 2
			8=vendedor; ahora = 3
			7=create time (formato); ahora = 4
			(NO ESTÁN EN ARRAYS —sql_array,sa—, SÓLO SON PARA EL CÁLCULO DE $resuelve){
				9=create time (sin formato); ahora = 5
				10=concrecion; ahora = 6
				 =id; ahora = 7
			}
			11=id (para referenciar las variables);
		}
		*/

/*** } Los querys y/o arrays ***/
/*** Las variables { ***/
$query_long=7;
$sql_ord_long=count($sql_tits);
if(empty($date)){
	$date='anyo';
}
if($date=='anyo'){
	$sys='a&ntilde;o';
}else{
	$sys=$date;
}
switch ($this) {// Rellena el título para la navegación atrás y adelante;
	case 4:
		$thus=' que pasó';
		break;
	case 5:
		$thus=' que transcurre';
		break;
	case 6:
		$thus=' que viene';
		break;
	default:
		$thus=' que transcurre';
		break;
}
/*** } Las variables ***/
/**** El objeto instanciado { ****/
$dis=new disData($priv,$depart);//(privilegios,departamento: vistas)
$dis1=$dis->dD1($date);//fecha(dia,mes,semana y año)
$dis2=$dis->dD2($sql,$pez,$query,$query_long);//
	
/**** } El objeto instanciado ****/
/*** El objeto vivo {***/
		echo '<div>';
		echo 	'<div>';
		echo 		'<h1>'.$depart.'</h1>';
		echo 		'<h3>'.$sys.$thus.'</h3>';
		echo 	'</div>';
		echo '<table id="dis_visita">';
		echo '<tr>';
			for($h=0;$h<=($sql_ord_long);$h++){
		echo	 '<td id="Sdis_visita_tit"><a href="?ruta='.$ruta.'&orden='.$h.'">'.$sql_tits[$h].'</a></td>';
			}
		echo '</tr>';
		for($a=1;$a<=$dis2[1];$a++){
			$sfecha=date($dis2[2][$a][5]);//creatime, antes: [6]
			$fecha_pactada=strtotime('+'.$dis2[2][$a][2].' day',strtotime($sfecha));//9
			$fecha_pactada = date ('Y-m-d',$fecha_pactada);
			$rEstaf=rEstaf($fecha_pactada);
			$dfecha=$rEstaf[1];
			$ruta_lki='<td id="dis_visita_cont"><a href="visitas.php?ruta=&form=1&rubro='.$dis2[2][$a][7].'">';
			$ruta_lkf='</a></td>';
		echo '<tr>';
			for($i=0;$i<=($sql_ord_long-1);$i++){
				if($dis2[2][$a][$i]!=$dis2[2][$a][2]){
		echo 		$ruta_lki.$dis2[2][$a][$i].$ruta_lkf;			
				}elseif($dis2[2][$a][$i]==$dis2[2][$a][2]){
					if($dis2[2][$a][6]==0){//caracter
		echo 			$ruta_lki.$dfecha.$ruta_lkf;
					}else{
		echo 		$ruta_lki.'vendido'.$ruta_lkf;
					}
				}
			}
		echo '</tr>';
		}
		echo '</table>';
		echo '</div>';
		
/*** } El objeto vivo ***/
?>