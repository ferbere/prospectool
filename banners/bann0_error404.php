<?php
session_start();
include_once("classes/mysql.php");
$mysql=new MySQL();
if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
}
?>
<div id="opinion">
<?php
$sql = $mysql->consulta("SELECT titulo,contenido FROM corporativa_index WHERE id = 9");

while($row = $mysql->fetch_array($sql)){
	echo	'<h1>'.$row[0].'</h1>';
	echo	'<div id="contenido">';
	echo 		$row[1];
	echo	'</div>';
}?>
</div>