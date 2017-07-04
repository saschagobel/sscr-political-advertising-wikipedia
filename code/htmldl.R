# ---------------------------------------------------------------------------------------
# POLITICAL ADVERTISING ON THE WIKIPEDIA MARKETPLACE OF INFORMATION
# Sascha Göbel and Simon Munzert
# HTML extraction script
# November 2015
# ---------------------------------------------------------------------------------------

# imports -------------------------------------------------------------------------------
c("")

# exports -------------------------------------------------------------------------------
c("./htmls/htmlbt16th/*.html", "./htmls/htmlbt17th/*.html", "./htmls/htmlbt18th/*.html",
  "./htmls/htmlrevh16thBT/*.html", "./htmls/htmlrevh17thBT/*.html", 
  "./htmls/htmlrevh18thBT/*.html", "./htmls/htmlwiki16thBT/*.html",
  "./htmls/htmlwiki17thBT/*.html", "./htmls/htmlwiki18thBT/*.html",
  "./htmls/htmlwiki16thBTbeg/*.html", "./htmls/htmlwiki17thBTbeg/*.html",
  "./htmls/htmlwiki18thBTbeg/*.html", "./htmls/htmlwiki16thBTend/*.html",
  "./htmls/htmlwiki17thBTend/*.html", "./htmls/htmlwiki18thBTend/*.html")


#### PREPARATIONS =======================================================================

# load packages -------------------------------------------------------------------------
library(plyr)
library(RCurl)
library(rvest) # note that this code is based on rvest version 0.2.0
library(stringr)
library(XML)
library(RSelenium) # note that this code is based on RSelenium 1.3.5
library(lubridate)
library(dplyr)
library(BBmisc)

# load functions ------------------------------------------------------------------------
source("./code/functions.R")


#### LINKS TO MP WIKIPEDIA PAGES, REVISION HISTORIES AND BUNDESTAG PAGES ================

# links to MPs' Wikipedia pages - 16th BT -----------------------------------------------
mp_wiki_list_url_16thBT <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(16._Wahlperiode)"
mp_wiki_list_parsed_16thBT <- html(mp_wiki_list_url_16thBT, encoding = "UTF-8")
mp_wiki_links_16thBT <- getHTMLLinks(mp_wiki_list_parsed_16thBT, xpQuery = "//table[2]//tr/td[1]/a/@href")
mp_wiki_links_16thBT <- str_c("https://de.wikipedia.org", mp_wiki_links_16thBT)

# links to MPs' Wikipedia pages - 17th BT -----------------------------------------------
mp_wiki_list_url_17thBT <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(17._Wahlperiode)"
mp_wiki_list_parsed_17thBT <- html(mp_wiki_list_url_17thBT, encoding = "UTF-8")
mp_wiki_links_17thBT <- getHTMLLinks(mp_wiki_list_parsed_17thBT, xpQuery = "//table[2]//tr/td[1]/a/@href")
mp_wiki_links_17thBT <- str_c("https://de.wikipedia.org", mp_wiki_links_17thBT)

# links to MPs' Wikipedia pages - 18th BT -----------------------------------------------
mp_wiki_list_url_18thBT <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(18._Wahlperiode)"
mp_wiki_list_parsed_18thBT <- html(mp_wiki_list_url_18thBT, encoding = "UTF-8")
mp_wiki_links_18thBT <- getHTMLLinks(mp_wiki_list_parsed_18thBT, xpQuery = "//table[2]//tr/td[1]/a/@href")
mp_wiki_links_18thBT <- mp_wiki_links_18thBT[-457]
mp_wiki_links_18thBT <- str_c("https://de.wikipedia.org", mp_wiki_links_18thBT)

# links to MPs' Wikipedia page revision histories - 16th BT -----------------------------
rev_hist_links_16thBT <- as.character(lapply(mp_wiki_links_16thBT, extRevHistLinks))
rev_hist_links_16thBT <- str_c("https://de.wikipedia.org", rev_hist_links_16thBT)
rev_hist_links_16thBT <- str_replace_all(rev_hist_links_16thBT, "&", "&offset=&limit=5000&")
rev_hist_links_list_16thBT <- as.list(rev_hist_links_16thBT)

# links to MPs' Wikipedia page revision histories - 17th BT -----------------------------
rev_hist_links_17thBT <- as.character(lapply(mp_wiki_links_17thBT, extRevHistLinks))
rev_hist_links_17thBT <- str_c("https://de.wikipedia.org", rev_hist_links_17thBT)
rev_hist_links_17thBT <- str_replace_all(rev_hist_links_17thBT, "&", "&offset=&limit=5000&")
rev_hist_links_list_17thBT <- as.list(rev_hist_links_17thBT)

