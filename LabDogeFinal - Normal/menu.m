function varargout = menu(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menu_OpeningFcn, ...
                   'gui_OutputFcn',  @menu_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menu (see VARARGIN)

% Choose default command line output for menu
handles.output = hObject;
clc
% Update handles structure
axes(handles.axes1);
I = imread('happy-doge.jpg');
RI = imref2d(size(I));
RI.XWorldLimits = [0 10];
RI.YWorldLimits = [0 10];
imshow(I,RI);
axis off;
handles.diff=5;
handles.doge=5;
handles.mostrar=1;
handles.LugarDoge(1)=2;
handles.LugarDoge(2)=2;
handles.MazoActual=[2,2,2;2,2,2;2,2,2];
handles.generado=0;
handles.buscando=0;
handles.buscado=0;

axes(handles.axes3); %Funcion escribir FESC1---
axis off;
P=imread('panel.jpg');
imshow(P);
text(10,25,'-¡Bienvenido al laberinto del Doge!');
axes(handles.axes1);

guidata(hObject,handles)

% UIWAIT makes menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure



% -Up-
    function pushbutton1_Callback(hObject, eventdata, handles)
        if handles.buscando~=1&&handles.buscado~=1
            [handles.LugarDoge(1),handles.LugarDoge(2),handles.MazoActual,g,nm]=Mover(handles.LugarDoge(1),handles.LugarDoge(2),handles.MazoActual,'w',handles.doge);
            p=handles.pasos;
            handles.pasos=p+1;
            if g==1
                handles.LugarDoge(1)=0;
                handles.LugarDoge(2)=0;
                I = imread('WinDoge.jpg');
                RI = imref2d(size(I));
                RI.XWorldLimits = [0 10];
                RI.YWorldLimits = [0 10];
                imshow(I,RI);
                axis off;
                [y,Fs] = audioread('Puppy-sound.mp3');
                sound(y,Fs);
                handles.mostrar=1;
                axes(handles.axes3); %Funcion escribir FESC1---
                axis off;
                P=imread('panel.jpg');
                imshow(P);
                text(10,25,strcat(strcat('Lo lograste en: ',int2str(handles.pasos)),' pasos'));
                axes(handles.axes1);
                if handles.pasos < handles.record
                    handles.record=handles.pasos;
                end
                handles.buscado=1;
            elseif handles.mostrar==1;
                donothing=0;
            else
                image(handles.MazoActual);
                axis off;
            end
            guidata(hObject,handles)
        end
        
        
        
        % -Left-
        function pushbutton2_Callback(hObject, eventdata, handles)
            if handles.buscando~=1&&handles.buscado~=1
                [handles.LugarDoge(1),handles.LugarDoge(2),handles.MazoActual,g,nm]=Mover(handles.LugarDoge(1),handles.LugarDoge(2),handles.MazoActual,'a',handles.doge);
                p=handles.pasos;
                handles.pasos=p+1;
                if g==1
                    handles.LugarDoge(1)=0;
                    handles.LugarDoge(2)=0;
                    I = imread('WinDoge.jpg');
                    RI = imref2d(size(I));
                    RI.XWorldLimits = [0 10];
                    RI.YWorldLimits = [0 10];
                    imshow(I,RI);
                    axis off;
                    [y,Fs] = audioread('Puppy-sound.mp3');
                    sound(y,Fs);
                    handles.mostrar=1;
                    axes(handles.axes3); %Funcion escribir FESC1---
                    axis off;
                    P=imread('panel.jpg');
                    imshow(P);
                    text(10,25,strcat(strcat('Lo lograste en: ',int2str(handles.pasos)),' pasos'));
                    axes(handles.axes1);
                    if handles.pasos < handles.record
                        handles.record=handles.pasos;
                    end
                    handles.buscado=1;
                elseif handles.mostrar==1;
                    donothing=0;
                else
                    image(handles.MazoActual);
                    axis off;
                end
                guidata(hObject,handles)
            end
            
            
            % -Right-
            function pushbutton3_Callback(hObject, eventdata, handles)
                if handles.buscando~=1&&handles.buscado~=1
                    [handles.LugarDoge(1),handles.LugarDoge(2),handles.MazoActual,g]=Mover(handles.LugarDoge(1),handles.LugarDoge(2),handles.MazoActual,'d',handles.doge);
                    p=handles.pasos;
                    handles.pasos=p+1;
                    if g==1
                        handles.LugarDoge(1)=0;
                        handles.LugarDoge(2)=0;
                        I = imread('WinDoge.jpg');
                        RI = imref2d(size(I));
                        RI.XWorldLimits = [0 10];
                        RI.YWorldLimits = [0 10];
                        imshow(I,RI);
                        axis off;
                        [y,Fs] = audioread('Puppy-sound.mp3');
                        sound(y,Fs);
                        handles.mostrar=1;
                        
                        axes(handles.axes3); %Funcion escribir FESC1---
                        axis off;
                        P=imread('panel.jpg');
                        imshow(P);
                        text(10,25,strcat(strcat('Lo lograste en: ',int2str(handles.pasos)),' pasos'));
                        axes(handles.axes1);
                        if handles.pasos < handles.record
                            handles.record=handles.pasos;
                        end
                        handles.buscado=1;
                        
                    elseif handles.mostrar==1;
                        donothing=0;
                    else
                        image(handles.MazoActual);
                        axis off;
                    end
                    guidata(hObject,handles)
                end
                
                
                
                % -Down-
                function pushbutton4_Callback(hObject, eventdata, handles)
                    if handles.buscando~=1&&handles.buscado~=1
                        [handles.LugarDoge(1),handles.LugarDoge(2),handles.MazoActual,g,nm]=Mover(handles.LugarDoge(1),handles.LugarDoge(2),handles.MazoActual,'s',handles.doge);
                        p=handles.pasos;
                        handles.pasos=p+1;
                        if g==1
                            handles.LugarDoge(1)=2;
                            handles.LugarDoge(2)=2;
                            I = imread('WinDoge.jpg');
                            RI = imref2d(size(I));
                            RI.XWorldLimits = [0 10];
                            RI.YWorldLimits = [0 10];
                            imshow(I,RI);
                            axis off;
                            [y,Fs] = audioread('Puppy-sound.mp3');
                            sound(y,Fs);
                            handles.mostrar=1;
                            
                            axes(handles.axes3); %Funcion escribir FESC1---
                            axis off;
                            P=imread('panel.jpg');
                            imshow(P);
                            text(10,25,strcat(strcat('Lo lograste en: ',int2str(handles.pasos)),' pasos'));
                            axes(handles.axes1);
                            if handles.pasos < handles.record
                                handles.record=handles.pasos;
                            end
                            handles.buscado=1;
                        elseif handles.mostrar==1;
                            donothing=0;
                        else
                            image(handles.MazoActual);
                            axis off;
                        end
                        guidata(hObject,handles)
                    end

% Boton -Salir-
function pushbutton5_Callback(hObject, eventdata, handles)
    s=1;
    save('salir','s');
    close;

% Boton -Reiniciar-
function pushbutton6_Callback(hObject, eventdata, handles)
if handles.generado==1&&handles.buscando~=1
    handles.MazoActual=handles.MazoInicio;
    handles.mostrar=0; %Vuelve a dejar que el jugador se mueva
    handles.LugarDoge=handles.InicioDoge;
    image(handles.MazoActual);
    axis off;
    axes(handles.axes3); %Funcion escribir FESC1---
    axis off;
    P=imread('panel.jpg');
    imshow(P);
    handles.pasos=0;
    text(10,25,strcat(strcat('El record actual es de:  ',int2str(handles.record)),' pasos'));
    axes(handles.axes1);
    handles.buscado=0;
end
guidata(hObject,handles)


% Boton -Nuevo Juego-.
    function pushbutton7_Callback(hObject, eventdata, handles)
        if handles.buscando~=1
            handles.MazoInicio=GenerarMazo(handles.diff); %Generar mazo inicial
            handles.MazoInicio=LimpiarLaberinto(handles.MazoInicio); %Limpiar el laberinto nuevo                     (Generando mazo)
            handles.MazoActual=handles.MazoInicio; %Asignar el mazo actual al mazo generado
            
            [x,y]=PosicionAzarDisp(handles.MazoInicio); %Generar posicion al azar
            handles.LugarDoge=[x,y]; %Asignarle la posicion al doge                                     (Posicionando doge)
            handles.InicioDoge=handles.LugarDoge;
            handles.MazoActual(x,y)=5; %Ocupar la posicion del doge en el laberinto
            
            [x,y]=PosicionAzarDisp(handles.MazoActual); %Generar posicion al azar
            handles.LugarSalida=[x,y]; %Asignarle la posicion a la salida                                            (Posicionando Salida)
            handles.MazoActual(x,y)=600; % Ocupar la posicion de la salida en el laberinto
            
            handles.MazoInicio=handles.MazoActual;
            
            handles.map= [0.2,0.1,0.5;0.1,0.5,0.8;0.2,0.7,0.6;0.8,0.7,0.3;0.9,1,0;0,1,0]; %Asignarle colores al Mazo
            colormap(handles.map); %Hacer que al mostrar el mazo los colores asignados se muestren                      (Mostrando mazo)
            image(handles.MazoActual); %Mostrar mazo
            axis off; %Quitar ejes
            handles.generado=1;
            handles.mostrar=0; %Volvemos a dejar que el jugador se mueva
            
            
            axes(handles.axes3); %Funcion escribir FESC1---
            axis off;
            P=imread('panel.jpg');
            imshow(P);
            handles.pasos=0;
            handles.record=inf;
            text(10,25,'¡Buena suerte!');
            axes(handles.axes1);
            handles.buscado=0;

            guidata(hObject,handles)
        end



% Pop-up
function popupmenu1_Callback(hObject, eventdata, handles)
handles.output = hObject;
str = get(hObject, 'String');
val = get(hObject, 'Value');
switch str{val};
    case 'Facil'
        I = imread('happy-doge.jpg');
        RI = imref2d(size(I));
        RI.XWorldLimits = [0 10];
        RI.YWorldLimits = [0 10];
        imshow(I,RI);
        axis off;
        handles.diff=5;
        handles.cambio=5;
        axes(handles.axes3);
        axis off;
        P=imread('panel.jpg');
        imshow(P);
        text(10,25,'-Para los poco experimentados.');
        axes(handles.axes1);
    case 'Medio'
        I = imread('doge.jpg');
        RI = imref2d(size(I));
        RI.XWorldLimits = [0 10];
        RI.YWorldLimits = [0 10];
        imshow(I,RI);
        axis off;
        handles.diff=8;
        handles.cambio=1;
        axes(handles.axes3);
        axis off;
        P=imread('panel.jpg');
        imshow(P);
        text(10,25,'-Para los que solo quieren pasar el rato.');
        axes(handles.axes1);
    case 'Dificil'
        I = imread('skilled-doge.jpg');
        RI = imref2d(size(I));
        RI.XWorldLimits = [0 10];
        RI.YWorldLimits = [0 10];
        imshow(I,RI);
        axis off;
        handles.diff=12;
        handles.cambio=1;
        axes(handles.axes3);
        axis off;
        P=imread('panel.jpg');
        imshow(P);
        text(10,25,'-No es tan dificil.');
        text(10,45,'-¡Tomate tu tiempo!');
        axes(handles.axes1);
    case 'Lunatico'
        I = imread('angery-doge.jpg');
        RI = imref2d(size(I));
        RI.XWorldLimits = [0 10];
        RI.YWorldLimits = [0 10];
        imshow(I,RI);
        axis off;
        handles.diff=50;
        handles.cambio=1;
        axes(handles.axes3);
        axis off;
        P=imread('panel.jpg');
        imshow(P);
        text(10,25,'-¡Eres un lunatico!');
        axes(handles.axes1);
end

% Save the handles structure.
guidata(hObject,handles)% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% Resolver Laberinto
function pushbutton9_Callback(hObject, eventdata, handles)
    if handles.buscado~=1
        encontrado=0;x0=handles.LugarDoge(1);y0=handles.LugarDoge(2);x=x0;y=y0;LabR=handles.MazoActual;
        wasd=1;camino=[];j=handles.LugarSalida(1);k=handles.LugarSalida(2);pasoA=2;erro=0;mismolugar=0;handles.buscando=1;guidata(hObject,handles)
        handles.map= [0.2,0.1,0.5;0.1,0.5,0.8;0.2,0.7,0.6;0.8,0.7,0.3;0.9,1,0;0,1,0]; %Asignarle colores al Mazo
        colormap(handles.map);%Hacer que al mostrar el mazo los colores asignados se muestren
        
        axes(handles.axes3);
        axis off;
        P=imread('panel.jpg');
        imshow(P);
        text(10,25,'-Doge esta buscando la salida.');
        text(10,45,'-¡Dale tiempo!');
        axes(handles.axes1);
        
        [camino,encontrado]=Buscar(x0,y0,LabR,j,k);
        pause(0.5);
        
        if encontrado==1
            I = imread('WinDoge.jpg');
            RI = imref2d(size(I));
            RI.XWorldLimits = [0 10];
            RI.YWorldLimits = [0 10];
            imshow(I,RI);
            axis off;
            axes(handles.axes3);
            axis off;
            P=imread('panel.jpg');
            imshow(P);
            text(10,25,'-¡Doge ha encontrado la salida!');
            text(10,45,strcat(strcat('-La salida estaba a: ',int2str(length(camino))),' pasos de distancia'));
            axes(handles.axes1);
        else
            I = imread('Perdoge.jpg');
            RI = imref2d(size(I));
            RI.XWorldLimits = [0 10];
            RI.YWorldLimits = [0 10];
            imshow(I,RI);
            axis off;
            load('salir.mat');
            if s==1;
                donothing=1;
            else
                axes(handles.axes3);
                axis off;
                P=imread('panel.jpg');
                imshow(P);
                text(10,25,'-¡Doge no ha encontrado la salida!');
                text(10,45,'-¿Sera que ha habido algun error?');
                axes(handles.axes1);
            end
        end
        
        handles.buscando=0;
        handles.buscado=1;
        if encontrado==1;
            guidata(hObject,handles)
        end
    end
