# MySQLInsertBashScriptCreator
This is a quite simple script that I developed on my free time when creating test databases in MySQL.

It is designed to create a scheme so that a "replace" command from a text editor makes the task of inserting custom registries easier.

When run, it explains the input format needed, and is avaliable in Spanish and English. Imagine the input were:

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

Finally, the file can be imported to MySQL with ease by previously selecting the desired database, and executing:

mysql> source /parthtothefile/insert.sql

I hope you may find as usefull as I did.