# links to MPs' Wikipedia page revision histories - 18th BT -----------------------------
rev_hist_links_18thBT <- as.character(lapply(mp_wiki_links_18thBT, extRevHistLinks))
rev_hist_links_18thBT <- str_c("https://de.wikipedia.org", rev_hist_links_18thBT)
rev_hist_links_18thBT <- str_replace_all(rev_hist_links_18thBT, "&", "&offset=&limit=5000&")
rev_hist_links_18thBT <- rev_hist_links_18thBT[-457]
rev_hist_links_list_18thBT <- as.list(rev_hist_links_18thBT)

# links to MPs' Bundestag pages - 16th BT -----------------------------------------------
checkForServer()
startServer()
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4444, browserName = "firefox")
remDr$open()
remDr$navigate("http://webarchiv.bundestag.de/cgi/show.php?fileToLoad=313&id=1041")
htmlParse(remDr$getPageSource()[[1]])
webElems <- remDr$findElements(using = "tag name", "frame")
sapply(webElems, function(x){x$getElementAttribute("src")})
remDr$switchToFrame(webElems[[2]])
mp_bt_list_parsed_16thBT <-  xmlParse(remDr$getPageSource()[[1]])
bt_links_16thBT <- saveXML(mp_bt_list_parsed_16thBT, tempfile())
bt_links_16thBT <- readLines(bt_links_16thBT)
bt_links_16thBT <- unlist(str_extract_all(bt_links_16thBT, "bio.+html"))
bt_links_16thBT <- bt_links_16thBT[2:622]
bt_links_16thBTadd <- c("bio/S/strengwo.html", "bio/W/wittlwe0.html", "bio/E/eiselst0.html", "bio/H/hultsst0.html", "bio/M/maiscni0.html", "bio/S/strebma0.html", "bio/S/seib_ma0.html", "bio/S/sarrama0.html", "bio/W/westehi0.html", "bio/L/lamp_he0.html", "bio/L/lotteer0.html", "bio/H/hoeglev0.html", "bio/H/herlibe0.html", "bio/C/caesaca0.html", "bio/H/hirtech0.html", "bio/K/kurthpa0.html", "bio/M/mahlbth0.html", "bio/T/tempefr0.html", "bio/S/stoecro0.html", "bio/V/volk_da0.html", "bio/S/steindi0.html")
bt_links_16thBT <- c(bt_links_16thBT, bt_links_16thBTadd)
bt_links_16thBT <- str_replace(bt_links_16thBT, "bio/B/bettigr0", "bio/S/staffgr0")
bt_links_16thBT <- str_replace(bt_links_16thBT, "bio/L/laemman0.html", "bio/L/laemman01.html")
bt_links_16thBT <- str_replace(bt_links_16thBT, "bio/W/weissgu0", "bio/W/weiss_gu0")
bt_links_16thBT <- str_c("http://webarchiv.bundestag.de/archive/2010/0427/bundestag/abgeordnete/", bt_links_16thBT)
bt_links_list_16thBT <- as.list(bt_links_16thBT)

# links to MPs' Bundestag pages - 17th BT -----------------------------------------------
checkForServer()
startServer()
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4444, browserName = "firefox")
remDr$open()
remDr$navigate("http://webarchiv.bundestag.de/cgi/show.php?fileToLoad=3144&id=1223")
htmlParse(remDr$getPageSource()[[1]])
webElems <- remDr$findElements(using = "tag name", "frame")
sapply(webElems, function(x){x$getElementAttribute("src")})
remDr$switchToFrame(webElems[[2]])
mp_bt_list_parsed_17thBT <- htmlParse(remDr$getPageSource()[[1]])
mp_bt_list_parsed_17thBT
bt_links_17thBT <- getHTMLLinks(mp_bt_list_parsed_17thBT, xpQuery = "//div[@class='linkIntern']/a/@href")
bt_links_17thBT <- str_replace_all(bt_links_17thBT, "^[.][.]", "")
bt_links_17thBT <- str_c("http://webarchiv.bundestag.de/archive/2013/1212/bundestag/abgeordnete17", bt_links_17thBT)
bt_links_list_17thBT <- as.list(bt_links_17thBT)

# links to MPs' Bundestag pages - 18th BT -----------------------------------------------
mp_bt_list_url_18thBT <- "http://www.bundestag.de/bundestag/abgeordnete18/alphabet"
mp_bt_list_parsed_18thBT <- html(mp_bt_list_url_18thBT, encoding = "UTF-8")
bt_links_18thBT <- getHTMLLinks(mp_bt_list_parsed_18thBT, xpQuery = "//div[@class='standardBox']//a/@href")
bt_links_18thBT <- str_c("http://www.bundestag.de", bt_links_18thBT)
bt_links_18thBT <- bt_links_18thBT[-457]
bt_links_list_18thBT <- as.list(bt_links_18thBT)


