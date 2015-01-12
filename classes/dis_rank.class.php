	<?php
class dis_visita{
public $url='';
public function __construct($url_viene,$ruta,$dep){
		session_start();	
		include_once("classes/cambiaf_a_normal.class.php");
		include_once("classes/restaFechasD.class.php");
		include_once("classes/mysql.php");
		include_once("classes/sacar.class.php");
		$this->mysql=new MySQL();
		$this->url=$url_viene;
		$this->ruta=$ruta;
		$this->dep=$dep;
	}
	public function dV(){
		$sql_array=array(0=>"Id",1=>"Empresa",2=>"Fecha de concreción",3=>"Número de edición",4=>"Fecha de publicación",5=>'Han pasado ya...');
		$qty=count($sql_array);

		if($_SESSION['privilegioss_id']<=4){
			$muestra='';
		}else{
			$muestra=" AND prospecta_visita.vendedor = ".$_SESSION['id'];
		}
		if(isset($_GET['orden'])){
			$orden=$_GET['orden'];
		}
		if(empty($orden)){
			$query=" ";
		}else{
			$query=' ORDER BY '.$s_a[$orden].' ASC ';
		}
			$hoy=date('Y-m-d');
		mysql_query('set @numero=0');
		$sql=$this->mysql->consulta("SELECT @numero:=@numero+1 AS hola,prospecta_directorio.empresa,date_format(prospecta_concrecion.createtime,'%d %M %Y'),prospecta_edicion.numero,date_format(prospecta_edicion.desde,'%d %M %Y'),CONCAT(ROUND(DATEDIFF(prospecta_edicion.desde,NOW())/7,0),' ediciones'),prospecta_directorio.id FROM prospecta_directorio INNER JOIN prospecta_concrecion ON prospecta_directorio.id = prospecta_concrecion.empresa INNER JOIN prospecta_edicion ON prospecta_concrecion.edicion = prospecta_edicion.numero");

		/* Query{
			0=id;
			1=empresa;
			2=fecha concreción;
			3=número de edición;
			4=fecha de publicación;
		}
		*/

		$catch  =	'<table id="dis_visita">';
		$catch .= 		'<tr>';
			for($h=0;$h<=$qty;$h++){
		$catch .=			'<td id="Sdis_visita_tit">
								<a href="'.$this->url.'?ruta='.$this->ruta.'&orden='.$h.'">
									'.$sql_array[$h].
								'</a>
							</td>';
			}
		$catch .= 		'</tr>';
		while($row=$this->mysql->fetch_array($sql)){
			$ruta_lki='<td id="dis_visita_cont"><a href="'.$this->url.'?ruta=prospectos&form=4&xyo='.$row[6].'">';
			$ruta_lkf='</a></td>';
		$catch .= '<tr>';
			for($i=0;$i<$qty;$i++){
				$catch .= $ruta_lki.$row[$i].$ruta_lkf;			
			}
		$catch .= '</tr>';
		}
		$catch .= '</table>';
		$this->devuelve = $catch;
		return $this->devuelve;

	}
}
?>