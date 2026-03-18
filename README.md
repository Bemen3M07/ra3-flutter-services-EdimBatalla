# EXERCICI RA3 – CONSUM DE SERVEIS
==================================================

## OBJECTIU
--------------------------------------------------

L’objectiu d’aquest exercici és integrar diferents APIs externes dins d’una aplicació Flutter per practicar el consum de serveis HTTP.

S’han implementat tres casos d’ús diferents:

- Consulta d’acudits  
- Consulta de dades de cotxes  
- Consulta de transport públic (TMB)  

---

## APIS UTILITZADES
--------------------------------------------------

Durant el desenvolupament s’han utilitzat diverses APIs:

- API d’acudits → retorna acudits aleatoris  
- API de cotxes → proporciona informació sobre marques i models  
- API de TMB → permet consultar línies, parades i temps de pas  

En tots els casos s’ha treballat amb peticions HTTP i parseig de respostes JSON.

---

## ESTRUCTURA DE L’APLICACIÓ
--------------------------------------------------

L’aplicació s’ha organitzat seguint una estructura clara:

**Service**  
S’encarrega de fer les crides a les APIs.

**Provider**  
Gestiona l’estat i comunica les dades a la interfície.

**Models**  
Representen les dades rebudes de cada API.

**UI**  
Mostra la informació a l’usuari mitjançant diferents pantalles.

---

## FUNCIONALITATS IMPLEMENTADES
--------------------------------------------------

### Acudits
Permet obtenir i mostrar acudits de manera aleatòria.

### Cotxes
Permet consultar informació relacionada amb vehicles, com marques i models.

### TMB
Permet:

- Llistar línies de bus  
- Visualitzar les parades d’una línia  
- Consultar els temps de pas en una parada  

Flux de navegació:
Línies → Parades → Temps de pas


---

## DIFICULTATS TROBADES
--------------------------------------------------

Algunes APIs no tenen una estructura uniforme en les respostes JSON, fet que ha obligat a adaptar el parseig de dades.

També s’ha detectat que en el cas de TMB no sempre hi ha dades disponibles en temps real per totes les parades.

---

## RESULTAT FINAL
--------------------------------------------------

S’ha aconseguit una aplicació funcional que integra múltiples serveis externs i permet visualitzar informació en temps real.

El projecte està estructurat de forma modular i es pot ampliar fàcilment amb noves funcionalitats.