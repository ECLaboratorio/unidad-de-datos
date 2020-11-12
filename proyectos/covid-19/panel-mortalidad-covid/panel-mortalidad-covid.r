## cargar librerías e importar datos originales
library(tidyverse)
library(lubridate)

## Recogemos todos los CSV de Google Drive
fallecidosOficial <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=158402147&single=true&output=csv', encoding = 'UTF-8')
fallecidosMinisterioyCCAA <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=1059673971&single=true&output=csv', encoding = 'UTF-8')
excesoEspanaFallecidos <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=1107905386&single=true&output=csv', encoding = 'UTF-8')
#excesoEuropaFallecidos <- read.csv()
fallecidosEdad <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=1214378008&single=true&output=csv', encoding = 'UTF-8')
#fallecidosSexo <- read.csv()

## En función de la carpeta que nos encontremos, escribimos el setwd de una forma u otra
## Descomentar la siguiente línea si estás en la carpeta 'unidad-de-datos'
setwd('./proyectos/covid-19/panel-mortalidad-covid')
## Descomentar la siguiente línea si estás en alguna de las siguientes carpetas: 'brotes-provincias-paises', 'evolucion-datos-covid' o 'widget-portada-bloque-covid'
#setwd('../panel-mortalidad-covid')

## Los mismo datos que hemos recogido (en la actualidad no necesitan ningún proceso de modificación de propiedades), los enviamos a Github
write_csv(fallecidosOficial, 'fallecidos-oficial-covid.csv')
write_csv(fallecidosMinisterioyCCAA, 'fallecidos-ccaa-vs-ministerio-covid.csv')
write_csv(excesoEspanaFallecidos, 'fallecidos-exceso-espana-covid.csv')
#write_csv(excesoEuropaFallecidos, 'exceso-europa-fallecidos-covid.csv')
write_csv(fallecidosEdad, 'fallecidos-edad-covid.csv')
#write_csv(fallecidosSexo, 'fallecidos-sexo-covid.csv')