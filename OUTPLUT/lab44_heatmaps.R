#INSTALAR PROGRAMAS
install.packages("viridis")
library(viridis)

#CARACTERISTICAS DE LOS AUTOS
#GENERAR DATOS PARA TRABAJAR

?mtcars
mtcars
class(mtcars)

mtcars_matrix <- data.matrix(mtcars)
head(mtcars)

#VISUALIZAR 

heatmap(mtcars_matrix)


#DESCRIPCION Y DATOS DE HEATMAPS
#?Se parece a lo que esperabas?
# Mire la p?gina de ayuda de la funci?n y lea la descripci?n del scale argumento en particular

?heatmap

#ESCALADO DE LAS COLUMNAS Y NO EN LOS RENGLONES
#La escala es importante: los valores deben centrarse y escalarse en filas o columnas. 
#En nuestro caso, queremos visualizar altibajos en cada variable, que est?n en columnas.
heatmap(mtcars_matrix, scale = "column")


#CREAR NUESTRA PALETA DE COLORES
colores_blue <- colorRampPalette(c("lightblue","cornflowerblue", "navyblue")) (256)


# con AMBOS denogramas por default, se ordenan las variables por cluster de pertenencia
heatmap(mtcars_matrix, 
        scale = "column", 
        col= colores_blue)

#Eliminar dendrogramas horizontal de las caracteristicas de los coches
#Nos interesan los tipos de coches por que no tenemos datos normalizados

heatmap(mtcars_matrix, 
        scale = "column", 
        col= colores_blue,
        colv= NA,
        margins = c(5,10),
        xlab = "ESPECIFICACIÓN DE CARACTERÍSTICAS",
        ylab = "MODELOS DE AUTOS",
        main= "MAPA DE CALOR")

#paletas por defecto
# rainbow, heat.colors, terrain.colors, topo.colors, cm.colors

library(viridis)
viridis_pal()
heatmap(mtcars_matrix, 
        scale = "column", 
        col= viridis_pal(option = "viridis") (6),
        colv= NA,
        margins = c(5,10),
        xlab = "ESPECIFICACIÓN DE CARACTERÍSTICAS",
        ylab = "MODELOS DE AUTOS",
        main= "MAPA DE CALOR")

#COLOR RAINBOW
heatmap(mtcars_matrix, 
        scale = "column", 
        col= rainbow (6),
        colv= NA,
        margins = c(5,10),
        xlab = "ESPECIFICACIÓN DE CARACTERÍSTICAS",
        ylab = "MODELOS DE AUTOS",
        main= "MAPA DE CALOR")
#CONTINUAR LA PRACTICA ESTANDARIZANDO DATOS

datos <- mtcars

# Para que las variables sean comparables bajo un mismo esquema de colores se
# estandarizan.
# ESTANDARIZACION DATOS COLORES UNO
datos <- scale(datos)

heatmap(x = datos, scale = "none",
        distfun = function(x){dist(x, method = "euclidean")},
        hclustfun = function(x){hclust(x, method = "average")},
        cexRow = 0.7)

colores1 <- colorRampPalette(c("red", "white", "blue"))(256)

#ESTANDARIZACION DE DATOS COLOR 2

heatmap(x = datos, scale = "none", col = colores_blue, cexRow = 0.7)

colores_blue <- colorRampPalette(c("lightblue", "cornflowerblue", "navyblue"))(256)


# Paleta de color viridis
library(viridis)
colores2 <- viridis(256)
heatmap(x = datos, scale = "none", col = colores2,
        distfun = function(x){dist(x, method = "euclidean")},
        hclustfun = function(x){hclust(x, method = "average")},
        cexRow = 0.7)

#Es posible a?adir informaci?n adicional (annotate) en las filas o columnas con los argumentos RowSideColors y ColSideColors. Por ejemplo, sup?ngase que los primeros 16 coches proceden de China y los 16 ?ltimos de Am?rica.
# Se codifica con color naranja a los coches procedentes de China y con morado a
# los de Am?rica
colores2 <- viridis(256)
heatmap(x = datos, scale = "none", col = colores2,
        distfun = function(x){dist(x, method = "euclidean")},
        hclustfun = function(x){hclust(x, method = "average")},
        RowSideColors = rep(c("orange", "purple"), each = 16))
