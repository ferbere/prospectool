<?php
class MenSAJE{
	public $sb;
	public $t='';
	public $m='';
	public $n='';
	public $c='';
	public $r='';
	public $mysql='';
	public function __contruct(){
		$this->saib=$sb;
	}
	public function men_pReV(){
		if(isset($_GET['rubro'])){
			$rubro=$_GET['rubro'];
		}
		include_once("mysql.php");
		$mysql2=new MySQL();
		$sql2 = $mysql2->consulta("SELECT id,titulo,nombre,contenido,DATE(fecha),TIME(fecha) FROM articulos_mensaje WHERE rel = '$rubro'");
		$cuenta2=$mysql2->num_rows($sql2);
		while($row2=$mysql2->fetch_array($sql2)){
			$catch0_1[]	= $row2[0];
			$catch0_2[]	= $row2[1];
			$catch0_3[] = $row2[2];
			$catch0_4[] = $row2[3];
			$catch0_5[] = $row2[4];
			$catch0_6[] = $row2[5];
		}
		$devuelve0[0]=$cuenta2;
		$devuelve0[1]=$catch0_1;
		$devuelve0[2]=$catch0_2;
		$devuelve0[3]=$catch0_3;
		$devuelve0[4]=$catch0_4;
		$devuelve0[5]=$catch0_5;
		$devuelve0[6]=$catch0_6;
		return $devuelve0;
	}
	public function men_fOrm(){
		if(isset($_GET['rubro'])){
			$rubro=$_GET['rubro'];
		}
		if(isset($_GET['titulo'])){
			$titulo=$_GET['titulo'];
		}
		if(isset($_GET['email'])){
			$email=$_GET['email'];
		}
			if(isset($_GET['email'])){
			$email=$_GET['email'];
		}
		$catch1  = '<div id="contact-form">';
		$catch1 .= '<h3>Deje un comentario</h3>';
		$catch1 .= '<form action="'.$_SERVER['PHP_SELF'].'?rubro='.$rubro.'&robru=1" method="post">';
		$catch1 .= '<input type="text" name="titulo" placeholder="Título" style="width:65%">';
		$catch1 .= '<input type="text" name="email" placeholder="Su correo-e" style="width:65%">';
		$catch1 .= '<input type="text" name="nombre" placeholder="Su nombre completo" style="width:65%">';
		$catch1 .= '<textarea name="contenido"  style="width:65% " rows="7"  placeholder="Su mensaje"></textarea><br>';
//		<!--	<input type="image"  src="style/images/enviar.png" class="rollover">-->
		$catch1 .= '<input type="submit"><br>';
		$catch1 .= '</div>';
		$devuelve1 = $catch1;
		return $devuelve1;
	}
	public function men_eXe(){
		if(isset($_GET['rubro'])){
			$rubro=$_GET['rubro'];
		}
		header("location:articulos.php?rubro=$rubro&robru=2");

		if(isset($_POST['titulo'])){
			$titulo=$_POST['titulo'];
		}
		if(isset($_POST['email'])){
			$email=$_POST['email'];
		}
		if(isset($_POST['nombre'])){
			$nombre=$_POST['nombre'];
		}
		if(isset($_POST['contenido'])){
			$contenido=$_POST['contenido'];
		}
		$this->t=$titulo;
		$this->m=$email;
		$this->n=$nombre;
		$this->c=$contenido;
		include_once("mysql.php");
		$mysql=new MySQL();
		$sql = $mysql->consulta("INSERT INTO articulos_mensaje (titulo,email,nombre,contenido,rel) VALUES ('{$this->t}','{$this->m}','{$this->n}','{$this->c}','{$rubro}')");
	$sep=(empty($sql))
			or die('Sí se capturó');
		$devuelve2 = $catch2;
		return $devuelve2;
	}
	public function men_bCk(){
		$catch3 = 'Muchas gracias por su participación';
		$devuelve3 = $catch3;
		return $devuelve3; 
	}
}



?>