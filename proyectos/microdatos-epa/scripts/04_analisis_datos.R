# cargar librerías e importar datos ocupados
library(tidyverse)

datos <- read_csv("datos/output/ocupados_con_flujos_trimestres.csv")


# calcular media anual de personas que tienen su trabajo en otra provincia distinta de la que viven sobre el total de ocupados
ocupados_media_anual <- datos %>% 
    group_by(trimestre, ano) %>% 
    summarise(ocupados_trimestre=sum(factorel)) %>% 
    group_by(ano) %>% 
    summarise(ocupados_anual=mean(ocupados_trimestre))

ocupados_otras_prov_media_anual <- datos %>% 
    filter(flujo=="Diferente") %>% 
    group_by(trimestre, ano) %>% 
    summarise(ocupados_trimestre_otras_prov=sum(factorel)) %>% 
    group_by(ano) %>% 
    summarise(ocupados_anual_otras_prov=mean(ocupados_trimestre_otras_prov))

ocupados <- left_join(ocupados_media_anual, ocupados_otras_prov_media_anual,
                      by = "ano") %>% 
    mutate(pct_otras_prov=round(ocupados_anual_otras_prov/ocupados_anual*100,2))


# calcular media anual de ocupados que viven en España pero tienen su puesto de trabajo en otro país
extranjero_total <- datos %>% 
    filter(is.na(provincia_trabajo)) %>% 
    group_by(trimestre, ano) %>% 
    summarise(valor=sum(factorel)) %>% 
    group_by(ano) %>% 
    summarise(media_anual=round(mean(valor),0))

extranjero_provincias_residencia <- datos %>% 
    filter(is.na(provincia_trabajo)) %>% 
    group_by(provincia_vivienda, trimestre, ano) %>% 
    summarise(valor=sum(factorel)) %>% 
    group_by(provincia_vivienda, ano) %>% 
    summarise(media_anual=round(mean(valor),0))


# calcular diferentes entre trabajadores y puestos de trabajo por provincias y año
provincias_viviendas <- datos %>% 
    group_by(trimestre, ano, provincia_vivienda) %>% 
    summarise(ocupados_trimestres=sum(factorel)) %>% 
    group_by(ano, provincia_vivienda) %>% 
    summarise(media_anual_trabajadores=round(mean(ocupados_trimestres),0))

provincias_trabajo <- datos %>% 
    group_by(trimestre, ano, provincia_trabajo) %>% 
    summarise(puestos_trabajo_trimestres=sum(factorel)) %>% 
    group_by(ano, provincia_trabajo) %>% 
    summarise(media_anual_puestos_trabajo=round(mean(puestos_trabajo_trimestres),0))

provincias_conjuntas <- left_join(provincias_viviendas, provincias_trabajo,
                                  by = c("provincia_vivienda"="provincia_trabajo", "ano"))
provincias_conjuntas <- provincias_conjuntas %>% 
    mutate(diferencia_abs=round(media_anual_puestos_trabajo-media_anual_trabajadores,0),
           diferencia_pct=round(((media_anual_puestos_trabajo-media_anual_trabajadores)/media_anual_trabajadores*100),1))