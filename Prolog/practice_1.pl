homme(albert).
homme(jean).
homme(paul).
homme(bertrand).
homme(louis).
homme(benoit).
femme(germaine).
femme(christiane).
femme(simone).
femme(marie).
femme(sophie).
pere(albert,jean).
pere(jean,paul).
pere(paul,bertrand).
pere(paul,sophie).
pere(jean,simone).
pere(louis,benoit).
mere(germaine,jean).
mere(christiane,simone).
mere(christiane,paul).
mere(simone,benoit).
mere(marie,bertrand).
mere(marie,sophie).

parent(X,Y):- pere(X,Y) | mere(X,Y).
fils(X,Y):- 
    pere(Y,X), homme(X);
    mere(Y,X), homme(X).
fille(X,Y):-
    pere(Y,X), femme(X);
    mere(Y,X), femme(X).
grand_pere(X,Y):-
    pere(X,Z), pere(Z,Y) | mere(Z,Y).
grand_mere(X,Y):-
    mere(X,Z), pere(Z,Y) | mere(Z,Y).
frere(X,Y):-
    homme(X),
    pere(Z,X),
    pere(Z,Y),
    mere(M,X),
    mere(M,Y),
    X \== Y.
soeur(X,Y):-
    femme(X),
    pere(Z,X),
    pere(Z,Y),
    mere(M,X),
    mere(M,Y),
    X \== Y.

% Exemple 2
aime(marie,vin).
voleur(pierre).
aime2(pierre,X):- aime(X,vin).
vole(X,Y):- voleur(X), aime2(X,Y).

% Exemple 3
% Time off = True if Grippe = True
conge(X):- grippe(X).
% Grippe => True if Fever = True and Cough = True
grippe(X):- fievre(X), tousse(X).
% Fever => True if someone has temperature and it is > 38
fievre(X):- temperature(X,T), sup(T,38).
% John coughs
tousse(john).
% John measures his temperature
temperature(john,t).
% temperature is over 38
sup(t,38).
    
sunny.
john_is_cold.



                     
                     
