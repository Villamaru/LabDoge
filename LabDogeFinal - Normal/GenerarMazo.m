function M = GenerarMazo(n)

    colormap([1,1,1;1,1,1;0,0,0]);
    set(gcf,'color','w');
 
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
        %if (showProgress)
            %image(M-VISITED);
           % axis equal off;
          %  drawnow;
         %   pause(.01);
        %end
    end
    %image(M-VISITED);
   axis equal off;