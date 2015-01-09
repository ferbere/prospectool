<?php
include_once("../classes/mysql.php");
$mysql=new MySQL();

$lascuentas = array();

$result=$mysql->consulta("SELECT id,mesa,consumo,cantidad,tiempo FROM restaurante_consumo WHERE pagado = 0" );
while ($row = mysql_fetch_array($result))
{
    $mesa = $row['mesa'];
    $lascuentas[$mesa][] = $row['cantidad'];
}

    foreach ($lascuentas as $mesa => $cuenta)
    {
?>
    <h3><?php echo $mesa; ?></h3>
    <table class="chart">
<?php
	$suma=0;
    foreach ($cuenta as $agency)
    {
	
?>
		<tr><td><?php echo $agency; ?></td></tr>
<?php
    }
?>
    </table>
<?php
    }
?>