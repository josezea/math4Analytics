#library(viejo)
library(dplyr)
?dplyr::bind_rows

sessionInfo() # Sirve para ver la versión de R y pquetes cargados

setwd("~/Laboral2020/Konrad Lorenz/Nivelatorio") # Cambiar carpeta (configurar dir de trabajo)

# pokemon_data <- read.csv("~/Laboral2020/Konrad Lorenz/Nivelatorio/pokemon_data.csv", comment.char="#")

pokemon_data <- read.csv("pokemon_data.csv")
names(pokemon_data)

names(pokemon_data) <- c("ID", "Nombre", "Tipo1", "Tpo2", "HP", "Ataque",
                         "Defensa", "Velocidad_ataque", "Velocidad_defensa",
                         "Velocidad", "Generacion", "Legendario")
# Ejercicio 1
# Seleccionar los antiguos pokemones y aparte los nuevos
class(pokemon_data$Generacion)
datosG1 <- subset(pokemon_data, Generacion == 1) 
datosResto <- subset(pokemon_data, Generacion != 1) 
# datosResto <- subset(pokemon_data, Generacion %in% 2:6)


# Pegado por debajo (bind / append)
datos_completo <- rbind(datosG1, datosResto) # Append


# Ejercicio 2: las dos tablas no tienen las mismas columnas
datosG1 <- subset(pokemon_data, Generacion == 1, select = -Legendario) 
datosResto <- subset(pokemon_data, Generacion != 1, select = -c(HP, Ataque)) 
datosResto$Generacion <- as.character(datosResto$Generacion) 
#datos_completo <- rbind(datosG1, datosResto) # Append
# Sale un error en la anterior líneal
# Usar una función bind_rows (paquete dplyr)  smart_bind(gtools)
NA
c(1, 4, NA)
4 + NA
mean(c(1, 4, NA, 10))
mean(c(1, 4, NA, 10), na.rm = T)

#datos_completo <- bind_rows(datosG1, datosResto) # Append
# Sale error por que Generacion es entero en la primera tabla
# es caracter en la segunda tabla
str(datosG1)
str(datosResto)
datosResto$Generacion <- as.integer(datosResto$Generacion)
datos_completo <- dplyr::bind_rows(datosG1, datosResto) # Append
str(datos_completo)

########3 Pegados de bases de datos ###########################

# Inner Join
# Left join
# Right Join 
# Outer (Full) Join

#X <- read.delim("clipboard")
#dput(X)
X <- data.frame(ID = 1:4, X = c(40L, 20L, 30L, 50L), 
         Y = c("A", "B", "C", "D"), Z = c(1L, 0L, 0L, 1L))
#Y <- read.delim("clipboard")
#dput(Y)
Y <- data.frame(ID = c(2L, 5L, 4L, 6L, 7L), W = c(5L, 9L, 3L, 
           1L, 5L), A = c(10L, 1L, 2L, 2L, 3L))
# dplyr
datos_izq <- left_join(X, Y, by = "ID")
datos_der <- right_join(X, Y, by = "ID")
datos_inner <- inner_join(X, Y, by = "ID")
datos_outer <- full_join(X, Y, by = "ID")
# Varias llaves: by = c("var1", "var2") dentro del join

library(sqldf)
# sqldf("select from group by ")

# Newthon Rhopson (APlicaciones derivadas): Próxima clase
# Integrales
# Optimización 