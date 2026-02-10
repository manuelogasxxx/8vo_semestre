<?php
    $id = isset($_POST["id"]) ? $_POST["id"]:"";
    $nom = isset($_POST["nombre"]) ? $_POST["nombre"]:"";
    $app = isset($_POST["app"]) ? $_POST["app"]:"";

    echo "id:: ".$id."<br>";
    echo "nombre:: ".$nom."<br>";
    echo "apellidos:: ".$app."<br>";
?>