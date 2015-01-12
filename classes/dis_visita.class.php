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
		$sql_array=array(0=>"Orden",1=>"Empresa",2=>"Ciudad",3=>"Car&aacute;cter",4=>"Se interes&oacute;",5=>"Perspectiva de venta",6=>"Regresar en... (d&iacute;as)",7=>"Fecha",8=>"Vendedor");
		$s_a=array(0=>"prospecta_directorio.id",1=>"prospecta_directorio.empresa",2=>"general_municipios.nombre",3=>"prospecta_caracter.nombre",4=>"general_sino.nombre",5=>"prospecta_perspectiva.nombre",6=>"prospecta_visita.resuelve",7=>"prospecta_visita.fecha",8=>"usuario_index.nombre");
		if($this->ruta=='dia'){
			$fech=" WHERE DATE(prospecta_visita.createtime) = date(NOW()) ";
		}elseif($this->ruta=='semana'){
			$fech=" WHERE WEEK(prospecta_visita.createtime) = WEEK(current_date) ";
		}elseif($this->ruta=='mes'){
			$fech=" WHERE MONTH(prospecta_visita.createtime) = MONTH(current_date) ";
		}elseif($this->ruta=='ano'){
			$fech=" WHERE YEAR(prospecta_visita.createtime) = YEAR(current_date) ";
		}else{
			$fech='';
		}
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
		$sql=$this->mysql->consulta("SELECT @numero:=@numero+1 AS enum,prospecta_directorio.empresa,general_municipios.nombre,prospecta_caracter.nombre,general_sino.nombre,prospecta_perspectiva.nombre,prospecta_visita.resuelve,date_format(prospecta_visita.createtime,'%W %d, %M %Y'),usuario_index.nombre,prospecta_visita.createtime,prospecta_visita.concrecion,prospecta_visita.id FROM prospecta_visita INNER JOIN prospecta_directorio ON prospecta_visita.empresa = prospecta_directorio.id INNER JOIN general_municipios ON prospecta_directorio.ciudad = general_municipios.id INNER JOIN prospecta_caracter ON prospecta_directorio.caracter = prospecta_caracter.id INNER JOIN general_sino ON prospecta_visita.se_intereso = general_sino.id INNER JOIN prospecta_perspectiva ON prospecta_directorio.perspectiva = prospecta_perspectiva.id INNER JOIN usuario_index ON prospecta_visita.vendedor = usuario_index.id ".$fech.$muestra.$query);
		
		/* Query{
			0=id;
			1=empresa;
			2=ciudad;
			3=nombramiento;
			4=se intereso;
			5=perspectiva;
			6=resuelve;
			7=create time (formato);
			8=vendedor;
			(NO ESTÁN EN ARRAYS —sql_array,sa—, SÓLO SON PARA EL CÁLCULO DE $resuelve){
				9=create time (sin formato);
				10=concrecion;
			}
		}
		*/
		$catch  = '<table id="dis_visita">';
		$catch .= '<tr>';
			for($h=0;$h<=8;$h++){
		$catch .=	 '<td id="Sdis_visita_tit"><a href="'.$this->url.'?ruta='.$this->ruta.'&orden='.$h.'">'.$sql_array[$h].'</a></td>';
			}
		$catch .= '</tr>';
		while($row=$this->mysql->fetch_array($sql)){
			$sfecha=date($row[9]);
			$fecha_pactada=strtotime('+'.$row[6].' day',strtotime($sfecha));
			$fecha_pactada = date ('Y-m-d',$fecha_pactada);
			$rEstaf=rEstaf($fecha_pactada);
			$dfecha=$rEstaf[1];
			$ruta_lki='<td id="dis_visita_cont"><a href="'.$this->url.'?ruta='.$this->ruta.'&form=1&rubro='.$row[11].'">';
			$ruta_lkf='</a></td>';
		$catch .= '<tr>';
			for($i=0;$i<=8;$i++){
				if($row[$i]!=$row[6]){
		$catch .= 		$ruta_lki.$row[$i].$ruta_lkf;			
				}elseif($row[$i]==$row[6]){
					if($row[10]==0){
		$catch 		.= $ruta_lki.$dfecha.$ruta_lkf;
					}else{
		$catch .= 		$ruta_lki.'vendido'.$ruta_lkf;
					}
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