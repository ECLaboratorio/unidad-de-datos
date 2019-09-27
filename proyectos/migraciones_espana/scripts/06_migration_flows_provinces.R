# Loading packages

library(tidyverse)
library(lubridate)


# Bringing in combined data file
# The original data dictionary is located in the 'Diseño' tab from the 'disreg_vr.xlsx' file located in the 'dictionaries' folder
# The data is zipped in the GitHub repository to reduce the file size. Before this process, the zip file should be unzipped

tidy_data <- read_csv("output_data/all_years_tidy.csv")


# Filtering the migrations between different provinces and selecting specific columns

provinces <- tidy_data %>% 
  filter(tipovar=="02") %>% 
  select(fechavar, provbaja, provalta)

rm(tidy_data)


# Grouping and summarising interregional migration flows

migration_flows <- provinces %>% 
  group_by(ano=year(fechavar), provbaja, provalta) %>% 
  summarise(migration=n())


# Bringing in the names of the provinces

ids_provinces <- readxl::read_xlsx("dictionaries/ids_provincias.xlsx")

migration_flows <- left_join(migration_flows, ids_provinces,
                        by = c("provbaja" = "idprov")) %>% 
  select(ano, provbaja, origin_province=Provincia, provalta, migration)

migration_flows <- left_join(migration_flows, ids_provinces,
                             by = c("provalta" = "idprov")) %>% 
  select(ano:provalta, destination_province=Provincia, migration)

write_csv(migration_flows,"output_data/provinces_migration_flows.csv")
