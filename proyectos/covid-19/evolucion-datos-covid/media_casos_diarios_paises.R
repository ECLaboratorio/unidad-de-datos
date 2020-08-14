## cargar librerías e importar datos originales
library(tidyverse)
library(lubridate)
library(zoo)

source("scripts/scripts/importar_datos.R")

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

write.table(datos_paises, "clipboard-20000", sep="\t", row.names=FALSE, col.names=TRUE)


# crear tabla de casos por países con la media diaria de los últimos 14 días
datos_paises_14dias <- datos_largo %>%
    filter(categoria=="casos") %>%
    group_by(pais_esp, fecha_buena) %>%
    summarise(casos=sum(valor)) %>% 
    mutate(casos_diarios=casos-lag(casos),
           casos_diarios_media=round(rollmean(casos_diarios, k=14, fill=NA, align = "right"),0)) %>% 
    filter(fecha_buena>="2020-03-01", !is.na(pais_esp)) %>% 
    select(-c(casos, casos_diarios)) %>% 
    pivot_wider(names_from = "pais_esp", values_from = "casos_diarios_media")

write.table(datos_paises_14dias, "clipboard-20000", sep="\t", row.names=FALSE, col.names=TRUE)


# crear tabla de casos acumulados por países de los últimos 14 días
datos_paises_ia_14dias <- datos_largo %>%
    filter(categoria=="casos") %>%
    group_by(pais_esp, fecha_buena) %>%
    summarise(casos=sum(valor)) %>% 
    mutate(casos_diarios=casos-lag(casos),
           casos_14dias=round(rollsum(casos_diarios, k=14, fill=NA, align = "right"),0)) %>% 
    filter(fecha_buena>="2020-03-01", !is.na(pais_esp)) %>% 
    select(-c(casos, casos_diarios)) %>% 
    pivot_wider(names_from = "pais_esp", values_from = "casos_14dias")

write.table(datos_paises_ia_14dias, "clipboard-20000", sep="\t", row.names=FALSE, col.names=TRUE)