### DOWNLOAD OF MPs WIKIPEDIA PAGE, REVISION HISTORY, AND BUNDESTAG PAGE HTMLs ==========

# MPs' wikipedia page htmls - 16th BT ---------------------------------------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(mp_wiki_links_16thBT, dlwikiHtmls, folder = "./htmls/htmlwiki16thBT")

# MPs' wikipedia page htmls - 17th BT ---------------------------------------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(mp_wiki_links_17thBT, dlwikiHtmls, folder = "./htmls/htmlwiki17thBT")

# MPs' wikipedia page htmls - 18th BT ---------------------------------------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(mp_wiki_links_18thBT, dlwikiHtmls, folder = "./htmls/htmlwiki18thBT")

# MPs' Wikipedia page revision history htmls - 16th BT ----------------------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(rev_hist_links_list_16thBT, dlRevHistHtmls, folder = "./htmls/htmlrevh16thBT")

# MPs' Wikipedia page revision history htmls - 17th BT ----------------------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(rev_hist_links_list_17thBT, dlRevHistHtmls, folder = "./htmls/htmlrevh17thBT")

# MPs' wikipedia page revision history htmls - 18th BT ----------------------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(rev_hist_links_list_18thBT, dlRevHistHtmls, folder = "./htmls/htmlrevh18thBT")

# MPs' Bundestag page htmls - 16th BT ---------------------------------------------------
handle <- getCurlHandle()
l_ply(bt_links_list_16thBT, dlBtHtmls16thBT, folder = "./htmls/htmlbt16th", handle = handle)

# MPs' Bundestag page htmls - 17th BT ---------------------------------------------------
handle <- getCurlHandle()
l_ply(bt_links_list_17thBT, dlBtHtmls17thBT, folder = "./htmls/htmlbt17th", handle = handle)

# MPs' Bundestag page htmls - 18th BT ---------------------------------------------------
handle <- getCurlHandle()
l_ply(bt_links_list_18thBT, dlBtHtmls18thBT, folder = "./htmls/htmlbt18th", handle = handle)


### EXTRACTION OF LINKS TO OLD MP WIKIPEDIA PAGES =======================================

# links to MPs' Wikipedia pages - 16th BT (at the beginning of the term) ----------------
mp_wiki_old_links_16thBT <- as.character(extWikiLinksOldId(folder = "./htmls/htmlrevh16thBT"))
mp_wiki_old_links_16thBT <- str_extract_all(mp_wiki_old_links_16thBT, "index.+?(?=\\\")")
mp_wiki_old_dates_16thBT <- as.character(extWikiLinksOldIdDates(folder = "./htmls/htmlrevh16thBT"))
mp_wiki_old_dates_16thBT <- str_extract_all(mp_wiki_old_dates_16thBT, "[[:digit:]][[:digit:]]?\\. [[:alpha:]]+\\.? +[[:digit:]]{4}")
mp_wiki_old_dates_16thBT <- mp_wiki_old_dates_16thBT %>%
  lapply(str_replace_all, fixed(". Jan. "), " January ") %>% 
  lapply(str_replace_all, fixed(". Feb. "), " February ") %>% 
  lapply(str_replace_all, fixed(". Mär. "), " March ") %>% 
  lapply(str_replace_all, fixed(". Apr. "), " April ") %>% 
  lapply(str_replace_all, fixed(". Mai "), " May ") %>% 
  lapply(str_replace_all, fixed(". Jun. "), " June ") %>% 
  lapply(str_replace_all, fixed(". Jul. "), " July ") %>% 
  lapply(str_replace_all, fixed(". Aug. "), " August ") %>% 
  lapply(str_replace_all, fixed(". Sep. "), " September ") %>% 
  lapply(str_replace_all, fixed(". Okt. "), " October ") %>% 
  lapply(str_replace_all, fixed(". Nov. "), " November ") %>% 
  lapply(str_replace_all, fixed(". Dez. "), " December ")
