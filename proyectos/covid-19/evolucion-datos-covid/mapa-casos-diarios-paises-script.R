## establecer carpeta predefinida
setwd("proyectos/covid-19/evolucion-datos-covid/")

source("importar_datos.R")

variacion_diaria <- datos_ancho %>%  
    group_by(pais, fecha=fecha_buena, pais_esp, lat=lat_pais, long=long_pais) %>% 
    summarise(casos_total=sum(casos)) %>% 
    mutate(var_casos=casos_total-dplyr::lag(casos_total))

variacion_diaria_final <- variacion_diaria %>% 
    mutate(casos_anterior=dplyrlag(pais))



## cargar librerías e importar datos originales
library(tidyverse)
library(lubridate)

# cambiar fechas de los dos archivos

datos_anterior <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/08-04-2020.csv")
datos_ultimo <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/08-05-2020.csv")

datos_anterior <- datos_anterior %>% 
    mutate(fecha_buena="2020-08-04") %>% # cambiar fecha
    select(Country_Region, Confirmed, Deaths, Recovered, fecha_buena)

datos_ultimo <- datos_ultimo %>% 
    mutate(fecha_buena="2020-08-05") %>% # cambiar fecha
    select(Country_Region, Confirmed, Deaths, Recovered, fecha_buena)


datos <- rbind(datos_anterior, datos_ultimo) %>% 
    group_by(`Country_Region`, fecha_buena) %>% 
    summarise(casos=sum(Confirmed),
              muertes=sum(Deaths),
              recuperados=sum(Recovered)) %>% 
    select(fecha_buena, pais=`Country_Region`, casos) %>% 
    arrange(pais, fecha_buena)


# traer columnas de países en español y latitudes de países
paises <- read_delim("dictionaries/paises.csv", delim = ";", locale = locale(encoding = "ISO-8859-1"))

variacion_diaria_ultima <- left_join(datos, paises,
                                     by = "pais") %>% 
    select(pais, fecha_buena, pais_esp, lat_pais, long_pais, casos) %>% 
    mutate(casos_dia_anterior=lag(casos),
           var_casos=casos-casos_dia_anterior) %>% 
    select(-c(casos_dia_anterior, casos)) %>% 
    filter(var_casos>0) %>%
    filter(!is.na(var_casos)) %>%
    arrange(pais_esp, fecha_buena) %>% 
    filter(fecha_buena=="2020-08-05") # filtrar fecha por la más reciente

write.table(variacion_diaria_ultima, "clipboard-20000", sep="\t", row.names=FALSE, col.names=TRUE)




## datos gráfico top 10 países con más casos diarios
variacion_diaria_grafico <- left_join(datos, paises,
                                     by = "pais") %>% 
    select(pais, fecha_buena, pais_esp, lat_pais, long_pais, casos) %>% 
    mutate(casos_dia_anterior=lag(casos),
           var_casos=casos-casos_dia_anterior) %>% 
    select(-c(casos_dia_anterior, casos)) %>% 
    filter(var_casos>0) %>%
    filter(!is.na(var_casos)) %>%
    arrange(-var_casos) %>% 
    filter(fecha_buena=="2020-06-22") # filtrar fecha por la más reciente

write.table(variacion_diaria_grafico, "clipboard-20000", sep="\t", row.names=FALSE, col.names=TRUE)


## datos evolución casos diarios países
library(tidyverse)
library(lubridate)

source("scripts/scripts/00_cargar_datos.R")

datos2 <- datos_ancho %>%  
    group_by(pais, pais_esp, fecha_buena) %>% 
    summarise(casos=sum(casos)) %>% 
    filter(casos>0 | recuperados>0) %>% 
    mutate(casos_dia_anterior=lag(casos),
           recuperados_dia_anterior=lag(recuperados),
           var_casos=casos-casos_dia_anterior,
           var_recuperados=recuperados-recuperados_dia_anterior,
           var_casos_pct=round(var_casos/casos_dia_anterior*100,1),
           var_recuperados_pct=round(var_recuperados/recuperados_dia_anterior*100,1)) %>% 
    select(-c(casos_dia_anterior, recuperados_dia_anterior)) 

## traer coordenadas del archivo de diccionarios
paises <- read_delim("dictionaries/paises.csv", ";", locale = locale(encoding="ISO-8859-1"))

datos3 <- left_join(datos2, paises,
                    by= c("pais", "pais_esp")) %>% 
    select(pais, fecha=fecha_buena, pais_esp, lat=lat_pais, long=long_pais, var_casos) %>% 
    filter(var_casos>0) %>%
    filter(!is.na(var_casos)) %>%
    arrange(-var_casos, fecha) %>% 
    filter(fecha=="2020-03-16") #cambiar fecha cada día por la del día anterior


write.table(datos3, "clipboard-20000", sep="\t", row.names=FALSE, col.names=TRUE)


