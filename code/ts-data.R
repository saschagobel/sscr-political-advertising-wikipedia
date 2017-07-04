# ---------------------------------------------------------------------------------------
# POLITICAL ADVERTISING ON THE WIKIPEDIA MARKETPLACE OF INFORMATION
# Sascha Göbel and Simon Munzert
# Time series data processing script
# November 2015
# ---------------------------------------------------------------------------------------

# imports -------------------------------------------------------------------------------
c("./htmls/htmlrevh16thBT/*.html", "./htmls/htmlrevh17thBT/*.html", 
  "./htmls/htmlrevh18thBT/*.html")

# exports -------------------------------------------------------------------------------
c("c:/data_ts.dta", "c:/data_ts16th.dta", "c:/data_ts17th.dta", "c:/data_ts18th.dta",
  "c:/data_tsip.dta", "c:/data_tsip16th.dta", "c:/data_tsip17th.dta", 
  "c:/data_tsip18th.dta")


#### PREPARATIONS =======================================================================

# load packages -------------------------------------------------------------------------
library(foreign)
library(plyr)
library(RCurl)
library(rvest) # note that this code is based on rvest version 0.2.0
library(stringr)
library(XML)

# load functions ------------------------------------------------------------------------
source("./code/functions.R")


#### TIME SERIES DATA FOR ALL EDITS =====================================================

# edits dates - 16th BT -----------------------------------------------------------------
ed16th <- as.character(extEditDates(folder = "./htmls/htmlrevh16thBT"))
ed16th <- unlist(str_extract_all(ed16th, "[[:digit:]]+\\. [[:alpha:]]{3}\\.? [[:digit:]]{4}"))
ed16th <- str_replace_all(ed16th, "\\.", "")
ed16th <- str_replace_all(ed16th, " ", "")
ed16th <- str_replace_all(ed16th, "Jan", "/01/")
ed16th <- str_replace_all(ed16th, "Feb", "/02/")
ed16th <- str_replace_all(ed16th, "Mär", "/03/")
ed16th <- str_replace_all(ed16th, "Apr", "/04/")
ed16th <- str_replace_all(ed16th, "Mai", "/05/")
ed16th <- str_replace_all(ed16th, "Jun", "/06/")
ed16th <- str_replace_all(ed16th, "Jul", "/07/")
ed16th <- str_replace_all(ed16th, "Aug", "/08/")
ed16th <- str_replace_all(ed16th, "Sep", "/09/")
ed16th <- str_replace_all(ed16th, "Okt", "/10/")
ed16th <- str_replace_all(ed16th, "Nov", "/11/")
ed16th <- str_replace_all(ed16th, "Dez", "/12/")
ed16th <- sort(as.Date(ed16th, "%d/%m/%Y"))
data_ts16th <- as.data.frame(ed16th)
data_ts16th <- rename(data_ts16th, c("ed16th" = "date"))
ed16th <- ed16th[-c(1:12953, 57511:113849)]
head(ed16th)
tail(ed16th)

# edits dates - 17th BT -----------------------------------------------------------------
ed17th <- as.character(extEditDates(folder = "./htmls/htmlrevh17thBT"))
ed17th <- unlist(str_extract_all(ed17th, "[[:digit:]]+\\. [[:alpha:]]{3}\\.? [[:digit:]]{4}"))
ed17th <- str_replace_all(ed17th, "\\.", "")
ed17th <- str_replace_all(ed17th, " ", "")
ed17th <- str_replace_all(ed17th, "Jan", "/01/")
ed17th <- str_replace_all(ed17th, "Feb", "/02/")
ed17th <- str_replace_all(ed17th, "Mär", "/03/")
ed17th <- str_replace_all(ed17th, "Apr", "/04/")
ed17th <- str_replace_all(ed17th, "Mai", "/05/")
ed17th <- str_replace_all(ed17th, "Jun", "/06/")
ed17th <- str_replace_all(ed17th, "Jul", "/07/")
ed17th <- str_replace_all(ed17th, "Aug", "/08/")
ed17th <- str_replace_all(ed17th, "Sep", "/09/")
ed17th <- str_replace_all(ed17th, "Okt", "/10/")
ed17th <- str_replace_all(ed17th, "Nov", "/11/")
ed17th <- str_replace_all(ed17th, "Dez", "/12/")
ed17th <- sort(as.Date(ed17th, "%d/%m/%Y"))
data_ts17th <- as.data.frame(ed17th)
data_ts17th <- rename(data_ts17th, c("ed17th" = "date"))
ed17th <- ed17th[-c(1:43238, 86688:105513)]
head(ed17th)
tail(ed17th)

