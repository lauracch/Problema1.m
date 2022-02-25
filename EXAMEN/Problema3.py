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
    num = int(input("Ingrese un numero: "))
except:
    print("Datos erroneos, ingrese numeros")



if(num>=1 & num<=1000):
    unidades=(num%10)
    decenas=(num%100)//10
    centenas=(num%1000)//100

    print("El numero tiene")

    print(unidades, "unidades")
    print(decenas, "decenas")
    print(centenas, "centenas")
    cursor.execute("Insert into problema3 VALUES (%s,%s,%s,%s);",(num,unidades,decenas,centenas))
    conexion.commit()
else:
    print("el valor no es correcto")

    cursor.close()
    conexion.commit()
    conexion.close()