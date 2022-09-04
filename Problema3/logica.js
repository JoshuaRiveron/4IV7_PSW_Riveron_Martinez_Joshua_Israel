<?php
 
 function teclado_movil($mensaje_deseado){
 
    //Inicializar el teclado
    $key = array(); 
    $char = ord('a');
 
    // Guardo las teclas que corresponden a cada letra 
    for($tecla = 2; $tecla <=9; $tecla++){
        //Todas las teclas tienen 3 letras excepto la 7 y la 9 que tienen 4
        $hasta = ($tecla == 7 || $tecla == 9)? 4 : 3 ;
        for($pulsar = 1; $pulsar <= $hasta; $pulsar){
            $key[$char++] = array('tecla' => $tecla, 'pulsar' => $pulsar++);
        }
    }
 
    //Para el espacio (tecla 0)
    $tecla = 0;
    $pulsar = 1;
    $key[ord(' ')] = array('tecla' => $tecla, 'pulsar' => $pulsar++);
 
    //Transformar string en array
    $letras = str_split ($mensaje_deseado);
    foreach($letras as $letra){
        //Obtengo la tecla que le corresponde y la cantidad de pulsaciones
        $tecla = $key[ord($letra)]['tecla'];
        $pulsar = $key[ord($letra)]['pulsar']; 
        //Si es la misma tecla que la anterior va espacio
        if($tecla == $tecla_anterior)
            $respuesta .= ' ';
        //Presiono la tecla la cantidad de veces necesaria
        for($i = 0; $i < $pulsar; $i++){
            $respuesta .= $tecla;
        }
        //Antes de seguir recuerdo a esta tecla como la anterior
        $tecla_anterior = $tecla;
    }
    return $respuesta;
 }
 
 //Cantidad de casos
 $N = $_REQUEST['N'];
 
 //Mensajes
 $mensajes = $_REQUEST['mensajes'];
 
 for($i = 1; $i <= $N; $i++){
    $mensaje_deseado= $mensajes[$i];
    $respuesta = teclado_movil($mensaje_deseado);
    echo "Caso #$i: $respuesta <br/>";
 }
?>