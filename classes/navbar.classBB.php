<?php
class navBar{
	private $posicion;
	private $cliente;
	private $privilegios;
	private $pr;
	private $evento;
	private $ev;
	private $ruta;
	private $pagado;
	private $catch;
	private $mysql;
	public function __construct($p,$c,$e){//(posición,cliente,evento)
		session_start();
		include_once("mysql.php");
		$this->mysql = new MySQL();
//		$this->admin = $_SESSION['privilegioss_id'];
//		$this->admin = 5;
		$this->activista = $_SESSION['rango_id'];
		$this->evento = $e;
	    $this->posicion=$p;
	    $this->cliente=$c;
	    $this->pr='';
	    $this->ev=' AND submenu = '.$this->evento;
	    $this->ruta='';
	    $this->pagado='';
	    $this->catch='';

  	}
  	public function pR($pr){
  	$this->admin=$pr;
  	$sql2 = $this->mysql->consulta("SELECT COUNT(id) FROM usuario_privilegios");
	$this->cuenta2=$this->mysql->fetch_array($sql2);
	$sql22 = $this->mysql->consulta("SELECT privilegios FROM menus_botones WHERE id = 1 AND visible = 1 AND posicion = ".$this->posicion.$this->ev." ORDER BY id ASC");
	$row22 = $this->mysql->fetch_array($sql22);
		$bin = decbin($row22[0]);
		$bin_def=str_pad($bin,$this->cuenta2[0],'0',STR_PAD_LEFT);
		$x=1;
		for($e=1;$e<=$this->cuenta2[0];$e++){
			if($this->admin==$e){
				$vale=$x;
			}
			$x=$x+$x;
		}
		$y=$x/2;
		$a=0;
		for($r=1;$r<=$this->cuenta2[0];$r++){
//			echo $y.'<br>';
			if($bin_def[$a]==1){
				if($vale==$y){
					$h[$a]= ' AND privilegios = '.$y;
				}else{
					$h[$a]= ' AND privilegios != '.$y;
				}
			}else{

			}
			$this->chain .= $h[$a];

			$y=$y/2;
			$a=$a+1;
		}
		return $this->chain;
  	}
	public function nB(){
		$sql = $this->mysql->consulta("SELECT ruta,nombre FROM menus_botones WHERE visible = 1 AND posicion = ".$this->posicion.$this->chain.$this->ev." ORDER BY id ASC");
		$this->catch='<ul>';
		while($row = $this->mysql->fetch_array($sql)){  
				$this->ruta='<a href="';
				$this->pagado='';
		$this->catch.=		'<li>'.
								$this->ruta.$row[0].$this->pagado.'">'.
									$row[1].
								'</a>
							</li>';
		}
		$this->catch.='</ul>';
			return $this->catch;
	}
}
?>