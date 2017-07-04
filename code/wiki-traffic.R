# ---------------------------------------------------------------------------------------
# POLITICAL ADVERTISING ON THE WIKIPEDIA MARKETPLACE OF INFORMATION
# Sascha Göbel and Simon Munzert
# Wikipedia traffic statistics script
# November 2015
# ---------------------------------------------------------------------------------------

# imports -------------------------------------------------------------------------------
c("names_district-list_MPs.RData")

# exports -------------------------------------------------------------------------------
c("pageviews.RData")


#### PREPARATIONS =======================================================================

# load packages -------------------------------------------------------------------------
library(plyr)
library(rvest)
library(stringr)
library(XML)
library(wikipediatrend)
library(dplyr)
library(zoo)
library(lubridate)
library(xts)


#### EXTRACT LINKS TO MPs WIKIPEDIA PAGES ===============================================

# links to MPs' Wikipedia pages - 16th BT -----------------------------------------------
mp_wiki_list_url_16thBT <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(16._Wahlperiode)"
mp_wiki_list_parsed_16thBT <- read_html(mp_wiki_list_url_16thBT, encoding = "UTF-8")
mp_wiki_links_16thBT <- html_nodes(mp_wiki_list_parsed_16thBT, xpath = "//table[2]//tr/td[1]/a/@href")
mp_wiki_links_16thBT <- html_text(mp_wiki_links_16thBT)
mp_wiki_links_16thBT <- basename(mp_wiki_links_16thBT)

# links to MPs' Wikipedia pages - 17th BT -----------------------------------------------
mp_wiki_list_url_17thBT <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(17._Wahlperiode)"
mp_wiki_list_parsed_17thBT <- read_html(mp_wiki_list_url_17thBT, encoding = "UTF-8")
mp_wiki_links_17thBT <- html_nodes(mp_wiki_list_parsed_17thBT, xpath = "//table[2]//tr/td[1]/a/@href")
mp_wiki_links_17thBT <- html_text(mp_wiki_links_17thBT)
mp_wiki_links_17thBT <- basename(mp_wiki_links_17thBT)

# links to MPs' Wikipedia pages - 18th BT -----------------------------------------------
mp_wiki_list_url_18thBT <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(18._Wahlperiode)"
mp_wiki_list_parsed_18thBT <- read_html(mp_wiki_list_url_18thBT, encoding = "UTF-8")
mp_wiki_links_18thBT <- html_nodes(mp_wiki_list_parsed_18thBT, xpath = "//table[2]//tr/td[1]/a/@href")
mp_wiki_links_18thBT <- html_text(mp_wiki_links_18thBT)
mp_wiki_links_18thBT <- basename(mp_wiki_links_18thBT)

mp_wiki_links <- unique(c(mp_wiki_links_16thBT, mp_wiki_links_17thBT, mp_wiki_links_18thBT))
mp_wiki_links[str_detect(mp_wiki_links, fixed("index.php?title=Petra_Rode-Bosse"))] <- "Petra_Rode-Bosse"


#### DOWNLOAD WIKIPEDIA TRAFFIC STATISTICS ==============================================

# retrieve statistics with wikipediatrend package, store them as csv --------------------
wiki_ger <- list()
wiki_filenames_raw <- vector()
for (i in mp_wiki_links) {
  folder <- "../data/wikipediatrend/"
  filename <- paste0("wp_", i, "_de.csv")
  if (!file.exists(paste0(folder, filename))) {
    wiki_ger[[i]] <- wp_trend(i, from = "2008-01-01", to = "2015-11-11", lang = "de")
    write.csv(wiki_ger[[i]], file = paste0(folder, filename), row.names = FALSE)    
  }
  wiki_filenames_raw[i] <- filename
}

# import downloaded data ----------------------------------------------------------------
#wiki_files <- list.files("../data/wikipediatrend", full.names = TRUE)
wiki_files <- paste0("../data/wikipediatrend/", wiki_filenames_raw)
wiki_filenames <- basename(wiki_files) %>% str_replace("\\.csv", "") %>% str_replace("wp_", "") %>% str_replace("_de", "")
wiki_ger <- list()
for (i in seq_along(wiki_files)) {
  foo <- read.csv(wiki_files[i])
  dat <- select(foo, date, count)
  names(dat) <- c("date", wiki_filenames[i])
  dat$date <- wp_date(dat$date)
  wiki_ger[[i]] <- dat 
}