# edits dates - 18th BT -----------------------------------------------------------------
ed18th <- as.character(extEditDates(folder = "./htmls/htmlrevh18thBT"))
ed18th <- unlist(str_extract_all(ed18th, "[[:digit:]]+\\. [[:alpha:]]{3}\\.? [[:digit:]]{4}"))
ed18th <- str_replace_all(ed18th, "\\.", "")
ed18th <- str_replace_all(ed18th, " ", "")
ed18th <- str_replace_all(ed18th, "Jan", "/01/")
ed18th <- str_replace_all(ed18th, "Feb", "/02/")
ed18th <- str_replace_all(ed18th, "Mär", "/03/")
ed18th <- str_replace_all(ed18th, "Apr", "/04/")
ed18th <- str_replace_all(ed18th, "Mai", "/05/")
ed18th <- str_replace_all(ed18th, "Jun", "/06/")
ed18th <- str_replace_all(ed18th, "Jul", "/07/")
ed18th <- str_replace_all(ed18th, "Aug", "/08/")
ed18th <- str_replace_all(ed18th, "Sep", "/09/")
ed18th <- str_replace_all(ed18th, "Okt", "/10/")
ed18th <- str_replace_all(ed18th, "Nov", "/11/")
ed18th <- str_replace_all(ed18th, "Dez", "/12/")
ed18th <- sort(as.Date(ed18th, "%d/%m/%Y"))
data_ts18th <- as.data.frame(ed18th)
data_ts18th <- rename(data_ts18th, c("ed18th" = "date"))
ed18th <- ed18th[-(1:61246)]
head(ed18th)
tail(ed18th)

# edit dates ----------------------------------------------------------------------------
data_ts <- as.data.frame(sort(c(ed16th, ed17th, ed18th)))
data_ts <- rename(data_ts, c("sort(c(ed16th, ed17th, ed18th))" = "date"))


#### TIME SERIES DATA FOR EDITS FROM BUNDESTAG IPs ======================================

# edits dates from Bundestag IPs - 16th BT ----------------------------------------------
edBtIp16th <- as.character(extBtIpEditDates(folder = "./htmls/htmlrevh16thBT"))
edBtIp16th <- unlist(str_extract_all(edBtIp16th, "[[:digit:]]+\\. [[:alpha:]]{3}\\.? [[:digit:]]{4}"))
edBtIp16th <- str_replace_all(edBtIp16th, "\\.", "")
edBtIp16th <- str_replace_all(edBtIp16th, " ", "")
edBtIp16th <- str_replace_all(edBtIp16th, "Jan", "/01/")
edBtIp16th <- str_replace_all(edBtIp16th, "Feb", "/02/")
edBtIp16th <- str_replace_all(edBtIp16th, "Mär", "/03/")
edBtIp16th <- str_replace_all(edBtIp16th, "Apr", "/04/")
edBtIp16th <- str_replace_all(edBtIp16th, "Mai", "/05/")
edBtIp16th <- str_replace_all(edBtIp16th, "Jun", "/06/")
edBtIp16th <- str_replace_all(edBtIp16th, "Jul", "/07/")
edBtIp16th <- str_replace_all(edBtIp16th, "Aug", "/08/")
edBtIp16th <- str_replace_all(edBtIp16th, "Sep", "/09/")
edBtIp16th <- str_replace_all(edBtIp16th, "Okt", "/10/")
edBtIp16th <- str_replace_all(edBtIp16th, "Nov", "/11/")
edBtIp16th <- str_replace_all(edBtIp16th, "Dez", "/12/")
edBtIp16th <- sort(as.Date(edBtIp16th, "%d/%m/%Y"))
data_tsip16th <- as.data.frame(edBtIp16th)
data_tsip16th <- rename(data_tsip16th, c("edBtIp16th" = "date"))
edBtIp16th <- edBtIp16th[-c(1:129, 1147:1892)]
head(edBtIp16th)
tail(edBtIp16th)

