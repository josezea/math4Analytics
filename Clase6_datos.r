setwd("~/Laboral2020/Konrad Lorenz/Nivelatorio") # Cambiar carpeta (configurar dir de trabajo)

# pokemon_data <- read.csv("~/Laboral2020/Konrad Lorenz/Nivelatorio/pokemon_data.csv", comment.char="#")

pokemon_data <- read.csv("pokemon_data.csv")
names(pokemon_data)

names(pokemon_data) <- c("ID", "Nombre", "Tipo1", "Tpo2", "HP", "Ataque",
                         "Defensa", "Velocidad_ataque", "Velocidad_defensa",
                         "Velocidad", "Generacion", "Legendario")
 
# Cuantos tipos hay y cuales
unique(pokemon_data$Tipo1)
table(pokemon_data$Tipo1) # Cuantos pokemones por tipo hay
barplot(table(pokemon_data$Tipo1), col = "red")

# Calcular el promedio del ataque por cada tipo de pokemon
mean(pokemon_data$Ataque)
tapply(pokemon_data$Ataque, pokemon_data$Tipo1, FUN = mean)
sort(tapply(pokemon_data$Ataque, pokemon_data$Tipo1, FUN = mean))

# ¿Cuáles son los pokemones más debiles de cada clase?
min(pokemon_data$Ataque)
which(pokemon_data$Ataque == min(pokemon_data$Ataque))
pokemon_data[which(pokemon_data$Ataque == min(pokemon_data$Ataque)),]
tapply(pokemon_data$Ataque, pokemon_data$Tipo1, FUN = min)
aggregate(pokemon_data$Ataque, list(pokemon_data$Tipo1), FUN = min)
aggregate(pokemon_data$Ataque, list(pokemon_data$Tipo1, pokemon_data$Tpo2),
          FUN = min)

# Filtros (condiciones lógicos), Agregaciones, Pegar, 

table(pokemon_data$Tipo1)

pokemon_elec <- subset(pokemon_data, Tipo1 == "Electric")

pokemon_elec <- pokemon_data[pokemon_data$Tipo1 == "Electric", 1:3] # Columno a la 3
pokemon_elec <- subset(pokemon_data, Tipo1 == "Electric", 
                       select = c(ID, Nombre, Tipo1)) # Columno a la 3

pokemon_elecB <- subset(pokemon_data, Tipo1 == "Electric", 
                       select = 1:3) # Columno a la 3

pokemon_elecC <- subset(pokemon_data, Tipo1 == "Electric", 
                        select = c(T,T,T, rep(F, 9))) # Columno a la 3


# Parentesis
pokemon_elec[1:4,] # Los custro primeas filas
pokemon_elec[1:4, c(1, 3)]
pokemon_elec[c(c(T,T,T,T), rep(F, 40)), c(T, F, T)]

a <- c(2, 4, 5)
a[c(1, 3)]
a[c(TRUE, FALSE, TRUE)]


datos <- data.frame(estaturas = rnorm(2000000, mean = 160, sd = 10),
                    sexo = rep("M", 2000000))
dim(datos)
class(datos)
datos <- as.data.table(datos)
class(datos)
a <- datos[estaturas > 180,,,]


