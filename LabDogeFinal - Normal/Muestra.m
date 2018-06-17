%Muestra del algoritmo: paso a paso

clc
clear

%colores: de este colormap map= [0.2,0.1,0.5;0.1,0.5,0.8;0.2,0.7,0.6;0.8,0.7,0.3;0.9,1,0;0,1,0];
%1 = azul marino
%2 = azul claro
%3 = otro azul
%4 = color doge
%5 = amarillo
%6 = verde

%%Paso 1: Generar el laberinto

n=5; %Dificultad

colormap([0.2,0.1,0.5;0.1,0.5,0.8;0.2,0.7,0.6;0.8,0.7,0.3;0.9,1,0;0,1,0]); %[1,1,1;1,1,1;0,0,0]
    set(gcf,'color','w');
    showProgress=1;
    Vacio      = 0;
    Pared        = 2;
    NoVisitado  = -1;
    Visitado     = -2;
 
    m = 2*n+3;
    M = NoVisitado(ones(m));
    offsets = [-1, m, 1, -m];
 
    M([1 2:2:end end],:) = Pared;
    M(:,[1 2:2:end end]) = Pared;
 
    celdaActual = sub2ind(size(M),3,3);
    M(celdaActual) = Visitado;
 
    S = celdaActual;
 
    while (~isempty(S))
        moves = celdaActual + 2*offsets;
        VecinosSinVisitar = find(M(moves)==NoVisitado);
 
        if (~isempty(VecinosSinVisitar))
            next = VecinosSinVisitar(randi(length(VecinosSinVisitar),1));
            M(celdaActual + offsets(next)) = Vacio;
 
            NuevaCelda = celdaActual + 2*offsets(next);
            if (any(M(NuevaCelda+2*offsets)==NoVisitado))
                S = [S NuevaCelda];
            end
 
            celdaActual = NuevaCelda;
            M(celdaActual) = Visitado;
        else
            celdaActual = S(1);
            S = S(2:end);
        end
        if (showProgress)
            image(M-Visitado);
            axis equal off;
            drawnow;
            pause(.01);
        end
    end
    image(M-Visitado);
   axis equal off;



%%Paso 2: Resolver el saberinto



MazoInicio=M;
MazoActual=M;
[x,y]=PosicionAzarDisp(MazoInicio); %Generar posicion al azar
LugarDoge=[x,y]; %Asignarle la posicion al doge                                     (Posicionando doge)
InicioDoge=LugarDoge;
MazoActual(x,y)=4; %Ocupar la posicion del doge en el laberinto

[x,y]=PosicionAzarDisp(MazoActual); %Generar posicion al azar
LugarSalida=[x,y]; %Asignarle la posicion a la salida                                            (Posicionando Salida)
MazoActual(x,y)=600; % Ocupar la posicion de la salida en el laberinto

map= [0.2,0.1,0.5;0.1,0.5,0.8;0.2,0.7,0.6;0.8,0.7,0.3;0.9,1,0;0,1,0]; %Asignarle colores al Mazo
colormap(map);

image(MazoActual);
axis equal off;
drawnow;





%%Paso 3: Mostrar paso a paso la salida del laberinto
encontrado=0;x0=LugarDoge(1);y0=LugarDoge(2);x=x0;y=y0;LabR=MazoActual;
wasd=1;camino=[];j=LugarSalida(1);k=LugarSalida(2);mismolugar=0;


if (x==j && y==k)
  encontrado=1;
  mismolugar=1;
else
  [camino,encontrado]=Buscar(x0,y0,LabR,j,k);
end


%if(encontrado==1 && mismolugar~=1 && ready==0)
%    [x,y,camino,ready,LabR] = pintar_celda(x,y,camino,LabR);
%    image(LabR);
%    axis equal off;
%    drawnow;
%    pause(.1);
%end

