%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DESCRIPCIÓN DEL PROGRAMA %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Este programa se encarga de recomendar una ciudad a la que viajar desde Buenos Aires
% para realizar una escapada.
% El programa selecciona la ciudad de acuerdo con tus preferencias y te recomienda
% un medio de transporte.
% Todo esto teniendo en cuenta tu presupuesto disponible.
% Para invocar a la funcion, se escribe:
% costo_de_viaje(Ciudad,Presupuesto,Transporte,Precio,[Preferencias]).
% Donde Preferencias puede ser una o varias de entre las siguientes:
% aire_libre, playa, norte, sur, cultural, juvenil o parque_tematico


%****************%
% BASE DE HECHOS %
%****************%

%%%$%%%%%%%%%%
%% ciudades %%
%%%%$%%%%%%%%%
ciudad(bariloche).
ciudad(puertoiguazu).
ciudad(mardelplata).
ciudad(villagesell).
ciudad(lafalda).
ciudad(villacarlospaz).
ciudad(sanRafael).
ciudad(laluciladelmar).
ciudad(calafate).

%%%%%%%%%%%%%%%%%%%%%%%%%
%% precios transportes %%
%%%%%%%%%%%%%%%%%%%%%%%%%

%Precio en auto para un consumo medio de 6 litros / 100 km -- 0.06 litros / 1 km.
%Precio gasolina: $19.72 / litro --- YPF 18/11/2017 MOTOR 1.6 CARGA NAFTA SUPER, 100km / Hora
%Distancias determinas usando Google Maps
%No se cuenta el costo de los peajes 
%Recorrido: Ida/Vuelta
en_auto(bariloche,3760). %1589 * 2 km
en_auto(puertoiguazu,2835). %1198 * 2 km 
en_auto(mardelplata,982). %415 * 2 km 
en_auto(villagesell,890). %376 * 2 km 
en_auto(lafalda,1796). %759 * 2 km 
en_auto(villacarlospaz,1739). %735 * 2 km 
en_auto(sanRafael,2329). %983 * 2 km 
en_auto(laluciladelmar,847). %358 * 2 km  
en_auto(calafate,6699). %2831 * 2 km 

% Precios en micro (Ida/Vuelta)
% Para esto lo que hago es calcular el KM de viaje
% Pensando que los micro cobran como el doble que el Auto
% Siendo el mismo $19.72 * 2 = $39.44 / litro
en_micro(bariloche,7520).
en_micro(puertoiguazu,5670). 
en_micro(mardelplata,1964).
en_micro(villagesell,1780). 
en_micro(lafalda,3592).
en_micro(villacarlospaz,3479).
en_micro(sanRafael,4652).
en_micro(laluciladelmar,1694).
en_micro(calafate,13399).

% Precios en avion (Ida/Vuelta)
% Para esto lo que hago es calcular el KM de viaje
% Pensando que los micro cobran como el cuatruple que el Auto
% Siendo el mismo $19.72 * 4 = $78.88 / litro
en_avion(bariloche,15041).
en_avion(puertoiguazu,11340).
en_avion(mardelplata,3928).
en_avion(villagesell,3559).
en_avion(lafalda,7184).
en_avion(villacarlospaz,6957).
en_avion(sanRafael,9305).
en_avion(laluciladelmar,3389).
en_avion(calafate,26797).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Precios Hoteles (precio estipulado por 3 dias ,1 persona en habitacion simple, hotel 3 estrellas) %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Los precios de los mismos determinados de booking.com y tripadvisor.com.ar
precio_hotel(bariloche,3357). 		% Huinid Hotel Pioneros
precio_hotel(puertoiguazu,2331). 	% Hotel el Libertador
precio_hotel(mardelplata,2330). 	% Hotel Arcos
precio_hotel(villagesell,2780). 	% Hotel y Spa Arenarena
precio_hotel(lafalda,1621). 		% Hotel Marydor
precio_hotel(villacarlospaz,1469). 	% Hotel Salerno
precio_hotel(sanRafael,3530).		% San Martin Hotel y Spa
precio_hotel(laluciladelmar,1717).	% Hotel Bella Costa
precio_hotel(calafate,6294).		% Quijote Hotel 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Características de las ciudades %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Ciudades con playa o muy proximas a ella
playa(mardelplata).
playa(villagesell).
playa(lafalda).			% Balneario siete cascadas
playa(villacarlospaz).
playa(sanRafael). 		% Playa Desconocida En Dique Valle Grande
playa(laluciladelmar). 	

