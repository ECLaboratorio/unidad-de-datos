## cargar librerías
library(tidyverse)
library(lubridate)
library(zoo)


## establecer carpeta predefinida
setwd("../brotes-provincias-paises/")

## importar datos de Out World in Data, modificar nombre continente y calcular
## media móvil de 7 días de casos diarios, casos acumulados en 7 días e IA 7 días para cada país
datos <- read_csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv") %>%
    select(fecha=date, iso=iso_code, pais_eng=location, continent, poblacion=population, casos_totales=total_cases, casos_diarios=new_cases) %>% 
    mutate(continente=case_when(
        continent=="Africa" ~ "África",
        continent=="Asia" ~ "Asia",
        continent=="Europe" ~ "Europa",
        continent=="North America" ~ "América",
        continent=="Oceania" ~ "Oceanía",
        continent=="South America" ~ "América",
        pais_eng=="World" ~ "Mundo"
    )) %>% 
    select(fecha, iso, continente, poblacion, casos_totales, casos_diarios) %>% 
    mutate(casos_media_movil_7dias=round(rollmean(casos_diarios, k=7, fill=NA, align = "right"),1),
           casos_7dias=rollsum(casos_diarios, k=7, fill=NA, align = "right"),
           ia_7dias=round(casos_7dias/poblacion*100000,2)) %>% 
    filter(poblacion>1000000, casos_totales>=10) %>% ## filtrar países de más de 1 millón de hab y con más de 10 casos acmulados
    select(-c(poblacion, casos_7dias, casos_totales))


## traer nombre de los países en castellano
paises <- read_delim("paises-diccionario.csv", delim = ";", locale = locale(encoding = "ISO-8859-1")) %>% 
    select(iso=iso3, pais_esp)


## unir data frames y filtrar primeras 7 fechas de cada país
paises_final <- left_join(datos, paises,
                         by = "iso") %>% 
    select(fecha, pais=pais_esp, continente:ia_7dias) %>% 
    group_by(pais) %>%  ## filtar las primeras 7 fechas de cada país para eliminar 
    filter(fecha>=min(fecha)+7) %>%  ## datos procedentes de otros países por la media móvil
    pivot_longer(4:6, names_to = "indicador", values_to = "valor") %>%
    filter(fecha>="2020-09-01") %>% 
    filter(indicador!="casos_diarios") %>%
    filter(!is.na(valor), continente!="Mundo") %>%
    arrange(fecha)


## guardar archivo en formato tsv
write_tsv(paises_final, "paises-datos.tsv")
