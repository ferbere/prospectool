<?php
if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
}
include_once("classes/conex.php");
$link = Conectarse();
?>
<div>
<?php
for($i=1; $i<=2;$i++){
	$sum=70*$i;
	 $consulta = mysql_query("SELECT titulo,contenido FROM corporativa  WHERE id = '$i' ",$link);
		  while($row = mysql_fetch_array($consulta)){
			echo '<div style="position: relative; float: left; left:'.$sum.'px">';
			echo '<strong>'.$row['titulo'].'</strong><br>';
			echo '<small>'.$row['contenido'].'</small> ';  
			echo '</div>';
		  }
}
?>
</div>