% Ciudades de elevada importancia cultural
cultural(bariloche).
cultural(puertoiguazu).
cultural(lafalda).
cultural(calafate).

% Ciudades ideales para juvenils
juvenil(mardelplata).
juvenil(villagesell).
juvenil(villacarlospaz).
juvenil(laluciladelmar).
juvenil(bariloche).

% Cercanía a parques temáticos
parque_tematico(bariloche).
parque_tematico(puertoiguazu).
parque_tematico(mardelplata).
parque_tematico(villacarlospaz).
parque_tematico(calafate).

% Zona aire libre
aire_libre(bariloche).
aire_libre(lafalda).
aire_libre(sanRafael).
aire_libre(calafate).

% Situación geografica
% Los que estan por el medio los cargo como ambos (norte y sur a la vez)
norte(puertoiguazu).
norte(mardelplata).
norte(villagesell).
norte(lafalda).
norte(villacarlospaz).
norte(sanRafael).
norte(laluciladelmar).
sur(bariloche).
sur(mardelplata).
sur(villagesell).
sur(sanRafael).
sur(laluciladelmar).
sur(calafate).


%**************************************************%
% DECLARACION DE PREDICADOS O RELACIONES DERIVADAS %
%**************************************************%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Precio del transporte a una Ciudad, según se vaya en avion,auto o micro %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
transporte(Ciudad,auto,Costo):- en_auto(Ciudad,Costo).
transporte(Ciudad,micro,Costo):- en_micro(Ciudad,Costo).
transporte(Ciudad,avion,Costo):- en_avion(Ciudad,Costo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Precio del viaje completo a una ciudad %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% viaje dice el precio en una ciudad, teniendo en cuenta el hotel y el precio del transporte.
viaje(Ciudad,Transporte,Precio):- transporte(Ciudad,Transporte,Costo_t),precio_hotel(Ciudad,Costo_h),Precio is Costo_t+Costo_h.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Seleccion de una ciudad en funcion de la opcion elegida %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
opcion_elegida(juvenil,Ciudad):-juvenil(Ciudad).
opcion_elegida(playa,Ciudad):-playa(Ciudad).
opcion_elegida(cultural,Ciudad):-cultural(Ciudad).
opcion_elegida(parque_tematico,Ciudad):-parque_tematico(Ciudad).
opcion_elegida(aire_libre,Ciudad):-aire_libre(Ciudad).
opcion_elegida(norte,Ciudad):-norte(Ciudad).
opcion_elegida(sur,Ciudad):-sur(Ciudad).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Descripcion de la informacion de cada ciudad %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
descripcion(bariloche):- write('Ciudad: San Carlos de Bariloche (Rio Negro).'),nl,
write('La distancia (en auto) desde Buenos Aires es: 1589 Km'),nl,
write('Podras visitar (entre otros):'),nl,
write(' - Parque Nacional Nahuel Huapi.'),nl,
write(' - Cerro Catedral.'),nl,
write(' - Museo de la Patagonia.'),nl,
write(' - Museo del Lago Gutierrez.'),nl,
write(' - Catedral Alta Patagonia.'),nl,
write(' - Cerro Campanario Bariloche.'),nl,
write('Una opcion muy recomendable para los amantes de la naturaleza, un verdadero paraiso natural. (MUY RECOMENDABLE).'),nl.
descripcion(puertoiguazu):- write('Ciudad: Puerto Iguazu (Misiones).'),nl,
write('La distancia (en auto) desde Buenos Aires es: 1198 Km'),nl,
write('Podras visitar (entre otros):'),nl,
write(' - Parque Nacional Iguazu.'),nl,
write(' - Ciudad del Este.'),nl,
write(' - Hito Tres Fronteras.'),nl,
write(' - Biocentro Iguazu.'),nl,
write('No podes esperar menos de la provincia poseedora de una de las siete maravillas naturales del mundo '),nl,
write('Dotada con las imponentes Cataratas del Iguazu, ademas de la cercania con Ciudad del Este'),nl,
write('Puerto Iguazu se presenta como una opcion fuerte entre gente de todas las edades'),nl.
descripcion(mardelplata):- write('Ciudad: Mar del Plata.'),nl,
write('La distancia (en auto) desde Buenos Aires es: 415 Km'),nl,
write('Podras visitar (entre otros):'),nl,
write(' - Rambla Marplatense.'),nl,
write(' - Muelle de los Pescadores.'),nl,
write(' - Playa Varese.'),nl,
write(' - Aquopolis.'),nl,
write('Senti todo el verano yendo a la mitica Mar del Plata, un destino ideal para grupos.'),nl,
write('de todas las edades en especial grupos jovenes ya que este destino cuenta con mucho'),nl,
write('entretenimiento nocturno debido a sus bares y diversos entretenimientos que continuan'),nl,
write('durante altas horas de la madrugada'),nl.
descripcion(villagesell):- write('Ciudad: Villa Gesell .'),nl,
write('La distancia (en auto) desde Buenos Aires es: 376 Km'),nl,
write('Podras visitar (entre otros):'),nl,
write(' - Playa Villa Gesell.'),nl,
write(' - Sendero Botanico.'),nl,
write(' - Muelle Villa Gesell.'),nl,
write('Senti todo el verano yendo a Villa Gesell, un destino ideal para grupos.'),nl,
write('de todas las edades en especial grupos jovenes ya que este destino cuenta con mucho'),nl,
write('entretenimiento nocturno debido a sus bares y diversos entretenimientos que continuan'),nl,
write('durante altas horas de la madrugada'),nl.
descripcion(lafalda):- write('Ciudad: La Falda (Cordoba).'),nl,
write('La distancia (en auto) desde Buenos Aires es: 759 Km'),nl,
write('Podras visitar (entre otros):'),nl,
write(' - 7 Cascadas.'),nl,
write(' - Dique la Falda.'),nl,
write(' - Casino La Falda.'),nl,
write(' - Plaza San Martin.'),nl,
write('Si necesitas desconectarte del clima de ciudad, La Falda es tu destino turistico'),nl,
write('venite a disfrutar de las vistas mas fantasticas del pais, senti la naturaleza en todo'),nl,
write('su esplendor debido a la belleza de sus paisajes.'),nl.
descripcion(villacarlospaz):- write('Ciudad: Villa Carlos Paz (Cordoba).'),nl,
write('La distancia (en auto) desde Buenos Aires es: 735 Km'),nl,
write('Podras visitar (entre otros):'),nl,
write(' - Dique San Roque.'),nl,
write(' - Parque Nacional Quebrada del Condorito.'),nl,
write(' - Wave Zone.'),nl,
write(' - Expoacuario.'),nl,
write('Una opcion diferente, Villa Carlos Paz mezcla a la perfeccion sus atracciones turisticas'),nl,
write('Junto con todo lo necesario para presentarse como fuerte candidato para grupos juveniles'),nl,
write('Siendo recomendado para grupos de todas las edades'),nl.
descripcion(sanRafael):- write('Ciudad: San Rafael (Mendoza).'),nl,
write('La distancia (en auto) desde Buenos Aires es: 983 Km'),nl,
write('Podras visitar (entre otros):'),nl,
write(' - Represa de Los Reyunos.'),nl,
write(' - Plaza Francia.'),nl,
write(' - Laberinto de Borges.'),nl,
write(' - Casino Tower.'),nl,
write('Como una de las ciudades mas bonitas del pais, San Rafael esta plagada de exelentes vistas.'),nl,
write('y los mayores placeres gastronomicos para que tu viaje sea perfecto'),nl.
descripcion(laluciladelmar):- write('Ciudad: La Lucila del Mar .'),nl,
write('La distancia (en auto) desde Buenos Aires es: 358 Km'),nl,
write('Podras visitar (entre otros):'),nl,
write(' - Balneario La Lucila del Mar.'),nl,
write(' - Muelle La Lucila'),nl,
write(' - A solo 5 metros de la ciudad de San Bernardo.'),nl,
write('La Lucila del Mar es una villa de veraneo con espiritu joven.'),nl, 
write('Se la puede elegir para el descanso en familia o para subirse a la movida que cada temporada imponga..'),nl.
descripcion(calafate):- write('Ciudad: Calafate.'),nl,
write('La distancia (en auto) desde Buenos Aires es: 2831 Km'),nl,
write('Podras visitar (entre otros):'),nl,
write(' - Parque Nacional Los Glaciares.'),nl,
write(' - Plazoleta Heroes de Malvinas.'),nl,
write(' - Southern Spirit Lago Argentino'),nl,
write(' - Museo del Hielo'),nl,
write(' - Punta Walichu'),nl,
write('Punto turistico imperdible, toda la belleza del Sur Argentino en un unico lugar, '),nl,
write('no te podes permitir no conocer esta hermosa ciudad (MUY RECOMENDADA).'),nl.

% Función que imprime una linea separadora.
separador :- write_ln(''), write('********************************************************************'),write_ln('').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comprobacion del precio del viaje %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Funcion que comprueba si la ciudad está dentro del presupuesto del cliente 
comprueba_precio(Ciudad,Transporte,Presupuesto,Precio):- viaje(Ciudad,Transporte,Precio),Z is Presupuesto - Precio,Z>=0, Presupuesto >=0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Imprime la informacion de la ciudad %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imprimir(Ciudad,auto):-separador,descripcion(Ciudad),separador.
imprimir(_,micro):-write_ln('').
imprimir(_,avion):-write_ln('').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Funcion principal del programa ¡es la que llama a todas las demas! %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Invocación de la función "costo_de_viaje(X,playa...)".
costo_de_viaje(Ciudad,Presupuesto,Transporte,Costo_total,W):- opcion_elegida(W,Ciudad),comprueba_precio(Ciudad,Transporte,Presupuesto,Costo_total),imprimir(Ciudad,Transporte).
costo_de_viaje(Ciudad,Presupuesto,Transporte,Costo_total,X,Y):- opcion_elegida(X,Ciudad), opcion_elegida(Y,Ciudad),comprueba_precio(Ciudad,Transporte,Presupuesto,Costo_total),imprimir(Ciudad,Transporte).
costo_de_viaje(Ciudad,Presupuesto,Transporte,Costo_total,X,Y,Z):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),comprueba_precio(Ciudad,Transporte,Presupuesto,Costo_total),imprimir(Ciudad,Transporte).
costo_de_viaje(Ciudad,Presupuesto,Transporte,Costo_total,X,Y,Z,T):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),opcion_elegida(T,Ciudad),comprueba_precio(Ciudad,Transporte,Presupuesto,Costo_total),imprimir(Ciudad,Transporte).
costo_de_viaje(Ciudad,Presupuesto,Transporte,Costo_total,X,Y,Z,T,R):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),opcion_elegida(T,Ciudad),opcion_elegida(R,Ciudad),comprueba_precio(Ciudad,Transporte,Presupuesto,Costo_total),imprimir(Ciudad,Transporte).
costo_de_viaje(Ciudad,Presupuesto,Transporte,Costo_total,X,Y,Z,T,R,S):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),opcion_elegida(T,Ciudad),opcion_elegida(R,Ciudad),opcion_elegida(S,Ciudad),comprueba_precio(Ciudad,Transporte,Presupuesto,Costo_total),imprimir(Ciudad,Transporte).
costo_de_viaje(Ciudad,Presupuesto,Transporte,Costo_total,X,Y,Z,T,R,S,M):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),opcion_elegida(T,Ciudad),opcion_elegida(R,Ciudad),opcion_elegida(S,Ciudad),opcion_elegida(M,Ciudad),comprueba_precio(Ciudad,Transporte,Presupuesto,Costo_total),imprimir(Ciudad,Transporte).

