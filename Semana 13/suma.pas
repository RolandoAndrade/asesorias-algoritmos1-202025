program suma;
var
	archivoEntrada, archivoSalida: Text;
	numero: Integer;
	total: Integer;
const
	nombreArchivoEntrada = 'entrada.txt';
	nombreArchivoSalida = 'salida.txt';
begin

 	assign(archivoEntrada, nombreArchivoEntrada);

	assign(archivoSalida, nombreArchivoSalida);

	reset(archivoEntrada);

	rewrite(archivoSalida); 

	{Mientras no sea el fin del archivo vas a leer línea por línea}
    while not eof(archivoEntrada) do
    begin
    	{Resetea el acumulador porque se viene un nuevo número}
    	total := 0;
    	{Mientras no termine la línea vas a leer un número y escribirlo en el archivo de salida}
        while not eoln(archivoEntrada) do
    	begin
    		{Lee en archivo de entrada}
			read(archivoEntrada,numero);
			{Escribe en archivo de salida el número que lee}
			write(archivoSalida, numero);
			{Suma el número al acumulador}
			total := total + numero;
			{Si no ha terminado quiero escribir el signo +}
			if not eoln(archivoEntrada) then
			begin
				write(archivoSalida, '+');
			end;
		end;
		{Escribe en salida = el resultado}
		writeln(archivoSalida, '=', total);
		{Salta a la siguiente línea}
		readln(archivoEntrada);
    end;


    close(archivoEntrada);

    close(archivoSalida);
end.