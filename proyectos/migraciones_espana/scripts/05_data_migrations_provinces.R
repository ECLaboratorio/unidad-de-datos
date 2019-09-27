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


# Calculating annual emigrations for each city to other provinces

emigrations <- provinces %>%
  group_by(ano=year(fechavar), provbaja) %>% 
  summarise(emigrations=n())


# Calculating annual inmigrations for each city from other provinces

inmigrations <- provinces %>% 
  group_by(ano=year(fechavar), provalta) %>% 
  summarise(inmigrations=n())


# Joining inmigrations and emigrations data frames and calculating interregional net migration per year

migrations <- left_join(inmigrations, emigrations,
                        by = c("provalta" = "provbaja", "ano")) %>% 
  mutate(net_migration=inmigrations-emigrations)


# Bringing in the names of the provinces

ids_provinces <- readxl::read_xlsx("dictionaries/ids_provincias.xlsx")

migrations <- left_join(migrations, ids_provinces,
                        by = c("provalta" = "idprov")) %>% 
  select(ano, idprov=provalta, province=Provincia, inmigrations:net_migration)


write_csv(migrations, "output_data/provinces_migrations.csv")
