# Automata-Finito---Asistente-de-viajes---Prolog-
TP correspondiente a la materia Teoria de la computacion dictada en la Universidad Nacional General Sarmiento. Por un lado un sistema que emula un automata finito deterministico especificado en el informe y por el otro un asistente de viajes que recomienda lugares a donde ir siguiendo preferencias pasadas por parametro y calculando el gasto total del viaje

# INFORME REALIZADO:
Fecha de entrega: 23/11/2017
Universidad Nacional General Sarmiento
Año 2017
Sistema Experto

La idea consiste en el desarrollo de un Sistema Experto realizado en Prolog, el cual permitirá realizar consultas a una base de conocimientos aplicados a un tema específico, en este caso, el tema elegido será “Planificar gastos de viajes”.
Para realizar la base de conocimientos se investigó sobre cómo las empresas de turismo calculan el costo de sus pasajes, las cuales utilizan diversas variables que para este sistema no van al caso utilizar, por lo que se decidió realizar los cálculos mediante los siguientes criterios.

Primero que nada aclaramos que el viaje está calculado como un viaje corto, donde se estiman unos 3 días de viaje ( por lo cual serian 3 noches de hotel), sin contar con gastos de comida, gastos extras que realicemos en el viaje, ni tampoco el costo de los peajes debido a la dificultad de calcularlos para algunos destinos cargados en el sistema.
Los gastos que realizamos normalmente para un viaje son:
1.	Gastos de Alojamiento (Hotel): Estos gastos suelen ser muy variados, dependen de la categoría del hotel y de donde están ubicados exactamente. Para realizar este programa se seleccionaron de forma aleatoria habitaciones simples de hoteles 3 estrellas (alojamiento individual). Los costos de los mismos ya están calculados por los 3 días de alojamiento y fueron determinados utilizando las páginas web booking.com y tripadvisor.com.ar.

2.	Gastos de Viaje: Estos gastos dependen del tipo de transporte que utilizaremos para llegar hasta la ciudad, debido a la complejidad de los diversos precios de micros y aviones que existen para una ciudad determinada, se decidió utilizar la siguiente medida.
a.	Viaje en Auto: Es el menor gasto del sistema, el gasto del mismo se calcula determinando la cantidad de combustible que utiliza el auto para llegar a dicha ciudad y luego multiplicando por el precio del combustible, para determinar esto se utilizó los siguientes parámetros.
i.	Distancia de Buenos Aires a la ciudad (Utilizando Google Maps).
ii.	Consumo medio del auto: Se utilizó 6 litros / 100 km (consumo medio de un auto naftero utilizando nafta Súper, motor 1.6, viajando a 110 km/h). Para facilitar el cálculo utilizamos como medida 0.06 litros / 1 km.
iii.	Precio del combustible: Se tomo el precio de $19.72 / litro (precio de nafta Súper en YPF tomado al día 18/11/2017).
b.	Viaje en Micro: Se calculó como 2 veces el viaje en auto.
c.	Viaje en Avión: Se calculó como 4 veces el viaje en auto.

Para permitir recomendar viajes de una manera más óptima, se implementó un sistema de preferencias para el viaje los cuales son:
1.	aire_libre: Cuando se marca esta preferencia, el sistema interpreta que el usuario está buscando una experiencia al aire libre.
2.	norte: Se pensó en que ciertos usuarios prefieren viajar a una cierta región de Argentina, por lo cual se implementó esta preferencia.
a.	NOTA: Las ciudades que no estén bien marcadas en esta región (trazando una línea horizontal en buenos aires) aparecerán como Norte y Sur.
3.	sur: Similar a norte.
4.	playa: Preferencia para los usuarios fanáticos de playas.
5.	cultural: Preferencia para los usuarios amantes de las ciudades culturales, con varios museos y/o ciudades con puntos históricos/culturales fuertes.
6.	juvenil: Preferencia para los usuarios que deseen ir con integrantes jóvenes.
7.	parque_tematico: Preferencia para los usuarios que deseen ciudades con importantes parques temáticos en la misma.

Como adicional el sistema mostrará información sobre la ciudades que aparecen en los resultados para así dar un paneo más grande al usuario de porque apareció dicha ciudad.
Las funciones principales del sistema son:
1)	costo_de_viaje(Ciudad,Presupuesto,Transporte,Costo_total,Preferencias).
2)	lugares_recomendados(Ciudad,Transporte,Costo_total,Preferencias).


 
PRUEBAS

