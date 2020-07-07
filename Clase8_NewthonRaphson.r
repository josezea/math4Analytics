
f1 <- function(x) 3*x^3  -2*x^2 + 5*x -8
plot(f1, xlim = c(-100, 100))
# 9 X^2 - 4*x + 5

D_f1 <- function(x) 9 * (x^2) - 4*x + 5
plot(D_f1, xlim = c(-100, 100))

# Ejemplo 3
f3 <- function(x) (4*(x^4)) - 100 
plot(f3, xlim = c(-10, 10), ylim = c(-100, 100))
D_f3 <- function(x) 16 * (x^3)
plot(D_f3, xlim = c(-1, 1))

#  1.842016
# f(x) = 4 x ^4  - 100 * x

func <- function(x) 4 * (x^4) - 100 * x
Dfunc <- function(x) 16 * (x ^3) - 100

# Inicializar x = 0


newtonRamphson <- function(funx, dfunx, tolerancia = 10^-16, valor_inicial = 0){
  y_prev <- valor_inicial
  i <-  0
  y <- y_prev - ( funx(y_prev) /  dfunx(y_prev))
  while(abs(y_prev - y) > tolerancia){
    y_prev <- y
    y <- y_prev- ( funx(y_prev) /  dfunx(y_prev))
    i = i + 1
    print(i)
  }
  return(y)
}

func <- function(x) 4 * (x^4) - 100 * x # Econtrar puntos criticos
Dfunc <- function(x) 16 * (x ^3) - 100 # Encontrar 0's
Dfunc2 <- function(x) 48 * (x ^2) 
sol <- newtonRamphson(Dfunc,Dfunc2, 10^-16, -100 )
sol
(100 / 16)^(1/3) # OK

func <- function(x) (x^2) - 4 * x - 7 # Puntos críticos
Dfunc <- function(x) 2  * x - 4 # Encontrar los ceros de esta función
Dfunc2 <- function(x) 2 

sol2 <- newtonRamphson(Dfunc,Dfunc2, 10^-16, 40)
sol2























# Prototipo

# y_prev <- 5
# # Paso 1
# y <- y_prev - ( func(y_prev) /  Dfunc(y_prev))
# y_prev <- y
# # Paso 2
# y <- y_prev - ( func(y_prev) /  Dfunc(y_prev))
# y_prev <- y
# # Paso 2
# y <- y_prev - ( func(y_prev) /  Dfunc(y_prev))
# y_prev <- y
# 
# X11()
# plot(func, xlim = c(-10, 10))
# 
# y_prev <- 4
# i <-  0
# y <- y_prev- ( func(y_prev) /  Dfunc(y_prev))
# while(abs(y_prev - y) > 10^-16){
# y_prev <- y
# y <- y_prev- ( func(y_prev) /  Dfunc(y_prev))
# i = i + 1
# print(i)
# }
