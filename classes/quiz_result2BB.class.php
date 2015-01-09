<?php
session_start();
class quiR{
	private $q_ques='';
	private $quiz='';
	private $bs='';
	private $mysql='';
	private $jab='';
	private $p='';
	private $r='';
	public $qui_res='';
	private $tot_preg2='';
	public function __construct($qq,$q){
		$this->q_ques=$qq;
		$this->quiz=$q;
		include_once("../classes/mysql.php");
		$this->mysql=new MySQL();
		include_once("../classes/quiz_result.class.php");
	}
	public function quiT(){
		$quiz=new quiz_result(1,$this->quiz);
		$qu=$quiz->qu_Re();
		$this->qui_res=$qu[2];
		
			$dtador		= 0;
	$sql2=$this->mysql->consulta("SELECT quiz_index.nombre,quiz_ques.id,quiz_ques.pregunta,quiz_answ.id,quiz_answ.respuesta FROM quiz_index INNER JOIN quiz_ques ON quiz_index.id = quiz_ques.quiz INNER JOIN quiz_answ ON quiz_ques.id = quiz_answ.ques WHERE quiz_ques.id = '$this->quiz'");
		while($row2=$this->mysql->fetch_array($sql2)){
			$nombre		= $row2[0];
			$pregunta	= $row2[1];
			$titulo 	= $row2[2];
			$respuesta	= $row2[3];
			$contador	= 1;

		    $ques[$titulo][] = '<td>'.$row2[4].' (respuestas: '.$this->qui_res[$dtador].' )</td>';
			$contador	= $contador+1;
			$dtador		= $dtador+1;
		}
			$as= '<table border="1">';
			$as.= '<tr><td><h1>'.$nombre.'</h1></td></tr>';
			$as.= '<form action="quiz.php?ruta=resultados.php" method="post">';
			$as.= '<input type="hidden" name="preg" value="'.$pregunta.'">';
			$as.= '<input type="hidden" name="sub" value="'.($pregunta+1).'">';
		    foreach ($ques as $titulo => $desglose){
			$as.= '<tr><td><h2>'.$titulo.'</h2></td></tr>';
		    	foreach ($desglose as $respuestas){
			$as.= '<tr>'.$respuestas.'</tr>';
		    	}	
		    }
			$as.= '<tr><td>';
			$as.= '<input type="submit" value="siguiente">';
			$as.= '</td></tr>';
			$as.= '</form>';
			$as.= '</table>';
			$this->bs=$as;
			return $this->bs;

	}
}
?>