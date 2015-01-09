<?php
class meSa{
	public $mysql;
	public $rubro;
	public function __construct($r,$p){
		include_once("../classes/mysql.php");
		$this->mysql=new MySQL();	
		$this->rubro=$r;
		$this->pagina=$p;
	}
	public function meS_unset(){//Borra las sesiones activas de mesa y cliente
		unset($_SESSION['cliente_e']);
		unset($_SESSION['cliente_n']);
		unset($_SESSION['cliente_id']);
		unset($_SESSION['mesa']);
		unset($_SESSION['mesa_nom']);
		unset($_SESSION['mesa_personas']);
		return void;
	}
	public function meS_mesas(){//Establece las mesas vigentes
		$sql	=	$this->mysql->consulta("SELECT id,nombre FROM restaurante_mesas");
		$cuenta	=	$this->mysql->num_rows($sql);
		while($row = $this->mysql->fetch_array($sql)){
			$s_mesas_id[]=$row[0];
			$s_mesas_nom[]=$row[1];
		}
		$dev1[0]=$cuenta;
		$dev1[1]=$s_mesas_id;
		$dev1[2]=$s_mesas_nom;
		return $dev1;
	}
	public function meS_msa(){//Establece las mesas vigentes
		if($this->pagina=='ordenes_mesa'){
			$sql2	=	$this->mysql->consulta("SELECT nombre FROM restaurante_mesas WHERE  id = '$this->rubro'");
		}elseif($this->pagina=='if_a'){
			$sql2	=	$this->mysql->consulta("SELECT restaurante_mesas.nombre,restaurante_consumo.personas FROM restaurante_mesas INNER JOIN restaurante_consumo ON restaurante_mesas.id = restaurante_consumo.mesa WHERE restaurante_consumo.estatus !=2 AND restaurante_consumo.cierra IS NULL AND restaurante_mesas.id = '$this->rubro' GROUP BY restaurante_mesas.nombre");
		}
		while($row2 = $this->mysql->fetch_array($sql2)){
			$s_mesas_nom=$row2[0];
			$s_mesas_per=$row2[1];
		}
		$dev2[0]=$s_mesas_nom;
		$dev2[1]=$s_mesas_per;
		return $dev2;
	}
}
?>