# generate data frame -------------------------------------------------------------------
wiki_ger_df <- join_all(wiki_ger, by = 'date', type = 'full')
wiki_ger_df <- arrange(wiki_ger_df, date)
wiki_ger_df <- filter(wiki_ger_df, date >= "2008-02-01")

# impute missing data by carrying valid observations forward and backward ---------------
wiki_ger_df[wiki_ger_df==0] <- NA
wiki_ger_df <- na.locf(wiki_ger_df, na.rm = FALSE)
wiki_ger_df[is.na(wiki_ger_df)] <- 0 # set leading NAs (`page did not exist yet') zero
cols_num <- names(wiki_ger_df)[!(names(wiki_ger_df) %in% "date")]
wiki_ger_df[cols_num] <- sapply(wiki_ger_df[cols_num],as.numeric)

# declare date variable -----------------------------------------------------------------
wiki_ger_df$date <- ymd(wiki_ger_df$date)

# save data.frame -----------------------------------------------------------------------
save(wiki_ger_df, file = "pageviews.RData")

# import data.frame ---------------------------------------------------------------------
load("pageviews.RData")

# import names of direct/list MPs -------------------------------------------------------
load("names_district-list_MPs.RData")


#### SUMMARY STATISTICS =================================================================

# generate vector of arcticle names (without the date variable) -------------------------
article_names_ger <- names(wiki_ger_df)
wiki_ger_df_red <- wiki_ger_df[,-1]

# generate indicator of popularity (more than 50 daily views on average) ----------------
wiki_views_means <- colMeans(wiki_ger_df[,article_names_ger])
wiki_views_50plus <- wiki_views_means > 50
table(wiki_views_50plus)

# generate aggregated popularity data frames --------------------------------------------
wiki_ger_df_agg_vips <- data.frame(wiki_agg = rowSums(wiki_ger_df_red[,wiki_views_50plus]))
wiki_ger_df_agg_novips <- data.frame(wiki_agg = rowSums(wiki_ger_df_red[,wiki_views_50plus != TRUE]))

# generate list/direct data frames ------------------------------------------------------
wiki_ger_df_names <- wiki_ger_df_red[,wiki_views_50plus != TRUE]
names(wiki_ger_df_names) <- names(wiki_ger_df_names) %>% str_replace("_\\(.*$", "") %>% str_replace_all("_", " ") %>% str_replace_all("%C3%A4", "a")  %>% str_replace_all("%C3%B6", "ö")  %>% str_replace_all("%C3%BC", "ü")  %>% str_replace_all("%C3%96", "Ö")  %>%  str_replace_all("%C3%9F", "ß")   %>%  str_replace_all("%C3%A9", "é")  %>%  str_replace_all("%C3%A8", "è")  %>%  str_replace_all("%C4%B1", "i") %>%  str_replace_all("%C5%A1", "s") %>%  str_replace_all("%C4%87", "c") %>%  str_replace_all("%C4%9F", "g")
wiki_ger_df_names <- wiki_ger_df_names[, !duplicated(colnames(wiki_ger_df_names))]
wiki_ger_df_names[,1] <- wiki_ger_df$date
names(wiki_ger_df_names)[1] <- "date"

wiki_ger_df_names_16th <- filter(wiki_ger_df_names, date <= ymd("2009-09-27"))
wiki_ger_df_names_17th <- filter(wiki_ger_df_names, date > ymd("2009-09-27"), date <= ymd("2013-09-22"))
wiki_ger_df_names_18th <- filter(wiki_ger_df_names, date > ymd("2013-09-22"))
wiki_ger_df_names_16th <- wiki_ger_df_names_16th[,-1]
wiki_ger_df_names_17th <- wiki_ger_df_names_17th[,-1]
wiki_ger_df_names_18th <- wiki_ger_df_names_18th[,-1]

wiki_ger_df_agg_direct_16th <- data.frame(wiki_agg = rowSums(wiki_ger_df_names_16th[,intersect(names(wiki_ger_df_names), names_district_16th)]))
wiki_ger_df_agg_direct_17th <- data.frame(wiki_agg = rowSums(wiki_ger_df_names_17th[,intersect(names(wiki_ger_df_names), names_district_17th)]))
wiki_ger_df_agg_direct_18th <- data.frame(wiki_agg = rowSums(wiki_ger_df_names_18th[,intersect(names(wiki_ger_df_names), names_district_18th)]))

