<?php
function progress($por)
{
    $por = max(0, min(100, $por));

    $alturaTotal = 150;
    $alturaTapas = 30;
    $ancho = 100;
    $radioTapa = $alturaTapas / 2;

    // 1. El líquido (Azul Océano)
    // El cuerpo usa un gradiente: Oscuro -> Claro -> Oscuro para simular redondez
    $gradienteCuerpo = "linear-gradient(90deg, #1e88e5 0%, #6ab7ff 50%, #1e88e5 100%)";
    $colorSuperficie = "#4facfe"; // Un azul claro brillante para la tapa del nivel
    $colorBase = "#1565c0";       // Un azul oscuro para la base del tanque

    // 2. El contenedor vacío (Gris Cristal/Metal)
    $colorFondoTanque = "#f0f2f5";
    $bordeTanque = "1px solid #d1d5db";
    $colorTapaTrasera = "#dbeafe"; // Un azul muy pálido para el interior del tanque vacío

    $alturaUtil = $alturaTotal - $alturaTapas;
    $avanceLiquido = ($alturaUtil * ($por / 100));
    $topNivel = $alturaUtil - $avanceLiquido;

    $topCuerpo = $topNivel + $radioTapa;
    $centroTapaInferior = $alturaTotal - $radioTapa;
    $alturaCuerpo = max(0, $centroTapaInferior - $topCuerpo);

    $obj = '
    <div style="
        background-color: ' . $colorFondoTanque . '; 
        width: ' . $ancho . 'px; 
        height: ' . $alturaTotal . 'px; 
        position: relative; 
    ">
        
        <div id="tapaSuperior" 
            style="width: ' . $ancho . 'px;
            height: ' . $alturaTapas . 'px; 
            border-radius: 50%; 
            background-color: ' . $colorTapaTrasera . '; 
            border: ' . $bordeTanque . ';
            position: absolute;
            top: 0;
            z-index: 1;">
        </div>

        <div class="fondo2" style="
            width:' . $ancho . 'px; 
            height: ' . $alturaCuerpo . 'px; 
            position: absolute; 
            background: ' . $gradienteCuerpo . '; 
            top: ' . $topCuerpo . 'px;
            left: 0;
            z-index: 2;
        "></div>
       
        <div id="tapaInferior" 
            style="width: ' . $ancho . 'px;
            height: ' . $alturaTapas . 'px; 
            border-radius: 50%; 
            background-color: ' . $colorBase . '; 
            position: absolute;
            top: ' . ($alturaTotal - $alturaTapas) . 'px;
            z-index: 3;">
        </div>

        <div id="tapaNivel" 
            style="width: ' . $ancho . 'px;
            height: ' . $alturaTapas . 'px; 
            border-radius: 50%; 
            background-color: ' . $colorSuperficie . '; 
            position: absolute;
            top: ' . $topNivel . 'px;
            z-index: 4;
            transition: top 0.5s ease;"> 
        </div>



    </div>';

    echo $obj;
}

echo "<br><br>";
// Ejemplo: ?por=50 moverá ambos elementos a la mitad
$valor = isset($_GET["por"]) ? intval($_GET["por"]) : 0;
progress($valor);
?>