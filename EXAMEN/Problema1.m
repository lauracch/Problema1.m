clc; clear;
try
  pkg load database
  conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','admin'))
  e1 = input('Ingrese dia de nacimiento: ');
  e2 = input('Ingrese mes de nacimiento: ');
  e3 = input('Ingrese año de nacimiento: ');
  
if (2022>e3 && e3>1900)
    edad = 2022-e3;
  if (e2<=32 && e2>=1)
    if (e2<=31 && e1>=1)
      if (e2<=8 && e1<=26)
        printf('Su edad es %d, usted ya cumplió años',edad)
        else
        printf('Su edad es %d, usted no ha cumplido años',edad)
        end
      else 
      printf('Fecha incorrect')
        end
    else
    printf('Fecha incorrecta')
    end
  else 
printf('Fecha incorrecta')
pq_exec_params(conn, 'insert into problema1 values ($1,$2,$3);',{e1,e2,e3});
end   
end