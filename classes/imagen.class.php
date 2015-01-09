<?php 
class Imagen { 
 var $src; 
 var $border; 
 function Imagen($src,$border) { 
  $this->src=$src; 
  $this->border=$border; 
 } 
 // Esta funcion es un método de Imagen 
 function Imprimir() { 
 echo "<img src=\""; 
 echo $this->src; 
 echo "\" border=\""; 
 echo $this->border; 
 echo "\">"; 
 } 
}
?>