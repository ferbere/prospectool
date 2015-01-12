<h2>Visita posterior</h2>
<h3><?php echo date("d-M-Y");?></h3>
<form id="foo" action="visitas.php" method="post">
<input type="hidden" name="form" value="9">
<input type="hidden" name="rubro" value="<?php echo $rubro;?>">
<label>Resultado:</label>
<textarea name="resultado"></textarea>
<label>En cuántos días resuelve:</label>
<input type="number" name="resuelve" range(1, 180)>
<input type="submit" value="guardar" >
</form>