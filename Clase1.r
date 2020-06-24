# Ejecutar como calculadora
2 + 2
4 * (5 + 3)
log10(100)
exp(1)
pi
sin(pi/2) # Seno
cos(pi)
sqrt(25) # Raiz cuadrada
4 ^ 3
4 ** 3
factorial(4) # 4! = 1 * 2 * 3 * 4
log(2*pi) + exp(3*20)
20 ^ (1/4) # Raiz cuarta
4000000 * 0.4 # Salario base
4000000 * 0.4 * 0.16 # pensión
4000000 * 0.4 * 0.125 # salud
# Vectores unidimensionales (escalares)
a = 2
b = 5
b <- 5
salud = 4000000 * 0.4 * 0.16 # pension
# salud2 = salud
# salud2 = 4
c = a + b 

# Vectores
a <- c(1, 2, 3)
ID <- 1:21
# muestra de tamaño 5
sample(ID, 5) # 5 19 11 17  4
# Vector edad de la muestra seleccionada
edad <-  c(27, 30, 32, 27, 28)
length(edad)
class(edad)
edad[3]
edad[c(1, 5)]
# Suma
sum(edad)
# Promedio
mean(edad)

# Ejercicio: restarle a cada persona la edad promedio
edad - mean(edad)

# Ejercicio: calcular la distancia de cada dato al promedio
abs(edad - mean(edad))

# Error de pronostico
# Ejercicio: promedio de las distancias de cada dato al promedio
mean(abs(edad - mean(edad))) # Mean Absolute Error: promedio del error absoluto


