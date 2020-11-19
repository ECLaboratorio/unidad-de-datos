## cargar librerías e importar datos originales
library(tidyverse)
library(lubridate)

## Recogemos todos los CSV de Google Drive
datosContagiosHistograma <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQVo0EJNeZWoF4XruYd0BnoHyWxgInurmI3iAWJRZplmYF7_YzGvesj1onZdfY3dbHI6-FRHkuQYXon/pub?gid=618971894&single=true&output=csv')
datosMuertesHistograma <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQVo0EJNeZWoF4XruYd0BnoHyWxgInurmI3iAWJRZplmYF7_YzGvesj1onZdfY3dbHI6-FRHkuQYXon/pub?gid=939250240&single=true&output=csv', encoding = 'UTF-8')
datosMapa <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQVo0EJNeZWoF4XruYd0BnoHyWxgInurmI3iAWJRZplmYF7_YzGvesj1onZdfY3dbHI6-FRHkuQYXon/pub?gid=905422202&single=true&output=csv', encoding = 'UTF-8')
datosUltimos7dias <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQVo0EJNeZWoF4XruYd0BnoHyWxgInurmI3iAWJRZplmYF7_YzGvesj1onZdfY3dbHI6-FRHkuQYXon/pub?gid=302214376&single=true&output=csv', encoding = 'UTF-8')

## En función de la carpeta que nos encontremos, escribimos el setwd de una forma u otra
## El setwd siempre tiene que atacar a la carpeta 'widget-portada-bloque-covid'
setwd('./proyectos/covid-19/widget-portada-bloque-covid')

## Los mismo datos que hemos recogido (en la actualidad no necesitan ningún proceso de modificación de propiedades), los enviamos a Github
write_csv(datosContagiosHistograma, 'datos-contagios-histograma.csv')
write_csv(datosMuertesHistograma, 'datos-muertes-histograma.csv')
write_csv(datosMapa, 'datos-mapa.csv')
write_csv(datosUltimos7dias, 'datos-inferiores-ultimos-7-dias.csv')