# install.packages("readxl)
library(readxl)

# Lectura de un conjunto de datos
# setwd: set working directory
setwd("C:/Users/Home/Documents/Laboral2020/Konrad Lorenz/Nivelatorio")
dir()
datos <- read_excel("Estaturas.xlsx", sheet = "Hoja2")
names(datos)
plot(datos$Estatura, datos$Peso)
# Peso es modelado (explicado) por estatura
# lm (y ~ x) # y: variable dependiente, x: variable independiente
modelo <- lm(datos$Peso ~ datos$Estatura)
abline(modelo)
modelo

# Patentesis cuadrados
a <-  c(1, 5, 100, 40, 3)
a[3]
a[c(2, 4)]
datos[2, 3]
datos[2, ]
datos[,3]

X <- as.matrix(datos[,-1]) # Quiteme la primera columna
X[,1] <- 1 
colnames(X) <- NULL

X <- model.matrix(modelo)
colnames(X) <- NULL

y <- as.matrix(datos$Peso)
beta <- as.matrix(modelo$coefficients)
e <-  as.matrix(modelo$residuals)

ygorro <- X %*% beta 
# ygorro <- as.matrix(modelo$fitted)

ygorro + e # Replicamos el y verdadero !!

# Valor real - valor pronosticado (ygorro)
e <- y - X %*% beta 
e
modelo$residuals
