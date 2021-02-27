#!/bin/bash
# MIT LICENSE
# Copyright (C) 2021 Jose Luis Arias Arcos

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# END OF LICENSE

echo "
The script will create in this same directory a .sql file to insert:
· To some previously created tables from a database,
· each with a determined number of fields,
· a deternmined number of registries.

Which tables do you wish to use? Please take into account the following:
· Names must be written with a single space between them.
· Continue by pressing Enter.

For example:

Alumns Schools Institutes Courses Registration

"
read -a tablas  #The -a makes the user input to be stored to an array when separated with spaces.

echo "Respectively, how many fields does those each table have? Please take into account the following:
· Numbers must be written with a single space between them.
· They must be introduced in the same order as the previous tables which they refer.
· Continue by pressing Enter.

For example:

5 6 6 4 4

"
read -a campos

echo "Respectively, how many registries are going to be inserted on each table? Please take into account the following:
· Numbers must be written with a single space between them.
· They must be introduced in the same order as the previous tables.
· Continue by pressing Enter.

For example:

25 3 4 6 25

"
read -a registros

echo "Creating file...

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
echo "¡Done!"

# # Thanks to the following online knowledge resources used to make this file:
# https://unix.stackexchange.com/questions/278502/accessing-array-index-variable-from-bash-shell-script-loop
# https://www.cyberciti.biz/faq/bash-for-loop-array/
# https://www.cyberciti.biz/faq/bash-for-loop/
