# va
## where stored data can be real

Va is a special data storing program.You can store your files or data in va.
Some va stuff:
. va.sh Documents/file.txt
cws
dws
#>
0-Documents/file.txt

It saves time because instead of writing 'cat Documents/file.txt' you can write 'cat ${NW[0]}'

You can save your list data in one file.

Some more va stuff:
. va_init.sh
vo[11]="hello world"
vo[12]=hello_world.sh
sws
. hello_world.sh
cws
dws
output:
#>
0-hello
1-world

echo ${NW[0]}
output:
hello
