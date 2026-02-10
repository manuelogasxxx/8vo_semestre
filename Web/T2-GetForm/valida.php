<?php
    $id = isset($_GET["id"]) ? $_GET["id"]:"";
    $nom = isset($_GET["nombre"]) ? $_GET["nombre"]:"";
    $app = isset($_GET["app"]) ? $_GET["app"]:"";

    echo "id:: ".$id."<br>";
    echo "nombre:: ".$nom."<br>";
    echo "apellidos:: ".$app."<br>";
?>