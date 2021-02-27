# MySQLInsertBashScriptCreator
This is a quite simple bash script that I developed on my free time when creating test databases in MySQL.

It is designed to create a scheme so that a "replace" command from a text editor makes the task of inserting custom registries easier.

When run, it explains the input format needed, and is avaliable in Spanish and English. Imagine that the input were:

TableA TableB   # Name for the tables to be used.

4 2             # Respectively, number of fields for each table.

2 1             # Respectively, number of registries to be inserted on each table.

The output file, named "insert.sql", will contain:

INSERT INTO TableA VALUES
        ('TableA1','TableA2','TableA3','TableA4');
        
INSERT INTO TableA VALUES
        ('TableA1','TableA2','TableA3','TableA4');
        
        
INSERT INTO TableB VALUES
        ('TableB1','TableB2');

In this way, when opened with a text editor, using the replace function (usually accesed by pressing Ctrl + H), you can select the desired field,
like "TableA1", and replace it with anything, like "1". Then you can press Enter, and the text editor will search for the next coincidence, that is,
the next first field from the next registry, which can be replaced with "2". And so on an so forth. This can be automatized in other ways, even with
other scripts, but I just wanted to present a more visual aproach.

Finally, it will create the ouput file in the same directory where it is run. Then, the file can be imported to MySQL with ease by previously
selecting the desired database, and executing:

mysql> source /parthtothefile/insert.sql

I hope you may find it as usefull as I did.

MIT LICENSE
Copyright (C) 2021 Jose Luis Arias Arcos

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
END OF LICENSE
