program submatriz;
type
	matriz = array[1..20,1..20] of Integer;
var
	A, C: matriz;
	filasA, columnasA, filasC, columnasC: Integer;
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

function generaMatriz(var filas: Integer; var columnas: Integer): matriz;
var 
	modo: Integer;
begin
	repeat
		write('Indique las filas de la matriz [1-20]: ');
		readln(filas);
	until ((1<=filas) and (filas<=20));
		repeat
		write('Indique las columnas de la matriz [1-20]: ');
		readln(columnas);
	until ((1<=columnas) and (columnas<=20));
	repeat
		writeln('Como desea introducir la matriz?');
		writeln('  Aleatorio (1)');
		writeln('  Manual (2)');
		write('R: ');
		readln(modo);
	until ((modo=1) or (modo=2));
	if (modo=1) then	
		generaMatriz := matrizAleatoria(filas, columnas)
	else
		generaMatriz := matrizManual(filas, columnas);
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
	A:=generaMatriz(filasA, columnasA);

	writeln;

	writeln('La matriz A es');
	writeln;
	mostrarMatriz(A, filasA, columnasA);
	writeln;

	writeln('Perfecto, ahora debes definir C');
	C:=generaMatriz(filasC, columnasC);

	writeln;

	writeln('La matriz C es');
	writeln;
	mostrarMatriz(C, filasC, columnasC);
	writeln;
end;

procedure muestraIndicesSubmatriz(i, j, filasC, columnasC: Integer);
var
	x, y: Integer;
begin
	writeln('Posiciones por fila');
	for x := 1 to filasC do
	begin
		for y := 1 to columnasC do
		begin
			write('[',(i + x - 1),', ',(j + y - 1),']');
			if (y<>columnasC) then
				write(' - ');
		end;
		writeln;
	end;

end;

function recorrerC(A,C: matriz; i, j, filasC, columnasC: Integer): Boolean;
var
	x, y: Integer;
	esLaCasillaEsIgual: Boolean;
begin
	for x := 1 to filasC do
	begin
	 	for y := 1 to columnasC do
	 	begin
	 		esLaCasillaEsIgual := (C[x,y] =  A[i + x - 1, y + j - 1]);
	 		if (not esLaCasillaEsIgual) then
	 			exit(FALSE);
	 	end; 
	end;
	recorrerC := TRUE;
end;


function recorrerA(A,C: matriz; filasA, columnasA,  filasC, columnasC: Integer): Boolean;
var
	i,j: Integer;
	esSubmatriz, fueSubmatriz, seEncuentraEnLosLimites: Boolean;
begin
	fueSubmatriz := FALSE;
	for i := 1 to filasA do
	begin
	 	for j := 1 to columnasA do
	 	begin
	 		esSubmatriz := FALSE;
	 		seEncuentraEnLosLimites := ((i+filasC-1)<=filasA) or ((j+columnasC-1)<=columnasC);
	 		if (seEncuentraEnLosLimites) then
	 	 		esSubmatriz := recorrerC(A, C, i, j, filasC, columnasC);
	 	 	if (esSubmatriz) then
	 	 	begin
	 	 		writeln('La matriz C es submatriz de A');
				muestraIndicesSubmatriz(i, j, filasC, columnasC);
				fueSubmatriz := TRUE;
	 	 	end;
	 	end; 
	end;
	recorrerA := fueSubmatriz;
end;

procedure ejercicio2();
begin
	if(not recorrerA(A, C, filasA, columnasA,  filasC, columnasC)) then
		writeln('C no es submatriz de A');
end;


begin
	randomize;
	repeat
		introducirDatos();
		ejercicio2();
		writeln;
		writeln('Se ha terminado el programa, desea repetir? [S/N]');
		readln(continuar);
	until (continuar = 'N');
end.