<?php
session_start();
if(isset($_GET['ruta'])){
	$ruta = $_GET['ruta'];
}
$_SESSION['ruta'] = $_GET['ruta'];
	
if(empty($ruta)){
	$_SESSION['ruta']=='';
}else{
	$seleccion = ' WHERE categoria = '.$_SESSION['ruta'];
}
$sql = mysql_query("SELECT SQL_CALC_FOUND_ROWS * FROM fotos_index ".$seleccion." ORDER BY fecha DESC LIMIT 12");
$row_object = mysql_query("Select Found_Rows() as rowcount");
$row_object = mysql_fetch_object($row_object);
$actual_row_count = $row_object->rowcount;
?>
<script type="text/javascript">
    var page = 1;
    $(window).scroll(function () {
        $('#more').hide();
        $('#no-more').hide();

        if($(window).scrollTop() + $(window).height() > $(document).height() - 200) {
            $('#more').css("top","400");
            $('#more').show();
        }
        if($(window).scrollTop() + $(window).height() == $(document).height()) {

            $('#more').hide();
            $('#no-more').hide();

            page++;

            var data = {
                page_num: page
            };

            var actual_count = "<?php echo $actual_row_count; ?>";

            if((page-1)* 12 > actual_count){
                $('#no-more').css("top","400");
                $('#no-more').show();
            }else{
                $.ajax({
                    type: "POST",
                    url: "try/data.php",
                    data:data,
                    success: function(res) {
                        $("#result").append(res);
                        console.log(res);
                    }
                });
            }
        }
    });
</script>
<script type="text/javascript">
$(function() {
    $('#galleryS a').lightBox();
});
</script>
<div id='more' >Cargando más imágenes</div>
	<div id='no-more' >No hay más qué cargar</div>
		<div id='result'>
<?php
	    while ($row = mysql_fetch_array($sql)) {
	        echo "<div id='galleryS'>";
			echo 	"<a href='images/fotos/" . $row['imagen'] . "' title='".$row['descripcion']."' >";	
			echo 		"<img src='images/fotos/" . $row['imagen'] . "' />";
			echo 	"</a>";
			echo "</div>";
	    }
?>
		</div>