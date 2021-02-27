#!/bin/bash
# MIT LICENSE
# Copyright (C) 2021 Jose Luis Arias Arcos

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# END OF LICENSE

echo "
El script creará en este mismo directorio un fichero .sql para insertar:
· A una unas tablas de una base de datos creada previamente,
· cada una con un numero determinado de campos,
· un número determinado de resgistros.

¿Qué tablas deseará usar? Por favor, tenga en cuenta lo siguiente:

· Los nombres deberán ser escritos separándolos con espacios.
· Continúe presionando la tecla Intro.

Por ejemplo:

Alumnos Escuelas Institutos Asignaturas Matriculas

"
read -a tablas  #The -a makes the user input to be stored to an array when separated with spaces.

echo "Respectivamente, ¿cuántos campos tiene cada tabla?  Por favor, tenga en cuenta lo siguiente:

· Los números deberán ser escritos separándolos con espacios.
· Deben ser introducidos en el mismo orden que las tablas anteriores a las que hacen referencia.
· Continúe presionando la tecla Intro.

Por ejemplo:

5 6 6 4 4

"
read -a campos

echo "Respectivamente, ¿cuántos registros querrá insertar en cada tabla?  Por favor, tenga en cuenta lo siguiente:

· Los números deberán ser escritos separándolos con espacios.
· Deben ser introducidos en el mismo orden que las tablas anteriores a las que hacen referencia.
· Continúe presionando la tecla Intro.

Por ejemplo:

25 3 4 6 25

"
read -a registros

echo "Creando fichero...

"

# Initiazing variables
fieldCount=1
singleTempField=''
registryNumber=0
tempF=''
finalR=''

# For each table name stored on the array "tablas", the script will create its registry inserts.
for i in "${!tablas[@]}"; do

    fieldNumber=${campos[i]};
    while [ $fieldCount -le ${campos[i]} ]; do
        tempF="'${tablas[i]}$fieldCount',";
        singleTempField+=$tempF             #Concatenates the previous registry value with the next.
        (( fieldCount=fieldCount+1 ));
    done
    singleTempField=${singleTempField%?}    #to remove the last colon.

    registryNumber=${registros[i]};
    while [ $registryNumber -gt 0 ]; do     #Concatenates the previous registry insert with the next.
        finalR+="INSERT INTO ${tablas[i]} VALUES
        ($singleTempField);
"
        (( registryNumber=registryNumber-1 ));
    done

    echo -e "$finalR" >> insert.sql;        #Appends all the inserts to the file. The -e is important.
    finalR=''
    singleTempField=''
    fieldCount=1
done
echo "¡Hecho!"

# # Thanks to the following online knowledge resources used to make this file:
# https://unix.stackexchange.com/questions/278502/accessing-array-index-variable-from-bash-shell-script-loop
# https://www.cyberciti.biz/faq/bash-for-loop-array/
# https://www.cyberciti.biz/faq/bash-for-loop/
