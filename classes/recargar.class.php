<script language="javascript" src="test/js/jquery-1.2.6.min.js"></script>
<script language="javascript">
function recargar(){	
	if ($actual<=13 && $actual>0) {
		$actual=$actual+1;
	} else {
		$actual=1;
	}
	var variable_post=$actual;
	$("#recargado").fadeOut(function() {
		$.post('../banners/bann00_perfil.php', { variable: variable_post }, function(data){	
		$("#recargado").html(data).fadeIn();
		});			
	});
}
$actual=0;
timer = setInterval("recargar()", 2000);
</script>
<div id="borde">
	<div id="recargado"></div>
</div>
