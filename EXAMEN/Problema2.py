from ctypes import pointer
import psycopg2



try: 
    angulo1 = int(input("Ingrese el primer angulo: "))
    angulo2 = int(input("Ingrese el segundo angulo: "))
    angulo3 = 180 - (angulo1+angulo2)

    if angulo3 != 0:
        conn = psycopg2.connect(database = "postgres", user ="postgres", password="admin",port = "5432", host = "localhost")
        pointer = conn.cursor()
        insertar = ("INSERT INTO problema3examen VALUES (%s, %s, %s);",(angulo1,angulo2,angulo3))
        conn.commit()
        print("Listo")

        print('El ultimo angulo es: ', angulo3, 'grados')
    else:
        print("Debe ingresar valores validos")
except:
    print("Ingrese valores validos ")