<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voltorb CSS</title>
</head>
<body>
    <div style="
        width: 280px; 
        height: 280px;
        background-color: green;  
        border: 6px solid black;
        position: relative;
        float: left">
        
        <div style="background-color: black;
                     width: 60px;
                     height: 60px;
                     position: absolute;
                     left: 50px;
                     top: 50px"></div>

        <div style="background-color: black;
                     width: 60px;
                     height: 60px;
                     position: absolute;
                     left: 170px;
                     top: 50px"></div>
        <div style="background-color: black;
                     width: 60px;
                     height: 90px;
                     position: absolute;
                     left: 110px;
                     top: 110px"></div>
        </div>

        <div style="background-color: black;
                     width: 30px;
                     height: 90px;
                     position: absolute;
                     left: 95px;
                     top: 150px"></div>
        </div>

        <div style="background-color: black;
                     width: 30px;
                     height: 90px;
                     position: absolute;
                     left: 180px;
                     top: 150px"></div>
        </div>
    </div>

<!-- El otro dibujito-->

    <div>
        <div style="
            width: 280px; 
            height: 280px;
            background-color: white;  
            border: 6px solid black;
            position: relative;
            float: left;
            display: flex;       /* Agregado para centrar a Pacman en la caja */
            align-items: center; /* Agregado para centrar verticalmente */
            justify-content: center; /* Agregado para centrar horizontalmente */
        ">
            
            <div style="
                /*Pacamn amarillo*/
                width: 200px;
                height: 200px;
                border-radius: 50%;
                /* para hacer la boca */
                background: conic-gradient(#f2d648 60deg, transparent 60deg 120deg, #f2d648 120deg);
                position: relative;
            ">
            </div>

            <div style="
                position: absolute;
                width: 20px;       /* Lo hice un poco más grande para que se vea mejor */
                height: 20px;
                border-radius: 50%;
                top: 70px;         /* Ajustado para alinearse con la frente */
                right: 100px;      /* Ajustado para mirar hacia la boca */
                background: #333333;
                z-index: 10;
            ">
            </div>

        </div>
    </div>
    
    </div>


</body>
</html>