lugares_recomendados(Ciudad,Transporte,Costo_total,W):- opcion_elegida(W,Ciudad),comprueba_precio(Ciudad,Transporte,100000,Costo_total),imprimir(Ciudad,Transporte).
lugares_recomendados(Ciudad,Transporte,Costo_total,X,Y):- opcion_elegida(X,Ciudad), opcion_elegida(Y,Ciudad),comprueba_precio(Ciudad,Transporte,1000000,Costo_total),imprimir(Ciudad,Transporte).
lugares_recomendados(Ciudad,Transporte,Costo_total,X,Y,Z):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),comprueba_precio(Ciudad,Transporte,100000,Costo_total),imprimir(Ciudad,Transporte).
lugares_recomendados(Ciudad,Transporte,Costo_total,X,Y,Z,T):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),opcion_elegida(T,Ciudad),comprueba_precio(Ciudad,Transporte,100000,Costo_total),imprimir(Ciudad,Transporte).
lugares_recomendados(Ciudad,Transporte,Costo_total,X,Y,Z,T,R):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),opcion_elegida(T,Ciudad),opcion_elegida(R,Ciudad),comprueba_precio(Ciudad,Transporte,100000,Costo_total),imprimir(Ciudad,Transporte).
lugares_recomendados(Ciudad,Transporte,Costo_total,X,Y,Z,T,R,S):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),opcion_elegida(T,Ciudad),opcion_elegida(R,Ciudad),opcion_elegida(S,Ciudad),comprueba_precio(Ciudad,Transporte,100000,Costo_total),imprimir(Ciudad,Transporte).
lugares_recomendados(Ciudad,Transporte,Costo_total,X,Y,Z,T,R,S,M):- opcion_elegida(X,Ciudad),opcion_elegida(Y,Ciudad),opcion_elegida(Z,Ciudad),opcion_elegida(T,Ciudad),opcion_elegida(R,Ciudad),opcion_elegida(S,Ciudad),opcion_elegida(M,Ciudad),comprueba_precio(Ciudad,Transporte,100000,Costo_total),imprimir(Ciudad,Transporte).

