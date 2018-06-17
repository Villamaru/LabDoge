function [x,y,wasd,camino,encontrado,LabR] = paso(x,y,x0,y0,wasd,camino,LabR,j,k)

encontrado=0;
if not(x==x0 && y==y0)
    if ((((wasd==1 && camino(length(camino))==3)||(wasd==2&& camino(length(camino))==4))    ||(wasd==3 && camino(length(camino))==1)))||(wasd==4 && camino(length(camino))==2)
        wasd=wasd+1;
    end
end
switch(wasd)
    case 1
        if(LabR(x-1,y)~=2)
            LabR(x,y)=0;
            x=x-1;
            camino(length(camino)+1)=1;
            wasd=1;
            LabR(x,y)=4;
            if(x==j && y==k)
                encontrado=1;
            end
        else
            wasd=wasd+1;
        end
    case 2
        if(LabR(x,y-1)~=2)
            LabR(x,y)=0;
            y=y-1;
            camino(length(camino)+1)=2;
            wasd=1;
            LabR(x,y)=4;
            if(x==j && y==k)
                encontrado=1;
            end
        else
            wasd=wasd+1;
        end
    case 3
         if(LabR(x+1,y)~=2)
            LabR(x,y)=0;
            x=x+1;
            camino(length(camino)+1)=3;
            wasd=1;
            LabR(x,y)=4;
            if(x==j && y==k)
                encontrado=1;
            end
          else
            wasd=wasd+1;
          end
    case 4
         if(LabR(x,y+1)~=2)
            LabR(x,y)=0;
            y=y+1;
            camino(length(camino)+1)=4;
            wasd=1;
            LabR(x,y)=4;
            if(x==j && y==k)
                encontrado=1;
            end
         else
            wasd=wasd+1;
         end
         
            
    case 5
        switch(camino(length(camino)))
          case 1
            wasd=2;
            LabR(x,y)=0;
            camino(length(camino))=[];
            x=x+1;
            LabR(x,y)=4;
          case 2
            wasd = 3;
            LabR(x,y)=0;
            camino(length(camino))=[];
            y=y+1;
            LabR(x,y)=4;
          case 3
            wasd=4;
            LabR(x,y)=0;
            camino(length(camino))=[];
            x=x-1;
            LabR(x,y)=4;
          case 4
            wasd=5;
            LabR(x,y)=0;
            camino(length(camino))=[];
            y=y-1;
           LabR(x,y)=4;  
        end
                        
end

