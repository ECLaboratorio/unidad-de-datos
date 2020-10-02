## cargar librerías e importar datos originales
library(tidyverse)
library(lubridate)

# cambiar fechas de los dos archivos
# setwd('./proyectos/covid-19/evolucion-datos-covid')

datos_anterior <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/09-20-2020.csv")
datos_ultimo <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/09-21-2020.csv")

datos_anterior <- datos_anterior %>% 
    mutate(fecha_buena="2020-09-30") %>% # cambiar fecha
    select(Country_Region, Confirmed, Deaths, Recovered, fecha_buena)

datos_ultimo <- datos_ultimo %>% 
    mutate(fecha_buena="2020-10-01") %>% # cambiar fecha
    select(Country_Region, Confirmed, Deaths, Recovered, fecha_buena)


datos <- rbind(datos_anterior, datos_ultimo) %>% 
    group_by(`Country_Region`, fecha_buena) %>% 
    summarise(casos=sum(Confirmed),
              muertes=sum(Deaths),
              recuperados=sum(Recovered)) %>% 
    select(fecha_buena, pais=`Country_Region`, casos) %>% 
    arrange(pais, fecha_buena)


# traer columnas de países en español y latitudes de países
paises <- read_delim("./paises.csv", delim = ";", locale = locale(encoding = "ISO-8859-1"))

variacion_diaria_ultima <- left_join(datos, paises,
                                     by = "pais") %>% 
    select(pais, fecha_buena, pais_esp, lat_pais, long_pais, casos) %>% 
    mutate(casos_dia_anterior=lag(casos),
           var_casos=casos-casos_dia_anterior) %>% 
    select(-c(casos_dia_anterior, casos)) %>% 
    filter(var_casos>0) %>%
    filter(!is.na(var_casos)) %>%
    arrange(pais_esp, fecha_buena) %>% 
    filter(fecha_buena=="2020-10-01") # filtrar fecha por la más reciente

write.table(variacion_diaria_ultima, "clipboard-20000", sep="\t", row.names=FALSE, col.names=TRUE)