mp_wiki_old_dates_16thBT <- sapply(mp_wiki_old_dates_16thBT, dmy, locale = "English_US.1252")
check_date_beg_16thBT <- sapply(mp_wiki_old_dates_16thBT, ">", ymd("2005-09-17"))
pos_old_link_beg_16thBT <- sapply(check_date_beg_16thBT, which.last) # find last "TRUE" value (= first edit at(only for 16thBT)/after election)
mp_wiki_old_links_beg_16thBT <- unlist(Map("[", mp_wiki_old_links_16thBT, pos_old_link_beg_16thBT))
mp_wiki_old_links_beg_16thBT <- as.list(str_c("https://de.wikipedia.org/w/", mp_wiki_old_links_beg_16thBT))

# links to MPs' Wikipedia pages - 17th BT (at the beginning of the term) ----------------
mp_wiki_old_links_17thBT <- as.character(extWikiLinksOldId(folder = "./htmls/htmlrevh17thBT"))
mp_wiki_old_links_17thBT <- str_extract_all(mp_wiki_old_links_17thBT, "index.+?(?=\\\")")
mp_wiki_old_dates_17thBT <- as.character(extWikiLinksOldIdDates(folder = "./htmls/htmlrevh17thBT"))
mp_wiki_old_dates_17thBT <- str_extract_all(mp_wiki_old_dates_17thBT, "[[:digit:]][[:digit:]]?\\. [[:alpha:]]+\\.? +[[:digit:]]{4}")
mp_wiki_old_dates_17thBT <- mp_wiki_old_dates_17thBT %>%
  lapply(str_replace_all, fixed(". Jan. "), " January ") %>% 
  lapply(str_replace_all, fixed(". Feb. "), " February ") %>% 
  lapply(str_replace_all, fixed(". Mär. "), " March ") %>% 
  lapply(str_replace_all, fixed(". Apr. "), " April ") %>% 
  lapply(str_replace_all, fixed(". Mai "), " May ") %>% 
  lapply(str_replace_all, fixed(". Jun. "), " June ") %>% 
  lapply(str_replace_all, fixed(". Jul. "), " July ") %>% 
  lapply(str_replace_all, fixed(". Aug. "), " August ") %>% 
  lapply(str_replace_all, fixed(". Sep. "), " September ") %>% 
  lapply(str_replace_all, fixed(". Okt. "), " October ") %>% 
  lapply(str_replace_all, fixed(". Nov. "), " November ") %>% 
  lapply(str_replace_all, fixed(". Dez. "), " December ")
mp_wiki_old_dates_17thBT <- sapply(mp_wiki_old_dates_17thBT, dmy, locale = "English_US.1252")
check_date_beg_17thBT <- sapply(mp_wiki_old_dates_17thBT, ">", ymd("2009-09-27"))
pos_old_link_beg_17thBT <- sapply(check_date_beg_17thBT, which.last) # find last "TRUE" value (= first edit after election)
mp_wiki_old_links_beg_17thBT <- unlist(Map("[", mp_wiki_old_links_17thBT, pos_old_link_beg_17thBT))
mp_wiki_old_links_beg_17thBT <- as.list(str_c("https://de.wikipedia.org/w/", mp_wiki_old_links_beg_17thBT))

# links to MPs' Wikipedia pages - 18th BT (at the beginning of the term) ----------------
mp_wiki_old_links_18thBT <- as.character(extWikiLinksOldId(folder = "./htmls/htmlrevh18thBT"))
mp_wiki_old_links_18thBT <- str_extract_all(mp_wiki_old_links_18thBT, "index.+?(?=\\\")")
mp_wiki_old_dates_18thBT <- as.character(extWikiLinksOldIdDates(folder = "./htmls/htmlrevh18thBT"))
mp_wiki_old_dates_18thBT <- str_extract_all(mp_wiki_old_dates_18thBT, "[[:digit:]][[:digit:]]?\\. [[:alpha:]]+\\.? +[[:digit:]]{4}")
mp_wiki_old_dates_18thBT <- mp_wiki_old_dates_18thBT %>%
  lapply(str_replace_all, fixed(". Jan. "), " January ") %>% 
  lapply(str_replace_all, fixed(". Feb. "), " February ") %>% 
  lapply(str_replace_all, fixed(". Mär. "), " March ") %>% 
  lapply(str_replace_all, fixed(". Apr. "), " April ") %>% 
  lapply(str_replace_all, fixed(". Mai "), " May ") %>% 
  lapply(str_replace_all, fixed(". Jun. "), " June ") %>% 
  lapply(str_replace_all, fixed(". Jul. "), " July ") %>% 
  lapply(str_replace_all, fixed(". Aug. "), " August ") %>% 
  lapply(str_replace_all, fixed(". Sep. "), " September ") %>% 
  lapply(str_replace_all, fixed(". Okt. "), " October ") %>% 
  lapply(str_replace_all, fixed(". Nov. "), " November ") %>% 
  lapply(str_replace_all, fixed(". Dez. "), " December ")
