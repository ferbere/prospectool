<?php
include_once("classes/conex.php");
$link = Conectarse();  
require_once('classes/template.class.php');
$tp=new templateParser('template/template_footer.tpl');

$consulta = mysql_query("SELECT bann1,bann2,bann3,bann4,bann0 FROM template_index WHERE pagina = 'nivel_footer' ",$link);
	while($row = mysql_fetch_array($consulta)){  
		$tp->parseTemplate($row);
		echo $tp->display();
}
?>
