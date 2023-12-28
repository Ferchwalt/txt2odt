# txt2odt
A short shell Script that will convert any text file into a basic .odt (Open Document) file that is openable by Word Processors that are compatible with the Open Document Format. 
Great if you hate bloated programms like libreOffice, MS Words, OpenOffice or such and you want to write documents using your command line or even console but you have to hand in a Word-like document!

# Dependencies:
Newest zip, awk and a shell I tested on (Feel free to test it on other versions. However, the functionalities I used are so basic that this script should run on basically any version).
zip version I tested on: extra/zip 3.0-11 (Arch repositories)
awk version I testet on: system/gawk 5.3.0-1 (Artix repositories)
shell version I tested on: system/bash 5.2.021-1 (Artix repositories)

# Usage:
If used without any arguments txt2odt will create an empty Open Document file called "untitled.odt".

The first argument should be the input text file. If only used with the first argument the name for the Open Document file will be the name of the first argument (including file format endings).

The second argument should be the desired name of the Open Document file that is to be created. The ".odt" extension will automatically be appended and should therefor not be typed out.

# Examples (command line):
+ txt2odt
+ ls
=> untitled.odt
---
+ txt2odt example
+ ls
=> example example.odt
---
+ txt2odt lol.txt haha
+ ls
=> lol.txt haha.odt

# Roadmap and possibly errors:
Simply converting a text file into an Open Document File is quite nice especially only using such a small script. However, with added functionality in the form of flags this script could be doing a lot more without getting too bloated.
The only real source for errors I could imagine with this script is that the two files and the one directory that are created and then deleted afterwards are placed in the current working directory and not in any temporary folder. So if you happen to have a file named content.xml in the directory you wish to create the Open Document File in then it will be overwritten and afterwards deleted. If you happen to have a directory called META-INF in this directory then it will also be deleted.
Some improvements I am looking to implement:
-Adding Flags that will let you specify a tile, fonts, sizes, extras (bold, italic, etc.), etc.
-Feel free to suggest other improvements or bugs
