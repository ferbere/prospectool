<?php
session_start();
if($adios==1){
	echo 'Hasta la vista, navegante.';
}
if(isset($_GET['loop'])){
	$loop=$_GET['loop'];
}

if($_SESSION['ip']!=''){
	header("Location:sesion.php?capturado=1");
}else{
?>
        <div align="center">
                        <form action="sesion.php" method="post">
							<input type="hidden" name="capturado" value="1">
							<input type="hidden" name="loop" value="<?php echo $loop ?>">
                            Usuario: <br><input type="text" name="user"><br>
                            Contraseña: <br><input type="password" name="passwd"><br>
                            <br><input type="submit" value="login">
                        </form><br>
        </div>
<?php } ?>