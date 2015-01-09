<?php
function Get_Edad($date) 
{ 
    // Si no es una marca de tiempo intentamos convertirla 
    if( !is_integer($date) ) 
    { 
         if( strtotime( $date ) <> -1 ) // Si es diferente a -1 convertimos la fecha 
         { 
             $date = strtotime( $date ); 
         } 
         else // No parece ser una fecha válida 
         { 
             return 0; 
         } 
    } 
     
    // Procesamos la marca de tiempo 
    $ano = date("Y", $date); 
    $mes = date("m", $date); 
    $dia = date("d", $date); 
     
    // Calculamos los años que tiene 
    $anos = date("Y") - $ano; 
     
    if( date("m") > $mes ) // Si el mes es superior, tenemos los años calculados anteriormente 
    { 
        return $anos; 
    }  
    elseif( date("m") < $mes ) // Si el mes es inferior tenemos tenemos un año menos 
    { 
        return $anos - 1; 
    } 
    else // Este mes es su cumpleaños 
    { 
        if( date("d") > $dia ) // Si el día es superior tenemos los años calculados anteriormente 
        { 
            return $anos; 
        }  
        elseif( date("d") < $dia ) // Si el día es inferior tenemos  un año menos 
        { 
            return $anos -1; 
        } 
        else // Hoy es su cumpleaños 
        { 
            return $anos; 
        } 
    } 
}
?>