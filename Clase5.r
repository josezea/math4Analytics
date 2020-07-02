# Funciones en R
function(x) x^2
# f: R -> R
x_cuad <- function(x) x^2
x_cuad(-2)
x_cuad(3)
plot(x_cuad, xlim = c(-3, 3), main = "f(x) = x^2")
# Tabular la función
y <- c(-10, -5, 0, 5, 10)
x_cuad(y)
data.frame(x = y, f_x = x_cuad(y))
# Ejercicio 
# f(x) = 0.1 * exp(-0.1x)
# Crear la función y graficarla
# tabular valores de x = 0 hasta x = 15


# R algunas funciones
x <- c(1, 2, 3) # R^3 -> R  f(x1, x2, x3) = x1 + x2 + x3
sum(x)

length(c(1, 6, 4))

DAM <- function(x){
  n <- length(x)  
  num <- sum(abs(x - mean(x)))
  num / n
  }

DAM(c(2, 5, 11, 18, 22))
DAM(c(5, 5.5, 6, 6.2, 6.3))

# Ejemplo una función de R2 -> R
# f(x, y) = x^2 - y^2

f1 <- function(x, y){
  x^2 - y^2  
}

f1(3, 5)

#library(rgl)
rgl::plot3d(f1, xlim = c(-10,10),
       ylim = c(-10,10), col = 'blue')
# dplyr plyr

# Derivadas de una función 
library(Deriv) 
x_cuad <- function(x) x^2
Deriv(x_cuad)

sin(pi/2)
Deriv(sin)

?optim


