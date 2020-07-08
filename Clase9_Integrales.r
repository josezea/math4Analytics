
estaturas <- c(170, 165, 178, 169, 172, 180, 180, 167, 182, 174, 166, 176, 169, 168, 175)
length(estaturas)

prom <- mean(estaturas)
  desvest <- sd(estaturas)

set.seed(12345)
est_bog <- rnorm(n = 4000000, mean = prom, sd = desvest)
hist(est_bog)
hist(est_bog, probability  = T)
hist(est_bog, probability  = T, breaks = 5000)

# Distribución normal (gaussiana)

dist_est <- function(x){

  (1 / ( 5.560918 * sqrt(2*pi))) * exp(-(1/(2* 5.560918^2)) * (x -  172.7333) ^2 )
}

# Función de densidad
dnorm(x = 190, mean = prom, sd = desvest)
dist_est(190)

integrate(dnorm, mean = prom, sd = desvest, lower = 180, upper = Inf)
# Prob de encontrar alguien de más de 1,80 es de 9,5 % 
# pnorm(180, mean = prom, sd = desvest, lower.tail = F)

integrate(dist_est, lower = -Inf, upper = Inf)

# Probabilidad de encontrar un hombre de menos de 1,60
integrate(dnorm, mean = prom, sd = desvest, lower = -Inf, upper = 160)

# Probabilidad de encontrar alguien de 170 a 180
integrate(dnorm, mean = prom, sd = desvest, lower = -Inf, upper = 180)[[1]] -
  integrate(dnorm, mean = prom, sd = desvest, lower = -Inf, upper = 160)[[1]] 
  


# Ejemplo de juguete con una parabola  
integrate(function(x) x ^2, lower = 1, upper = 5)
125 / 3 - 1/3
# OK

