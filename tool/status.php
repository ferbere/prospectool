<?php
include_once('../classes/mysql.php');
$mysql=new MySQL();
/*
include_once('../classes/status.class.php');
$cl=new sTatus();
$cl_1=$cl->sT();
echo $cl_1[1];
*/
//
if(isset($_POST['ruta'])){
	$ruta=$_POST['ruta'];
}
if(isset($_GET['ruta'])){
	$ruta=$_GET['ruta'];
}
if(empty($ruta)){
	$sql=$mysql->consulta("SELECT id,nombre FROM prospecta_panel WHERE visible = 1 ");
	while($row=$mysql->fetch_array($sql)){
		echo '<div id="st">';
		echo 	'<div id="st_tit">'.$row[1].'</div>';
		$sql2=$mysql->consulta("SELECT c_0,c_1,c_2,c_3,c_4 FROM prospecta_panel WHERE visible = 1 AND id = ".$row[0]);
		while($row2=$mysql->fetch_array($sql2)){
			for($i=0;$i<4;$i++){
				if($row2[$i]=='ano'){
					$sus[$i]='a&ntilde;o';
				}else{
					$sus[$i]=$row2[$i];
				}
				echo 	'<a href="status.php?ruta='.$row2[$i].'" class="rollover"><div id="st_c'.$i.'">'.$sus[$i].'</div></a>';
			}
		}
		echo '</div>';
	}
}elseif($ruta=='dia'){
	include("dis_status_dia.php");
}elseif($ruta=='semana'){

}elseif($ruta=='mes'){

}elseif($ruta=='ano'){

}