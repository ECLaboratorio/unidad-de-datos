## establecer carpeta predefinida
# setwd("proyectos/covid-19/evolucion-datos-covid/")

source("importar_datos.R")

# crear tabla de casos por países filtrando fechas con 10 o más infectados
top_paises <- datos_largo %>%
    filter(categoria=="casos") %>%
    group_by(pais_esp, fecha_buena) %>%
    summarise(casos=sum(valor)) %>% 
    mutate(var_casos=casos-lag(casos)) %>% 
    filter(fecha_buena=="2020-11-10", !is.na(pais_esp)) %>% ## cambiar fecha cada día por la más reciente (un día antes de cuando ejecutemos el script)
    select(fecha_buena, pais_esp, var_casos) %>% 
    arrange(-var_casos)

write_csv(top_paises, "top10-paises-datos.csv")