wiki_ger_df_agg_list_16th <- data.frame(wiki_agg = rowSums(wiki_ger_df_names_16th[,intersect(names(wiki_ger_df_names), names_list_16th)]))
wiki_ger_df_agg_list_17th <- data.frame(wiki_agg = rowSums(wiki_ger_df_names_17th[,intersect(names(wiki_ger_df_names), names_list_17th)]))
wiki_ger_df_agg_list_18th <- data.frame(wiki_agg = rowSums(wiki_ger_df_names_18th[,intersect(names(wiki_ger_df_names), names_list_18th)]))

wiki_ger_df_agg_direct <- rbind(wiki_ger_df_agg_direct_16th, wiki_ger_df_agg_direct_17th, wiki_ger_df_agg_direct_18th)
wiki_ger_df_agg_list <- rbind(wiki_ger_df_agg_list_16th, wiki_ger_df_agg_list_17th, wiki_ger_df_agg_list_18th)


#### GENERATE DAILY AND WEEKLY TIME SERIES ==============================================

# generate aggregated time series -------------------------------------------------------
wiki_ger_df_agg <- data.frame(wiki_agg = rowSums(wiki_ger_df[,article_names_ger]))

wiki_ger_xts_daily <- xts(wiki_ger_df, wiki_ger_df$date)
wiki_ger_xts_daily <- wiki_ger_xts_daily[,-1]

wiki_ger_xts_daily_agg <- xts(wiki_ger_df_agg , wiki_ger_df$date)
wiki_ger_weekly_agg  <- apply(wiki_ger_xts_daily_agg , 2, apply.weekly, sum)
weeks_dates <- apply.weekly(wiki_ger_df$date, sum) %>% index()
wiki_ger_xts_weekly_agg  <- xts(wiki_ger_weekly_agg , weeks_dates)

wiki_ger_xts_daily_agg_vips <- xts(wiki_ger_df_agg_vips , wiki_ger_df$date)
wiki_ger_weekly_agg_vips  <- apply(wiki_ger_xts_daily_agg_vips , 2, apply.weekly, sum)
weeks_dates <- apply.weekly(wiki_ger_df$date, sum) %>% index()
wiki_ger_xts_weekly_agg_vips  <- xts(wiki_ger_weekly_agg_vips , weeks_dates)

wiki_ger_xts_daily_agg_novips <- xts(wiki_ger_df_agg_novips , wiki_ger_df$date)
wiki_ger_weekly_agg_novips  <- apply(wiki_ger_xts_daily_agg_novips , 2, apply.weekly, sum)
weeks_dates <- apply.weekly(wiki_ger_df$date, sum) %>% index()
wiki_ger_xts_weekly_agg_novips  <- xts(wiki_ger_weekly_agg_novips , weeks_dates)

wiki_ger_xts_daily_agg_direct <- xts(wiki_ger_df_agg_direct , wiki_ger_df$date)
wiki_ger_weekly_agg_direct  <- apply(wiki_ger_xts_daily_agg_direct , 2, apply.weekly, sum)
weeks_dates <- apply.weekly(wiki_ger_df$date, sum) %>% index()
wiki_ger_xts_weekly_agg_direct  <- xts(wiki_ger_weekly_agg_direct , weeks_dates)

wiki_ger_xts_daily_agg_list <- xts(wiki_ger_df_agg_list , wiki_ger_df$date)
wiki_ger_weekly_agg_list  <- apply(wiki_ger_xts_daily_agg_list , 2, apply.weekly, sum)
weeks_dates <- apply.weekly(wiki_ger_df$date, sum) %>% index()
wiki_ger_xts_weekly_agg_list  <- xts(wiki_ger_weekly_agg_list , weeks_dates)

# set date range ------------------------------------------------------------------------
dates <- seq(ymd('2007-01-01'), ymd('2016-01-01'), by = '1 year')
election.dates <- ymd(c("2009-09-27", "2013-09-22"))
volume_agg <- seq(0, max(wiki_ger_xts_weekly_agg), 25E4)
volume_agg_vips <- seq(0, max(wiki_ger_xts_weekly_agg_vips) + 25E4, 25E4)
volume_agg_novips <- seq(0, max(wiki_ger_xts_weekly_agg_novips) + 50E3, 50E3)
volume_agg_direct <- seq(0, max(wiki_ger_xts_weekly_agg_direct) + 10E3, 20E3)
volume_agg_list <- seq(0, max(wiki_ger_xts_weekly_agg_list) + 10E3, 20E3)

