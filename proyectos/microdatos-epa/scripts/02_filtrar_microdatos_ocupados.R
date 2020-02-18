# cargar librerías
library(tidyverse)
library(lubridate)

# importar csv con todos los datos de los 4T 2015-2019
datos <- read_csv("datos/combined/datos_unidos_todos.csv")

glimpse(datos)

# filtrar más datos de ocupados
datos_ocupados <- datos %>% 
  filter(aoi%in%c("03", "04")) %>% 
  select(fecha, prov_vivienda=prov, edad5, nacionalidad=nac1, nivel_estudios=nforma, prov_trabajo=proest, region_trabajo=regest, ocupacion=ocup1, actividad=act1, situacion=situ, actividad2=aoi, condicion_econ=cse, factorel)

rm(datos)


# traer provincias a partir de los códigos
provincias <- readxl::read_xlsx("dictionaries/provincias.xlsx")

datos_ocupados2 <- left_join(datos_ocupados, provincias,
                             by = c("prov_vivienda"="codigo")) %>% 
  select(fecha, provincia_vivienda=provincia, edad5:factorel)

datos_ocupados3 <- left_join(datos_ocupados2, provincias,
                             by = c("prov_trabajo"="codigo")) %>% 
  select(fecha:nivel_estudios, provincia_trabajo=provincia, region_trabajo:factorel)


# crear nueva columna en función del flujo entre provincia de vivienda y la provincia del trabajo
datos_ocupados4 <- datos_ocupados3 %>% 
  mutate(flujo=case_when(
    provincia_vivienda!=provincia_trabajo ~ "Diferente",
    provincia_vivienda==provincia_trabajo ~ "Coincide"
  ))


# crear dos columnas, una de trimestre y otra de año, a partir de la fecha
datos_ocupados5 <- datos_ocupados4 %>% 
    mutate(trimestre=quarter(fecha, with_year = TRUE),
           ano=year(fecha)) %>% 
    select(fecha, trimestre, ano, provincia_vivienda:flujo)


write_csv(datos_ocupados5, "datos/output/ocupados_con_flujos_trimestres.csv")
