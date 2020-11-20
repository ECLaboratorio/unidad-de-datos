## cargar librerías e importar datos originales
library(tidyverse)
library(lubridate)  

p <- read.csv2('https://docs.google.com/spreadsheets/d/e/2PACX-1vRBk31yoOSm9W7u0zlSAVSZqDCKuapf2vLgrHe93a8xpmq2s8CTQId7n6q5g2Td5BmVAmjwwCos4o43/pub?gid=0&single=true&output=csv', encoding = 'UTF-8')
p2 <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vRBk31yoOSm9W7u0zlSAVSZqDCKuapf2vLgrHe93a8xpmq2s8CTQId7n6q5g2Td5BmVAmjwwCos4o43/pub?gid=903416503&single=true&output=csv', encoding = 'UTF-8')

## Recogemos todos los CSV de Google Drive
#1.1
fallecidosOficialUltimaSemana <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=2015297896&single=true&output=csv', encoding = 'UTF-8')
fallecidosSinTitania <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vSJN0NeJrI_7ZKlXr6ezLY-n2m27uLfjRR2yOELtko3pAfP3c8e5Obc-eZGA1pn7jUJKwCYWR3jLyOI/pub?gid=2015297896&single=true&output=csv')
#1.2
fallecidosRetrasosCCAA <- read.csv2('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=158402147&single=true&output=csv', encoding = 'UTF-8')
#1.3
fallecidosOficialCCAA <- read.csv2('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=2142056583&single=true&output=csv', encoding = 'UTF-8')
#1.4
fallecidosComparativaCCAA <- read.csv2('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=1059673971&single=true&output=csv', encoding = 'UTF-8')
#2.1
fallecidosExcesoNacional <- read.csv2('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=1107905386&single=true&output=csv', encoding = 'UTF-8')
#2.2
fallecidosExcesoCCAA <- read.csv2('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=968035202&single=true&output=csv', encoding = 'UTF-8')
#2.3
fallecidosExcesoAnios <- read.csv2('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=65140418&single=true&output=csv', encoding = 'UTF-8')
#2.4
fallecidosExcesoOtrosPaises <- read.csv2('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=5204283&single=true&output=csv', encoding = 'UTF-8')
#3.1
fallecidosEdad <- read.csv2('https://docs.google.com/spreadsheets/d/e/2PACX-1vQAbGmq1q9TYkM6Pi4ftN595EBTKLhk6oSR_lA3l_indS_zfYyV7TeFuNv2sGSHX0aIWAx9cE0INzQC/pub?gid=1214378008&single=true&output=csv', encoding = 'UTF-8')

####################
####################

## En función de la carpeta que nos encontremos, escribimos el setwd de una forma u otra
## Descomentar la siguiente línea si estás en la carpeta 'unidad-de-datos'
setwd('./proyectos/covid-19/panel-mortalidad-covid')
## Descomentar la siguiente línea si estás en alguna de las siguientes carpetas: 'brotes-provincias-paises', 'evolucion-datos-covid' o 'widget-portada-bloque-covid'
#setwd('../panel-mortalidad-covid')

####################
####################

## Los mismo datos que hemos recogido (en la actualidad no necesitan ningún proceso de modificación de propiedades), los enviamos a Github
write.csv(fallecidosOficialUltimaSemana, 'fallecidos-oficial-ultima-semana.csv')
write.csv(fallecidosRetrasosCCAA, 'fallecidos-retrasos-ccaa.csv')
write.csv(fallecidosOficialCCAA, 'fallecidos-oficial-ccaa.csv')
write.csv(fallecidosComparativaCCAA, 'fallecidos-comparativa-ccaa.csv')
write.csv(fallecidosExcesoNacional, 'fallecidos-exceso-nacional.csv')
write.csv(fallecidosExcesoCCAA, 'fallecidos-exceso-ccaa.csv')
write.csv(fallecidosExcesoAnios, 'fallecidos-exceso-anios.csv')
write.csv(fallecidosExcesoOtrosPaises, 'fallecidos-exceso-otros-paises.csv')
write.csv(fallecidosEdad, 'fallecidos-edad.csv')