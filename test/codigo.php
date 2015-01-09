<?php
include_once("../classes/mysql.php");
$mysql=new MySQL();
/*
$sql = $mysql->consulta("DELETE FROM fotos_categoria");
$sql2 = $mysql->consulta("ALTER TABLE perfil_iniciativa ADD COLUMN visible SMALLINT(1)NOT NULL DEFAULT 0");*/
$sql2 = $mysql->consulta("ALTER TABLE articulos_index CHANGE titulo titulo VARCHAR(250)NOT NULL");



?>