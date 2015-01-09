<script language="JavaScript"><!--
// v3 compatible:
function HacerAlgo() {
   // hacer algo aquí...

   setTimeout('HacerAlgo()',1000);
	for(i=0;i<12;i++){
		var sab[i][0]=i;
				document.write(sab[i]);
	}


}
/*
function cuenta(){
	if(contador >= fin_contador){
	   document.getElementById("contador").innerHTML  = "Chale ";
	}else{
//	    document.getElementById("contador").innerHTML  = "Redireccionando en " + fin_contador;
		document.write("viene "+sepsi[fin_contador][0]); 
	        fin_contador = fin_contador - 1;
	}
}*/
</script>

<body onload="HacerAlgo()">
<div id="contador"></div>
</body>