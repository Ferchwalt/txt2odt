# txt2odt
A short shell Script that will convert any text file into a basic .odt (Open Document) file that is openable by Word Processors that are compatible with the Open Document Format. 
Great if you hate bloated programms like libreOffice, MS Words, OpenOffice or such and you want to write using your command line or even console but you have to hand in a Word-like document!

Usage:
If used without any arguments txt2pdf will create an empty Open Document file called "untitled.odt"

The first argument should be the text file. If only used with the first argument the name for the Open Document file will be the name of the first argument,

The second argument should be the desired name of the Open Document file that is to be created. The ".odt" extension will automatically be appended and should therefor not be typed out.

Examples:
>txt2pdf
>ls
>untitled.odt

>txt2pdf example
>ls
>example example.odt

>txt2pdf lol.txt haha
>ls
>lol.txt haha.odt

Roadmap:
In the moment txt2pdf will simply create a mostly empty .odt file without many specifications. Also all the text of the input file will be put into a single paragraph in the Open Document file.
So improvements I am looking to implement:
-Adding Flags that will let u specify fonts, sizes, extras (bold, italic, etc.), etc.
-Transporting the breaks (paragraphs) in the text file to the Open Document file.
-Feel free to suggest other improvements or bugs
