program submatriz;
type
	matriz = array[1..20,1..20] of Integer;
var
	A: matriz;
	n: Integer;
	continuar: char;

function matrizManual(filas, columnas: Integer): matriz;
var
	i,j, n: Integer;
	tablero: matriz;
begin
	for i := 1 to filas do
	begin
	 	for j := 1 to columnas do
	 	begin
	 		write('(',i,', ',j,') = ');
	 		readln(n);
	 	 	tablero[i,j] := n;
	 	end;
	end;
	matrizManual := tablero;
end;

function matrizAleatoria(filas, columnas: Integer): matriz;
var
	i,j : Integer;
	tablero: matriz;
begin
	for i := 1 to filas do
	begin
	 	for j := 1 to columnas do
	 	begin
	 	 	tablero[i,j] := random(100);
	 	end; 
	end;
	matrizAleatoria := tablero;
end;

function generaMatriz(var n: Integer): matriz;
var 
	modo: Integer;
begin
	repeat
		write('Indique dimension de la matriz [1-20]: ');
		readln(n);
	until ((1<=n) and (n<=20));
	repeat
		writeln('Como desea introducir la matriz?');
		writeln('  Aleatorio (1)');
		writeln('  Manual (2)');
		write('R: ');
		readln(modo);
	until ((modo=1) or (modo=2));
	if (modo=1) then	
		generaMatriz := matrizAleatoria(n, n)
	else
		generaMatriz := matrizManual(n, n);
end;



procedure mostrarMatriz(tabla: matriz; filas,columnas: Integer);
var
	i, j : Integer;
begin
	for i := 1 to filas do
	begin
	 	for j := 1 to columnas do
	 	begin
	 	 	if(tabla[i,j]<10) then
	 	 		write('0');
	 	 	write(tabla[i,j], ' ');
	 	end; 
	 	writeln;
	end; 
end;

procedure introducirDatos();
begin
	writeln('Es hora de definir la matriz A');
	A:=generaMatriz(n);
end;

{Voltear la matriz}
procedure voltear();
var 
	aux: matriz;
	i, j: Integer;
begin
	writeln('Matriz antes');
	mostrarMatriz(A, n, n);
	for i := 1 to n do
	begin
		for j := 1 to n do
		begin
			aux[i,j] := A[j , n - i + 1];
		end;
	end;
	A := aux;
	writeln('Matriz despues');
	mostrarMatriz(A, n, n);
end;

begin
	randomize;
	repeat
		introducirDatos();
		voltear();
		writeln;
		writeln('Se ha terminado el programa, desea repetir? [S/N]');
		readln(continuar);
	until (continuar = 'N');
end.