# plot aggregated wiki views, by popularity ---------------------------------------------
pdf(file="../figures/wiki_views_pop_ts.pdf", height=9, width=9, family="URWTimes")
par(mar=c(0,3,3,.6) + 0.1)     # b, l, t, r
par(oma=c(0,0,0,0)+.1)
par(xaxs = "i", yaxs = "i")
par(mfrow = c(3, 1))
# plot time series, all MPs
plot.xts(wiki_ger_xts_weekly_agg,
         main = "", 
         ylim = c(0, max(wiki_ger_xts_weekly_agg) + 23E4), 
         xlim = c(ymd('2008-01-01'), ymd('2016-01-01')),
         xaxt="n", yaxt = "n",
         auto.grid = FALSE)
abline(v=dates, col="darkgrey", lty=2)
abline(h=volume_agg, col="darkgrey", lty=2)
abline(v=election.dates, col="red", lty=1)
#axis(1, at=dates, labels=year(dates), tick=T)
axis(2, at=volume_agg, labels=paste0(volume_agg/1000, "K"), tick=T)
title(main="(a) All MPs (n = 1100)", sub="", 
      xlab="", ylab="")
axis(2, at = mean(c(0, max(wiki_ger_xts_weekly_agg))), labels = "Aggregated views", tick = F, line = 1.2)
lines(wiki_ger_xts_weekly_agg)
# label all weeks with more than 500,000 views on average
# 1. Heilmann affair
pos <- c(as.numeric(as.POSIXct("2008-11-15", format = "%Y-%m-%d", tz = "UTC")), 960000)
text(pos[1], pos[2], "1", cex = 2) 
points(pos[1], pos[2], pch=1, cex = 4)
# 2. Guttenberg demission
pos <- c(as.numeric(as.POSIXct("2011-03-01", format = "%Y-%m-%d", tz = "UTC")), 1410000) # four days actually, 16.2., 20.2., 27.2., and 6.3
text(pos[1], pos[2], "2", cex = 2)  
points(pos[1], pos[2], pch=1, cex = 4)
# 3. Schavan demission
pos <- c(as.numeric(as.POSIXct("2013-02-10", format = "%Y-%m-%d", tz = "UTC")), 760000)
text(pos[1], pos[2], "3", cex = 2) 
points(pos[1], pos[2], pch=1, cex = 4)
# 4. Merkel cabinet appointments
pos <- c(as.numeric(as.POSIXct("2013-12-15", format = "%Y-%m-%d", tz = "UTC")), 650000)
text(pos[1], pos[2], "4", cex = 2)  
points(pos[1], pos[2], pch=1, cex = 4)  
# 5. Friedrich demission  
pos <- c(as.numeric(as.POSIXct("2014-02-16", format = "%Y-%m-%d", tz = "UTC")), 760000)
text(pos[1], pos[2], "5", cex = 2)  
points(pos[1], pos[2], pch=1, cex = 4)    
#   legend("topright",
#          c("1. Heilmann affair", "2. Guttenberg demission", "3. Schavan demission" ,"4. Merkel cabinet appointments","5. Friedrich demission", "Federal election dates"),
#          lty = c(1, 1, 1, 1, 1, 1),
#          lwd = c(0, 0, 0, 0, 0, 1),
#          cex = .8,
#          bg = "white", seg.len=c(0, 0, 0, 0, 0, .8),
#          col = c("white", "white", "white", "white", "white", "red"))

# separate by popularity
# separate by candidate status

# 1. Heilmann affair: http://www.spiegel.de/netzwelt/web/umstrittener-eintrag-linke-politiker-laesst-wikipedia-de-sperren-a-590643.html
# 2. Guttenberg demission: http://www.spiegel.de/politik/deutschland/guttenberg-ruecktritt-copy-paste-delete-a-746260.html
# 3. Schavan demission: https://de.wikipedia.org/wiki/Annette_Schavan#Aberkennung_des_Doktorgrads_und_R.C3.BCcktritt
# 4. Merkel cabinet appointments: http://www.sueddeutsche.de/politik/grosse-koalition-der-neue-zuschnitt-der-ministerien-1.1844102
# 5. Friedrich demission (Edathy affair): https://de.wikipedia.org/wiki/Edathy-Aff%C3%A4re

