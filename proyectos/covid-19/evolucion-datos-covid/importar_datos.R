## cargar librerías e importar datos originales
library(tidyverse)
library(lubridate)


infectados <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
muertes <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
recuperados <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")


## reordenar data frames haciéndolos más largos y convertir columna fecha a formato fecha (actual, hasta 27/09/2020)
infectados_long <- infectados %>% 
    pivot_longer(names_to = "fecha", values_to = "casos", cols = 5:254) %>% # añadir cada día una columna nueva
    mutate(fecha_buena=mdy(fecha), # convertir columna fecha a formato fecha
           region=case_when(
               `Country/Region`=="China" ~ "China",
               `Country/Region`!="China" ~"Resto Mundo")) %>%  # crear columna para China y resto mundo
    select(provincia=`Province/State`, pais=`Country/Region`, region, lat=Lat, long=Long, fecha, fecha_buena, casos)

muertes_long <- muertes %>% 
    pivot_longer(names_to = "fecha", values_to = "muertes", cols = 5:254) %>% 
    mutate(fecha_buena=mdy(fecha), # convertir columna fecha a formato fecha
           region=case_when(
               `Country/Region`=="China" ~ "China",
               `Country/Region`!="China" ~"Resto Mundo")) %>%  # crear columna para China y resto mundo
    select(provincia=`Province/State`, pais=`Country/Region`, region, lat=Lat, long=Long, fecha, fecha_buena, muertes)

recuperados_long <- recuperados %>% 
    pivot_longer(names_to = "fecha", values_to = "recuperados", cols = 5:254) %>% 
    mutate(fecha_buena=mdy(fecha), # convertir columna fecha a formato fecha
           region=case_when(
               `Country/Region`=="China" ~ "China",
               `Country/Region`!="" ~"Resto Mundo")) %>%  # crear columna para China y resto mundo
    select(provincia=`Province/State`, pais=`Country/Region`, region, lat=Lat, long=Long, fecha, fecha_buena, recuperados)


## unir tres data frames en uno único
datos <- left_join(infectados_long, muertes_long,
                   by = c("provincia", "pais", "region", "lat", "long", "fecha", "fecha_buena"))

datos2 <- left_join (datos, recuperados_long,
                     by = c("provincia", "pais", "region", "lat", "long", "fecha", "fecha_buena"))

datos_reordenados <- datos2 %>% 
    pivot_longer(names_to = "categoria", values_to = "valor", cols = 8:10)


# traer columnas de países en español y latitudes de países
paises <- read_delim("paises.csv", delim = ";", locale = locale(encoding = "ISO-8859-1"))

datos_ancho <- left_join(datos2, paises,
                      by = "pais") %>% 
    select(fecha, fecha_buena, provincia, pais, pais_esp, lat_pais, long_pais, region:recuperados)

datos_largo <- left_join(datos_reordenados, paises,
                                by = "pais") %>% 
    select(fecha, fecha_buena,provincia, pais, pais_esp, lat_pais, long_pais, region:valor)

rm(datos)
rm(datos2)
rm(datos_reordenados)
rm(infectados)
rm(infectados_long)
rm(muertes)
rm(muertes_long)
rm(paises)
rm(recuperados)
rm(recuperados_long)