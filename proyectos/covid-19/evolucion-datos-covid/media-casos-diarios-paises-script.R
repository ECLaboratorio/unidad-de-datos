## cargar librerías e importar datos originales
library(tidyverse)
library(lubridate)
library(zoo)

## establecer carpeta predefinida
setwd("proyectos/covid-19/evolucion-datos-covid/")

source("importar_datos.R")


# crear tabla de casos por países con la media diaria de los últimos 7 días
datos_paises <- datos_largo %>%
    filter(categoria=="casos") %>%
    group_by(pais_esp, fecha_buena) %>%
    summarise(casos=sum(valor)) %>% 
    mutate(casos_diarios=casos-lag(casos),
           casos_diarios_media=round(rollmean(casos_diarios, k=7, fill=NA, align = "right"),0)) %>% 
    filter(fecha_buena>="2020-03-01", !is.na(pais_esp)) %>% 
    select(-c(casos, casos_diarios)) %>% 
    pivot_wider(names_from = "pais_esp", values_from = "casos_diarios_media")


write_csv(datos_paises, "media-casos-diarios-paises-datos.csv")