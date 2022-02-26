import random
import psycopg2

conexion = psycopg2.connect(
    host = 'localhost',
    port = '5432',
    user = 'postgres',
    password = 'admin',
    dbname = 'postgres'
)
cursor = conexion.cursor()

while True:
    try:    
        numero1 = random.randint(1,6)
        numero2 = random.randint(1,6)
        print("numero1: ",numero1)
        print("numero2: ", numero2)
        if numero1 + numero2 == 8 : 
            print("\n GANADOR")
            
            break
        elif numero1 + numero2 == 7:
            print("\n PERDEDOR")
            
        else:
            print("Intentalo de nuevo")
            cursor.execute("insert into problema4(numero1, numero2, resultado) values(%s, %s, %s);",(numero1, numero2, numero1 + numero2))
            conexion.commit()
            cursor.close()
            conexion.close()
                  
    except:
        break 