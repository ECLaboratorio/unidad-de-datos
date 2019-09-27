# Loading packages

library(tidyverse)
library(lubridate)


# Bringing in combined data file
# The original data dictionary is located in the 'Diseño' tab from the 'disreg_vr.xlsx' file located in the 'dictionaries' folder
# The data is zipped in the GitHub repository to reduce the file size. Before this process, the zip file should be unzipped

data <- read_csv("output_data/all_years_tidy.csv")


# Bringing in codes for autonomous communities and EU NUTS-1 regions

regions <- readxl::read_xlsx("dictionaries/ids_provincias.xlsx")

regions_data <- left_join(data, regions,
                        by = c("provnac" = "idprov")) %>% 
  select(sexo:tamualta, ccaanac=idccaa, regionnac=idregion) # Selecting the chosen columns

# To bring in the codes for provbaja and provalta, you should change provnac for provbaja or provalta


# Bringing in the names of the municipalities

municipalities <- readxl::read_xlsx("dictionaries/ids_municipios.xlsx")

municipalities_data <- left_join(data, municipalities,
                          by = c("idmuninac" = "CODMUN")) %>% 
  select(sexo:tamualta, municipio=Nombre) # Selecting the chosen columns

# To bring in the codes for idmunibaja and idmunibaja, you should change idmuninac for idmunibaja or idmunialta
