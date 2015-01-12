<?php
class t_d_venta{
public $url='';
public function __construct($ruta){
		session_start();	
		include_once("classes/restaFechasD.class.php");
		include_once("classes/mysql.php");
		$this->mysql=new MySQL();
		$this->ruta=$ruta;
	}
	public function td_Venta(){
		if($this->ruta=='dia'){
			$fech=" WHERE DATE(prospecta_concrecion.createtime) = date(NOW()) ";
		}elseif($this->ruta=='semana'){
			$fech=" WHERE WEEK(prospecta_concrecion.createtime) = WEEK(current_date) ";
		}elseif($this->ruta=='mes'){
			$fech=" WHERE MONTH(prospecta_concrecion.createtime) = MONTH(current_date) ";
		}elseif($this->ruta=='anyo'){
			$fech=" WHERE YEAR(prospecta_concrecion.createtime) = YEAR(current_date) ";
		}else{
			$fech='';
		}
		$sql=$this->mysql->consulta("SELECT prospecta_concrecion.id,prospecta_anuncio.precio FROM prospecta_concrecion INNER JOIN prospecta_anuncio ON prospecta_concrecion.anuncio = prospecta_anuncio.id ".$fech);

		/* Query{
			0=id;
			1=precio;
		}
		*/
		$quan=0;
		$catch  ='';
		while($row=$this->mysql->fetch_array($sql)){
			$quan=$quan+$row[1];
		}
		$catch  = $quan;
		$this->devuelve = $catch;
		return $this->devuelve;

	}
}
?>