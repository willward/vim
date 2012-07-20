
c:\cygwin\bin\find.exe . -name '*.py' ^
-o -name '*.java' ^
-o -iname '*.[CH]' ^
-o -name '*.cpp' ^
-o -name '*.cc' ^
-o -name '*.hpp' > cscope.files

REM -b: just build
REM -q: create inverted index
C:\cygwin\usr\local\bin\cscope -b -q