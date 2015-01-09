<script language="javascript" src="try/js/jquery-1.2.6.min.js"></script>
<script language="javascript">
function recargar(){	
	if ($actual<13 && $actual>0) {
		$actual=$actual+1;
	} else {
		$actual=1;
	}
	var variable_galeria=$actual;
	$("#try_galeria").fadeOut(function() {
		$.post('banners/bann00_try_galeria.php', { variable: variable_galeria }, function(data){	
		$("#try_galeria").html(data).fadeIn();
		});			
	});
}
$actual=1;
timer = setInterval("recargar()", 5000);
</script>
<div id="bordes">
	<div id="try_galeria">opopop<?php //include("banners/bann00_try_1.php");?></div>
</div>