# plot time series, VIP vs. non VIP MPs -------------------------------------------------
plot.xts(wiki_ger_xts_weekly_agg_vips, bar.col = "white",
         main = "(b) Popular MPs (black) vs. non-popular (grey) MPs", 
         ylim = c(0, max(wiki_ger_xts_weekly_agg_vips) + 10E4), 
         xlim = c(ymd('2008-01-01'), ymd('2016-01-01')),
         xaxt="n", yaxt = "n",
         auto.grid = FALSE)
abline(v=dates, col="darkgrey", lty=2)
abline(h=volume_agg_vips, col="darkgrey", lty=2)
abline(v=election.dates, col="red", lty=1)
#axis(1, at=dates, labels=year(dates), tick=T)
axis(2, at=volume_agg_vips, labels=paste0(volume_agg_vips/1000, "K"), tick=T)
axis(2, at = mean(c(0, max(wiki_ger_xts_weekly_agg_vips))), labels = "Aggregated views", tick = F, line = 1.2)
lines(wiki_ger_xts_weekly_agg_vips, col = "black")
lines(wiki_ger_xts_weekly_agg_novips, col = "darkgrey")

# # plot time series, no VIP MPs
# plot.xts(wiki_ger_xts_weekly_agg_novips,
#          main = "(c) Non-popular MPs (n = 1007)", 
#          ylim = c(0, max(wiki_ger_xts_weekly_agg_novips) + 5E4), 
#          xlim = c(ymd('2008-01-01'), ymd('2016-01-01')),
#          xaxt="n", yaxt = "n",
#          auto.grid = FALSE)
# abline(v=dates, col="darkgrey", lty=2)
# abline(h=volume_agg_novips, col="darkgrey", lty=2)
# abline(v=election.dates, col="red", lty=1)
# #axis(1, at=dates, labels=year(dates), tick=T)
# axis(2, at=volume_agg_novips, labels=paste0(volume_agg_novips/1000, "K"), tick=T)
# axis(2, at = mean(c(0, max(wiki_ger_xts_weekly_agg_novips))), labels = "Aggregated views", tick = F, line = 1.2)
# lines(wiki_ger_xts_weekly_agg_novips)

# # plot time series, direct MPs
# plot.xts(wiki_ger_xts_weekly_agg_direct,
#          main = "(d) Direct (non-popular) MPs (n = 299)", 
#          ylim = c(0, max(wiki_ger_xts_weekly_agg_direct) + 5E2), 
#          xlim = c(ymd('2008-01-01'), ymd('2016-01-01')),
#          xaxt="n", yaxt = "n",
#          auto.grid = FALSE)
# abline(v=dates, col="darkgrey", lty=2)
# abline(h=volume_agg_direct, col="darkgrey", lty=2)
# abline(v=election.dates, col="red", lty=1)
# #axis(1, at=dates, labels=year(dates), tick=T)
# axis(2, at=volume_agg_direct, labels=paste0(volume_agg_direct/1000, "K"), tick=T)
# axis(2, at = mean(c(0, max(wiki_ger_xts_weekly_agg_direct))), labels = "Aggregated views", tick = F, line = 1.2)
# lines(wiki_ger_xts_weekly_agg_direct)
# par(mar=c(3,3,3,.6) + 0.1)

# plot time series, direct vs. list MPs -------------------------------------------------
plot.xts(wiki_ger_xts_weekly_agg_list, bar.col = "white",
         main = "(c) Direct (black) vs. List (grey) non-popular MPs", 
         ylim = c(0, max(wiki_ger_xts_weekly_agg_list) + 5E2), 
         xlim = c(ymd('2008-01-01'), ymd('2016-01-01')),
         xaxt="n", yaxt = "n",
         auto.grid = FALSE)
abline(v=dates, col="darkgrey", lty=2)
abline(h=volume_agg_list, col="darkgrey", lty=2)
abline(v=election.dates, col="red", lty=1)
axis(1, at=dates, labels=year(dates), tick=T)
axis(2, at=volume_agg_list, labels=paste0(volume_agg_list/1000, "K"), tick=T)
axis(2, at = mean(c(0, max(wiki_ger_xts_weekly_agg_list))), labels = "Aggregated views", tick = F, line = 1.2)
lines(wiki_ger_xts_weekly_agg_list, col = "darkgrey")
lines(wiki_ger_xts_weekly_agg_direct, col = "black")
dev.off()