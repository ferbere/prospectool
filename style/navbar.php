<?php
session_start();
include_once("classes/navbar.class.php");
include_once("classes/sacar.class.php");
$pagina=sacar($_SERVER['PHP_SELF'],'prospecta/','.php');

if(isset($_POST['ruta'])){
	$ruta=$_POST['ruta'];
}
if(isset($_GET['ruta'])){
	$ruta=$_GET['ruta'];
}
?>
<div id="nb_tool">
	<ul>
<?php
$eje=new navBar(7,null,1);
$dame_eje=$eje->dBin($_SESSION['privilegioss_id']);
$dame_eje2=$eje->bTn();
	for($i=1;$i<=$dame_eje2[0];$i++){	?>
	<li>
		<a href="<?php echo $dame_eje2[4][$i];?>">
			<?php echo $dame_eje2[1][$i]; ?>
		</a>
	</li>
<?php }	
if(($ruta=='directorio')&&($pagina=='vendedores')){
	$aja=new navBar(7,null,5);
	$dame_aja=$aja->dBin($_SESSION['privilegioss_id']);
	$dame_aja2=$aja->bTn();
		for($e=1;$e<=$dame_aja2[0];$e++){	?>
		<li>
			<a href="<?php echo $dame_aja2[4][$e];?>">
				<?php echo $dame_aja2[1][$e]; ?>
			</a>
		</li>
<?php
	 	}
}
?>
	</ul>
</div>
