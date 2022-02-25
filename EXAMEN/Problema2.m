try 
  pkg load database
  conn = pq_connect(setdbopts('dbname','postgres','host','localhost','port','5432',
  'user','postgres','password','admin'))
  disp("1.Calculo de angulos")
  disp("2.Historial")
  menu=input("Selecciona una opcion: ");
switch menu
  case 1 
    disp("Debera de ingresar 2 angulos para encontrar el tercer ")
    angulo1 = input('Ingrese el primer angulo: ');
    angulo2 = input('Ingrese el segundo angulo: ');
    angulo = angulo1 + angulo2;
    angulo3 = 0;
    
    if (angulo1<180)&&(angulo2<180)
    angulo3 = 180-angulo;
    
    disp('El angulo 3 es : ')
    disp(angulo3)
    
    elseif(angulo1>=180)&&(angulo2<180)
      disp('El angulo 1 no puede superar los 180 grados')
  
    elseif(angulo1<180)&&(angulo2>=180)
      disp('El angulo 2 no puede superar los 180 grados')
  
    elseif(angulo1>=180)&&(angulo2>=180)
      disp('Ninguno de los dos angulos puede superar los 180 grados')
  end 
  pq_exec_params(conn, 'insert into problema3examen values ($1,$2,$3);',{angulo1,angulo2,angulo3});

case 2 
  pq_exec_params(conn, "select *from problema3examen;")
otherwise
  disp("Selecciona una categoria valida")
end
catch
  disp("Ha ocurrido un error")
end_try_catch
fid = fopen('P3.txt', 'a');
fprintf(fid, 'El primer angulo es:%f\n',angulo1');
fprintf(fid, 'El segundo angulo es:%f\n',angulo2');
fprintf(fid, 'El anguloo resultante es:%f\n',angulo3');
fclose(fid);
fprintf('Archivo guardado \n')