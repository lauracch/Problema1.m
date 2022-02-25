import datetime
import psycopg2


conexion = psycopg2.connect(
    host = 'localhost',
    port = '5432',
    user = 'postgres',
    password = 'admin',
    dbname = 'postgres'
)
cursor = conexion.cursor()
try:
    print("Ingrese los datos ")
    dia = int(input("dia de nacimiento: "))
    mes = int(input("mes de nacimiento: "))
    año = int(input("Año de nacimiento: "))

except:
    print("Los datos son erroneos, ingrese numeros")

año_act = datetime.date.today().year
mes_act = datetime.date.today().month
dia_act = datetime.date.today().day

fecha_act = dia_act+mes_act+año_act
cumple = dia+mes+año_act

if (fecha_act>cumple):
    edad_años = (año_act -año)
else:
    edad_años = ((año_act)-año)-1

edad_mes = abs(mes_act-mes)
edad_dia = abs(dia_act-dia)

print("La persona cumple: ",edad_años)

if (fecha_act)>=(cumple):
    print("La persona ya cumplió años")
else : 
    print("La persona aun no ha cumplido años")

cursor.execute("Insert into problema1 VALUES (%s, %s, %s, %s);",(dia,mes,año,edad_años))

cursor.close()
conexion.commit()
conexion.close()