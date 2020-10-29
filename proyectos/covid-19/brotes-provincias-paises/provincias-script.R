## cargar librerías e importar datos
library(tidyverse)
library(lubridate)
library(zoo)

datos <- read.csv("https://cnecovid.isciii.es/covid19/resources/datos_provincias.csv", na.strings="")
datos$fecha <- ymd(datos$fecha)


## establecer carpeta predefinida
setwd("proyectos/covid-19/brotes-provincias-paises/")


## importar nombre y población de las provincias
provincias <- read.delim("provincias-diccionario.csv", sep = ";", na.strings = "") %>% 
    select(iso, provincia_buena, poblacion)


## unir data frames datos y provincias en uno único
datos_provincias <- left_join(datos, provincias,
                              by = c("provincia_iso"="iso")) %>% 
    select(fecha, iso=provincia_iso, provincia=provincia_buena, poblacion, num_casos:num_casos_prueba_desconocida) %>% 
    arrange(provincia, fecha) 

rm(datos)
rm(provincias)


## simplificar data frame con columnas de fecha, iso, provincia, población y pcr
datos_pcr <- datos_provincias %>% 
    select(fecha, iso, provincia, poblacion, pcr=num_casos_prueba_pcr)

rm(datos_provincias)


## calcular media móvil de 7 días de casos diarios, casos acumulados en 7 días e IA 7 días para el total nacional
datos_pcr_espana <- datos_pcr %>% 
    group_by(fecha) %>% 
    summarise(poblacion=sum(poblacion),
              pcr=sum(pcr)) %>% 
    mutate(idpro="ES",
           provincia="España",
           pcr_media_movil_7dias=round(rollmean(pcr, k=7, fill=NA, align = "right"),1),
           pcr_7dias=rollsum(pcr, k=7, fill=NA, align = "right"),
           ia_7dias=round(pcr_7dias/poblacion*100000, 2)) %>% 
    filter(fecha>="2020-02-24" & fecha <= "2020-10-24") %>% 
    select(fecha, idpro, provincia, pcr_diario=pcr, pcr_media_movil_7dias, ia_7dias) %>% 
    pivot_longer(4:6, names_to="indicador", values_to = "valor") %>% 
    arrange(fecha, idpro)


## calcular media móvil de 7 días de casos diarios, casos acumulados en 7 días e IA 7 días para cada provincia
datos_pcr_provincias <- datos_pcr %>% 
    mutate(pcr_media_movil_7dias=round(rollmean(pcr, k=7, fill=NA, align = "right"),1),
           pcr_7dias=rollsum(pcr, k=7, fill=NA, align = "right"),
           ia_7dias=round(pcr_7dias/poblacion*100000, 2)) %>% 
    filter(fecha>="2020-02-24" & fecha <= "2020-10-24") %>%
    select(fecha, idpro=iso, provincia, pcr_diario=pcr, pcr_media_movil_7dias, ia_7dias) %>% 
    pivot_longer(4:6, names_to="indicador", values_to = "valor")


## unir data frames de España y provincias en uno único y guardar el archivo en formato tsv
datos_pcr_final <- bind_rows(datos_pcr_provincias, datos_pcr_espana) %>% 
    arrange(fecha, idpro) 

write_tsv(datos_pcr_final, "provincias-datos.tsv")