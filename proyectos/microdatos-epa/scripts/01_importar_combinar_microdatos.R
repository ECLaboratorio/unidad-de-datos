# cargar librerías
library(tidyverse)
library(plyr)
library(lubridate)

# importar microdatos de la EPA correspondientes al 1T de cada año 2005-2019
mydir <- "datos/raw/md_EPA_T1" # elegir carpeta donde están todos los .txt a importar
myfiles <-  list.files(path=mydir, pattern="*.txt", full.names=TRUE)
datos1t <- ldply(myfiles, read_fwf,
                       fwf_widths(c(3,2,2,5,1,2,2,1,1,2,2,2,1,1,2,3,1,3,2,2,2,3,1,2,1,2,3,2,1,1,1,2,2,1,1,1,2,1,1,1,2,2,2,3,3,2,3,1,2,4,4,4,1,4,4,2,1,1,1,2,4,1,1,2,2,1,1,1,1,2,1,1,2,1,1,1,3,1,1,2,1,2,2,2,1,1,1,2,3,1,2,2,7),
                                  c("ciclo","ccaa","prov","nvivi","nivel","npers","edad5","relpp1","sexo1","ncony","npadre","nmadre","rellmili","eciv1","prona1","regna1","nac1","exregna1","anore1","nforma","rellb1","edadest","cursr","ncursr","cursnr","ncurnr","hcurnr","rellb2","trarem","ayudfa","ausent","rznotb","vincul","nuevem","ocup1","act1","situ","sp","ducon1","ducon2","ducon3","tcontm","tcontd","dren","dcom","proest","regest","parco1","parco2","horasp","horash","horase","extra","extpag","extnpg","rzdifh","traplu","ocuplu1","actplu1","sitplu","horplu","mashor","dismas","rzndish","hordes","busotr","busca","desea","fobact","nbusca","asala","embus","itbu","disp","rzndis","empant","dtant","ocupa","acta","situa","ofemp","sidi1","sidi2","sidi3","sidac1","sidac2","mun1","prore1","repaire1","traant","aoi","cse","factorel")),
                 cols(.default = col_character()))
write_csv(datos1t, "datos/combined/trimestres/datos_unidos_1T.csv")

# importar microdatos de la EPA correspondientes al 2T de cada año 2005-2019
mydir <- "datos/raw/md_EPA_T2" # elegir carpeta donde están todos los .txt a importar
myfiles <-  list.files(path=mydir, pattern="*.txt", full.names=TRUE)
datos2t <- ldply(myfiles, read_fwf,
                 fwf_widths(c(3,2,2,5,1,2,2,1,1,2,2,2,1,1,2,3,1,3,2,2,2,3,1,2,1,2,3,2,1,1,1,2,2,1,1,1,2,1,1,1,2,2,2,3,3,2,3,1,2,4,4,4,1,4,4,2,1,1,1,2,4,1,1,2,2,1,1,1,1,2,1,1,2,1,1,1,3,1,1,2,1,2,2,2,1,1,1,2,3,1,2,2,7),
                            c("ciclo","ccaa","prov","nvivi","nivel","npers","edad5","relpp1","sexo1","ncony","npadre","nmadre","rellmili","eciv1","prona1","regna1","nac1","exregna1","anore1","nforma","rellb1","edadest","cursr","ncursr","cursnr","ncurnr","hcurnr","rellb2","trarem","ayudfa","ausent","rznotb","vincul","nuevem","ocup1","act1","situ","sp","ducon1","ducon2","ducon3","tcontm","tcontd","dren","dcom","proest","regest","parco1","parco2","horasp","horash","horase","extra","extpag","extnpg","rzdifh","traplu","ocuplu1","actplu1","sitplu","horplu","mashor","dismas","rzndish","hordes","busotr","busca","desea","fobact","nbusca","asala","embus","itbu","disp","rzndis","empant","dtant","ocupa","acta","situa","ofemp","sidi1","sidi2","sidi3","sidac1","sidac2","mun1","prore1","repaire1","traant","aoi","cse","factorel")),
                 cols(.default = col_character()))
write_csv(datos2t, "datos/combined/trimestres/datos_unidos_2T.csv")

