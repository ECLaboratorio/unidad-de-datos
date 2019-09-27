# Loading packages

library(tidyverse)
library(lubridate)


# Bringing in combined data file
# The original data dictionary is located in the 'Diseño' tab from the 'disreg_vr.xlsx' file located in the 'dictionaries' folder
# The data is zipped in the GitHub repository to reduce the file size. Before this process, the zip file should be unzipped

raw_data <- read_csv("output_data/all_years_raw.csv")


# Formatting age column as number

raw_data$edad <- as.numeric(raw_data$edad)


# Joining and formmating date columns (mesnac + anonac, mesvar + anovar) in two columns (fechanac and fechavar)

raw_data <- raw_data %>% 
  mutate(fechanac=str_c("01", mesnac, anonac))
raw_data$fechanac <- dmy(raw_data$fechanac) # fechanac = date of birth (month and year)

raw_data <- raw_data %>% 
  mutate(fechavar=str_c("01", mesvar, anovar))
raw_data$fechavar <- dmy(raw_data$fechavar) # fechavar = date of migration (month and year)


# Creating columns with the five-digits code (the two first digits represent the province and the next three, the municipality) for municipalities 

raw_data <- raw_data %>% 
  mutate(idmuninac=str_c(provnac, muninac), # Municipality of birth
         idmunibaja=str_c(provbaja, munibaja), # Municipality of origin
         idmunialta=str_c(provalta, munialta)) # Municipality of destination

# When idmuninac==NA, idmunibaja==NA or idmunialta=NA, it means that the population of the municipality is less than 10,000 people and the municipality is not identified


# Creating new column with the type of migration

raw_data <- raw_data %>% 
  mutate(tipovar=case_when(
    provbaja == provalta ~ "01", # 01 = Within the same province
    provbaja != provalta & provbaja != "66" & provalta != "66" ~ "02", # 02 = Between different provinces
    provbaja == "66" | provalta == "66" ~ "03" # 03 = With origin or destination to other countries
  ))


# Selecting and reordering columns

tidy_data <- raw_data %>% 
  select(sexo,
         edad,
         fechanac,
         provnac,
         idmuninac,
         cnan,
         fechavar,
         tipovar,
         provbaja,
         idmunibaja,
         provalta,
         idmunialta,
         tamunaci,
         tamubaja,
         tamualta)

rm(raw_data)

# The data is zipped in the GitHub repository to reduce the file size. Before this process, the zip file should be unzipped

memory.limit(100000)
write_csv(tidy_data, "output_data/all_years_tidy.csv")
