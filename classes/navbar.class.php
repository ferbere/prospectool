<?php
class navBar{
	public $posicion;
	public $cliente;
	public $evento; 
	public function __construct($p,$c,$e){//(posicion,cliente,evento)
		session_start();
		include_once("mysql.php");
		$this->mysql = new MySQL();
		$this->posicion=$p;
		$this->cliente=$c;
		$this->evento=$e;
	}
	public function dBin($admin){//Convierte privilegios de orden en Decimales Binarios
		$x=1;
		for($e=1;$e<=$admin;$e++){
			$x=$x+$x;
		}
		$this->vale=$x/2;
		return $this->vale;
	}
	public function bTn(){//¿Cabe el usuario en los Privilegios requeridos?
		$sql = $this->mysql->consulta("SELECT nombre,privilegios,imagen,ruta FROM menus_botones WHERE visible = 1 AND posicion = ".$this->posicion." AND submenu = ".$this->evento." ORDER BY id ASC");
		$it=0;
		while($row = $this->mysql->fetch_array($sql)){
			$e=1;
			$y=$this->vale;
			if($y<$row[1]){
				while($y<$row[1]){
					$y=($y)*2;
				}
			}else{
				$y=$this->vale;
			}
			while($y>1){
				$como[$e]=$y;
				$y=$y-($y/2);
				$e=$e+1;
			}
			$i=1;
			$z=$row[1];
			while($z>1){//Mientras $z(el # de Priv Req.)
				if($z>$como[$i]){//Si $z es mayor que el valor más alto de la iteración (empieza 16);
//					echo '<big>Resultado ::'.$como[$i].'</big><br>';
					if($this->vale==$como[$i]){
						$emma=true;
						break;
					}
					$z=$z-($como[$i]);
				}elseif($z==$como[$i]){
//					echo '<big>Resultado ::'.$como[$i].'</big><br>';
					if($this->vale==$como[$i]){
						$emma=true;
						break;
					}
					break;
				}elseif($z<$como[$i]){
				}
				$i=$i+1;
			}
			if($z==1){
//				echo '<big>Resultado ::'.$z.'</big><br>';
				if($this->vale==$z){
					$emma=true;
				}
			}
			if($emma==true){
				$it=$it+1;
				$catch[1][$it] =	$row[0];
				$catch[2][$it] =	$row[1];
				$catch[3][$it] =	$row[2];
				$catch[4][$it] =	$row[3];
				$emma=false;
			}else{

			}
		}
		$catch[0]=$it;
		return $catch;
	}
}
?>