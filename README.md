[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=19716634&assignment_repo_type=AssignmentRepo)
# Lab03: Decodificador BCD a 7segmentos


## Integrantes 
[David Chaparro](https://github.com/DavidChaparro10)


## Informe

Indice:

1. [Diseño implementado](#1-diseño-implementado)
2. [Simulaciones](#2-descripción)
3. [Implementación](#3-diagramas)
4. [Simulaciones](#4-simulaciones)
5. [Implementación](#5-implementación)
6. [Conclusiones](#conclusiones)

## 1. Diseño implementado

### 2. Descripción

El BCD significa "Binary COoe Decimal". El cual es un codificador que convierte un número binario en decimal. CUando nos adentramos a la parte circuital tenemos 2 tipos de BCD´s: De ánodo compun y de cátodo común. Eso depende de la FPGA:
![alt text](<Anexos/image copy 2.png>)

 En el caso de la Cyclone IV que usamos en clase, es de ándodo común. Esto significa que están conectados ya sea a tierra o a VCC. En el caso de nuestra FPGA el led prende cuando está a un nivel bajo (para encender un led se debe dar un cero lógico).

En la primera parte se implementó un 7 segmentos que me representa 1 bit. La segunda parte es más compleja, ya que queremos ampliar los bits.
### 3. Diagramas
![alt text](<Anexos/image copy.png>)

Primero se debe elegir el bloque funcional del diseño:

![alt text](Anexos/image.png)

Puedo seleccionar el numero en binario a decimal (similar a un multiplexor), eso es problemático porque debo activar uno para mostrar las unidades, luego las decenas y luego las centenas. Entonces ahi es donde entra la **logica secuencial** Si no estuviera multiplexado la lógica seria siendo combinacional.

![alt text](<Anexos/image copy 4.png>)

Hay FPGA´s que tienen 7 para cada uno. Pero en nuestro caso nunca van a estar prendidos al mismo tiempo. Así que vamos a jugar con la frecuencia para que el usuario no note la diferencia. Pero para eso necesitamos una señal clock.

## 4. Simulaciones 


## 5. Implementación


## Conclusiones




