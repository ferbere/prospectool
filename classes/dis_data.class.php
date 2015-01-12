<?php
class disData{
public function __construct($priv,$depart){
		session_start();	
		include_once("classes/cambiaf_a_normal.class.php");
		include_once("classes/restaFechasD.class.php");
		include_once("classes/mysql.php");
		include_once("classes/sacar.class.php");
		$this->mysql=new MySQL();
		$this->priv=$priv;
	}
	public function dD1($date){
		switch ($date) {//Setea las especificaciones del query (éste viene como $sql hace mysql y regresa)
			case 'dia':
				$fech_date=" WHERE DATE(prospecta_visita.createtime) = date(NOW()) ";
				break;
			case 'semana':
				$fech_date=" WHERE WEEK(prospecta_visita.createtime) = WEEK(current_date) ";
				break;
			case 'mes':
				$fech_date=" WHERE MONTH(prospecta_visita.createtime) = MONTH(current_date) ";
				break;
			case 'anyo':
				$fech_date=" WHERE YEAR(prospecta_visita.createtime) = YEAR(current_date) ";
				break;
			default:
				$fech_date=" WHERE WEEK(prospecta_visita.createtime) = WEEK(current_date) ";
				break;
		}
		switch ($this->priv) {
			case 1:
				$muestra='';
				break;
			case 2:
				$muestra='';
				break;
			case 3:
				$muestra='';
				break;
			case 4:
				$muestra='';
				break;
			case 5:
				$muestra=" AND prospecta_visita.vendedor = ".$_SESSION['id'];
				break;
			default:
				$muestra=" AND prospecta_visita.vendedor = ".$_SESSION['id'];
				break;
		}
		$this->catch1[1]=$fech_date;
		$this->catch1[2]=$muestra;
		return null;
	}
	public function dD2($sql,$pez,$query,$query_long){//Esta es la consulta a la DB
//		$hoy=date('Y-m-d');
		$qy  =$this->mysql->consulta($sql.$this->catch1[1].$this->catch1[2].$pez.$query);
		$qty =$this->mysql->num_rows($qy);
		$i=1;
		while ($row=$this->mysql->fetch_array($qy)){
			for($g=0;$g<=$query_long;$g++){
				$chow[$i][]=$row[$g];
			}/*este es el meollo: aquí en el array, mete el array */
			$i=$i+1;
		}
		$this->catch2[1] = $qty;
		$this->catch2[2] = $chow;
		return $this->catch2;
	}
}
?>