Teniendo como parámetros configurables principales Presupuesto y Preferencias. Dándonos las siguientes configuraciones más útiles:
1.	Utilizando los parámetros Presupuesto y Preferencias podremos encontrar el destino que más se ajuste a lo que buscamos por el precio indicado. Por ej.:
costo_de_viaje(Ciudad,3000,Transporte,Costo_total,playa).
El sistema recomendará:
********************************************************************
Ciudad: La Lucila del Mar .
La distancia (en auto) desde Buenos Aires es: 358 Km
Podrás visitar (entre otros):
 - Balneario La Lucila del Mar.
 - Muelle La Lucila
 - A solo 5 metros de la ciudad de San Bernardo.
La Lucila del Mar es una villa de veraneo con espíritu joven.
Se la puede elegir para el descanso en familia o para subirse a la movida que cada temporada imponga...
********************************************************************
Ciudad = laluciladelmar,
Transporte = auto,
Costo_total = 2564 ;
 
  2. Ahora configurando solo Presupuesto , Ciudad y Preferencias, el sistema nos dirá si nuestro presupuesto se ajusta para viajar a dicha ciudad y si la misma se ajusta a lo que deseamos. Por ej:
	costo_de_viaje(mardelplata,8000,Transporte,Costo_total,playa).
********************************************************************
Ciudad: Mar del Plata.
La distancia (en auto) desde Buenos Aires es: 415 Km
Podrás visitar (entre otros):
 - Rambla Marplatense.
 - Muelle de los Pescadores.
 - Playa Varese.
 - Aquopolis.
Sentí todo el verano yendo a la mítica Mar del Plata, un destino ideal para grupos.
de todas las edades en especial grupos jóvenes ya que este destino cuenta con mucho
entretenimiento nocturno debido a sus bares y diversos entretenimientos que continúan
durante altas horas de la madrugada
********************************************************************
Transporte = auto,
Costo_total = 3312 ;

Transporte = micro,
Costo_total = 4294 ;

Transporte = avión,
Costo_total = 6258.


 
3. Por ejemplo configurando Presupuesto , Transporte y Preferencias puedo consultarle al sistema a que destinos me puedo ir en auto con dicho presupuesto. Por ej:
costo_de_viaje(Ciudad,4000,auto,Costo_total,playa).

********************************************************************
Ciudad: Mar del Plata.
La distancia (en auto) desde Buenos Aires es: 415 Km
Podrás visitar (entre otros):
 - Rambla Marplatense.
 - Muelle de los Pescadores.
 - Playa Varese.
 - Aquopolis.
Sentí todo el verano yendo a la mítica Mar del Plata, un destino ideal para grupos.
de todas las edades en especial grupos jóvenes ya que este destino cuenta con mucho
entretenimiento nocturno debido a sus bares y diversos entretenimientos que continúan
durante altas horas de la madrugada
********************************************************************
Ciudad = mardelplata,
Costo_total = 3312 ;
********************************************************************
Ciudad: Villa Gesell .
La distancia (en auto) desde Buenos Aires es: 376 Km
Podrás visitar (entre otros):
 - Playa Villa Gesell.
 - Sendero Botánico.
 - Muelle Villa Gesell.
Sentí todo el verano yendo a Villa Gesell, un destino ideal para grupos.
de todas las edades en especial grupos jóvenes ya que este destino cuenta con mucho
entretenimiento nocturno debido a sus bares y diversos entretenimientos que continúan
durante altas horas de la madrugada
********************************************************************
Ciudad = villagesell,
Costo_total = 3670 ;
********************************************************************
Ciudad: La Falda (Córdoba).
La distancia (en auto) desde Buenos Aires es: 759 Km
Podrás visitar (entre otros):
 - 7 Cascadas.
 - Dique la Falda.
 - Casino La Falda.
 - Plaza San Martín.
Si necesitas desconectarte del clima de ciudad, La Falda es tu destino turístico
veinte a disfrutar de las vistas más fantásticas del país, sentí la naturaleza en todo
su esplendor debido a la belleza de sus paisajes.
********************************************************************
Ciudad = lafalda,
Costo_total = 3417 ;
********************************************************************
Ciudad: Villa Carlos Paz (Córdoba).
La distancia (en auto) desde Buenos Aires es: 735 Km
Podrás visitar (entre otros):
 - Dique San Roque.
 - Parque Nacional Quebrada del Condorito.
 - Wave Zone.
 - Expoacuario.
Una opción diferente, Villa Carlos Paz mezcla a la perfección sus atracciones turísticas
Junto con todo lo necesario para presentarse como fuerte candidato para grupos juveniles
Siendo recomendado para grupos de todas las edades
********************************************************************
Ciudad = villacarlospaz,
Costo_total = 3208 ;
********************************************************************
Ciudad: La Lucila del Mar .
La distancia (en auto) desde Buenos Aires es: 358 Km
Podrás visitar (entre otros):
 - Balneario La Lucila del Mar.
 - Muelle La Lucila
 - A solo 5 metros de la ciudad de San Bernardo.
