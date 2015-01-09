<?php
if(isset($_GET['f'])){
	$f=$_GET['f'];
}
		if(strpos($f,"/")!==false){
		    die("No puedes navegar por otros directorios");
		}
		
		header("Content-type: application/octet-stream");
		header("Content-Disposition: attachment; filename=\"$f\"\n");
		$fp=fopen("$f", "r");
		fpassthru($fp);
?>