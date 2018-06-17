function [ X ] = LimpiarLaberinto( X )
%LIMPIARLABERINTO: Toma un laberinto generado y lo limpia para que solo
%queden 0 y 2 (Vacios y paredes)
[x,y]=size(X);
for i=1:x
    for j=1:y
        if X(i,j)~=2 && X(i,j) ~=0
            X(i,j)=0;
        end
    end
end
   


end

