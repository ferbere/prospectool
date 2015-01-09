<?php
session_start();
if($_SESSION['ruta']==''){
	$seleccion = '';
}else{
	$seleccion = '';
//	$seleccion = ' WHERE categoria = '.$_SESSION['ruta'];
}

$requested_page = $_POST['page_num'];
$set_limit = (($requested_page - 1) * 12) . ",12";
?>
<script type="text/javascript">
$(function() {
    $('#galleryS a').lightBox();
});
</script>

<?php
include_once("../classes/mysql.php");
$mysql = new MySQL();
$sql = $mysql->consulta("SELECT * FROM fotos_index ".$seleccion." ORDER BY fecha DESC LIMIT $set_limit");
$html = '';
while ($row = mysql_fetch_array($sql)) {
    $html .= "<div id='galleryS'>";
	$html .=	"<a href='images/fotos/" . $row['imagen'] . "' title='".$row['descsripcion']."'>";	
	$html .=		"<img src='images/fotos/" . $row['imagen'] . "' />";
	$html .=	"</a>";
	$html .=  "</div>";
}
echo $html;
exit;
?>