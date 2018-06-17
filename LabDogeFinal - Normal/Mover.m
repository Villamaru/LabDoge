function [x,y,X,g,nm] = Mover( x,y,X,m,ente)
%Funcion que toma una posicion de un ente(x,y), el laberinto donde se encuentra 
%y el laberinto original y devuelve la nueva posicion del ente, junto con
%el laberinto actualizado
%Entrada: x,y posicion del ente, X Laberinto actual, m lugar hacia donde se
%desea mover
%Salida: x,y, posicion nueva del ente(Si es que logro moverse), X
%laberinto cambiado, g ¿Ha ganado el juego? 1 si, 0 no.
g=0;
nm=0;
switch m
    case 'a',
        x2=x;
        y2=y-1;
    case 'w',
        x2=x-1;
        y2=y;
    case 'd',
        x2=x;
        y2=y+1;
    case 's',
        x2=x+1;
        y2=y;
end    
r=EstaVacio(x2,y2,X);
switch r
    case 1,
        X(x,y)=0;
        x=x2;
        y=y2;
        X(x,y)=ente;
    case 2,
        g=1;
    case 0,
        nm=1;
end

end

