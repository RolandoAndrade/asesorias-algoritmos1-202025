program musica;
uses windows;
type continentes = (Asia, Europa, America, Africa, Oceania);
type objetivos = (Orquesta, Opera);
type Pais = record
	nombre : String;
	continente: continentes;
end;
type Autor = record
	nombre : String;
	apellido: String;
	pais: Pais;
end;
type Cancion = record
	nombre : String;
	anho: Integer;
	autores: array[1..3] of Autor;
end;

function crearPais(nombre: String; continente: continentes): Pais;
var
	elPais: Pais;
begin
	elPais.nombre := nombre;
	elPais.continente := continente;
	crearPais := elPais;
end;

function crearAutor(nombre, apellido: String; pais: Pais): Autor;
var
	elAutor: Autor;
begin
	elAutor.nombre := nombre;
	elAutor.apellido := apellido;
	elAutor.pais := pais;
	crearAutor := elAutor;
end;

procedure mostrarCancion(cancion: Cancion; cantidad: Integer);
var 
	i: Integer;
begin
	writeln('nombre: ', cancion.nombre);
	writeln('anho: ', cancion.anho);
	writeln('autores:');
	for i := 1 to cantidad do 
	begin
		writeln(' - ', cancion.autores[i].nombre, cancion.autores[i].apellido);
	end;
	writeln;
end;

var
	canciones: array[1..20] of Cancion;
begin
	canciones[1].nombre := 'Estrellita, Estrellita, donde estas';
	canciones[1].anho := 1761;
	canciones[1].autores[1] := crearAutor('Amadeus ', 'Mozart', crearPais('Austria', Europa));
	canciones[1].autores[2] := crearAutor('Anonimo ', '', crearPais('Desconocido', Europa));

	canciones[2].nombre := 'Para Ellisa';
	canciones[2].anho := 1820;
	canciones[2].autores[1] := crearAutor('Ludwing ', 'Beethoven', crearPais('Alemania', Europa));

	mostrarCancion(canciones[1], 2); 
	mostrarCancion(canciones[2], 1); 
end.