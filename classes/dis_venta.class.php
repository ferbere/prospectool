<?php
class dis_visita{
public $url='';
public function __construct($url_viene,$ruta,$dep,$cambio){
		session_start();	
		include_once("cambiaf_a_normal.class.php");
		include_once("restaFechasD.class.php");
		include_once("mysql.php");
		include_once("sacar.class.php");
		$this->mysql=new MySQL();
		$this->url=$url_viene;
		$this->ruta=$ruta;
		$this->dep=$dep;
		$this->cambio=$cambio;
	}
	public function dvB(){
		if($this->cambio=='masuno'){
			$this->change='+1';
		}elseif($this->cambio=='menosuno') {
			$this->change='-1';
		}
		return	$this->devuelve0=$this->change;
	}
	public function dV(){
		$sql_array=array(0=>"Id",1=>"Empresa",2=>"Vendedor",3=>"Edici&oacute;n",4=>"anuncio",5=>"pagado",6=>"Fecha");
		$s_a=array(0=>"prospecta_concrecion.id",1=>"prospecta_directorio.empresa",2=>"usuario_index.nombre",3=>"prospecta_concrecion.edicion",4=>"prospecta_anuncio.nombre",5=>"prospecta_concrecion.pagado",6=>"prospecta_visita.fecha");
		$cuent=count($sql_array);
		if($this->ruta=='dia'){
			$fech=" WHERE DATE(prospecta_concrecion.createtime) = date(NOW()) ";
		}elseif($this->ruta=='semana'){
			$fech=" WHERE WEEK(prospecta_concrecion.createtime) = WEEK(current_date) ";
		}elseif($this->ruta=='mes'){
			$fech=" WHERE MONTH(prospecta_concrecion.createtime) = MONTH(current_date) ";
		}elseif($this->ruta=='ano'){
			$fech=" WHERE YEAR(prospecta_concrecion.createtime) = YEAR(current_date) ";
		}else{
			$fech='';
		}
		if($_SESSION['privilegioss_id']<=4){
			$muestra='';
		}else{
			$muestra=" WHERE prospecta_concrecion.vendedor = ".$_SESSION['id'];
		}
		if(isset($_GET['orden'])){
			$orden=$_GET['orden'];
		}
		if(empty($orden)){
			$query=" ";
		}else{
			$query=" ";
//			$query=' ORDER BY '.$s_a[$orden].' ASC ';
		}
			$hoy=date('Y-m-d');

		$sql=$this->mysql->consulta("SELECT prospecta_concrecion.id,prospecta_directorio.empresa,usuario_index.nombre,prospecta_concrecion.edicion,prospecta_anuncio.nombre,general_sino.nombre,prospecta_concrecion.createtime FROM prospecta_concrecion INNER JOIN prospecta_directorio ON prospecta_concrecion.empresa = prospecta_directorio.id INNER JOIN usuario_index ON prospecta_concrecion.vendedor = usuario_index.id INNER JOIN prospecta_anuncio ON prospecta_concrecion.anuncio = prospecta_anuncio.id INNER JOIN general_sino ON prospecta_concrecion.pagado = general_sino.id ".$fech.$muestra.$query);
		/* Query{
			0=id;
			1=empresa;
			2=vendedor;
			3=edición;
			4=anuncio;
			5=pagado;
			6=fecha;
		}
		*/
		$catch  = '<table id="dis_visita">';
		$catch .= '<tr>';
			for($h=0;$h<$cuent;$h++){
		$catch .=	 '<td id="Sdis_visita_tit"><a href="'.$this->url.'?ruta='.$this->ruta.'&orden='.$h.'">'.$sql_array[$h].'</a></td>';
			}
		$catch .= '</tr>';
		while($row=$this->mysql->fetch_array($sql)){
/*			$sfecha=date($row[9]);
			$fecha_pactada=strtotime('+'.$row[6].' day',strtotime($sfecha));
			$fecha_pactada = date ('Y-m-d',$fecha_pactada);
			$dfecha=rEstaf($fecha_pactada);*/
			$ruta_lki='<td id="dis_visita_cont"><a href="'.$this->url.'?ruta='.$this->ruta.'&form=1&rubro='.$row[0].'">';
			$ruta_lkf='</a></td>';
		$catch .= '<tr>';
			for($i=0;$i<$cuent;$i++){
				if($row[$i]!=$row[6]){
		$catch .= 		$ruta_lki.$row[$i].$ruta_lkf;			
				}elseif($row[$i]==$row[6]){
					$catch 	.= $ruta_lki.date('d/m/Y',strtotime($row[6])).$ruta_lkf;	

				}
			}
		$catch .= '</tr>';
		}
		$catch .= '</table>';
		$this->devuelve = $catch;
		return $this->devuelve;
	}
}
?>