# cargar librerías e importar datos de ocupados con flujos
library(tidyverse)

datos <- read_csv("datos/output/ocupados_con_flujos_trimestres.csv")


# comparar evolución de los ocupados por trimestres con tabla 3.1 de la EPA (https://www.ine.es/jaxiT3/Tabla.htm?t=4076&L=0)
ocupados_nacional_trimestres <- datos %>% 
    group_by(trimestre) %>% 
    summarise(ocupados=sum(factorel))


# comparar evolución de la media anual de ocupados con tabla 3.1 del módulo anual la EPA (https://www.ine.es/jaxiT3/Tabla.htm?t=4745&L=0)
ocupados_nacional_anual <- datos %>% 
    group_by(trimestre, ano) %>% 
    summarise(ocupados_trimestre=sum(factorel)) %>% 
    group_by(ano) %>% 
    summarise(ocupados_anual=mean(ocupados_trimestre))


# comparar ocupados del 4T de 2019 por provincias con tabla 3.1 de los resultados provinciales la EPA (https://www.ine.es/jaxiT3/Tabla.htm?t=3991&L=0)
ocupados_provincia_4T2019 <- datos %>% 
    filter(trimestre=="2019.4") %>% 
    group_by(provincia_vivienda) %>% 
    summarise(ocupados=sum(factorel))

