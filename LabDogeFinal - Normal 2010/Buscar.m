function [camino,encontrado] = Buscar(x0,y0,LabR,j,k)
%Variables internas: Wasd = Direccion actual de doge, w=1...,d=4
%Camino: Direcciones que ha tenido doge en el tiempo Ej: [1,2,4,1,2,3,4]
s=0;
save('salir','s');
encontrado =0;
error=0;x=x0;y=y0;
wasd=1;
camino=[];
while (encontrado==0 && error ==0)
  [x,y,wasd,camino,encontrado,LabR]=paso(x,y,x0,y0,wasd,camino,LabR,j,k);
  image(LabR);
  axis equal off;
  drawnow;
  pause(.1);
  if ((x==x0&&y==y0)&&wasd==5)
    error=1;
  end
  load('salir.mat');
  if s==1;
      error=1;
      break;
  end
end
if error ==1
  disp('Error, no se encontro la salida')
end
