<div id="nav" class="nav_seccion">
	<ul>
<?php
	include_once("classes/mysql.php");
	$mysql = new MySQL();
		$sql = $mysql->consulta("SELECT ruta,nombre FROM gadgets_botones WHERE posicion = 6 ORDER BY id ASC");
		  while($row = $mysql->fetch_array($sql)){  
			echo '<li><a href="'.$row[0].'">'.$row[1].'</a></li>';  
		  }
?>
	</ul>
</div>