<?php
session_start();
include_once("../classes/alerta.class.php");
if(isset($_GET['visita_s'])){
	$visita_s=$_GET['visita_s'];
}
$sql=$mysql->consulta("SELECT prospecta_visita.id,prospecta_visita.edicion,prospecta_directorio.empresa,prospecta_visita.vendedor,prospecta_visita.concrecion,prospecta_visita.createtime,prospecta_visita.resuelve FROM prospecta_visita INNER JOIN prospecta_directorio ON prospecta_visita.empresa = prospecta_directorio.id WHERE prospecta_visita.id = '$rubro' AND prospecta_visita.vendedor = ".$_SESSION['id']);
while($row=$mysql->fetch_array($sql)){
	$visita = $row[0];
	$edicion = $row[1];
	$empresa = $row[2];
	$vendedor_v=$row[3];
	$concrecion = $row[4];
	$fecha=$row[5];
	$resuelve=$row[6];
}
$sql2=$mysql->consulta("SELECT id,createtime,resuelve FROM prospecta_visita_seg WHERE visita = '$visita' ORDER BY createtime DESC");
if($_SESSION['id']!=$vendedor_v){
	echo 'No es un contenido que usted pueda ver. Pero com&eacute;ntele sin pena a su jefe inmediato para obtener las licencias necesarias.';
}else{
?>
<!-- Formato general{-->
	<h1>Seguimiento de visitas</h1>
		<label>Empresa: <b><?php echo $empresa; ?></b></label>
		<label style="width:100%">Nombre del ejecutivo: <b><i><?php echo $vendedor;?></b></i></label>
		<fieldset>
			<legend>Se vendió:</legend>
			<?php
				if($concrecion==0){
					$concno="checked";
					$concsi="nain";
				}else{
					$concno="nain";
					$concsi="checked";
				}
			?>
			<div class="radio">
				<label class="not" for="1">Sí</label>
				<input form="foo" type="radio" name="concrecion" value="1" <?php echo $concsi;?> class="not2">
				<label class="not" for=0>No</label>
				<input form="foo" type="radio" name="concrecion" value="0" <?php echo $concno;?> class="not2">
			</div>
		</fieldset>
		<label>Edición:</label>
		<input form="foo" type="number" name="edicion" value="<?php echo $edicion; ?>" required>
<!--}Formato general -->
<!-- Formato visitas{-->
	<div>
<?php
	$exts=$_SERVER['PHP_SELF'].'?ruta=ver_visita.php&form=1&rubro='.$rubro.'&departamento=null&visita_s=';
?>
	<div id="visitas_seg">
		<ul>
<?php
	$i=1;
	while($row2=$mysql->fetch_array($sql2)){
		$id_pos=$row2[0];
		$createtime_pos=$row2[1];
		$resuelve_pos[$i]=$row2[2];
?>
			<li>
				<a href="<?php echo $exts.$row2[0];?>">
					<?php echo date("d-M-Y",strtotime($createtime_pos));?>
				</a>
			</li>
<?php
		$i=$i+1;
	}
?>
			<li>
				<a href="<?php echo $exts;?>ini">
					Visita inicial
				</a>
			</li>
			<li>
				<a href="<?php echo $exts;?>post">
					Nueva Visita
				</a>
			</li>
		</ul>
	</div>
<?php
		if(!empty($createtime_pos)){
			$fecha_fc=$createtime_pos;
			$resuelve_fc=$resuelve_pos[1];
		}else{
			$fecha_fc=$fecha;
			$resuelve_fc=$resuelve;
		}
		echo aLerta($fecha_fc,$resuelve_fc,$concrecion);
		if(!empty($visita_s)){
			if($visita_s=='ini'){
				$visita_include='if_visita_a.php';
			}elseif($visita_s=='post'){
				$visita_include='if_visitas_posteriores.php';
			}else{
				$visita_include='visitas_posteriores.php';
			}
			include($visita_include);
		}
?>
	</div>
<?php
}
?>