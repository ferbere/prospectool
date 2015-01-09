<?php
require_once('../classes/template.class.php');
require_once('../classes/sacar.class.php');
if(isset($pagina)){
	$pagina=$_GET['pagina'];
}
$pagina= sacar($_SERVER['PHP_SELF'],"prospecta/","/index.php");
$tp=new templateParser('../template/template_'.$pagina.'.tpl');
include_once("../classes/conex.php");
$link = Conectarse();  
$consulta = mysql_query("SELECT * FROM template_index WHERE pagina = '$pagina' ",$link);
	while($row = mysql_fetch_array($consulta)){  
		$tp->parseTemplate($row);
		echo $tp->display();
	}
?>
