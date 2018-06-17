function [ x,y ] = PosicionAzarDisp( X )
%Esta funcion genera un punto (x,y) que esté disponible en la matriz X
Generado=0;
while Generado==0
    [f,c]=size(X);
    y=randi(f);
    x=randi(c);
    if X(x,y)==0 
        Generado=1;
    end
end
    
    
    

end

