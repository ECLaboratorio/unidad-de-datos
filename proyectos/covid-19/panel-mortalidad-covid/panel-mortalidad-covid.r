## cargar librerías e importar datos originales
library(tidyverse)
library(lubridate)

## Recogemos todos los CSV de Google Drive
datosFallecidosOficial <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=0&single=true&output=csv')
datosCCAA <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=1059673971&single=true&output=csv')
datosExceso <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=1107905386&single=true&output=csv')

## En función de la carpeta que nos encontremos, escribimos el setwd de una forma u otra
## El setwd siempre tiene que atacar a la carpeta 'panel-mortalidad-covid'
setwd('../panel-mortalidad-covid')

## Los mismo datos que hemos recogido (en la actualidad no necesitan ningún proceso de modificación de propiedades), los enviamos a Github
write_csv(datosFallecidosOficial, 'datos-fallecidos-oficial.csv')
write_csv(datosCCAA, 'datos-fallecidos-ccaa.csv')
write_csv(datosExceso, 'datos-exceso-falleciods.csv')