# edits dates from Bundestag IPs - 17th BT ----------------------------------------------
edBtIp17th <- as.character(extBtIpEditDates(folder = "./htmls/htmlrevh17thBT"))
edBtIp17th <- unlist(str_extract_all(edBtIp17th, "[[:digit:]]+\\. [[:alpha:]]{3}\\.? [[:digit:]]{4}"))
edBtIp17th <- str_replace_all(edBtIp17th, "\\.", "")
edBtIp17th <- str_replace_all(edBtIp17th, " ", "")
edBtIp17th <- str_replace_all(edBtIp17th, "Jan", "/01/")
edBtIp17th <- str_replace_all(edBtIp17th, "Feb", "/02/")
edBtIp17th <- str_replace_all(edBtIp17th, "Mär", "/03/")
edBtIp17th <- str_replace_all(edBtIp17th, "Apr", "/04/")
edBtIp17th <- str_replace_all(edBtIp17th, "Mai", "/05/")
edBtIp17th <- str_replace_all(edBtIp17th, "Jun", "/06/")
edBtIp17th <- str_replace_all(edBtIp17th, "Jul", "/07/")
edBtIp17th <- str_replace_all(edBtIp17th, "Aug", "/08/")
edBtIp17th <- str_replace_all(edBtIp17th, "Sep", "/09/")
edBtIp17th <- str_replace_all(edBtIp17th, "Okt", "/10/")
edBtIp17th <- str_replace_all(edBtIp17th, "Nov", "/11/")
edBtIp17th <- str_replace_all(edBtIp17th, "Dez", "/12/")
edBtIp17th <- sort(as.Date(edBtIp17th, "%d/%m/%Y"))
data_tsip17th <- as.data.frame(edBtIp17th)
data_tsip17th <- rename(data_tsip17th, c("edBtIp17th" = "date"))
edBtIp17th <- edBtIp17th[-c(1:843, 1745:1990)]
head(edBtIp17th)
tail(edBtIp17th)

# edits dates from Bundestag IPs - 18th BT ----------------------------------------------
edBtIp18th <- as.character(extBtIpEditDates(folder = "./htmls/htmlrevh18thBT"))
edBtIp18th <- unlist(str_extract_all(edBtIp18th, "[[:digit:]]+\\. [[:alpha:]]{3}\\.? [[:digit:]]{4}"))
edBtIp18th <- str_replace_all(edBtIp18th, "\\.", "")
edBtIp18th <- str_replace_all(edBtIp18th, " ", "")
edBtIp18th <- str_replace_all(edBtIp18th, "Jan", "/01/")
edBtIp18th <- str_replace_all(edBtIp18th, "Feb", "/02/")
edBtIp18th <- str_replace_all(edBtIp18th, "Mär", "/03/")
edBtIp18th <- str_replace_all(edBtIp18th, "Apr", "/04/")
edBtIp18th <- str_replace_all(edBtIp18th, "Mai", "/05/")
edBtIp18th <- str_replace_all(edBtIp18th, "Jun", "/06/")
edBtIp18th <- str_replace_all(edBtIp18th, "Jul", "/07/")
edBtIp18th <- str_replace_all(edBtIp18th, "Aug", "/08/")
edBtIp18th <- str_replace_all(edBtIp18th, "Sep", "/09/")
edBtIp18th <- str_replace_all(edBtIp18th, "Okt", "/10/")
edBtIp18th <- str_replace_all(edBtIp18th, "Nov", "/11/")
edBtIp18th <- str_replace_all(edBtIp18th, "Dez", "/12/")
edBtIp18th <- sort(as.Date(edBtIp18th, "%d/%m/%Y"))
data_tsip18th <- as.data.frame(edBtIp18th)
data_tsip18th <- rename(data_tsip18th, c("edBtIp18th" = "date"))
edBtIp18th <- edBtIp18th[-(1:1061)]
head(edBtIp18th)
tail(edBtIp18th)

# edit dates ----------------------------------------------------------------------------
data_tsip <- as.data.frame(sort(c(edBtIp16th, edBtIp17th, edBtIp18th)))
data_tsip <- rename(data_tsip, c("sort(c(edBtIp16th, edBtIp17th, edBtIp18th))" = "date"))


#### EXPORT DATA INTO STATAs .DTA FORMAT ================================================

write.dta(data_ts, "c:/data_ts.dta")
write.dta(data_ts16th, "c:/data_ts16th.dta")
write.dta(data_ts17th, "c:/data_ts17th.dta")
write.dta(data_ts18th, "c:/data_ts18th.dta")
write.dta(data_tsip, "c:/data_tsip.dta")
write.dta(data_tsip16th, "c:/data_tsip16th.dta")
write.dta(data_tsip17th, "c:/data_tsip17th.dta")
write.dta(data_tsip18th, "c:/data_tsip18th.dta")
