
# Ejercicio

A <- matrix(c(3, 0, 2, 1, 4, 1), nrow = 3, ncol = 2)
class(A)

B <- matrix(c(1, -2, 7, 5, 1, 4), nrow = 2, ncol = 3) 

# A'
t(A)
# A_nXp  t(A) pXn  X A nXn = H pXp
t(A) %*% A
A %*% t(A)

# Calcular: C = A X B    D = B X A

C <- A %*% B
D <- B %*% A

# Parentesis el rol de la matriz identidad
W <- matrix(1:9, ncol = 3, byrow = TRUE)
W %*% diag(3)
diag(3) %*% W  

# Calcular C a la menos uno
# Las únicas matrices sobre las cuales hace sentido calcular una inversa
# son las matrices cuadradas
det(D) 
solve(D)
D %*% solve(D)
solve(D) %*% D
dim(D)

dim(C)
det(C)
solve(C)
# No existe una matriz que al multiplicarla por C me de la identidad

# Un ejemplo de una matriz sin inversa 

det(matrix(c(2, 5, 6, 15), ncol = 2))
# solve(matrix(c(2, 5, 6, 15), ncol = 2))

# otra matriz que no tiene inversa    
# 2*c(1,5,7) + 4 * c(2,1,3)
det(matrix(c(1,5,7, 2,1,3,10,14,26), ncol = 3))


# Resolver Ax = b
A <- matrix(c(3, 5, 2, 17), ncol = 2)
b <- matrix(c(5, 3), ncol = 1)

solve(A) %*% b
# 1.9268293 * 3 + 2 * -0.3902439
# 1.9268293 * 5 + 17 * -0.3902439

# datos <- read.delim("clipboard", dec = ",")
# dput(datos)
datos <- data.frame(ID = paste0("Persona", 1:6), 
      X = c(1.78, 1.82, 1.6, 1.68, 1.8, 1.68), 
      Y = c(82L, 76L, 50L, 63L, 74L, 60L))
X <- matrix(c(rep(1, 6), datos$X), ncol = 2)
y <- matrix(datos$Y)
beta <- solve(t(X) %*% X) %*% t(X) %*% y
beta
modelo <- lm(y ~ X, data = datos)
modelo
summary(modelo)
plot(datos$X, datos$Y, xlab = "Estatura(mts)", ylab = "Peso(kg)")
abline(modelo, col = "red")

# ID7 Estatura: 1.74
# ID8: Estatura: 1.65

predict(modelo, data.frame(X = c(1.74, 1.65)))

X_pred <- matrix(c(1,1,1.74, 1.65), ncol = 2)
X_pred %*% beta


datos$Sexo <- c("M", "M", "F", "F", "M", "F")
datos$Masculino <- ifelse(datos$Sexo == "M", 1, 0)
#dummy
modelo2 <- lm(y ~ X + Masculino, data = datos)
summary(modelo2)

model.matrix(modelo2)



modelo2 <- lm(y ~ X + factor(Sexo), data = datos)
summary(modelo2)