mp_wiki_old_dates_18thBT <- sapply(mp_wiki_old_dates_18thBT, dmy, locale = "English_US.1252")
check_date_beg_18thBT <- sapply(mp_wiki_old_dates_18thBT, ">", ymd("2013-09-22"))
pos_old_link_beg_18thBT <- sapply(check_date_beg_18thBT, which.last) # find last "TRUE" value (= first edit after election)
mp_wiki_old_links_beg_18thBT <- unlist(Map("[", mp_wiki_old_links_18thBT, pos_old_link_beg_18thBT))
mp_wiki_old_links_beg_18thBT <- as.list(str_c("https://de.wikipedia.org/w/", mp_wiki_old_links_beg_18thBT))
idx_nolink_beg_18thBT <- !(sapply(pos_old_link_beg_18thBT, length))
idx_nolink_beg_18thBT <- which(idx_nolink_beg_18thBT, TRUE)

# links to MPs' Wikipedia pages - 16th BT (at the end of the term) ----------------------
check_date_end_16thBT <- sapply(mp_wiki_old_dates_16thBT, "<", ymd("2009-09-28"))
pos_old_link_end_16thBT <- sapply(check_date_end_16thBT, which.first) # find first "TRUE" value (= last edit at/befor election)
mp_wiki_old_links_end_16thBT <- unlist(Map("[", mp_wiki_old_links_16thBT, pos_old_link_end_16thBT))
mp_wiki_old_links_end_16thBT <- as.list(str_c("https://de.wikipedia.org/w/", mp_wiki_old_links_end_16thBT))
idx_nolink_end_16thBT <- !(sapply(pos_old_link_end_16thBT, length))
idx_nolink_end_16thBT <- which(idx_nolink_end_16thBT, TRUE)

# links to MPs' Wikipedia pages - 17th BT (at the end of the term) ----------------------
check_date_end_17thBT <- sapply(mp_wiki_old_dates_17thBT, "<", ymd("2013-09-23"))
pos_old_link_end_17thBT <- sapply(check_date_end_17thBT, which.first) # find first "TRUE" value (= last edit at/before election)
mp_wiki_old_links_end_17thBT <- unlist(Map("[", mp_wiki_old_links_17thBT, pos_old_link_end_17thBT))
mp_wiki_old_links_end_17thBT <- as.list(str_c("https://de.wikipedia.org/w/", mp_wiki_old_links_end_17thBT))

# links to MPs' Wikipedia pages - 18th BT (at the end of the data collection process) ---
check_date_end_18thBT <- sapply(mp_wiki_old_dates_18thBT, "<", ymd("2015-10-16"))
pos_old_link_end_18thBT <- sapply(check_date_end_18thBT, which.first) # find first "TRUE" value (= last edit occuring during data collection)
mp_wiki_old_links_end_18thBT <- unlist(Map("[", mp_wiki_old_links_18thBT, pos_old_link_end_18thBT))
mp_wiki_old_links_end_18thBT <- as.list(str_c("https://de.wikipedia.org/w/", mp_wiki_old_links_end_18thBT))


### DOWNLOAD OF MPs OLD WIKIPEDIA PAGES =================================================

# MPs' Wikipedia page htmls - 16th BT (at the beginning of the term) --------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(mp_wiki_old_links_beg_16thBT, dlRevHistHtmls, folder = "./htmls/htmlwiki16thBTbeg")

# MPs' Wikipedia page htmls - 16th BT (at the end of the term) --------------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(mp_wiki_old_links_end_16thBT, dlRevHistHtmls, folder = "./htmls/htmlwiki16thBTend")

# MPs' Wikipedia page htmls - 17th BT (at the beginning of the term) --------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(mp_wiki_old_links_beg_17thBT, dlRevHistHtmls, folder = "./htmls/htmlwiki17thBTbeg")

# MPs' Wikipedia page htmls - 17th BT (at the end of the term) --------------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(mp_wiki_old_links_end_17thBT, dlRevHistHtmls, folder = "./htmls/htmlwiki17thBTend")

# MPs' Wikipedia page htmls - 18th BT (at the beginning of the term) --------------------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(mp_wiki_old_links_beg_18thBT, dlRevHistHtmls, folder = "./htmls/htmlwiki18thBTbeg")

# MPs' Wikipedia page htmls - 18th BT (at the end of the data collection process) -------
signatures = system.file("CurlSSL", "cacert.pem", package = "RCurl")
l_ply(mp_wiki_old_links_end_18thBT, dlRevHistHtmls, folder = "./htmls/htmlwiki18thBTend")
