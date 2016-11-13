% Función para calcular la fft
function F=calc_fft(x)
N=length(x);%tamaño de la entrada
Fant=zeros(1,N);%vector temporal 


%% Aclaraciones
%el tamaño del vector de entrada debe ser una potencia de dos N=2^n con n
%entero positivo

%si bien el programa usa el algoritmo rapido de la fft
%presenta demora cuando el N es grande 2^14=16384



%% Algoritmo pasos
%paso 1
%primero se acomoda la entrada
%paso 2
%se calcula la transformada





%% Paso 1 - inversion de orden de bits 
%Fant=bitrevorder(x);%pemuta entrada en orden de bit-inverso



%% Paso 1 (otra opcion) -inversion de orden de bits 
%reliza lo mismo que la opcion 1 solo que sin usar la función de matlab

%variables para ordenamiento
M=N/2;
desp=0;

%divide las N muestras en dos partes (par e impar)
%a cada parte (par o impar) lo divide nuevamente en parte par e impar y
%asi sigue dividiendo.

%ej N=8
%01234567
%la parte par seria 0246 y la impar 1357 uniendolos da 02461357
%-ahora el bloque 0246 se divide en par 04 e impar 26
%-mientras que el bloque 1357 se divide en par 15 e impar 37
%-uniendolos 04261537

%pemuta entrada en orden de bit-inverso 
while M>1
    %while para acomodar los 'varios' bloques de de tamaño 2M
    while desp <N
        %lazo for que acomoda un bloque de tamaño 2M para un dado desp
        %el numero uno que se encuentra al final es porque en matlab el
            %indice empieza con 1
        for i=0:M-1                                    
            Fant(i+desp+1)=x(2*i+desp+1);       %bloque par de tamaño M
            Fant(i+M+desp+1)=x(2*i+1+desp+1);   %bloque impar de tamaño M
            %al final del bloque par va el impar por eso va +M en el impar 
        end
        desp=desp+2*M;%para el siguiente bloque de tamaño 2M
    end
    x=Fant;%guarda los valores ordenados para usarlos de aca en adelante
    desp=0;%vuelve a cero
    %una vez acomodado el M se divide en dos
    M=M/2;%
end



%% Paso 2 - transformada rapida de fourier
%se calcula 'varias' fft de tamaño 2 con dos bloques de tamaño 1 (M)
%se calcula 'varias' fft de tamaño 4 con dos bloques de tamaño 2 (M)
%se calcula 'varias' fft de tamaño 8 con dos bloques de tamaño 4 (M)
% ...
%se calcula  fft de tamaño N con dos bloques de tamaño M=N/2

%como se ve el M se va duplicando hasta llegar a N/2


%variables para transformada
M=1;    %valor inicial para M
desp=0; %para hacer varias transformadas discretas


% halla la transformada de fourier de la entrada (Fant)
while M<=N/2        
    while desp<N % procesamiento de bloques de tamaño 2M                   
        %lazo for que obtiene la transformada discreta de tamaño 2M para 
        %un dado desp        
        for u=1:M 
            %en realidad u va de 0 a M-1, solo que en matlab el indice
            %inicial es 1
            upar=u+desp;    %indice para la funcion par
            uimp=u+M+desp;  %indice para la funcion impar
            %al final del bloque par va el impar por eso el +M en el impar
            W=exp(-2j*pi*(u-1)/(2*M));  %constante
            F(upar)=Fant(upar)+Fant(uimp)*W; %primera mitad de la transformada
            F(uimp)=Fant(upar)-Fant(uimp)*W; %segunda mitad de la transformada
        end        
        desp=desp+2*M;%para el siguiente bloque de tamaño 2M
    end
    %asciende de nivel ahora los bloques tienen el doble de tamaño
    desp=0; %para iniciar en cero
    Fant=F; %copia las 'varias' transformadas realizadas 
    M=2*M;%indica que ahora los bloques a procesar tienen el doble de tamaño
end


