<script language="javascript">
function recargar(){	
	if ($actual<13 && $actual>0) {
		$actual=$actual+1;
	} else {
		$actual=1;
	}
	var variable_post=$actual;
	$("#recargado").fadeOut(10,function() {
		$.post('banners/bann00_try.php', { variable: variable_post }, function(data){	
		$("#recargado").html(data).fadeIn(10);
		});			
	});
}
$actual=1;
timer = setInterval("recargar()", 10000);
</script>
<div id="borde">
	<div id="recargado"><?php include("banners/bann00_try_1.php");?></div>
</div>
