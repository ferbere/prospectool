<div id="billetes">
	<form oninput="x.value=parseInt(b.value)-parseInt(a.value)">
	<input type="hidden" id="a" value="<?php echo $cuenta ?>">
	<?php
	echo 'recibo en efectivo la cantidad de: $';
	?>
	<input class="number" type="number" id="b" value="0"><br><br>
	<big>El cambio que debo entregar es de: <strong>$<output name="x" for="a b"></output></strong></big>
	</form><br><br>
</div>