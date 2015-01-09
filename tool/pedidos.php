<?php
session_start();
unset($_SESSION['cuenta']);
unset($_SESSION['cuenta_email']);
unset($_SESSION['cliente_e']);
if(!isset($_SESSION['cliente_e'])){
	$_SESSION['cliente_e']='pedidos';	
}
include_once("../classes/mysql.php");
$mysql=new MySQL();

include("buscar.php");
include("../classes/abre_cierra.class.php");
?>
<div id="divregistrar" class="link_s" align="center">
	<a href="javascript:abreC('registrar');">Registrar cliente</a>
	<div id="registrar" style="display:none;">
		<a href="javascript:cierraA('registrar');"> Cerrar</a>
		<?php
		if((!isset($_SESSION['cuenta'])||($_SESSION['cuenta']=='if_1'))){
			include("../sesion/account.php");	
		}elseif($_SESSION['cuenta']=='if_2'){
			include("../sesion/account2.php");	
		}
 ?>
	</div>
</div>
<div id="divtransito" class="link_s" align="center">
	<a href="javascript:abreC('transito');">Pedidos en tránsito</a>
	<div id="transito" style="display:none;">
		<a href="javascript:cierraA('transito');"> Cerrar</a>
		<?php  include("transito.php"); ?>
	</div>
</div>