function [ r ] = EstaVacio( x,y,X )
%ESTAVACIO: Responde si el sitio al que se desea mover esta vacio en primer
%lugar, si es la salida, responde 2. 1 es Si, 0 es no.
r=0;
if X(x,y)==0
    r=1;
elseif X(x,y)==600
    r=2;
end

    
    


end

