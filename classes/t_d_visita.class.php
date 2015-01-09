<?php
class t_d_visita{
public $url='';
public function __construct($ruta){
		session_start();	
		include_once("../classes/restaFechasD.class.php");
		include_once("../classes/mysql.php");
		$this->mysql=new MySQL();
		$this->ruta=$ruta;
	}
	public function td_Visita(){
		if($this->ruta=='dia'){
			$fech=" WHERE DATE(prospecta_visita.createtime) = date(NOW()) ";
		}elseif($this->ruta=='semana'){
			$fech=" WHERE WEEK(prospecta_visita.createtime) = WEEK(current_date) ";
		}elseif($this->ruta=='mes'){
			$fech=" WHERE MONTH(prospecta_visita.createtime) = MONTH(current_date) ";
		}elseif($this->ruta=='anyo'){
			$fech=" WHERE YEAR(prospecta_visita.createtime) = YEAR(current_date) ";
		}else{
			$fech='';
		}
		$sql=$this->mysql->consulta("SELECT prospecta_visita.id FROM prospecta_visita ".$fech);
		$cuenta=$this->mysql->num_rows($sql);
		/* Query{
			0=id;
		}
		*/
		$catch  =$cuenta;
		$this->devuelve = $catch;
		return $this->devuelve;

	}
}
?>