%%%%%%%%%%%%%%%%%%%
%% Funcion ayuda %%
%%%%%%%%%%%%%%%%%%%
ayuda:- nl, write('******************************************************'),nl,
write('TP FINAL - "Programacion Logica)'),nl,
write('Materia: Teoria de la Computacion'),nl,
write('2do Cuatrimestre de 2017'),nl,
write('Alumno: Gonzalo Pesado'),nl,
nl, write('******************************************************'), nl,
nl, write(' SISTEMA EXPERTO - PLANIFICACION DE GASTOS DE VIAJES.'), nl,nl,
write('Para planificar una escapada fuera de Buenos Aires escriba:'),nl,
nl,write(' costo_de_viaje(Ciudad,Presupuesto,Transporte,Costo_total,Preferencias).'),nl,nl,
write(' Sustituya "Presupuesto" (en pesos sin $) , "Preferencias" y/o "Ciudad".'),nl,
write(' El resto de los parametros dejelos como estan escritos arriba y obtendra los resultados'),nl,
write(' "Preferencias" pueden ser: aire_libre, norte, sur, playa, cultural, juvenil o parque_tematico'),nl,
write(' "Ciudades" pueden ser: bariloche, puertoiguazu, mardelplata , villagesell , lafalda ,'),nl,
write(' 		        villacarlospaz, sanRafael, laluciladelmar, calafate'),nl,
nl,write('Si el dinero no es un problema puede probar tambien:'),nl,
nl,write(' lugares_recomendados(Ciudad,Transporte,Costo_total,Preferencias).'),nl,nl,
write('La cual le recomendara lugares a los que viajar con sus respectivos precios.'),nl,
nl,write('IMPORTANTE:'),nl,
write(' Pulse "r" o ";" detras de cada resultado para ver todas las posibilidades.'),nl,
write(' Pulse "enter" para dejar de ver los resultados'),nl.