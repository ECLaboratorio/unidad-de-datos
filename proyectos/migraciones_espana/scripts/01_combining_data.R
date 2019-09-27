# Loading packages

library(tidyverse)
devtools::install_github("andrewbtran/muckrakr")
library(muckrakr)


# Original source

# Estadística de variaciones residenciales 1988-2018, Spanish Statistical Office, INE, www.ine.es
# Link to the original source: http://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736177013&menu=resultados&secc=1254736195469&idp=1254734710990
# Official note: Until 2002, this statistics does not include data about the emigrations from Spain to other countries.


# Bringing in annual migration data
# The original data dictionary is located in the 'Diseño' tab from the 'disreg_vr.xlsx' file located in the 'dictionaries' folder
# The data is zipped in the GitHub repository to reduce the file size. Before this process, the zip file should be unzipped

data1988 <- read_fwf("raw_data/original/EVR_1988",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1989 <- read_fwf("raw_data/original/EVR_1989",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1990 <- read_fwf("raw_data/original/EVR_1990",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1991 <- read_fwf("raw_data/original/EVR_1991",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1992 <- read_fwf("raw_data/original/EVR_1992",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1993 <- read_fwf("raw_data/original/EVR_1993",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1994 <- read_fwf("raw_data/original/EVR_1994",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1995 <- read_fwf("raw_data/original/EVR_1995",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1996 <- read_fwf("raw_data/original/EVR_1996",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1997 <- read_fwf("raw_data/original/EVR_1997",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1998 <- read_fwf("raw_data/original/EVR_1998",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data1999 <- read_fwf("raw_data/original/EVR_1999",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2000 <- read_fwf("raw_data/original/EVR_2000",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2001 <- read_fwf("raw_data/original/EVR_2001",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2002 <- read_fwf("raw_data/original/EVR_2002",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2003 <- read_fwf("raw_data/original/EVR_2003",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2004 <- read_fwf("raw_data/original/EVR_2004",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2005 <- read_fwf("raw_data/original/EVR_2005",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2006 <- read_fwf("raw_data/original/EVR_2006",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2007 <- read_fwf("raw_data/original/EVR_2007",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2008 <- read_fwf("raw_data/original/EVR_2008",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2009 <- read_fwf("raw_data/original/EVR_2009",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2010 <- read_fwf("raw_data/original/EVR_2010",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2011 <- read_fwf("raw_data/original/EVR_2011",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2012 <- read_fwf("raw_data/original/EVR_2012",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2013 <- read_fwf("raw_data/original/EVR_2013",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2014 <- read_fwf("raw_data/original/EVR_2014",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2015 <- read_fwf("raw_data/original/EVR_2015",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

# From this moment, the file format changes to .txt

data2016 <- read_fwf("raw_data/original/EVR_2016.txt",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2017 <- read_fwf("raw_data/original/EVR_2017.txt",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))

data2018 <- read_fwf("raw_data/original/EVR_2018.txt",
                      fwf_widths(c(1,2,3,3,2,4,3,2,3,2,4,2,3,1,1,1),
                                 c("sexo", "provnac", "muninac", "edad", "mesnac", "anonac", "cnan", "provalta", "munialta", "mesvar", "anovar", "provbaja", "munibaja", "tamualta", "tamubaja", "tamunaci")))


# Saving each data frame as csv in the same folder
# The data is zipped in the GitHub repository to reduce the file size. Before this process, the zip file should be unzipped

write_csv(data1988, "raw_data/csv/data1988.csv")
write_csv(data1989, "raw_data/csv/data1989.csv")
write_csv(data1990, "raw_data/csv/data1990.csv")
write_csv(data1991, "raw_data/csv/data1991.csv")
write_csv(data1992, "raw_data/csv/data1992.csv")
write_csv(data1993, "raw_data/csv/data1993.csv")
write_csv(data1994, "raw_data/csv/data1994.csv")
write_csv(data1995, "raw_data/csv/data1995.csv")
write_csv(data1996, "raw_data/csv/data1996.csv")
write_csv(data1997, "raw_data/csv/data1997.csv")
write_csv(data1998, "raw_data/csv/data1998.csv")
write_csv(data1999, "raw_data/csv/data1999.csv")
write_csv(data2000, "raw_data/csv/data2000.csv")
write_csv(data2001, "raw_data/csv/data2001.csv")
write_csv(data2002, "raw_data/csv/data2002.csv")
write_csv(data2003, "raw_data/csv/data2003.csv")
write_csv(data2004, "raw_data/csv/data2004.csv")
write_csv(data2005, "raw_data/csv/data2005.csv")
write_csv(data2006, "raw_data/csv/data2006.csv")
write_csv(data2007, "raw_data/csv/data2007.csv")
write_csv(data2008, "raw_data/csv/data2008.csv")
write_csv(data2009, "raw_data/csv/data2009.csv")
write_csv(data2010, "raw_data/csv/data2010.csv")
write_csv(data2011, "raw_data/csv/data2011.csv")
write_csv(data2012, "raw_data/csv/data2012.csv")
write_csv(data2013, "raw_data/csv/data2013.csv")
write_csv(data2014, "raw_data/csv/data2014.csv")
write_csv(data2015, "raw_data/csv/data2015.csv")
write_csv(data2016, "raw_data/csv/data2016.csv")
write_csv(data2017, "raw_data/csv/data2017.csv")
write_csv(data2018, "raw_data/csv/data2018.csv")


# Joining the annual csv in an unique one and saving it
# The data is zipped in the GitHub repository to reduce the file size. Before this process, the zip file should be unzipped

memory.limit(70000)
bulk_csv(folder = "raw_data/csv", export = "output_data/all_years_raw.csv")