# importar microdatos de la EPA correspondientes al 3T de cada año 2005-2019
mydir <- "datos/raw/md_EPA_T3" # elegir carpeta donde están todos los .txt a importar
myfiles <-  list.files(path=mydir, pattern="*.txt", full.names=TRUE)
datos3t <- ldply(myfiles, read_fwf,
                 fwf_widths(c(3,2,2,5,1,2,2,1,1,2,2,2,1,1,2,3,1,3,2,2,2,3,1,2,1,2,3,2,1,1,1,2,2,1,1,1,2,1,1,1,2,2,2,3,3,2,3,1,2,4,4,4,1,4,4,2,1,1,1,2,4,1,1,2,2,1,1,1,1,2,1,1,2,1,1,1,3,1,1,2,1,2,2,2,1,1,1,2,3,1,2,2,7),
                            c("ciclo","ccaa","prov","nvivi","nivel","npers","edad5","relpp1","sexo1","ncony","npadre","nmadre","rellmili","eciv1","prona1","regna1","nac1","exregna1","anore1","nforma","rellb1","edadest","cursr","ncursr","cursnr","ncurnr","hcurnr","rellb2","trarem","ayudfa","ausent","rznotb","vincul","nuevem","ocup1","act1","situ","sp","ducon1","ducon2","ducon3","tcontm","tcontd","dren","dcom","proest","regest","parco1","parco2","horasp","horash","horase","extra","extpag","extnpg","rzdifh","traplu","ocuplu1","actplu1","sitplu","horplu","mashor","dismas","rzndish","hordes","busotr","busca","desea","fobact","nbusca","asala","embus","itbu","disp","rzndis","empant","dtant","ocupa","acta","situa","ofemp","sidi1","sidi2","sidi3","sidac1","sidac2","mun1","prore1","repaire1","traant","aoi","cse","factorel")),
                 cols(.default = col_character()))
write_csv(datos3t, "datos/combined/trimestres/datos_unidos_3T.csv")

# importar microdatos de la EPA correspondientes al 4T de cada año 2005-2019
mydir <- "datos/raw/md_EPA_T4" # elegir carpeta donde están todos los .txt a importar
myfiles <-  list.files(path=mydir, pattern="*.txt", full.names=TRUE)
datos4t <- ldply(myfiles, read_fwf,
                 fwf_widths(c(3,2,2,5,1,2,2,1,1,2,2,2,1,1,2,3,1,3,2,2,2,3,1,2,1,2,3,2,1,1,1,2,2,1,1,1,2,1,1,1,2,2,2,3,3,2,3,1,2,4,4,4,1,4,4,2,1,1,1,2,4,1,1,2,2,1,1,1,1,2,1,1,2,1,1,1,3,1,1,2,1,2,2,2,1,1,1,2,3,1,2,2,7),
                            c("ciclo","ccaa","prov","nvivi","nivel","npers","edad5","relpp1","sexo1","ncony","npadre","nmadre","rellmili","eciv1","prona1","regna1","nac1","exregna1","anore1","nforma","rellb1","edadest","cursr","ncursr","cursnr","ncurnr","hcurnr","rellb2","trarem","ayudfa","ausent","rznotb","vincul","nuevem","ocup1","act1","situ","sp","ducon1","ducon2","ducon3","tcontm","tcontd","dren","dcom","proest","regest","parco1","parco2","horasp","horash","horase","extra","extpag","extnpg","rzdifh","traplu","ocuplu1","actplu1","sitplu","horplu","mashor","dismas","rzndish","hordes","busotr","busca","desea","fobact","nbusca","asala","embus","itbu","disp","rzndis","empant","dtant","ocupa","acta","situa","ofemp","sidi1","sidi2","sidi3","sidac1","sidac2","mun1","prore1","repaire1","traant","aoi","cse","factorel")),
                 cols(.default = col_character()))
write_csv(datos4t, "datos/combined/trimestres/datos_unidos_4T.csv")

# combinar csv de los cuatro trimestres
mydir <- "datos/combined/trimestres" # elegir carpeta donde están todos los .txt a importar
myfiles <-  list.files(path=mydir, pattern="*.csv", full.names=TRUE)
todos_datos <- ldply(myfiles, read_csv,                    
                     col_types = cols(.default = "c"))

# crear columna numérica factor elevación
todos_datos_2 <- todos_datos %>% 
  mutate(factorel_num=as.numeric(factorel)/100)
rm(todos_datos)

# crear columna con fecha de trimestre en base a la columna ciclo
codigos <- readxl::read_xlsx("dictionaries/diccionario_codigos_trimestres.xlsx")

codigos <- codigos %>% 
  select(-descripcion)

todos_datos_2$ciclo <- as.numeric(todos_datos_2$ciclo)

todos_datos_bueno <- left_join(todos_datos_2, codigos,
                               by = c("ciclo" = "codigo"))

rm(todos_datos_2)
rm(codigos)

todos_datos_bueno <- todos_datos_bueno %>% 
  select(ciclo, fecha, ccaa:factorel_num)

todos_datos_bueno$fecha <- ymd(todos_datos_bueno$fecha)

todos_datos_bueno <- todos_datos_bueno %>% 
  select(-factorel)

todos_datos_bueno <- todos_datos_bueno %>% 
  select(ciclo:cse, factorel=factorel_num)


write_csv(todos_datos_bueno, "datos/combined/datos_unidos_todos_final.csv")