La Lucila del Mar es una villa de veraneo con espíritu joven.
Se la puede elegir para el descanso en familia o para subirse a la movida que cada temporada imponga..
********************************************************************
Ciudad = laluciladelmar,
Costo_total = 2564 ;

La otra función importante para usar es:
lugares_recomendados(Ciudad,Transporte,Costo_total,Preferencias).

La cual le recomendará lugares a los que viajar con sus respectivos precios sin considerar un presupuesto a respetar. Por ej:
lugares_recomendados(Ciudad,Transporte,Costo_total,playa,juvenil,parque_tematico).
********************************************************************
Ciudad: Mar del Plata.
La distancia (en auto) desde Buenos Aires es: 415 Km
Podrás visitar (entre otros):
 - Rambla Marplatense.
 - Muelle de los Pescadores.
 - Playa Varese.
 - Aquopolis.
Sentí todo el verano yendo a la mítica Mar del Plata, un destino ideal para grupos.
de todas las edades en especial grupos jóvenes ya que este destino cuenta con mucho
entretenimiento nocturno debido a sus bares y diversos entretenimientos que continúan
durante altas horas de la madrugada
********************************************************************
Ciudad = mardelplata,
Transporte = auto,
Costo_total = 3312 ;

Ciudad = mardelplata,
Transporte = micro,
Costo_total = 4294 ;

Ciudad = mardelplata,
Transporte = avión,
Costo_total = 6258 ;
********************************************************************
Ciudad: Villa Carlos Paz (Córdoba).
La distancia (en auto) desde Buenos Aires es: 735 Km
Podrás visitar (entre otros):
 - Dique San Roque.
 - Parque Nacional Quebrada del Condorito.
 - Wave Zone.
 - Expoacuario.
Una opción diferente, Villa Carlos Paz mezcla a la perfección sus atracciones turísticas
Junto con todo lo necesario para presentarse como fuerte candidato para grupos juveniles
Siendo recomendado para grupos de todas las edades
********************************************************************
Ciudad = villacarlospaz,
Transporte = auto,
Costo_total = 3208 ;

Ciudad = villacarlospaz,
Transporte = micro,
Costo_total = 4948 ;

Ciudad = villacarlospaz,
Transporte = avión,
Costo_total = 8426 ;

Por último, cabe destacar que el sistema cuenta con su sistema de ayuda, el cual se invoca escribiendo ayuda. , el mismo informa de la sintaxis del programa y los parámetros configurables.
 
AUTOMATA FINITO 
NO DETERMINÍSTICO

Para recrear el autómata finito no determinantico. Se utilizó el siguiente grafo del autómata
 
Estados:
Verde: Estado Inicial del autómata. Cantidad: 1.
Rojo: Estados Finales del autómata. Cantidad: 1.
Amarillo: Estados intermedios del autómata. Cantidad: 6.
Caracteres del autómata:
λ: Transición lambda. Cantidad 3.
A: Abrir la puerta. Cantidad 1.
E: Entrar por la puerta. Cantidad 1.
C: Cerrar la puerta / La puerta está cerrada. Cantidad 2.
L: Abrir/Cerrar con llave. Cantidad 2.

Tabla de Transición:
Estados / Caracteres	λ 	A	E	C	L
INICIAL :Q0	[Q2 , Q3]	-	-	Q1	-
Q1	-	-	-	-	Q2
Q2	-	Q3	-	-	-
Q3	-	-	Q4	-	-
Q4	-	-	-	Q5	-
Q5	-	-	-	-	Q6
Q6	QF	-	-	-	-
FINAL : QF	-	-	-	-	-
Para la resolución del mismo el programa cuenta con la siguiente función principal:
automata([listaDeCaracteres]).

Ejemplos:
1 - Nadie mejor que el mismo programa para decirnos todas las combinaciones posibles para llegar a los resultados. Esto se puede ver usando.
automata(A).
Resultado:
A = [c, l, a, e, c, l] ;
A = [a, e, c, l] ;
A = [e, c, l] ;

2 - Ahora veremos uno de los casos críticos, cuando la lista de caracteres es vacía.

?- automata([]).
false.
?- automata(['']).
false.
?- automata([""]).
false.
?- automata('').
false.

3-  Para ver si el autómata resuelve bien vamos a probar un ejemplo de una cadena aceptada y otra que no.

automata([c,l,a,e,c,'l']).
true .
automata([c,l,a,e,'l']).
false.

4- Además probaremos que no ocurra nada raro con caracteres no validos para el sistema.

automata([c,l,a,j,k,l]).
false.

5- Por ultimo si se quiere conocer que caracteres nos faltaría en la cadena para ser aceptada podemos optar por poner.

automata([c,l,a,J,K,l]).
J = e,
K = c .


