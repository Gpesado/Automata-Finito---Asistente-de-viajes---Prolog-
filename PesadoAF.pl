%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DESCRIPCIÓN DEL PROGRAMA %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Este programa se encarga de realizar consultas a un automata finitio no deterministico
% Los simbolos son C (cerrar) , L (llaves) , E (entrar) , lambda (transicion vacia).

%****************%
% BASE DE HECHOS %
%****************%

%%%$%%%%%%%%%
%% Estados %%
%%%%$%%%%%%%%
estado(0).
estado(1).
estado(2).
estado(3).
estado(4).
estado(5).
estado(6).
estado(f).

esEstadoFinal(f).

%%%$%%%%%%%%%%%%%%
%% Transiciones %%
%%%%$%%%%%%%%%%%%%
transicion(0,c,1).
transicion(1,l,2).
transicion(2,a,3).
transicion(3,e,4).
transicion(4,c,5).
transicion(5,l,6).

%%%$%%%%%%%%%%%%%%%%%%%%%
%% Transiciones Lambda %%
%%%%$%%%%%%%%%%%%%%%%%%%%
transicion_lambda(0,2).
transicion_lambda(0,3).
transicion_lambda(6,f).

%%%$%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FUNCION PRINCIPAL - EJECUTAR AUTOMATA %%
%%%%$%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejecutarAutomata(E,[]) :- esEstadoFinal(E).
ejecutarAutomata(E,[X|L]) :- transicion(E,X,E1), ejecutarAutomata(E1,L).
ejecutarAutomata(E,L) :- transicion_lambda(E,E1), ejecutarAutomata(E1,L).

automata(A):- ejecutarAutomata(0,A).
%%%%%%%%%%%%%%%%%%%
%% Funcion ayuda %%
%%%%%%%%%%%%%%%%%%%
ayuda:- nl, write('******************************************************'),nl,
write('TP f - "Programacion Logica")'),nl,
write('Materia: Teoria de la Computacion'),nl,
write('2do Cuatrimestre de 2017'),nl,
write('Alumno: Gonzalo Pesado'),nl,
nl, write('******************************************************'), nl,
nl, write(' AUTOMATA FINITO NO DETERMINISTICO.'), nl,nl,
write('Para ejecutar el automata escriba:'),nl,
nl,write(' automata([listaDeCaracteres]).'),nl,nl,
write(' la listaDeCaracteres permite diversos valores los cuales son:'),nl,
write(' 	-Caracter a = "abrir la puerta"'),nl,
write(' 	-Caracter c = "cerrar la puerta / la puerta esta cerrada"'),nl,
write(' 	-Caracter e = "entrar por la puerta"'),nl,
write(' 	-Caracter l = "abrir/cerrar con la llave"'),nl,
write('si desea consultar cuales son las combinaciones de caracteres aceptadas'),nl,
write('por el automata puede escribir automata(A). para verlas.'),nl,
write(' Pulse "r" o ";" detrás de cada resultado para ver todas las posibilidades.'),nl,
write(' Pulse "enter" para dejar de ver los resultados'),nl.