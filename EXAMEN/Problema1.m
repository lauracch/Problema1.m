clc; clear;
try
pkg load database
conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','admin'))
  
e1 = input('Ingrese dia de nacimiento: ');
e2 = input('Ingrese mes de nacimiento: ');
e3 = input('Ingrese a?o de nacimiento: ');
  
if (2022>e3 && e3>1900)
    edad = 2022-e3;
    if (e2<=32 && e2>=1)
        if (e2<=31 && e1>=1)
            if (e2<=8 && e1<=26)
                printf('Su edad es %d, usted ya cumpli? a?os',edad)
                txt = 'Ya cumplio anios';
            else
                printf('Su edad es %d, usted no ha cumplido a?os',edad)
                txt = 'No cumplio anios';
            end
        else 
            printf('Fecha incorrect')
            end
    else
        printf('Fecha incorrecta')
    end
else 
    printf('Fecha incorrecta')
  end
N=pq_exec_params(conn, 'insert into problema3 (anio,edad,resultado)  values ($1,$2,$3);',{e1,e2,e3});
catch
  printf("Ha ocurrido un error")
end_try_catch