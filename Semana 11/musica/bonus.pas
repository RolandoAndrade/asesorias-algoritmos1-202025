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
type Nota = record
	frecuencia : Integer;
	duracion: Integer;
end;
type Cancion = record
	nombre : String;
	anho: Integer;
	autores: array[1..3] of Autor;
	notas: array[1..20] of Nota; 
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

function craerNota(frecuencia, duracion: Integer): Nota;
var 
	laNota: Nota;
begin
	laNota.frecuencia := frecuencia;
	laNota.duracion := duracion;
	craerNota := laNota;
end;

procedure reproducir(laCancion: Cancion);
var
	i: Integer;
begin
	for i := 1 to 20 do
		windows.beep(laCancion.notas[i].frecuencia, laCancion.notas[i].duracion); 
end;

const 
	A5 = 880; 
	B5 = 988;
	C5 = 523;
	D5 = 587;
	E5 = 659;
	F5 = 698;
	G5 = 784;

var
	canciones: array[1..20] of Cancion;
begin
	canciones[1].nombre := 'Estrellita, Estrellita, donde estas';
	canciones[1].anho := 1761;
	canciones[1].autores[1] := crearAutor('Amadeus ', 'Mozart', crearPais('Austria', Europa));

	canciones[1].notas[1] := craerNota(C5, 300);
	canciones[1].notas[2] := craerNota(C5, 300);
	canciones[1].notas[3] := craerNota(G5, 300);
	canciones[1].notas[4] := craerNota(G5, 300);
	canciones[1].notas[5] := craerNota(A5, 300);
	canciones[1].notas[6] := craerNota(A5, 300);
	canciones[1].notas[7] := craerNota(G5, 300);

	canciones[1].notas[8] := craerNota(F5, 300);
	canciones[1].notas[9] := craerNota(F5, 300);
	canciones[1].notas[10] := craerNota(E5, 300);
	canciones[1].notas[11] := craerNota(E5, 300);
	canciones[1].notas[12] := craerNota(D5, 300);
	canciones[1].notas[13] := craerNota(D5, 300);
	canciones[1].notas[14] := craerNota(C5, 300);

	canciones[1].notas[15] := craerNota(G5, 300);
	canciones[1].notas[16] := craerNota(G5, 300);
	canciones[1].notas[17] := craerNota(F5, 300);
	canciones[1].notas[18] := craerNota(F5, 300);
	canciones[1].notas[19] := craerNota(E5, 300);
	canciones[1].notas[20] := craerNota(E5, 300);

	reproducir(canciones[1]);
end.