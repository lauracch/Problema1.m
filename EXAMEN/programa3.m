try 
  pkg load database;
  conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432','user','postgres','password','admin'))
  
  numero = input('Ingrese un numero entero: ');
  N = num2str(numero);
  
if (num1<100)
    decena = N(1);
    unidad = N(2);
    centena  = 0;
    fprintf('El numero %d tiene %d centenas, %s decenas y %s unidades',numero,centena ,decena,unidad )
    N = pq_exec_params(conn, "INSERT INTO problema3 values ($1,$2,$3,$4);",(numero,unidad,decena,centena));
 
else 
  decena = N(1);
  unidad = N(2);
  centena  = N(3);
  fprintf('El numero %d tieine %d centenas, %s decenas y %s unidades',numero,centena ,decena,unidad )
  N = pq_exec_params(conn, "INSERT INTO problema3 values ($1,$2,$3,$4);",(numero,unidad,decena,centena));

end 
catch 
printf("Ha ocurrido un error")
end_try_catch