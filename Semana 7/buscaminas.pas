program buscaminas;
uses math;
type
	matriz = array[1..10,1..10] of char;
var
	tablero: matriz;

{Función para contar las bombas al rededor}
function cuentaBombas(tablero: matriz; i: Integer; j: Integer): char;
var
	total: Integer;
	x, y: Integer;
begin
	total := 0;
	for x:= max(1, i - 1) to min(i + 1, length(tablero)) do
	begin
		for y:= max(1, j - 1) to min(j + 1, length(tablero[i])) do
		begin
			if ((x <> i) or (y <> j)) then
			begin
				if (tablero[x,y] = '*') then
				begin
					total := total + 1;
				end;
			end;
		end;
	end;
	cuentaBombas := chr(total+48);
end;

{Procedimiento para recorrer el tablero}
procedure recorrerTablero(var tablero: matriz);
var
	i, j : Integer;
begin
	for i := 1 to length(tablero) do
	begin
	 	for j := 1 to length(tablero[i]) do
	 	begin
	 	 	if (tablero[i,j] <> '*') then
	 	 	begin
	 	 		tablero[i,j]:=cuentaBombas(tablero, i, j);
	 	 	end;
	 	end; 
	end; 
end;


{Procedimiento para mostrar el tablero}
procedure mostrarTablero(var tablero: matriz);
var
	i, j : Integer;
begin
	for i := 1 to length(tablero) do
	begin
	 	for j := 1 to length(tablero[i]) do
	 	begin
	 	 	write(tablero[i,j], ' ');
	 	end; 
	 	writeln;
	end; 
end;

{Procedimiento para crear tablero aleatorio}
function crearTablero(): matriz;
var
	tablero: matriz;
	i, j : Integer;
begin
	for i := 1 to length(tablero) do
	begin
	 	for j := 1 to length(tablero[i]) do
	 	begin
	 	 	if (random(100) > 59) then
	 	 	begin
	 	 		tablero[i,j] := '*';
	 	 	end
	 	 	else
	 	 	begin
	 	 		tablero[i,j] := '-';
	 	 	end;
	 	end; 
	end;
	crearTablero := tablero;
end;

begin
	randomize;
	tablero := crearTablero();
	writeln('Tablero inicial');
	mostrarTablero(tablero);
	writeln('Tablero final');
	recorrerTablero(tablero);
	mostrarTablero(tablero);
end.