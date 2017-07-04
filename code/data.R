# ---------------------------------------------------------------------------------------
# POLITICAL ADVERTISING ON THE WIKIPEDIA MARKETPLACE OF INFORMATION
# Sascha Göbel and Simon Munzert
# Data processing script
# November 2015
# ---------------------------------------------------------------------------------------

# imports -------------------------------------------------------------------------------
c("./htmls/htmlbt16th/*.html", "./htmls/htmlbt17th/*.html", "./htmls/htmlbt18th/*.html",
  "./htmls/htmlrevh16thBT/*.html", "./htmls/htmlrevh17thBT/*.html", 
  "./htmls/htmlrevh18thBT/*.html", "./htmls/htmlwiki16thBT/*.html",
  "./htmls/htmlwiki17thBT/*.html", "./htmls/htmlwiki18thBT/*.html",
  "./htmls/htmlwiki16thBTbeg/*.html", "./htmls/htmlwiki17thBTbeg/*.html",
  "./htmls/htmlwiki18thBTbeg/*.html", "./htmls/htmlwiki16thBTend/*.html",
  "./htmls/htmlwiki17thBTend/*.html", "./htmls/htmlwiki18thBTend/*.html")

# exports -------------------------------------------------------------------------------
c("./data/data_combined.dta", "./data/data16th.dta", "./data/data17th.dta",
  "./data/data18th.dta")


#### PREPARATIONS =======================================================================

# load packages -------------------------------------------------------------------------
library(eeptools)
library(foreign)
library(gdata)
library(plyr)
library(RCurl)
library(rvest) # note that this code is based on rvest version 0.2.0
library(stringr)
library(XML)

# load functions ------------------------------------------------------------------------
source("./code/functions.R")


#### DATA GENERATION FROM WIKIPEDIA LISTS ===============================================

# MPs' names on Wikipedia List - 16th BT ------------------------------------------------
html_mplist16th <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(16._Wahlperiode)"
html_mplist16th <- html(html_mplist16th, encoding = "UTF-8")
names_wiki_list16th <- xpathSApply(html_mplist16th, "//table[2]/tr/td[1]/a", xmlValue)
names_wiki_list16th <- str_replace(names_wiki_list16th, "Andrea Voßhoff", "Andrea Astrid Voßhoff")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Axel Fischer", "Axel E. Fischer")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Cajus Julius Caesar", "Cajus Caesar")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Carl-Eduard von Bismarck", "Carl Eduard von Bismarck")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Christian von Stetten", "Christian Freiherr von Stetten")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Edmund Geisen", "Edmund Peter Geisen")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Eike Hovermann", "Eike Anna Maria Hovermann")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Elvira Drobinski-Weiß", "Elvira Drobinski-Weiss")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Gerd Bollmann", "Gerd Friedrich Bollmann")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Hakk. Keskin", "Hakki Keskin")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Heidemarie Wright", "Heidi Wright")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Johannes Pflug", "Johannes Andreas Pflug")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Joschka Fischer", "Joseph Fischer")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Josef Winkler", "Josef Philip Winkler")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Karl-Theodor zu Guttenberg", "Karl-Theodor Freiherr zu Guttenberg")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Klaus Lippold", "Klaus W. Lippold")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Kurt Rossmanith", "Kurt J. Rossmanith")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Manfred Zöllmer", "Manfred Helmut Zöllmer")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Maximilian Lehmer", "Max Lehmer")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Paul Friedhoff", "Paul K. Friedhoff")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Susanne Jaffke", "Susanne Jaffke-Witt")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Volkmar Vogel", "Volkmar Uwe Vogel")
names_wiki_list16th <- str_replace(names_wiki_list16th, "Wolfgang Ne.kovi.", "Wolfgang Neskovic")
head(names_wiki_list16th)

# MPs' names on Wikipedia List - 17th BT ------------------------------------------------
html_mplist17th <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(17._Wahlperiode)"
html_mplist17th <- html(html_mplist17th, encoding = "UTF-8")
names_wiki_list17th <- xpathSApply(html_mplist17th, "//table[2]/tr/td[1]/a", xmlValue)
names_wiki_list17th <- str_replace(names_wiki_list17th, "Agnieszka Brugger", "Agnes Brugger")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Andreas Lämmel", "Andreas G. Lämmel")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Axel Fischer", "Axel E. Fischer")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Aydan Özo.uz", "Aydan Özoguz")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Cajus Julius Caesar", "Cajus Caesar")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Christian von Stetten", "Christian Freiherr von Stetten")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Dagmar Wöhrl", "Dagmar G. Wöhrl")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Edmund Geisen", "Edmund Peter Geisen")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Elisabeth Paus", "Lisa Paus")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Gabi Molitor", "Gabriele Molitor")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Ingrid Remmers", "Ingrid Lieselotte Remmers")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Josef Winkler", "Josef Philip Winkler")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Karl-Theodor zu Guttenberg", "Karl-Theodor Freiherr zu Guttenberg")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Luc Jochimsen", "Lukrezia Jochimsen")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Manfred Zöllmer", "Manfred Helmut Zöllmer")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Matthias Birkwald", "Matthias W. Birkwald")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Maximilian Lehmer", "Max Lehmer")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Memet K.l..", "Memet Kilic")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Michael Georg Link", "Michael Link")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Michael Groß", "Michael Peter Groß")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Patrick Ernst Sensburg", "Patrick Sensburg")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Paul Friedhoff", "Paul K. Friedhoff")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Peter Wichtel", "Heinz Peter Wichtel")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Sabine Stüber", "Sabine Ursula Stüber")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Sevim Da.delen", "Sevim Dagdelen")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Sonja Steffen", "Sonja Amalie Steffen")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Ursula Lötzer", "Ulla Lötzer")
names_wiki_list17th <- str_replace(names_wiki_list17th, "Wolfgang Ne.kovi.", "Wolfgang Neskovic")
head(names_wiki_list17th)

# MPs' names on Wikipedia List - 18th BT ------------------------------------------------
html_mplist18th <- "https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Deutschen_Bundestages_(18._Wahlperiode)"
html_mplist18th <- html(html_mplist18th, encoding = "UTF-8")
names_wiki_list18th <- xpathSApply(html_mplist18th, "//table[2]/tr/td[1]/a", xmlValue)
names_wiki_list18th <- str_replace(names_wiki_list18th, "Matthias Birkwald", "Matthias W. Birkwald")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Cajus Julius Caesar", "Cajus Caesar")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Sevim Da.delen", "Sevim Dagdelen")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Michaela Engelmeier-Heite", "Michaela Engelmeier")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Mark Andr. Helfrich", "Mark Helfrich")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Axel Fischer", "Axel E. Fischer")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Charles M. Huber", "Karl-Heinz Huber")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Axel Fischer", "Axel E. Fischer")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Andreas Lämmel", "Andreas G. Lämmel")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Philipp Graf von und zu Lerchenfeld", "Philipp Graf Lerchenfeld")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Elisabeth Charlotte Motschmann", "Elisabeth Motschmann")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Alexander Neu", "Alexander S. Neu")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Elisabeth Paus", "Lisa Paus")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Alois Georg Josef Rainer", "Alois Rainer")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Ursula Schauws", "Ulle Schauws")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Patrick Ernst Sensburg", "Patrick Sensburg")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Christian von Stetten", "Christian Freiherr von Stetten")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Volker Michael Ullrich", "Volker Ullrich")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Dagmar Wöhrl", "Dagmar G. Wöhrl")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Pia-Beate Zimmermann", "Pia Zimmermann")
names_wiki_list18th <- str_replace(names_wiki_list18th, "Aydan Özo.uz", "Aydan Özoguz")
names_wiki_list18th <- names_wiki_list18th[-457] # Petra Rode-Bosse (entered after other data ends)
head(names_wiki_list18th)

# MPs' names on Wikipedia Pages - 16th BT -----------------------------------------------
names_wiki_pages16th <- as.character(extNamesRevHist(folder = "./htmls/htmlwiki16thBT"))
names_wiki_pages16th <- str_replace_all(names_wiki_pages16th, " \\(.+", "")
names_wiki_pages16th <- str_replace_all(names_wiki_pages16th, "\\\u009a", "s")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Maximilian Lehmer", "Max Lehmer")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Volkmar Vogel", "Volkmar Uwe Vogel")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Sabine Bätzing-Lichtenthäler", "Sabine Bätzing")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Paul Friedhoff", "Paul K. Friedhoff")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Manfred Zöllmer", "Manfred Helmut Zöllmer")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Luc Jochimsen", "Lukrezia Jochimsen")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Kurt Rossmanith", "Kurt J. Rossmanith")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Klaus Lippold", "Klaus W. Lippold")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Karl-Theodor zu Guttenberg", "Karl-Theodor Freiherr zu Guttenberg")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Joschka Fischer", "Joseph Fischer")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Josef Winkler", "Josef Philip Winkler")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Johannes Pflug", "Johannes Andreas Pflug")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Heidemarie Wright", "Heidi Wright")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Grietje Staffelt Bettin", "Kersten Naumann")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Gerd Bollmann", "Gerd Friedrich Bollmann")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Elvira Drobinski-Weiß", "Elvira Drobinski-Weiss")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Eike Hovermann", "Eike Anna Maria Hovermann")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Edmund Geisen", "Edmund Peter Geisen")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Christian von Stetten", "Christian Freiherr von Stetten")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Carl-Eduard von Bismarck", "Carl Eduard von Bismarck")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Axel Fischer", "Axel E. Fischer")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Andrea Voßhoff", "Andrea Astrid Voßhoff")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Kristina Schröder", "Kristina Köhler")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Daniela Ludwig", "Daniela Raab")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Susanne Jaffke", "Susanne Jaffke-Witt")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Kersten Steinke", "Kersten Naumann")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Cajus Julius Caesar", "Cajus Caesar")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Ursula Heinen-Esser", "Ursula Heinen")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Ursula Lötzer", "Ulla Lötzer")
names_wiki_pages16th <- str_replace(names_wiki_pages16th, "Hüseyin Kenan Aydin", "Hüseyin-Kenan Aydin")
head(names_wiki_pages16th)

# MPs' names on Wikipedia Pages - 17th BT -----------------------------------------------
names_wiki_pages17th <- as.character(extNamesRevHist(folder = "./htmls/htmlwiki17thBT"))
names_wiki_pages17th <- str_replace_all(names_wiki_pages17th, " \\(.+", "")
names_wiki_pages17th <- str_replace_all(names_wiki_pages17th, "\\\u009a", "s")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Agnieszka", "Agnes")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Andrea Voßhoff", "Andrea Astrid Voßhoff")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Andreas Lämmel", "Andreas G. Lämmel")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Axel Fischer", "Axel E. Fischer")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Cajus Julius Caesar", "Cajus Caesar")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Christian von Stetten", "Christian Freiherr von Stetten")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Dagmar Wöhrl", "Dagmar G. Wöhrl")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Edmund Geisen", "Edmund Peter Geisen")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Gabi Molitor", "Gabriele Molitor")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Ingrid Remmers", "Ingrid Lieselotte Remmers")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Josef Winkler", "Josef Philip Winkler")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Karl-Theodor zu Guttenberg", "Karl-Theodor Freiherr zu Guttenberg")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Luc Jochimsen", "Lukrezia Jochimsen")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Manfred Zöllmer", "Manfred Helmut Zöllmer")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Maximilian Lehmer", "Max Lehmer")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Michael Georg Link", "Michael Link")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Michael Groß", "Michael Peter Groß")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Paul Friedhoff", "Paul K. Friedhoff")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Kiliç", "Kilic")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Peter Wichtel", "Heinz Peter Wichtel")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Sabine Stüber", "Sabine Ursula Stüber")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Sonja Steffen", "Sonja Amalie Steffen")
names_wiki_pages17th <- str_replace(names_wiki_pages17th, "Ursula Lötzer", "Ulla Lötzer")
head(names_wiki_pages17th)

# MPs' names on Wikipedia Pages - 18th BT -----------------------------------------------
names_wiki_pages18th <- as.character(extNamesRevHist(folder = "./htmls/htmlwiki18thBT"))
names_wiki_pages18th <- str_replace_all(names_wiki_pages18th, " \\(.+", "")
names_wiki_pages18th <- str_replace(names_wiki_pages18th, "Alexander Neu", "Alexander S. Neu")
names_wiki_pages18th <- str_replace(names_wiki_pages18th, "Andreas Lämmel", "Andreas G. Lämmel")
names_wiki_pages18th <- str_replace(names_wiki_pages18th, "Axel Fischer", "Axel E. Fischer")
names_wiki_pages18th <- str_replace(names_wiki_pages18th, "Cajus Julius Caesar", "Cajus Caesar")
names_wiki_pages18th <- str_replace(names_wiki_pages18th, "Charles M. Huber", "Karl-Heinz Huber")
names_wiki_pages18th <- str_replace(names_wiki_pages18th, "Christian von Stetten", "Christian Freiherr von Stetten")
names_wiki_pages18th <- str_replace(names_wiki_pages18th, "Dagmar Wöhrl", "Dagmar G. Wöhrl")
head(names_wiki_pages18th)

# MPs' party - 16th BT ------------------------------------------------------------------
mp_party16th <- xpathSApply(html_mplist16th, "//table[2]/tr/td[3]", xmlValue)
head(mp_party16th)

# MPs' party - 17th BT ------------------------------------------------------------------
mp_party17th <- xpathSApply(html_mplist17th, "//table[2]/tr/td[3]", xmlValue)
mp_party17th <- str_replace_all(mp_party17th, "DIE LINKE", "Die Linke")
mp_party17th <- str_replace_all(mp_party17th, "GRÜNE", "Bündnis 90/Die Grünen")
head(mp_party17th)

# MPs' party - 18th BT ------------------------------------------------------------------
mp_party18th <- xpathSApply(html_mplist18th, "//table[2]/tr/td[3]", xmlValue)
mp_party18th <- mp_party18th[-207] # Peter Hinz, who refused the mandate, removed
mp_party18th <- mp_party18th[-457] # Petra Rode-Bosse removed
mp_party18th <- str_replace_all(mp_party18th, "DIE LINKE", "Die Linke")
mp_party18th <- str_replace_all(mp_party18th, "GRÜNE", "Bündnis 90/Die Grünen")
head(mp_party18th)

# MPs' origin - 16th BT -----------------------------------------------------------------
mp_origin16th <- xpathSApply(html_mplist16th, "//table[2]/tr/td[4]", xmlValue)
mp_origin16th <- str_replace_all(mp_origin16th, "Sachsen-Anhalt|Mecklenburg-Vorpommern|Thüringen|Sachsen|Brandenburg", "east")
mp_origin16th <- str_replace_all(mp_origin16th, "Hamburg|Nordrhein-Westfalen|Rheinland-Pfalz|Niedersachsen|Baden-Württemberg|Schleswig-Holstein|Hessen|Bayern|Berlin|Saarland|Bremen", "west")
head(mp_origin16th)

# MPs' origin - 17th BT -----------------------------------------------------------------
mp_origin17th <- xpathSApply(html_mplist17th, "//table[2]/tr/td[4]", xmlValue)
mp_origin17th <- str_replace_all(mp_origin17th, "Sachsen-Anhalt|Mecklenburg-Vorpommern|Thüringen|Sachsen|Brandenburg", "east")
mp_origin17th <- str_replace_all(mp_origin17th, "Hamburg|Nordrhein-Westfalen|Rheinland-Pfalz|Niedersachsen|Baden-Württemberg|Schleswig-Holstein|Hessen|Bayern|Berlin|Saarland|Bremen", "west")
head(mp_origin17th)

# MPs' origin - 18th BT -----------------------------------------------------------------
mp_origin18th <- xpathSApply(html_mplist18th, "//table[2]/tr/td[4]", xmlValue)
mp_origin18th <- str_replace_all(mp_origin18th, "Sachsen-Anhalt|Mecklenburg-Vorpommern|Thüringen|Sachsen|Brandenburg", "east")
mp_origin18th <- str_replace_all(mp_origin18th, "Hamburg|Nordrhein-Westfalen|Rheinland-Pfalz|Niedersachsen|Baden-Württemberg|Schleswig-Holstein|Hessen|Bayern|Berlin|Saarland|Bremen", "west")
mp_origin18th <- mp_origin18th[-207] # Peter Hinz, who refused the mandate, removed
mp_origin18th <- mp_origin18th[-457] # Peter Hinz, who refused the mandate, removed
head(mp_origin18th)


#### DATA GENERATION FROM WIKIPEDIA PAGES ===============================================

# MPs' age - 16th BT --------------------------------------------------------------------
mp_age16th <- as.character(extPersonal(folder = "./htmls/htmlwiki16thBT"))
mp_age16th <- as.character(str_extract(mp_age16th, "[[:digit:]]+\\..[[:alpha:]]+.[[:digit:]]+"))
mp_age16th <- str_replace_all(mp_age16th, "\\. | ", "")
mp_age16th <- str_replace_all(mp_age16th, "5..Dezember.1971", "5Dezember1971")
mp_age16th <- str_replace_all(mp_age16th, "29März.1963", "29März1963")
mp_age16th <- str_replace_all(mp_age16th, "Januar", "/01/")
mp_age16th <- str_replace_all(mp_age16th, "Februar", "/02/")
mp_age16th <- str_replace_all(mp_age16th, "März", "/03/")
mp_age16th <- str_replace_all(mp_age16th, "April", "/04/")
mp_age16th <- str_replace_all(mp_age16th, "Mai", "/05/")
mp_age16th <- str_replace_all(mp_age16th, "Juni", "/06/")
mp_age16th <- str_replace_all(mp_age16th, "Juli", "/07/")
mp_age16th <- str_replace_all(mp_age16th, "August", "/08/")
mp_age16th <- str_replace_all(mp_age16th, "September", "/09/")
mp_age16th <- str_replace_all(mp_age16th, "Oktober", "/10/")
mp_age16th <- str_replace_all(mp_age16th, "November", "/11/")
mp_age16th <- str_replace_all(mp_age16th, "Dezember", "/12/")
mp_age16th <- as.Date(mp_age16th, "%d/%m/%Y")
mp_age16th <- age_calc(mp_age16th, units = "years")
head(mp_age16th)

# MPs' age - 17th BT --------------------------------------------------------------------
mp_age17th <- as.character(extPersonal(folder = "./htmls/htmlwiki17thBT"))
mp_age17th <- as.character(str_extract(mp_age17th, "[[:digit:]]+\\..[[:alpha:]]+.[[:digit:]]+"))
mp_age17th <- str_replace_all(mp_age17th, "\\. | ", "")
mp_age17th <- str_replace_all(mp_age17th, "5..Dezember.1971", "5Dezember1971")
mp_age17th <- str_replace_all(mp_age17th, "29März.1963", "29März1963")
mp_age17th <- str_replace_all(mp_age17th, "Januar", "/01/")
mp_age17th <- str_replace_all(mp_age17th, "Februar", "/02/")
mp_age17th <- str_replace_all(mp_age17th, "März", "/03/")
mp_age17th <- str_replace_all(mp_age17th, "April", "/04/")
mp_age17th <- str_replace_all(mp_age17th, "Mai", "/05/")
mp_age17th <- str_replace_all(mp_age17th, "Juni", "/06/")
mp_age17th <- str_replace_all(mp_age17th, "Juli", "/07/")
mp_age17th <- str_replace_all(mp_age17th, "August", "/08/")
mp_age17th <- str_replace_all(mp_age17th, "September", "/09/")
mp_age17th <- str_replace_all(mp_age17th, "Oktober", "/10/")
mp_age17th <- str_replace_all(mp_age17th, "November", "/11/")
mp_age17th <- str_replace_all(mp_age17th, "Dezember", "/12/")
mp_age17th <- as.Date(mp_age17th, "%d/%m/%Y")
mp_age17th <- age_calc(mp_age17th, units = "years")
head(mp_age17th)

# MPs' age - 18th BT --------------------------------------------------------------------
mp_age18th <- as.character(extPersonal(folder = "./htmls/htmlwiki18thBT"))
mp_age18th <- as.character(str_extract(mp_age18th, "[[:digit:]]+\\..[[:alpha:]]+.[[:digit:]]+"))
mp_age18th <- str_replace_all(mp_age18th, "\\. | ", "")
mp_age18th <- str_replace_all(mp_age18th, "Januar", "/01/")
mp_age18th <- str_replace_all(mp_age18th, "Februar", "/02/")
mp_age18th <- str_replace_all(mp_age18th, "März", "/03/")
mp_age18th <- str_replace_all(mp_age18th, "April", "/04/")
mp_age18th <- str_replace_all(mp_age18th, "Mai", "/05/")
mp_age18th <- str_replace_all(mp_age18th, "Juni", "/06/")
mp_age18th <- str_replace_all(mp_age18th, "Juli", "/07/")
mp_age18th <- str_replace_all(mp_age18th, "August", "/08/")
mp_age18th <- str_replace_all(mp_age18th, "September", "/09/")
mp_age18th <- str_replace_all(mp_age18th, "Oktober", "/10/")
mp_age18th <- str_replace_all(mp_age18th, "November", "/11/")
mp_age18th <- str_replace_all(mp_age18th, "Dezember", "/12/")
mp_age18th <- as.Date(mp_age18th, "%d/%m/%Y")
mp_age18th <- age_calc(mp_age18th, units = "years")
head(mp_age18th)

# MPs' gender - 16th BT -----------------------------------------------------------------
mp_gen16th <- as.character(extPersonal(folder = "./htmls/htmlwiki16thBT"))
mp_gen16th <- str_extract_all(mp_gen16th, "Politiker.? |Politikerin.? |Abgeordnete|gewählter Abgeordneter|deutscher|deutsche|Bundestagsabgeordnete|Kandidat")
mp_gen16th <- sapply(mp_gen16th, "[[", 1)
mp_gen16th <- str_replace_all(mp_gen16th, "deutscher", "male")
mp_gen16th <- str_replace_all(mp_gen16th, "deutsche", "female")
mp_gen16th <- str_replace_all(mp_gen16th, "Politikerin", "female")
mp_gen16th <- str_replace_all(mp_gen16th, "Politiker", "male")
mp_gen16th <- str_replace_all(mp_gen16th, "Abgeordnete", "female")
mp_gen16th <- str_replace_all(mp_gen16th, " ", "")
head(mp_gen16th)

# MPs' gender - 17th BT -----------------------------------------------------------------
mp_gen17th <- as.character(extPersonal(folder = "./htmls/htmlwiki17thBT"))
mp_gen17th <- str_extract_all(mp_gen17th, "Politiker.? |Politikerin.? |Abgeordnete|gewählter Abgeordneter|deutscher|deutsche|Bundestagsabgeordnete|Kandidat|Minister|Movassat|Professor| Konstantin Hunko")
mp_gen17th <- sapply(mp_gen17th, "[[", 1)
mp_gen17th <- str_replace_all(mp_gen17th, "deutscher", "male")
mp_gen17th <- str_replace_all(mp_gen17th, "deutsche", "female")
mp_gen17th <- str_replace_all(mp_gen17th, "Politikerin", "female")
mp_gen17th <- str_replace_all(mp_gen17th, "Politiker", "male")
mp_gen17th <- str_replace_all(mp_gen17th, "Abgeordnete", "female")
mp_gen17th <- str_replace_all(mp_gen17th, "Minister", "male")
mp_gen17th <- str_replace_all(mp_gen17th, "Movassat", "male")
mp_gen17th <- str_replace_all(mp_gen17th, "Professor", "male")
mp_gen17th <- str_replace_all(mp_gen17th, "Professor", "male")
mp_gen17th <- str_replace_all(mp_gen17th, "Konstantin Hunko", "male")
mp_gen17th <- str_replace_all(mp_gen17th, " ", "")
head(mp_gen17th)
  
# MPs' gender - 18th BT -----------------------------------------------------------------
mp_gen18th <- as.character(extPersonal(folder = "./htmls/htmlwiki18thBT"))
mp_gen18th <- str_extract_all(mp_gen18th, "Politiker.? |Politikerin.? |Abgeordnete|gewählter Abgeordneter|deutscher|deutsche|Bundestagsabgeordnete|Kandidat|Minister|Movassat|Professor| Konstantin Hunko")
mp_gen18th <- sapply(mp_gen18th, "[[", 1)
mp_gen18th <- str_replace_all(mp_gen18th, "deutscher", "male")
mp_gen18th <- str_replace_all(mp_gen18th, "deutsche", "female")
mp_gen18th <- str_replace_all(mp_gen18th, "Politikerin", "female")
mp_gen18th <- str_replace_all(mp_gen18th, "Politiker", "male")
mp_gen18th <- str_replace_all(mp_gen18th, "Abgeordnete", "female")
mp_gen18th <- str_replace_all(mp_gen18th, "Minister", "male")
mp_gen18th <- str_replace_all(mp_gen18th, "Movassat", "male")
mp_gen18th <- str_replace_all(mp_gen18th, "Professor", "male")
mp_gen18th <- str_replace_all(mp_gen18th, "Professor", "male")
mp_gen18th <- str_replace_all(mp_gen18th, "Konstantin Hunko", "male")
mp_gen18th <- str_replace_all(mp_gen18th, "Bundestagsabgeordnete", "female")
mp_gen18th <- str_replace_all(mp_gen18th, " ", "")
head(mp_gen18th)


#### DATA GENERATION FROM WIKIPEDIA REVEISION HISTORIES =================================

# MPs' names - 16th BT ------------------------------------------------------------------
names_rev_hist16th <- as.character(extNamesRevHist(folder = "./htmls/htmlrevh16thBT"))
names_rev_hist16th <- str_replace_all(names_rev_hist16th, "\\\u0084|\\\u0093.+| \\(.+", "")
names_rev_hist16th <- str_replace_all(names_rev_hist16th, "\\\u009a", "s")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Maximilian Lehmer", "Max Lehmer")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Volkmar Vogel", "Volkmar Uwe Vogel")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Sabine Bätzing-Lichtenthäler", "Sabine Bätzing")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Paul Friedhoff", "Paul K. Friedhoff")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Manfred Zöllmer", "Manfred Helmut Zöllmer")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Luc Jochimsen", "Lukrezia Jochimsen")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Kurt Rossmanith", "Kurt J. Rossmanith")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Klaus Lippold", "Klaus W. Lippold")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Karl-Theodor zu Guttenberg", "Karl-Theodor Freiherr zu Guttenberg")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Joschka Fischer", "Joseph Fischer")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Josef Winkler", "Josef Philip Winkler")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Johannes Pflug", "Johannes Andreas Pflug")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Heidemarie Wright", "Heidi Wright")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Grietje Staffelt Bettin", "Kersten Naumann")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Gerd Bollmann", "Gerd Friedrich Bollmann")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Elvira Drobinski-Weiß", "Elvira Drobinski-Weiss")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Eike Hovermann", "Eike Anna Maria Hovermann")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Edmund Geisen", "Edmund Peter Geisen")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Christian von Stetten", "Christian Freiherr von Stetten")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Carl-Eduard von Bismarck", "Carl Eduard von Bismarck")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Axel Fischer", "Axel E. Fischer")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Andrea Voßhoff", "Andrea Astrid Voßhoff")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Kristina Schröder", "Kristina Köhler")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Daniela Ludwig", "Daniela Raab")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Susanne Jaffke", "Susanne Jaffke-Witt")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Kersten Steinke", "Kersten Naumann")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Cajus Julius Caesar", "Cajus Caesar")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Ursula Heinen-Esser", "Ursula Heinen")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Ursula Lötzer", "Ulla Lötzer")
names_rev_hist16th <- str_replace(names_rev_hist16th, "Hüseyin Kenan Aydin", "Hüseyin-Kenan Aydin")
head(names_rev_hist16th)

# MPs' names - 17th BT ------------------------------------------------------------------
names_rev_hist17th <- as.character(extNamesRevHist(folder = "./htmls/htmlrevh17thBT"))
names_rev_hist17th <- str_replace_all(names_rev_hist17th, "\\\u0084|\\\u0093.+| \\(.+", "")
names_rev_hist17th <- str_replace_all(names_rev_hist17th, "\\\u009a", "s")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Agnieszka", "Agnes")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Andrea Voßhoff", "Andrea Astrid Voßhoff")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Andreas Lämmel", "Andreas G. Lämmel")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Axel Fischer", "Axel E. Fischer")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Cajus Julius Caesar", "Cajus Caesar")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Christian von Stetten", "Christian Freiherr von Stetten")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Dagmar Wöhrl", "Dagmar G. Wöhrl")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Edmund Geisen", "Edmund Peter Geisen")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Gabi Molitor", "Gabriele Molitor")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Ingrid Remmers", "Ingrid Lieselotte Remmers")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Josef Winkler", "Josef Philip Winkler")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Karl-Theodor zu Guttenberg", "Karl-Theodor Freiherr zu Guttenberg")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Luc Jochimsen", "Lukrezia Jochimsen")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Manfred Zöllmer", "Manfred Helmut Zöllmer")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Maximilian Lehmer", "Max Lehmer")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Michael Georg Link", "Michael Link")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Michael Groß", "Michael Peter Groß")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Paul Friedhoff", "Paul K. Friedhoff")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Kiliç", "Kilic")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Peter Wichtel", "Heinz Peter Wichtel")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Sabine Stüber", "Sabine Ursula Stüber")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Sonja Steffen", "Sonja Amalie Steffen")
names_rev_hist17th <- str_replace(names_rev_hist17th, "Ursula Lötzer", "Ulla Lötzer")
head(names_rev_hist17th)

# MPs' names - 18th BT ------------------------------------------------------------------
names_rev_hist18th <- as.character(extNamesRevHist(folder = "./htmls/htmlrevh18thBT"))
names_rev_hist18th <- str_replace_all(names_rev_hist18th, "\\\u0084|\\\u0093.+| \\(.+", "")
names_rev_hist18th <- str_replace_all(names_rev_hist18th, "\\\u009a", "s")
names_rev_hist18th <- str_replace(names_rev_hist18th, "Alexander Neu", "Alexander S. Neu")
names_rev_hist18th <- str_replace(names_rev_hist18th, "Andreas Lämmel", "Andreas G. Lämmel")
names_rev_hist18th <- str_replace(names_rev_hist18th, "Axel Fischer", "Axel E. Fischer")
names_rev_hist18th <- str_replace(names_rev_hist18th, "Cajus Julius Caesar", "Cajus Caesar")
names_rev_hist18th <- str_replace(names_rev_hist18th, "Charles M. Huber", "Karl-Heinz Huber")
names_rev_hist18th <- str_replace(names_rev_hist18th, "Christian von Stetten", "Christian Freiherr von Stetten")
names_rev_hist18th <- str_replace(names_rev_hist18th, "Dagmar Wöhrl", "Dagmar G. Wöhrl")
head(names_rev_hist18th)

# total revisions - 16th BT -------------------------------------------------------------
total_rev16th <- as.character(extTotRev(folder = "./htmls/htmlrevh16thBT"))
total_rev16th <- str_replace_all(total_rev16th, "2001|2002|2003|2004|2010|2011|2012|2013|2014|2015|Jan. 2005|Feb. 2005|Mär. 2005|Apr. 2005|Mai 2005|Jun. 2005|Jul. 2005|Aug. 2005| 1. Sep. 2005| 2. Sep. 2005| 3. Sep. 2005| 4. Sep. 2005| 5. Sep. 2005| 6. Sep. 2005| 7. Sep. 2005| 8. Sep. 2005| 9. Sep. 2005| 10. Sep. 2005| 11. Sep. 2005| 12. Sep. 2005| 13. Sep. 2005| 14. Sep. 2005| 15. Sep. 2005| 16. Sep. 2005| 17. Sep. 2005| 28. Sep. 2009| 29. Sep. 2009| 30. Sep. 2009|Okt. 2009|Nov. 2009|Dez. 2009", "")
total_rev16th <- as.numeric(str_count(total_rev16th, "[[:digit:]]{4}"))
head(total_rev16th)

# total revisions - 17th BT -------------------------------------------------------------
total_rev17th <- as.character(extTotRev(folder = "./htmls/htmlrevh17thBT"))
total_rev17th <- str_replace_all(total_rev17th, "2001|2002|2003|2004|2005|2006|2007|2008|2014|2015|Jan. 2009|Feb. 2009|Mär. 2009|Apr. 2009|Mai 2009|Jun. 2009|Jul. 2009|Aug. 2009| 1. Sep. 2009| 2. Sep. 2009| 3. Sep. 2009| 4. Sep. 2009| 5. Sep. 2009| 6. Sep. 2009| 7. Sep. 2009| 8. Sep. 2009| 9. Sep. 2009| 10. Sep. 2009| 11. Sep. 2009| 12. Sep. 2009| 13. Sep. 2009| 14. Sep. 2009| 15. Sep. 2009| 16. Sep. 2009| 17. Sep. 2009| 18. Sep. 2009| 19. Sep. 2009| 20. Sep. 2009| 21. Sep. 2009| 22. Sep. 2009| 23. Sep. 2009| 24. Sep. 2009| 25. Sep. 2009| 26. Sep. 2009| 27. Sep. 2009| 23. Sep. 2013| 24. Sep. 2013| 25. Sep. 2013| 26. Sep. 2013| 27. Sep. 2013| 28. Sep. 2013| 29. Sep. 2013| 30. Sep. 2013|Okt. 2013|Nov. 2013|Dez. 2013", "")
total_rev17th <- as.numeric(str_count(total_rev17th, "[[:digit:]]{4}"))
head(total_rev17th)

# total revisions - 18th BT -------------------------------------------------------------
total_rev18th <- as.character(extTotRev(folder = "./htmls/htmlrevh18thBT"))
total_rev18th <- str_replace_all(total_rev18th, "2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012|Jan. 2013|Feb. 2013|Mär. 2013|Apr. 2013|Mai 2013|Jun. 2013|Jul. 2013|Aug. 2013| 1. Sep. 2013| 2. Sep. 2013| 3. Sep. 2013| 4. Sep. 2013| 5. Sep. 2013| 6. Sep. 2013| 7. Sep. 2013| 8. Sep. 2013| 9. Sep. 2013| 10. Sep. 2013| 11. Sep. 2013| 12. Sep. 2013| 13. Sep. 2013| 14. Sep. 2013| 15. Sep. 2013| 16. Sep. 2013| 17. Sep. 2013| 18. Sep. 2013| 19. Sep. 2013| 20. Sep. 2013| 21. Sep. 2013| 22. Sep. 2013", "")
total_rev18th <- as.numeric(str_count(total_rev18th, "[[:digit:]]{4}"))
head(total_rev18th)

# negative revisions - 16th BT ----------------------------------------------------------
neg_rev16th <- as.character(extNegRev(folder = "./htmls/htmlrevh16thBT"))
neg_rev16th <- str_replace_all(neg_rev16th, "2001|2002|2003|2004|2010|2011|2012|2013|2014|2015|Jan. 2005|Feb. 2005|Mär. 2005|Apr. 2005|Mai 2005|Jun. 2005|Jul. 2005|Aug. 2005| 1. Sep. 2005| 2. Sep. 2005| 3. Sep. 2005| 4. Sep. 2005| 5. Sep. 2005| 6. Sep. 2005| 7. Sep. 2005| 8. Sep. 2005| 9. Sep. 2005| 10. Sep. 2005| 11. Sep. 2005| 12. Sep. 2005| 13. Sep. 2005| 14. Sep. 2005| 15. Sep. 2005| 16. Sep. 2005| 17. Sep. 2005| 28. Sep. 2009| 29. Sep. 2009| 30. Sep. 2009|Okt. 2009|Nov. 2009|Dez. 2009", "")
neg_rev16th <- as.numeric(str_count(neg_rev16th, "[[:digit:]]{4}"))
head(neg_rev16th)

# negative revisions - 17th BT ----------------------------------------------------------
neg_rev17th <- as.character(extNegRev(folder = "./htmls/htmlrevh17thBT"))
neg_rev17th <- str_replace_all(neg_rev17th, "2001|2002|2003|2004|2005|2006|2007|2008|2014|2015|Jan. 2009|Feb. 2009|Mär. 2009|Apr. 2009|Mai 2009|Jun. 2009|Jul. 2009|Aug. 2009| 1. Sep. 2009| 2. Sep. 2009| 3. Sep. 2009| 4. Sep. 2009| 5. Sep. 2009| 6. Sep. 2009| 7. Sep. 2009| 8. Sep. 2009| 9. Sep. 2009| 10. Sep. 2009| 11. Sep. 2009| 12. Sep. 2009| 13. Sep. 2009| 14. Sep. 2009| 15. Sep. 2009| 16. Sep. 2009| 17. Sep. 2009| 18. Sep. 2009| 19. Sep. 2009| 20. Sep. 2009| 21. Sep. 2009| 22. Sep. 2009| 23. Sep. 2009| 24. Sep. 2009| 25. Sep. 2009| 26. Sep. 2009| 27. Sep. 2009| 23. Sep. 2013| 24. Sep. 2013| 25. Sep. 2013| 26. Sep. 2013| 27. Sep. 2013| 28. Sep. 2013| 29. Sep. 2013| 30. Sep. 2013|Okt. 2013|Nov. 2013|Dez. 2013", "")
neg_rev17th <- as.numeric(str_count(neg_rev17th, "[[:digit:]]{4}"))
head(neg_rev17th)

# negative revisions - 18th BT ----------------------------------------------------------
neg_rev18th <- as.character(extNegRev(folder = "./htmls/htmlrevh18thBT"))
neg_rev18th <- str_replace_all(neg_rev18th, "2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012|Jan. 2013|Feb. 2013|Mär. 2013|Apr. 2013|Mai 2013|Jun. 2013|Jul. 2013|Aug. 2013| 1. Sep. 2013| 2. Sep. 2013| 3. Sep. 2013| 4. Sep. 2013| 5. Sep. 2013| 6. Sep. 2013| 7. Sep. 2013| 8. Sep. 2013| 9. Sep. 2013| 10. Sep. 2013| 11. Sep. 2013| 12. Sep. 2013| 13. Sep. 2013| 14. Sep. 2013| 15. Sep. 2013| 16. Sep. 2013| 17. Sep. 2013| 18. Sep. 2013| 19. Sep. 2013| 20. Sep. 2013| 21. Sep. 2013| 22. Sep. 2013", "")
neg_rev18th <- as.numeric(str_count(neg_rev18th, "[[:digit:]]{4}"))
head(neg_rev18th)

# positive revisions - 16th BT ----------------------------------------------------------
pos_rev16th <- as.character(extPosRev(folder = "./htmls/htmlrevh16thBT"))
pos_rev16th <- str_replace_all(pos_rev16th, "2001|2002|2003|2004|2010|2011|2012|2013|2014|2015|Jan. 2005|Feb. 2005|Mär. 2005|Apr. 2005|Mai 2005|Jun. 2005|Jul. 2005|Aug. 2005| 1. Sep. 2005| 2. Sep. 2005| 3. Sep. 2005| 4. Sep. 2005| 5. Sep. 2005| 6. Sep. 2005| 7. Sep. 2005| 8. Sep. 2005| 9. Sep. 2005| 10. Sep. 2005| 11. Sep. 2005| 12. Sep. 2005| 13. Sep. 2005| 14. Sep. 2005| 15. Sep. 2005| 16. Sep. 2005| 17. Sep. 2005| 28. Sep. 2009| 29. Sep. 2009| 30. Sep. 2009|Okt. 2009|Nov. 2009|Dez. 2009", "")
pos_rev16th <- as.numeric(str_count(pos_rev16th, "[[:digit:]]{4}"))
head(pos_rev16th)

# positive revisions - 17th BT ----------------------------------------------------------
pos_rev17th <- as.character(extPosRev(folder = "./htmls/htmlrevh17thBT"))
pos_rev17th <- str_replace_all(pos_rev17th, "2001|2002|2003|2004|2005|2006|2007|2008|2014|2015|Jan. 2009|Feb. 2009|Mär. 2009|Apr. 2009|Mai 2009|Jun. 2009|Jul. 2009|Aug. 2009| 1. Sep. 2009| 2. Sep. 2009| 3. Sep. 2009| 4. Sep. 2009| 5. Sep. 2009| 6. Sep. 2009| 7. Sep. 2009| 8. Sep. 2009| 9. Sep. 2009| 10. Sep. 2009| 11. Sep. 2009| 12. Sep. 2009| 13. Sep. 2009| 14. Sep. 2009| 15. Sep. 2009| 16. Sep. 2009| 17. Sep. 2009| 18. Sep. 2009| 19. Sep. 2009| 20. Sep. 2009| 21. Sep. 2009| 22. Sep. 2009| 23. Sep. 2009| 24. Sep. 2009| 25. Sep. 2009| 26. Sep. 2009| 27. Sep. 2009| 23. Sep. 2013| 24. Sep. 2013| 25. Sep. 2013| 26. Sep. 2013| 27. Sep. 2013| 28. Sep. 2013| 29. Sep. 2013| 30. Sep. 2013|Okt. 2013|Nov. 2013|Dez. 2013", "")
pos_rev17th <- as.numeric(str_count(pos_rev17th, "[[:digit:]]{4}"))
head(pos_rev17th)
  
# positive revisions - 18th BT ----------------------------------------------------------
pos_rev18th <- as.character(extPosRev(folder = "./htmls/htmlrevh18thBT"))
pos_rev18th <- str_replace_all(pos_rev18th, "2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012|Jan. 2013|Feb. 2013|Mär. 2013|Apr. 2013|Mai 2013|Jun. 2013|Jul. 2013|Aug. 2013| 1. Sep. 2013| 2. Sep. 2013| 3. Sep. 2013| 4. Sep. 2013| 5. Sep. 2013| 6. Sep. 2013| 7. Sep. 2013| 8. Sep. 2013| 9. Sep. 2013| 10. Sep. 2013| 11. Sep. 2013| 12. Sep. 2013| 13. Sep. 2013| 14. Sep. 2013| 15. Sep. 2013| 16. Sep. 2013| 17. Sep. 2013| 18. Sep. 2013| 19. Sep. 2013| 20. Sep. 2013| 21. Sep. 2013| 22. Sep. 2013", "")
pos_rev18th <- as.numeric(str_count(pos_rev18th, "[[:digit:]]{4}"))
head(pos_rev18th)
  
# null revisions - 16th BT --------------------------------------------------------------
nul_rev16th <- as.character(extNulRev(folder = "./htmls/htmlrevh16thBT"))
nul_rev16th <- str_replace_all(nul_rev16th, "2001|2002|2003|2004|2010|2011|2012|2013|2014|2015|Jan. 2005|Feb. 2005|Mär. 2005|Apr. 2005|Mai 2005|Jun. 2005|Jul. 2005|Aug. 2005| 1. Sep. 2005| 2. Sep. 2005| 3. Sep. 2005| 4. Sep. 2005| 5. Sep. 2005| 6. Sep. 2005| 7. Sep. 2005| 8. Sep. 2005| 9. Sep. 2005| 10. Sep. 2005| 11. Sep. 2005| 12. Sep. 2005| 13. Sep. 2005| 14. Sep. 2005| 15. Sep. 2005| 16. Sep. 2005| 17. Sep. 2005| 28. Sep. 2009| 29. Sep. 2009| 30. Sep. 2009|Okt. 2009|Nov. 2009|Dez. 2009", "")
nul_rev16th <- as.numeric(str_count(nul_rev16th, "[[:digit:]]{4}"))
head(nul_rev16th)

# null revisions - 17th BT --------------------------------------------------------------
nul_rev17th <- as.character(extNulRev(folder = "./htmls/htmlrevh17thBT"))
nul_rev17th <- str_replace_all(nul_rev17th, "2001|2002|2003|2004|2005|2006|2007|2008|2014|2015|Jan. 2009|Feb. 2009|Mär. 2009|Apr. 2009|Mai 2009|Jun. 2009|Jul. 2009|Aug. 2009| 1. Sep. 2009| 2. Sep. 2009| 3. Sep. 2009| 4. Sep. 2009| 5. Sep. 2009| 6. Sep. 2009| 7. Sep. 2009| 8. Sep. 2009| 9. Sep. 2009| 10. Sep. 2009| 11. Sep. 2009| 12. Sep. 2009| 13. Sep. 2009| 14. Sep. 2009| 15. Sep. 2009| 16. Sep. 2009| 17. Sep. 2009| 18. Sep. 2009| 19. Sep. 2009| 20. Sep. 2009| 21. Sep. 2009| 22. Sep. 2009| 23. Sep. 2009| 24. Sep. 2009| 25. Sep. 2009| 26. Sep. 2009| 27. Sep. 2009| 23. Sep. 2013| 24. Sep. 2013| 25. Sep. 2013| 26. Sep. 2013| 27. Sep. 2013| 28. Sep. 2013| 29. Sep. 2013| 30. Sep. 2013|Okt. 2013|Nov. 2013|Dez. 2013", "")
nul_rev17th <- as.numeric(str_count(nul_rev17th, "[[:digit:]]{4}"))
head(nul_rev17th)

# null revisions - 18th BT --------------------------------------------------------------
nul_rev18th <- as.character(extNulRev(folder = "./htmls/htmlrevh18thBT"))
nul_rev18th <- str_replace_all(nul_rev18th, "2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012|Jan. 2013|Feb. 2013|Mär. 2013|Apr. 2013|Mai 2013|Jun. 2013|Jul. 2013|Aug. 2013| 1. Sep. 2013| 2. Sep. 2013| 3. Sep. 2013| 4. Sep. 2013| 5. Sep. 2013| 6. Sep. 2013| 7. Sep. 2013| 8. Sep. 2013| 9. Sep. 2013| 10. Sep. 2013| 11. Sep. 2013| 12. Sep. 2013| 13. Sep. 2013| 14. Sep. 2013| 15. Sep. 2013| 16. Sep. 2013| 17. Sep. 2013| 18. Sep. 2013| 19. Sep. 2013| 20. Sep. 2013| 21. Sep. 2013| 22. Sep. 2013", "")
nul_rev18th <- as.numeric(str_count(nul_rev18th, "[[:digit:]]{4}"))
head(nul_rev18th)

# size of positive revisions - 16th BT --------------------------------------------------
size_pos_rev16th <- as.character(extSizePosRev(folder = "./htmls/htmlrevh16thBT"))
size_pos_rev16th <- str_replace_all(size_pos_rev16th, fixed("\", \""), "")
size_pos_rev16th <- str_replace_all(size_pos_rev16th, fixed("\", \n\""), "")
size_pos_rev16th <- str_replace_all(size_pos_rev16th, "\\)\\([^()]+\\)", "\\)")
size_pos_rev16th <- str_replace_all(size_pos_rev16th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2010\\([^()]+\\)|2011\\([^()]+\\)|2012\\([^()]+\\)|2013\\([^()]+\\)|2014\\([^()]+\\)|2015\\([^()]+\\)|Jan. 2005\\([^()]+\\)|Feb. 2005\\([^()]+\\)|Mär. 2005\\([^()]+\\)|Apr. 2005\\([^()]+\\)|Mai 2005\\([^()]+\\)|Jun. 2005\\([^()]+\\)|Jul. 2005\\([^()]+\\)|Aug. 2005\\([^()]+\\)| 1. Sep. 2005\\([^()]+\\)| 2. Sep. 2005\\([^()]+\\)| 3. Sep. 2005\\([^()]+\\)| 4. Sep. 2005\\([^()]+\\)| 5. Sep. 2005\\([^()]+\\)| 6. Sep. 2005\\([^()]+\\)| 7. Sep. 2005\\([^()]+\\)| 8. Sep. 2005\\([^()]+\\)| 9. Sep. 2005\\([^()]+\\)| 10. Sep. 2005\\([^()]+\\)| 11. Sep. 2005\\([^()]+\\)| 12. Sep. 2005\\([^()]+\\)| 13. Sep. 2005\\([^()]+\\)| 14. Sep. 2005\\([^()]+\\)| 15. Sep. 2005\\([^()]+\\)| 16. Sep. 2005\\([^()]+\\)| 17. Sep. 2005\\([^()]+\\)| 28. Sep. 2009\\([^()]+\\)| 29. Sep. 2009\\([^()]+\\)| 30. Sep. 2009\\([^()]+\\)|Okt. 2009\\([^()]+\\)|Nov. 2009\\([^()]+\\)|Dez. 2009\\([^()]+\\)", "")
size_pos_rev16th <- as.character(str_extract_all(size_pos_rev16th, "\\([^()]+\\)"))
size_pos_rev16th <- str_replace_all(size_pos_rev16th, "\\.", "")
size_pos_rev16th <- str_extract_all(size_pos_rev16th, "[[:digit:]]+")
size_pos_rev16th <- rbind.fill(lapply(size_pos_rev16th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
size_pos_rev16th <- as.data.frame(apply(size_pos_rev16th, 2,as.numeric))
size_pos_rev16th <- rowSums(size_pos_rev16th[sapply(size_pos_rev16th, is.numeric)], na.rm = TRUE)
size_pos_rev16th <- as.list(size_pos_rev16th)
head(size_pos_rev16th)

# size of positive revisions - 17th BT --------------------------------------------------
size_pos_rev17th <- as.character(extSizePosRev(folder = "./htmls/htmlrevh17thBT"))
size_pos_rev17th <- str_replace_all(size_pos_rev17th, fixed("\", \""), "")
size_pos_rev17th <- str_replace_all(size_pos_rev17th, fixed("\", \n\""), "")
size_pos_rev17th <- str_replace_all(size_pos_rev17th, "\\)\\([^()]+\\)", "\\)")
size_pos_rev17th <- str_replace_all(size_pos_rev17th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2005\\([^()]+\\)|2006\\([^()]+\\)|2007\\([^()]+\\)|2008\\([^()]+\\)|2014\\([^()]+\\)|2015\\([^()]+\\)|Jan. 2009\\([^()]+\\)|Feb. 2009\\([^()]+\\)|Mär. 2009\\([^()]+\\)|Apr. 2009\\([^()]+\\)|Mai 2009\\([^()]+\\)|Jun. 2009\\([^()]+\\)|Jul. 2009\\([^()]+\\)|Aug. 2009\\([^()]+\\)| 1. Sep. 2009\\([^()]+\\)| 2. Sep. 2009\\([^()]+\\)| 3. Sep. 2009\\([^()]+\\)| 4. Sep. 2009\\([^()]+\\)| 5. Sep. 2009\\([^()]+\\)| 6. Sep. 2009\\([^()]+\\)| 7. Sep. 2009\\([^()]+\\)| 8. Sep. 2009\\([^()]+\\)| 9. Sep. 2009\\([^()]+\\)| 10. Sep. 2009\\([^()]+\\)| 11. Sep. 2009\\([^()]+\\)| 12. Sep. 2009\\([^()]+\\)| 13. Sep. 2009\\([^()]+\\)| 14. Sep. 2009\\([^()]+\\)| 15. Sep. 2009\\([^()]+\\)| 16. Sep. 2009\\([^()]+\\)| 17. Sep. 2009\\([^()]+\\)| 18. Sep. 2009\\([^()]+\\)| 19. Sep. 2009\\([^()]+\\)| 20. Sep. 2009\\([^()]+\\)| 21. Sep. 2009\\([^()]+\\)| 22. Sep. 2009\\([^()]+\\)| 23. Sep. 2009\\([^()]+\\)| 24. Sep. 2009\\([^()]+\\)| 25. Sep. 2009\\([^()]+\\)| 26. Sep. 2009\\([^()]+\\)| 27. Sep. 2009\\([^()]+\\)| 23. Sep. 2013\\([^()]+\\)| 24. Sep. 2013\\([^()]+\\)| 25. Sep. 2013\\([^()]+\\)| 26. Sep. 2013\\([^()]+\\)| 27. Sep. 2013\\([^()]+\\)| 28. Sep. 2013\\([^()]+\\)| 29. Sep. 2013\\([^()]+\\)| 30. Sep. 2013\\([^()]+\\)|Okt. 2013\\([^()]+\\)|Nov. 2013\\([^()]+\\)|Dez. 2013\\([^()]+\\)", "")
size_pos_rev17th <- as.character(str_extract_all(size_pos_rev17th, "\\([^()]+\\)"))
size_pos_rev17th <- str_replace_all(size_pos_rev17th, "\\.", "")
size_pos_rev17th <- str_extract_all(size_pos_rev17th, "[[:digit:]]+")
size_pos_rev17th <- rbind.fill(lapply(size_pos_rev17th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
size_pos_rev17th <- as.data.frame(apply(size_pos_rev17th, 2,as.numeric))
size_pos_rev17th <- rowSums(size_pos_rev17th[sapply(size_pos_rev17th, is.numeric)], na.rm = TRUE)
size_pos_rev17th <- as.list(size_pos_rev17th)
head(size_pos_rev17th)

# size of positive revisions - 18th BT --------------------------------------------------
size_pos_rev18th <- as.character(extSizePosRev(folder = "./htmls/htmlrevh18thBT"))
size_pos_rev18th <- str_replace_all(size_pos_rev18th, fixed("\", \""), "")
size_pos_rev18th <- str_replace_all(size_pos_rev18th, fixed("\", \n\""), "")
size_pos_rev18th <- str_replace_all(size_pos_rev18th, "\\)\\([^()]+\\)", "\\)")
size_pos_rev18th <- str_replace_all(size_pos_rev18th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2005\\([^()]+\\)|2006\\([^()]+\\)|2007\\([^()]+\\)|2008\\([^()]+\\)|2009\\([^()]+\\)|2010\\([^()]+\\)|2011\\([^()]+\\)|2012\\([^()]+\\)|Jan. 2013\\([^()]+\\)|Feb. 2013\\([^()]+\\)|Mär. 2013\\([^()]+\\)|Apr. 2013\\([^()]+\\)|Mai 2013\\([^()]+\\)|Jun. 2013\\([^()]+\\)|Jul. 2013\\([^()]+\\)|Aug. 2013\\([^()]+\\)| 1. Sep. 2013\\([^()]+\\)| 2. Sep. 2013\\([^()]+\\)| 3. Sep. 2013\\([^()]+\\)| 4. Sep. 2013\\([^()]+\\)| 5. Sep. 2013\\([^()]+\\)| 6. Sep. 2013\\([^()]+\\)| 7. Sep. 2013\\([^()]+\\)| 8. Sep. 2013\\([^()]+\\)| 9. Sep. 2013\\([^()]+\\)| 10. Sep. 2013\\([^()]+\\)| 11. Sep. 2013\\([^()]+\\)| 12. Sep. 2013\\([^()]+\\)| 13. Sep. 2013\\([^()]+\\)| 14. Sep. 2013\\([^()]+\\)| 15. Sep. 2013\\([^()]+\\)| 16. Sep. 2013\\([^()]+\\)| 17. Sep. 2013\\([^()]+\\)| 18. Sep. 2013\\([^()]+\\)| 19. Sep. 2013\\([^()]+\\)| 20. Sep. 2013\\([^()]+\\)| 21. Sep. 2013\\([^()]+\\)| 22. Sep. 2013\\([^()]+\\)", "")
size_pos_rev18th <- as.character(str_extract_all(size_pos_rev18th, "\\([^()]+\\)"))
size_pos_rev18th <- str_replace_all(size_pos_rev18th, "\\.", "")
size_pos_rev18th <- str_extract_all(size_pos_rev18th, "[[:digit:]]+")
size_pos_rev18th <- rbind.fill(lapply(size_pos_rev18th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
size_pos_rev18th <- as.data.frame(apply(size_pos_rev18th, 2,as.numeric))
size_pos_rev18th <- rowSums(size_pos_rev18th[sapply(size_pos_rev18th, is.numeric)], na.rm = TRUE)
size_pos_rev18th <- as.list(size_pos_rev18th)
head(size_pos_rev18th)

# size of negative revisions - 16th BT --------------------------------------------------
size_neg_rev16th <- as.character(extSizeNegRev(folder = "./htmls/htmlrevh16thBT"))
size_neg_rev16th <- str_replace_all(size_neg_rev16th, fixed("\", \""), "")
size_neg_rev16th <- str_replace_all(size_neg_rev16th, fixed("\", \n\""), "")
size_neg_rev16th <- str_replace_all(size_neg_rev16th, "\\)\\([^()]+\\)", "\\)")
size_neg_rev16th <- str_replace_all(size_neg_rev16th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2010\\([^()]+\\)|2011\\([^()]+\\)|2012\\([^()]+\\)|2013\\([^()]+\\)|2014\\([^()]+\\)|2015\\([^()]+\\)|Jan. 2005\\([^()]+\\)|Feb. 2005\\([^()]+\\)|Mär. 2005\\([^()]+\\)|Apr. 2005\\([^()]+\\)|Mai 2005\\([^()]+\\)|Jun. 2005\\([^()]+\\)|Jul. 2005\\([^()]+\\)|Aug. 2005\\([^()]+\\)| 1. Sep. 2005\\([^()]+\\)| 2. Sep. 2005\\([^()]+\\)| 3. Sep. 2005\\([^()]+\\)| 4. Sep. 2005\\([^()]+\\)| 5. Sep. 2005\\([^()]+\\)| 6. Sep. 2005\\([^()]+\\)| 7. Sep. 2005\\([^()]+\\)| 8. Sep. 2005\\([^()]+\\)| 9. Sep. 2005\\([^()]+\\)| 10. Sep. 2005\\([^()]+\\)| 11. Sep. 2005\\([^()]+\\)| 12. Sep. 2005\\([^()]+\\)| 13. Sep. 2005\\([^()]+\\)| 14. Sep. 2005\\([^()]+\\)| 15. Sep. 2005\\([^()]+\\)| 16. Sep. 2005\\([^()]+\\)| 17. Sep. 2005\\([^()]+\\)| 28. Sep. 2009\\([^()]+\\)| 29. Sep. 2009\\([^()]+\\)| 30. Sep. 2009\\([^()]+\\)|Okt. 2009\\([^()]+\\)|Nov. 2009\\([^()]+\\)|Dez. 2009\\([^()]+\\)", "")
size_neg_rev16th <- as.character(str_extract_all(size_neg_rev16th, "\\([^()]+\\)"))
size_neg_rev16th <- str_replace_all(size_neg_rev16th, "\\.", "")
size_neg_rev16th <- str_extract_all(size_neg_rev16th, "[[:digit:]]+")
size_neg_rev16th <- rbind.fill(lapply(size_neg_rev16th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
size_neg_rev16th <- as.data.frame(apply(size_neg_rev16th, 2,as.numeric))
size_neg_rev16th <- rowSums(size_neg_rev16th[sapply(size_neg_rev16th, is.numeric)], na.rm = TRUE)
size_neg_rev16th <- as.list(size_neg_rev16th)
head(size_neg_rev16th)

# size of negative revisions - 17th BT --------------------------------------------------
size_neg_rev17th <- as.character(extSizeNegRev(folder = "./htmls/htmlrevh17thBT"))
size_neg_rev17th <- str_replace_all(size_neg_rev17th, fixed("\", \""), "")
size_neg_rev17th <- str_replace_all(size_neg_rev17th, fixed("\", \n\""), "")
size_neg_rev17th <- str_replace_all(size_neg_rev17th, "\\)\\([^()]+\\)", "\\)")
size_neg_rev17th <- str_replace_all(size_neg_rev17th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2005\\([^()]+\\)|2006\\([^()]+\\)|2007\\([^()]+\\)|2008\\([^()]+\\)|2014\\([^()]+\\)|2015\\([^()]+\\)|Jan. 2009\\([^()]+\\)|Feb. 2009\\([^()]+\\)|Mär. 2009\\([^()]+\\)|Apr. 2009\\([^()]+\\)|Mai 2009\\([^()]+\\)|Jun. 2009\\([^()]+\\)|Jul. 2009\\([^()]+\\)|Aug. 2009\\([^()]+\\)| 1. Sep. 2009\\([^()]+\\)| 2. Sep. 2009\\([^()]+\\)| 3. Sep. 2009\\([^()]+\\)| 4. Sep. 2009\\([^()]+\\)| 5. Sep. 2009\\([^()]+\\)| 6. Sep. 2009\\([^()]+\\)| 7. Sep. 2009\\([^()]+\\)| 8. Sep. 2009\\([^()]+\\)| 9. Sep. 2009\\([^()]+\\)| 10. Sep. 2009\\([^()]+\\)| 11. Sep. 2009\\([^()]+\\)| 12. Sep. 2009\\([^()]+\\)| 13. Sep. 2009\\([^()]+\\)| 14. Sep. 2009\\([^()]+\\)| 15. Sep. 2009\\([^()]+\\)| 16. Sep. 2009\\([^()]+\\)| 17. Sep. 2009\\([^()]+\\)| 18. Sep. 2009\\([^()]+\\)| 19. Sep. 2009\\([^()]+\\)| 20. Sep. 2009\\([^()]+\\)| 21. Sep. 2009\\([^()]+\\)| 22. Sep. 2009\\([^()]+\\)| 23. Sep. 2009\\([^()]+\\)| 24. Sep. 2009\\([^()]+\\)| 25. Sep. 2009\\([^()]+\\)| 26. Sep. 2009\\([^()]+\\)| 27. Sep. 2009\\([^()]+\\)| 23. Sep. 2013\\([^()]+\\)| 24. Sep. 2013\\([^()]+\\)| 25. Sep. 2013\\([^()]+\\)| 26. Sep. 2013\\([^()]+\\)| 27. Sep. 2013\\([^()]+\\)| 28. Sep. 2013\\([^()]+\\)| 29. Sep. 2013\\([^()]+\\)| 30. Sep. 2013\\([^()]+\\)|Okt. 2013\\([^()]+\\)|Nov. 2013\\([^()]+\\)|Dez. 2013\\([^()]+\\)", "")
size_neg_rev17th <- as.character(str_extract_all(size_neg_rev17th, "\\([^()]+\\)"))
size_neg_rev17th <- str_replace_all(size_neg_rev17th, "\\.", "")
size_neg_rev17th <- str_extract_all(size_neg_rev17th, "[[:digit:]]+")
size_neg_rev17th <- rbind.fill(lapply(size_neg_rev17th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
size_neg_rev17th <- as.data.frame(apply(size_neg_rev17th, 2,as.numeric))
size_neg_rev17th <- rowSums(size_neg_rev17th[sapply(size_neg_rev17th, is.numeric)], na.rm = TRUE)
size_neg_rev17th <- as.list(size_neg_rev17th)
head(size_neg_rev17th)
  
# size of negative revisions - 18th BT --------------------------------------------------
size_neg_rev18th <- as.character(extSizeNegRev(folder = "./htmls/htmlrevh18thBT"))
size_neg_rev18th <- str_replace_all(size_neg_rev18th, fixed("\", \""), "")
size_neg_rev18th <- str_replace_all(size_neg_rev18th, fixed("\", \n\""), "")
size_neg_rev18th <- str_replace_all(size_neg_rev18th, "\\)\\([^()]+\\)", "\\)")
size_neg_rev18th <- str_replace_all(size_neg_rev18th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2005\\([^()]+\\)|2006\\([^()]+\\)|2007\\([^()]+\\)|2008\\([^()]+\\)|2009\\([^()]+\\)|2010\\([^()]+\\)|2011\\([^()]+\\)|2012\\([^()]+\\)|Jan. 2013\\([^()]+\\)|Feb. 2013\\([^()]+\\)|Mär. 2013\\([^()]+\\)|Apr. 2013\\([^()]+\\)|Mai 2013\\([^()]+\\)|Jun. 2013\\([^()]+\\)|Jul. 2013\\([^()]+\\)|Aug. 2013\\([^()]+\\)| 1. Sep. 2013\\([^()]+\\)| 2. Sep. 2013\\([^()]+\\)| 3. Sep. 2013\\([^()]+\\)| 4. Sep. 2013\\([^()]+\\)| 5. Sep. 2013\\([^()]+\\)| 6. Sep. 2013\\([^()]+\\)| 7. Sep. 2013\\([^()]+\\)| 8. Sep. 2013\\([^()]+\\)| 9. Sep. 2013\\([^()]+\\)| 10. Sep. 2013\\([^()]+\\)| 11. Sep. 2013\\([^()]+\\)| 12. Sep. 2013\\([^()]+\\)| 13. Sep. 2013\\([^()]+\\)| 14. Sep. 2013\\([^()]+\\)| 15. Sep. 2013\\([^()]+\\)| 16. Sep. 2013\\([^()]+\\)| 17. Sep. 2013\\([^()]+\\)| 18. Sep. 2013\\([^()]+\\)| 19. Sep. 2013\\([^()]+\\)| 20. Sep. 2013\\([^()]+\\)| 21. Sep. 2013\\([^()]+\\)| 22. Sep. 2013\\([^()]+\\)", "")
size_neg_rev18th <- as.character(str_extract_all(size_neg_rev18th, "\\([^()]+\\)"))
size_neg_rev18th <- str_replace_all(size_neg_rev18th, "\\.", "")
size_neg_rev18th <- str_extract_all(size_neg_rev18th, "[[:digit:]]+")
size_neg_rev18th <- rbind.fill(lapply(size_neg_rev18th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
size_neg_rev18th <- as.data.frame(apply(size_neg_rev18th, 2,as.numeric))
size_neg_rev18th <- rowSums(size_neg_rev18th[sapply(size_neg_rev18th, is.numeric)], na.rm = TRUE)
size_neg_rev18th <- as.list(size_neg_rev18th)
head(size_neg_rev18th)

# reverts - 16th BT ---------------------------------------------------------------------
reverts16th <- as.character(extComments(folder = "./htmls/htmlrevh16thBT"))
reverts16th <- str_replace_all(reverts16th, fixed("\", \""), "")
reverts16th <- str_replace_all(reverts16th, fixed("\", \n\""), "")
reverts16th <- str_replace_all(reverts16th, "\\)\\([^()]+\\)", "\\)")
reverts16th <- str_replace_all(reverts16th, "\\(|\\)", "")
reverts16th <- str_replace_all(reverts16th, "2001.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2002.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2003.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2004.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2010.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2011.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2012.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2014.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2015.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jan. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Feb. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mär. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Apr. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mai 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jun. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jul. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Aug. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 1. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 2. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 3. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 4. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 5. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 6. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 7. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 8. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 9. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 10. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 11. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 12. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 13. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 14. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 15. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 16. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 17. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 28. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 29. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 30. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Okt. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Nov. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Dez. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)", "")
reverts16th <- tolower(reverts16th)
reverts16th <- as.numeric(str_count(reverts16th, "wiederhergestellt|rückgängig|verworfen|zurückgesetzt|revert"))
head(reverts16th)

# reverts - 17th BT ---------------------------------------------------------------------
reverts17th <- as.character(extComments(folder = "./htmls/htmlrevh17thBT"))
reverts17th <- str_replace_all(reverts17th, fixed("\", \""), "")
reverts17th <- str_replace_all(reverts17th, fixed("\", \n\""), "")
reverts17th <- str_replace_all(reverts17th, "\\)\\([^()]+\\)", "\\)")
reverts17th <- str_replace_all(reverts17th, "\\(|\\)", "")
reverts17th <- str_replace_all(reverts17th, "2001.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2002.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2003.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2004.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2006.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2007.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2008.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2014.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2015.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jan. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Feb. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mär. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Apr. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mai 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jun. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jul. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Aug. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 1. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 2. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 3. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 4. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 5. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 6. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 7. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 8. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 9. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 10. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 11. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 12. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 13. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 14. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 15. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 16. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 17. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 18. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 19. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 20. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 21. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 22. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 23. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 24. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 25. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 26. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 27. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 23. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 24. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 25. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 26. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 27. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 28. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 29. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 30. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Okt. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Nov. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Dez. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)", "")
reverts17th <- tolower(reverts17th)
reverts17th <- as.numeric(str_count(reverts17th, "wiederhergestellt|rückgängig|verworfen|zurückgesetzt|revert"))
head(reverts17th)

# reverts - 18th BT ---------------------------------------------------------------------
reverts18th <- as.character(extComments(folder = "./htmls/htmlrevh18thBT"))
reverts18th <- str_replace_all(reverts18th, fixed("\", \""), "")
reverts18th <- str_replace_all(reverts18th, fixed("\", \n\""), "")
reverts18th <- str_replace_all(reverts18th, "\\)\\([^()]+\\)", "\\)")
reverts18th <- str_replace_all(reverts18th, "\\(|\\)", "")
reverts18th <- str_replace_all(reverts18th, "2001.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2002.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2003.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2004.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2006.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2007.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2008.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2010.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2011.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2012.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jan. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Feb. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mär. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Apr. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mai 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jun. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jul. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Aug. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 1. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 2. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 3. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 4. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 5. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 6. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 7. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 8. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 9. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 10. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 11. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 12. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 13. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 14. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 15. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 16. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 17. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 18. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 19. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 20. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 21. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 22. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\")$", "")
reverts18th <- tolower(reverts18th)
reverts18th <- as.numeric(str_count(reverts18th, "wiederhergestellt|rückgängig|verworfen|zurückgesetzt|revert"))
head(reverts18th)

# total revisions from Bundestag IPS - 16th BT ------------------------------------------
btip_total_rev16th <- as.character(extIpBt(folder = "./htmls/htmlrevh16thBT"))
btip_total_rev16th <- str_replace_all(btip_total_rev16th, "2001|2002|2003|2004|2010|2011|2012|2013|2014|2015|Jan. 2005|Feb. 2005|Mär. 2005|Apr. 2005|Mai 2005|Jun. 2005|Jul. 2005|Aug. 2005| 1. Sep. 2005| 2. Sep. 2005| 3. Sep. 2005| 4. Sep. 2005| 5. Sep. 2005| 6. Sep. 2005| 7. Sep. 2005| 8. Sep. 2005| 9. Sep. 2005| 10. Sep. 2005| 11. Sep. 2005| 12. Sep. 2005| 13. Sep. 2005| 14. Sep. 2005| 15. Sep. 2005| 16. Sep. 2005| 17. Sep. 2005| 28. Sep. 2009| 29. Sep. 2009| 30. Sep. 2009|Okt. 2009|Nov. 2009|Dez. 2009", "")
btip_total_rev16th <- as.numeric(str_count(btip_total_rev16th, "[[:digit:]]{4}"))
head(btip_total_rev16th)

# total revisions from Bundestag IPS - 17th BT ------------------------------------------
btip_total_rev17th <- as.character(extIpBt(folder = "./htmls/htmlrevh17thBT"))
btip_total_rev17th <- str_replace_all(btip_total_rev17th, "2001|2002|2003|2004|2005|2006|2007|2008|2014|2015|Jan. 2009|Feb. 2009|Mär. 2009|Apr. 2009|Mai 2009|Jun. 2009|Jul. 2009|Aug. 2009| 1. Sep. 2009| 2. Sep. 2009| 3. Sep. 2009| 4. Sep. 2009| 5. Sep. 2009| 6. Sep. 2009| 7. Sep. 2009| 8. Sep. 2009| 9. Sep. 2009| 10. Sep. 2009| 11. Sep. 2009| 12. Sep. 2009| 13. Sep. 2009| 14. Sep. 2009| 15. Sep. 2009| 16. Sep. 2009| 17. Sep. 2009| 18. Sep. 2009| 19. Sep. 2009| 20. Sep. 2009| 21. Sep. 2009| 22. Sep. 2009| 23. Sep. 2009| 24. Sep. 2009| 25. Sep. 2009| 26. Sep. 2009| 27. Sep. 2009| 23. Sep. 2013| 24. Sep. 2013| 25. Sep. 2013| 26. Sep. 2013| 27. Sep. 2013| 28. Sep. 2013| 29. Sep. 2013| 30. Sep. 2013|Okt. 2013|Nov. 2013|Dez. 2013", "")
btip_total_rev17th <- as.numeric(str_count(btip_total_rev17th, "[[:digit:]]{4}"))
head(btip_total_rev17th)

# total revisions from Bundestag IPS - 18th BT ------------------------------------------
btip_total_rev18th <- as.character(extIpBt(folder = "./htmls/htmlrevh18thBT"))
btip_total_rev18th <- str_replace_all(btip_total_rev18th, "2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012|Jan. 2013|Feb. 2013|Mär. 2013|Apr. 2013|Mai 2013|Jun. 2013|Jul. 2013|Aug. 2013| 1. Sep. 2013| 2. Sep. 2013| 3. Sep. 2013| 4. Sep. 2013| 5. Sep. 2013| 6. Sep. 2013| 7. Sep. 2013| 8. Sep. 2013| 9. Sep. 2013| 10. Sep. 2013| 11. Sep. 2013| 12. Sep. 2013| 13. Sep. 2013| 14. Sep. 2013| 15. Sep. 2013| 16. Sep. 2013| 17. Sep. 2013| 18. Sep. 2013| 19. Sep. 2013| 20. Sep. 2013| 21. Sep. 2013| 22. Sep. 2013", "")
btip_total_rev18th <- as.numeric(str_count(btip_total_rev18th, "[[:digit:]]{4}"))
length(btip_total_rev18th)
  
# positive revisions from Bundestag IPs - 16th BT ---------------------------------------
btip_pos_rev16th <- as.character(extIpBtPos(folder = "./htmls/htmlrevh16thBT"))
btip_pos_rev16th <- str_replace_all(btip_pos_rev16th, fixed("\", \""), "")
btip_pos_rev16th <- str_replace_all(btip_pos_rev16th, fixed("\", \n\""), "")
btip_pos_rev16th <- str_replace_all(btip_pos_rev16th, "\\)\\([^()]+\\)", "\\)")
btip_pos_rev16th <- str_replace_all(btip_pos_rev16th, "2001|2002|2003|2004|2010|2011|2012|2013|2014|2015|Jan. 2005|Feb. 2005|Mär. 2005|Apr. 2005|Mai 2005|Jun. 2005|Jul. 2005|Aug. 2005| 1. Sep. 2005| 2. Sep. 2005| 3. Sep. 2005| 4. Sep. 2005| 5. Sep. 2005| 6. Sep. 2005| 7. Sep. 2005| 8. Sep. 2005| 9. Sep. 2005| 10. Sep. 2005| 11. Sep. 2005| 12. Sep. 2005| 13. Sep. 2005| 14. Sep. 2005| 15. Sep. 2005| 16. Sep. 2005| 17. Sep. 2005| 28. Sep. 2009| 29. Sep. 2009| 30. Sep. 2009|Okt. 2009|Nov. 2009|Dez. 2009", "")
btip_pos_rev16th <- as.numeric(str_count(btip_pos_rev16th, "[[:digit:]]{4}\\(+"))
head(btip_pos_rev16th)

# positive revisions from Bundestag IPs - 17th BT ---------------------------------------
btip_pos_rev17th <- as.character(extIpBtPos(folder = "./htmls/htmlrevh17thBT"))
btip_pos_rev17th <- str_replace_all(btip_pos_rev17th, fixed("\", \""), "")
btip_pos_rev17th <- str_replace_all(btip_pos_rev17th, fixed("\", \n\""), "")
btip_pos_rev17th <- str_replace_all(btip_pos_rev17th, "\\)\\([^()]+\\)", "\\)")
btip_pos_rev17th <- str_replace_all(btip_pos_rev17th, "2001|2002|2003|2004|2005|2006|2007|2008|2014|2015|Jan. 2009|Feb. 2009|Mär. 2009|Apr. 2009|Mai 2009|Jun. 2009|Jul. 2009|Aug. 2009| 1. Sep. 2009| 2. Sep. 2009| 3. Sep. 2009| 4. Sep. 2009| 5. Sep. 2009| 6. Sep. 2009| 7. Sep. 2009| 8. Sep. 2009| 9. Sep. 2009| 10. Sep. 2009| 11. Sep. 2009| 12. Sep. 2009| 13. Sep. 2009| 14. Sep. 2009| 15. Sep. 2009| 16. Sep. 2009| 17. Sep. 2009| 18. Sep. 2009| 19. Sep. 2009| 20. Sep. 2009| 21. Sep. 2009| 22. Sep. 2009| 23. Sep. 2009| 24. Sep. 2009| 25. Sep. 2009| 26. Sep. 2009| 27. Sep. 2009| 23. Sep. 2013| 24. Sep. 2013| 25. Sep. 2013| 26. Sep. 2013| 27. Sep. 2013| 28. Sep. 2013| 29. Sep. 2013| 30. Sep. 2013|Okt. 2013|Nov. 2013|Dez. 2013", "")
btip_pos_rev17th <- as.numeric(str_count(btip_pos_rev17th, "[[:digit:]]{4}\\(+"))
head(btip_pos_rev17th)
  
# positive revisions from Bundestag IPs - 18th BT ---------------------------------------
btip_pos_rev18th <- as.character(extIpBtPos(folder = "./htmls/htmlrevh18thBT"))
btip_pos_rev18th <- str_replace_all(btip_pos_rev18th, fixed("\", \""), "")
btip_pos_rev18th <- str_replace_all(btip_pos_rev18th, fixed("\", \n\""), "")
btip_pos_rev18th <- str_replace_all(btip_pos_rev18th, "\\)\\([^()]+\\)", "\\)")
btip_pos_rev18th <- str_replace_all(btip_pos_rev18th, "2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012|Jan. 2013|Feb. 2013|Mär. 2013|Apr. 2013|Mai 2013|Jun. 2013|Jul. 2013|Aug. 2013| 1. Sep. 2013| 2. Sep. 2013| 3. Sep. 2013| 4. Sep. 2013| 5. Sep. 2013| 6. Sep. 2013| 7. Sep. 2013| 8. Sep. 2013| 9. Sep. 2013| 10. Sep. 2013| 11. Sep. 2013| 12. Sep. 2013| 13. Sep. 2013| 14. Sep. 2013| 15. Sep. 2013| 16. Sep. 2013| 17. Sep. 2013| 18. Sep. 2013| 19. Sep. 2013| 20. Sep. 2013| 21. Sep. 2013| 22. Sep. 2013", "")
btip_pos_rev18th <- as.numeric(str_count(btip_pos_rev18th, "[[:digit:]]{4}\\(+"))
head(btip_pos_rev18th)
  
# negative revisions from Bundestag IPs - 16th BT ---------------------------------------
btip_neg_rev16th <- as.character(extIpBtNeg(folder = "./htmls/htmlrevh16thBT"))
btip_neg_rev16th <- str_replace_all(btip_neg_rev16th, fixed("\", \""), "")
btip_neg_rev16th <- str_replace_all(btip_neg_rev16th, fixed("\", \n\""), "")
btip_neg_rev16th <- str_replace_all(btip_neg_rev16th, "\\)\\([^()]+\\)", "\\)")
btip_neg_rev16th <- str_replace_all(btip_neg_rev16th, "2001|2002|2003|2004|2010|2011|2012|2013|2014|2015|Jan. 2005|Feb. 2005|Mär. 2005|Apr. 2005|Mai 2005|Jun. 2005|Jul. 2005|Aug. 2005| 1. Sep. 2005| 2. Sep. 2005| 3. Sep. 2005| 4. Sep. 2005| 5. Sep. 2005| 6. Sep. 2005| 7. Sep. 2005| 8. Sep. 2005| 9. Sep. 2005| 10. Sep. 2005| 11. Sep. 2005| 12. Sep. 2005| 13. Sep. 2005| 14. Sep. 2005| 15. Sep. 2005| 16. Sep. 2005| 17. Sep. 2005| 28. Sep. 2009| 29. Sep. 2009| 30. Sep. 2009|Okt. 2009|Nov. 2009|Dez. 2009", "")
btip_neg_rev16th <- as.numeric(str_count(btip_neg_rev16th, "[[:digit:]]{4}\\(-"))
head(btip_neg_rev16th)

# negative revisions from Bundestag IPs - 17th BT ---------------------------------------
btip_neg_rev17th <- as.character(extIpBtNeg(folder = "./htmls/htmlrevh17thBT"))
btip_neg_rev17th <- str_replace_all(btip_neg_rev17th, fixed("\", \""), "")
btip_neg_rev17th <- str_replace_all(btip_neg_rev17th, fixed("\", \n\""), "")
btip_neg_rev17th <- str_replace_all(btip_neg_rev17th, "\\)\\([^()]+\\)", "\\)")
btip_neg_rev17th <- str_replace_all(btip_neg_rev17th, "2001|2002|2003|2004|2005|2006|2007|2008|2014|2015|Jan. 2009|Feb. 2009|Mär. 2009|Apr. 2009|Mai 2009|Jun. 2009|Jul. 2009|Aug. 2009| 1. Sep. 2009| 2. Sep. 2009| 3. Sep. 2009| 4. Sep. 2009| 5. Sep. 2009| 6. Sep. 2009| 7. Sep. 2009| 8. Sep. 2009| 9. Sep. 2009| 10. Sep. 2009| 11. Sep. 2009| 12. Sep. 2009| 13. Sep. 2009| 14. Sep. 2009| 15. Sep. 2009| 16. Sep. 2009| 17. Sep. 2009| 18. Sep. 2009| 19. Sep. 2009| 20. Sep. 2009| 21. Sep. 2009| 22. Sep. 2009| 23. Sep. 2009| 24. Sep. 2009| 25. Sep. 2009| 26. Sep. 2009| 27. Sep. 2009| 23. Sep. 2013| 24. Sep. 2013| 25. Sep. 2013| 26. Sep. 2013| 27. Sep. 2013| 28. Sep. 2013| 29. Sep. 2013| 30. Sep. 2013|Okt. 2013|Nov. 2013|Dez. 2013", "")
btip_neg_rev17th <- as.numeric(str_count(btip_neg_rev17th, "[[:digit:]]{4}\\(-"))
head(btip_neg_rev17th)
  
# negative revisions from Bundestag IPs - 18th BT ---------------------------------------
btip_neg_rev18th <- as.character(extIpBtNeg(folder = "./htmls/htmlrevh18thBT"))
btip_neg_rev18th <- str_replace_all(btip_neg_rev18th, fixed("\", \""), "")
btip_neg_rev18th <- str_replace_all(btip_neg_rev18th, fixed("\", \n\""), "")
btip_neg_rev18th <- str_replace_all(btip_neg_rev18th, "\\)\\([^()]+\\)", "\\)")
btip_neg_rev18th <- str_replace_all(btip_neg_rev18th, "2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012|Jan. 2013|Feb. 2013|Mär. 2013|Apr. 2013|Mai 2013|Jun. 2013|Jul. 2013|Aug. 2013| 1. Sep. 2013| 2. Sep. 2013| 3. Sep. 2013| 4. Sep. 2013| 5. Sep. 2013| 6. Sep. 2013| 7. Sep. 2013| 8. Sep. 2013| 9. Sep. 2013| 10. Sep. 2013| 11. Sep. 2013| 12. Sep. 2013| 13. Sep. 2013| 14. Sep. 2013| 15. Sep. 2013| 16. Sep. 2013| 17. Sep. 2013| 18. Sep. 2013| 19. Sep. 2013| 20. Sep. 2013| 21. Sep. 2013| 22. Sep. 2013", "")
btip_neg_rev18th <- as.numeric(str_count(btip_neg_rev18th, "[[:digit:]]{4}\\(-"))
head(btip_neg_rev18th)
  
# null revisions from Bundestag IPs - 16th BT -------------------------------------------
btip_null_rev16th <- as.character(extIpBtNull(folder = "./htmls/htmlrevh16thBT"))
btip_null_rev16th <- str_replace_all(btip_null_rev16th, fixed("\", \""), "")
btip_null_rev16th <- str_replace_all(btip_null_rev16th, fixed("\", \n\""), "")
btip_null_rev16th <- str_replace_all(btip_null_rev16th, "\\)\\([^()]+\\)", "\\)")
btip_null_rev16th <- str_replace_all(btip_null_rev16th, "2001|2002|2003|2004|2010|2011|2012|2013|2014|2015|Jan. 2005|Feb. 2005|Mär. 2005|Apr. 2005|Mai 2005|Jun. 2005|Jul. 2005|Aug. 2005| 1. Sep. 2005| 2. Sep. 2005| 3. Sep. 2005| 4. Sep. 2005| 5. Sep. 2005| 6. Sep. 2005| 7. Sep. 2005| 8. Sep. 2005| 9. Sep. 2005| 10. Sep. 2005| 11. Sep. 2005| 12. Sep. 2005| 13. Sep. 2005| 14. Sep. 2005| 15. Sep. 2005| 16. Sep. 2005| 17. Sep. 2005| 28. Sep. 2009| 29. Sep. 2009| 30. Sep. 2009|Okt. 2009|Nov. 2009|Dez. 2009", "")
btip_null_rev16th <- as.numeric(str_count(btip_null_rev16th, "[[:digit:]]{4}\\(0"))
head(btip_null_rev16th)

# null revisions from Bundestag IPs - 17th BT -------------------------------------------
btip_null_rev17th <- as.character(extIpBtNull(folder = "./htmls/htmlrevh17thBT"))
btip_null_rev17th <- str_replace_all(btip_null_rev17th, fixed("\", \""), "")
btip_null_rev17th <- str_replace_all(btip_null_rev17th, fixed("\", \n\""), "")
btip_null_rev17th <- str_replace_all(btip_null_rev17th, "\\)\\([^()]+\\)", "\\)")
btip_null_rev17th <- str_replace_all(btip_null_rev17th, "2001|2002|2003|2004|2005|2006|2007|2008|2014|2015|Jan. 2009|Feb. 2009|Mär. 2009|Apr. 2009|Mai 2009|Jun. 2009|Jul. 2009|Aug. 2009| 1. Sep. 2009| 2. Sep. 2009| 3. Sep. 2009| 4. Sep. 2009| 5. Sep. 2009| 6. Sep. 2009| 7. Sep. 2009| 8. Sep. 2009| 9. Sep. 2009| 10. Sep. 2009| 11. Sep. 2009| 12. Sep. 2009| 13. Sep. 2009| 14. Sep. 2009| 15. Sep. 2009| 16. Sep. 2009| 17. Sep. 2009| 18. Sep. 2009| 19. Sep. 2009| 20. Sep. 2009| 21. Sep. 2009| 22. Sep. 2009| 23. Sep. 2009| 24. Sep. 2009| 25. Sep. 2009| 26. Sep. 2009| 27. Sep. 2009| 23. Sep. 2013| 24. Sep. 2013| 25. Sep. 2013| 26. Sep. 2013| 27. Sep. 2013| 28. Sep. 2013| 29. Sep. 2013| 30. Sep. 2013|Okt. 2013|Nov. 2013|Dez. 2013", "")
btip_null_rev17th <- as.numeric(str_count(btip_null_rev17th, "[[:digit:]]{4}\\(0"))
head(btip_null_rev17th)

# null revisions from Bundestag IPs - 18th BT -------------------------------------------
btip_null_rev18th <- as.character(extIpBtNull(folder = "./htmls/htmlrevh18thBT"))
btip_null_rev18th <- str_replace_all(btip_null_rev18th, fixed("\", \""), "")
btip_null_rev18th <- str_replace_all(btip_null_rev18th, fixed("\", \n\""), "")
btip_null_rev18th <- str_replace_all(btip_null_rev18th, "\\)\\([^()]+\\)", "\\)")
btip_null_rev18th <- str_replace_all(btip_null_rev18th, "2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012|Jan. 2013|Feb. 2013|Mär. 2013|Apr. 2013|Mai 2013|Jun. 2013|Jul. 2013|Aug. 2013| 1. Sep. 2013| 2. Sep. 2013| 3. Sep. 2013| 4. Sep. 2013| 5. Sep. 2013| 6. Sep. 2013| 7. Sep. 2013| 8. Sep. 2013| 9. Sep. 2013| 10. Sep. 2013| 11. Sep. 2013| 12. Sep. 2013| 13. Sep. 2013| 14. Sep. 2013| 15. Sep. 2013| 16. Sep. 2013| 17. Sep. 2013| 18. Sep. 2013| 19. Sep. 2013| 20. Sep. 2013| 21. Sep. 2013| 22. Sep. 2013", "")
btip_null_rev18th <- as.numeric(str_count(btip_null_rev18th, "[[:digit:]]{4}\\(0"))
head(btip_null_rev18th)

# size of positive revisions from Bundestag IPs - 16th BT -------------------------------
btip_size_pos_rev16th <- as.character(extIpBtPos(folder = "./htmls/htmlrevh16thBT"))
btip_size_pos_rev16th <- str_replace_all(btip_size_pos_rev16th, fixed("\", \""), "")
btip_size_pos_rev16th <- str_replace_all(btip_size_pos_rev16th, fixed("\", \n\""), "")
btip_size_pos_rev16th <- str_replace_all(btip_size_pos_rev16th, "\\)\\([^()]+\\)", "\\)")
btip_size_pos_rev16th <- str_replace_all(btip_size_pos_rev16th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2010\\([^()]+\\)|2011\\([^()]+\\)|2012\\([^()]+\\)|2013\\([^()]+\\)|2014\\([^()]+\\)|2015\\([^()]+\\)|Jan. 2005\\([^()]+\\)|Feb. 2005\\([^()]+\\)|Mär. 2005\\([^()]+\\)|Apr. 2005\\([^()]+\\)|Mai 2005\\([^()]+\\)|Jun. 2005\\([^()]+\\)|Jul. 2005\\([^()]+\\)|Aug. 2005\\([^()]+\\)| 1. Sep. 2005\\([^()]+\\)| 2. Sep. 2005\\([^()]+\\)| 3. Sep. 2005\\([^()]+\\)| 4. Sep. 2005\\([^()]+\\)| 5. Sep. 2005\\([^()]+\\)| 6. Sep. 2005\\([^()]+\\)| 7. Sep. 2005\\([^()]+\\)| 8. Sep. 2005\\([^()]+\\)| 9. Sep. 2005\\([^()]+\\)| 10. Sep. 2005\\([^()]+\\)| 11. Sep. 2005\\([^()]+\\)| 12. Sep. 2005\\([^()]+\\)| 13. Sep. 2005\\([^()]+\\)| 14. Sep. 2005\\([^()]+\\)| 15. Sep. 2005\\([^()]+\\)| 16. Sep. 2005\\([^()]+\\)| 17. Sep. 2005\\([^()]+\\)| 28. Sep. 2009\\([^()]+\\)| 29. Sep. 2009\\([^()]+\\)| 30. Sep. 2009\\([^()]+\\)|Okt. 2009\\([^()]+\\)|Nov. 2009\\([^()]+\\)|Dez. 2009\\([^()]+\\)", "")
btip_size_pos_rev16th <- str_replace_all(btip_size_pos_rev16th, "\\.", "")
btip_size_pos_rev16th <- str_extract_all(btip_size_pos_rev16th, "\\+[[:digit:]]+")
btip_size_pos_rev16th <- rbind.fill(lapply(btip_size_pos_rev16th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
btip_size_pos_rev16th <- as.data.frame(apply(btip_size_pos_rev16th, 2,as.numeric))
btip_size_pos_rev16th <- rowSums(btip_size_pos_rev16th[sapply(btip_size_pos_rev16th, is.numeric)], na.rm = TRUE)
btip_size_pos_rev16th <- as.list(btip_size_pos_rev16th)
head(btip_size_pos_rev16th)

# size of positive revisions from Bundestag IPs - 17th BT -------------------------------
btip_size_pos_rev17th <- as.character(extIpBtPos(folder = "./htmls/htmlrevh17thBT"))
btip_size_pos_rev17th <- str_replace_all(btip_size_pos_rev17th, fixed("\", \""), "")
btip_size_pos_rev17th <- str_replace_all(btip_size_pos_rev17th, fixed("\", \n\""), "")
btip_size_pos_rev17th <- str_replace_all(btip_size_pos_rev17th, "\\)\\([^()]+\\)", "\\)")
btip_size_pos_rev17th <- str_replace_all(btip_size_pos_rev17th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2005\\([^()]+\\)|2006\\([^()]+\\)|2007\\([^()]+\\)|2008\\([^()]+\\)|2014\\([^()]+\\)|2015\\([^()]+\\)|Jan. 2009\\([^()]+\\)|Feb. 2009\\([^()]+\\)|Mär. 2009\\([^()]+\\)|Apr. 2009\\([^()]+\\)|Mai 2009\\([^()]+\\)|Jun. 2009\\([^()]+\\)|Jul. 2009\\([^()]+\\)|Aug. 2009\\([^()]+\\)| 1. Sep. 2009\\([^()]+\\)| 2. Sep. 2009\\([^()]+\\)| 3. Sep. 2009\\([^()]+\\)| 4. Sep. 2009\\([^()]+\\)| 5. Sep. 2009\\([^()]+\\)| 6. Sep. 2009\\([^()]+\\)| 7. Sep. 2009\\([^()]+\\)| 8. Sep. 2009\\([^()]+\\)| 9. Sep. 2009\\([^()]+\\)| 10. Sep. 2009\\([^()]+\\)| 11. Sep. 2009\\([^()]+\\)| 12. Sep. 2009\\([^()]+\\)| 13. Sep. 2009\\([^()]+\\)| 14. Sep. 2009\\([^()]+\\)| 15. Sep. 2009\\([^()]+\\)| 16. Sep. 2009\\([^()]+\\)| 17. Sep. 2009\\([^()]+\\)| 18. Sep. 2009\\([^()]+\\)| 19. Sep. 2009\\([^()]+\\)| 20. Sep. 2009\\([^()]+\\)| 21. Sep. 2009\\([^()]+\\)| 22. Sep. 2009\\([^()]+\\)| 23. Sep. 2009\\([^()]+\\)| 24. Sep. 2009\\([^()]+\\)| 25. Sep. 2009\\([^()]+\\)| 26. Sep. 2009\\([^()]+\\)| 27. Sep. 2009\\([^()]+\\)| 23. Sep. 2013\\([^()]+\\)| 24. Sep. 2013\\([^()]+\\)| 25. Sep. 2013\\([^()]+\\)| 26. Sep. 2013\\([^()]+\\)| 27. Sep. 2013\\([^()]+\\)| 28. Sep. 2013\\([^()]+\\)| 29. Sep. 2013\\([^()]+\\)| 30. Sep. 2013\\([^()]+\\)|Okt. 2013\\([^()]+\\)|Nov. 2013\\([^()]+\\)|Dez. 2013\\([^()]+\\)", "")
btip_size_pos_rev17th <- str_replace_all(btip_size_pos_rev17th, "\\.", "")
btip_size_pos_rev17th <- str_extract_all(btip_size_pos_rev17th, "\\+[[:digit:]]+")
btip_size_pos_rev17th <- rbind.fill(lapply(btip_size_pos_rev17th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
btip_size_pos_rev17th <- as.data.frame(apply(btip_size_pos_rev17th, 2,as.numeric))
btip_size_pos_rev17th <- rowSums(btip_size_pos_rev17th[sapply(btip_size_pos_rev17th, is.numeric)], na.rm = TRUE)
btip_size_pos_rev17th <- as.list(btip_size_pos_rev17th)
head(btip_size_pos_rev17th)
  
# size of positive revisions from Bundestag IPs - 18th BT -------------------------------
btip_size_pos_rev18th <- as.character(extIpBtPos(folder = "./htmls/htmlrevh18thBT"))
btip_size_pos_rev18th <- str_replace_all(btip_size_pos_rev18th, fixed("\", \""), "")
btip_size_pos_rev18th <- str_replace_all(btip_size_pos_rev18th, fixed("\", \n\""), "")
btip_size_pos_rev18th <- str_replace_all(btip_size_pos_rev18th, "\\)\\([^()]+\\)", "\\)")
btip_size_pos_rev18th <- str_replace_all(btip_size_pos_rev18th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2005\\([^()]+\\)|2006\\([^()]+\\)|2007\\([^()]+\\)|2008\\([^()]+\\)|2009\\([^()]+\\)|2010\\([^()]+\\)|2011\\([^()]+\\)|2012\\([^()]+\\)|Jan. 2013\\([^()]+\\)|Feb. 2013\\([^()]+\\)|Mär. 2013\\([^()]+\\)|Apr. 2013\\([^()]+\\)|Mai 2013\\([^()]+\\)|Jun. 2013\\([^()]+\\)|Jul. 2013\\([^()]+\\)|Aug. 2013\\([^()]+\\)| 1. Sep. 2013\\([^()]+\\)| 2. Sep. 2013\\([^()]+\\)| 3. Sep. 2013\\([^()]+\\)| 4. Sep. 2013\\([^()]+\\)| 5. Sep. 2013\\([^()]+\\)| 6. Sep. 2013\\([^()]+\\)| 7. Sep. 2013\\([^()]+\\)| 8. Sep. 2013\\([^()]+\\)| 9. Sep. 2013\\([^()]+\\)| 10. Sep. 2013\\([^()]+\\)| 11. Sep. 2013\\([^()]+\\)| 12. Sep. 2013\\([^()]+\\)| 13. Sep. 2013\\([^()]+\\)| 14. Sep. 2013\\([^()]+\\)| 15. Sep. 2013\\([^()]+\\)| 16. Sep. 2013\\([^()]+\\)| 17. Sep. 2013\\([^()]+\\)| 18. Sep. 2013\\([^()]+\\)| 19. Sep. 2013\\([^()]+\\)| 20. Sep. 2013\\([^()]+\\)| 21. Sep. 2013\\([^()]+\\)| 22. Sep. 2013\\([^()]+\\)", "")
btip_size_pos_rev18th <- str_replace_all(btip_size_pos_rev18th, "\\.", "")
btip_size_pos_rev18th <- str_extract_all(btip_size_pos_rev18th, "\\+[[:digit:]]+")
btip_size_pos_rev18th <- rbind.fill(lapply(btip_size_pos_rev18th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
btip_size_pos_rev18th <- as.data.frame(apply(btip_size_pos_rev18th, 2,as.numeric))
btip_size_pos_rev18th <- rowSums(btip_size_pos_rev18th[sapply(btip_size_pos_rev18th, is.numeric)], na.rm = TRUE)
btip_size_pos_rev18th <- as.list(btip_size_pos_rev18th)
head(btip_size_pos_rev18th)
  
# size of negative revisions from BUndestag IPs - 16th BT -------------------------------
btip_size_neg_rev16th <- as.character(extIpBtNeg(folder = "./htmls/htmlrevh16thBT"))
btip_size_neg_rev16th <- str_replace_all(btip_size_neg_rev16th, fixed("\", \""), "")
btip_size_neg_rev16th <- str_replace_all(btip_size_neg_rev16th, fixed("\", \n\""), "")
btip_size_neg_rev16th <- str_replace_all(btip_size_neg_rev16th, "\\)\\([^()]+\\)", "\\)")
btip_size_neg_rev16th <- str_replace_all(btip_size_neg_rev16th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2010\\([^()]+\\)|2011\\([^()]+\\)|2012\\([^()]+\\)|2013\\([^()]+\\)|2014\\([^()]+\\)|2015\\([^()]+\\)|Jan. 2005\\([^()]+\\)|Feb. 2005\\([^()]+\\)|Mär. 2005\\([^()]+\\)|Apr. 2005\\([^()]+\\)|Mai 2005\\([^()]+\\)|Jun. 2005\\([^()]+\\)|Jul. 2005\\([^()]+\\)|Aug. 2005\\([^()]+\\)| 1. Sep. 2005\\([^()]+\\)| 2. Sep. 2005\\([^()]+\\)| 3. Sep. 2005\\([^()]+\\)| 4. Sep. 2005\\([^()]+\\)| 5. Sep. 2005\\([^()]+\\)| 6. Sep. 2005\\([^()]+\\)| 7. Sep. 2005\\([^()]+\\)| 8. Sep. 2005\\([^()]+\\)| 9. Sep. 2005\\([^()]+\\)| 10. Sep. 2005\\([^()]+\\)| 11. Sep. 2005\\([^()]+\\)| 12. Sep. 2005\\([^()]+\\)| 13. Sep. 2005\\([^()]+\\)| 14. Sep. 2005\\([^()]+\\)| 15. Sep. 2005\\([^()]+\\)| 16. Sep. 2005\\([^()]+\\)| 17. Sep. 2005\\([^()]+\\)| 28. Sep. 2009\\([^()]+\\)| 29. Sep. 2009\\([^()]+\\)| 30. Sep. 2009\\([^()]+\\)|Okt. 2009\\([^()]+\\)|Nov. 2009\\([^()]+\\)|Dez. 2009\\([^()]+\\)", "")
btip_size_neg_rev16th <- str_replace_all(btip_size_neg_rev16th, "\\.", "")
btip_size_neg_rev16th <- str_extract_all(btip_size_neg_rev16th, "(?<=\\-)[[:digit:]]+")
btip_size_neg_rev16th <- rbind.fill(lapply(btip_size_neg_rev16th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
btip_size_neg_rev16th <- as.data.frame(apply(btip_size_neg_rev16th, 2,as.numeric))
btip_size_neg_rev16th <- rowSums(btip_size_neg_rev16th[sapply(btip_size_neg_rev16th, is.numeric)], na.rm = TRUE)
btip_size_neg_rev16th <- as.list(btip_size_neg_rev16th)
head(btip_size_neg_rev16th)

# size of negative revisions from BUndestag IPs - 17th BT -------------------------------
btip_size_neg_rev17th <- as.character(extIpBtNeg(folder = "./htmls/htmlrevh17thBT"))
btip_size_neg_rev17th <- str_replace_all(btip_size_neg_rev17th, fixed("\", \""), "")
btip_size_neg_rev17th <- str_replace_all(btip_size_neg_rev17th, fixed("\", \n\""), "")
btip_size_neg_rev17th <- str_replace_all(btip_size_neg_rev17th, "\\)\\([^()]+\\)", "\\)")
btip_size_neg_rev17th <- str_replace_all(btip_size_neg_rev17th, "22001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2005\\([^()]+\\)|2006\\([^()]+\\)|2007\\([^()]+\\)|2008\\([^()]+\\)|2014\\([^()]+\\)|2015\\([^()]+\\)|Jan. 2009\\([^()]+\\)|Feb. 2009\\([^()]+\\)|Mär. 2009\\([^()]+\\)|Apr. 2009\\([^()]+\\)|Mai 2009\\([^()]+\\)|Jun. 2009\\([^()]+\\)|Jul. 2009\\([^()]+\\)|Aug. 2009\\([^()]+\\)| 1. Sep. 2009\\([^()]+\\)| 2. Sep. 2009\\([^()]+\\)| 3. Sep. 2009\\([^()]+\\)| 4. Sep. 2009\\([^()]+\\)| 5. Sep. 2009\\([^()]+\\)| 6. Sep. 2009\\([^()]+\\)| 7. Sep. 2009\\([^()]+\\)| 8. Sep. 2009\\([^()]+\\)| 9. Sep. 2009\\([^()]+\\)| 10. Sep. 2009\\([^()]+\\)| 11. Sep. 2009\\([^()]+\\)| 12. Sep. 2009\\([^()]+\\)| 13. Sep. 2009\\([^()]+\\)| 14. Sep. 2009\\([^()]+\\)| 15. Sep. 2009\\([^()]+\\)| 16. Sep. 2009\\([^()]+\\)| 17. Sep. 2009\\([^()]+\\)| 18. Sep. 2009\\([^()]+\\)| 19. Sep. 2009\\([^()]+\\)| 20. Sep. 2009\\([^()]+\\)| 21. Sep. 2009\\([^()]+\\)| 22. Sep. 2009\\([^()]+\\)| 23. Sep. 2009\\([^()]+\\)| 24. Sep. 2009\\([^()]+\\)| 25. Sep. 2009\\([^()]+\\)| 26. Sep. 2009\\([^()]+\\)| 27. Sep. 2009\\([^()]+\\)| 23. Sep. 2013\\([^()]+\\)| 24. Sep. 2013\\([^()]+\\)| 25. Sep. 2013\\([^()]+\\)| 26. Sep. 2013\\([^()]+\\)| 27. Sep. 2013\\([^()]+\\)| 28. Sep. 2013\\([^()]+\\)| 29. Sep. 2013\\([^()]+\\)| 30. Sep. 2013\\([^()]+\\)|Okt. 2013\\([^()]+\\)|Nov. 2013\\([^()]+\\)|Dez. 2013\\([^()]+\\)", "")
btip_size_neg_rev17th <- str_replace_all(btip_size_neg_rev17th, "\\.", "")
btip_size_neg_rev17th <- str_extract_all(btip_size_neg_rev17th, "(?<=\\-)[[:digit:]]+")
btip_size_neg_rev17th <- rbind.fill(lapply(btip_size_neg_rev17th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
btip_size_neg_rev17th <- as.data.frame(apply(btip_size_neg_rev17th, 2,as.numeric))
btip_size_neg_rev17th <- rowSums(btip_size_neg_rev17th[sapply(btip_size_neg_rev17th, is.numeric)], na.rm = TRUE)
btip_size_neg_rev17th <- as.list(btip_size_neg_rev17th)
head(btip_size_neg_rev17th)
  
# size of negative revisions from BUndestag IPs - 18th BT -------------------------------
btip_size_neg_rev18th <- as.character(extIpBtNeg(folder = "./htmls/htmlrevh18thBT"))
btip_size_neg_rev18th <- str_replace_all(btip_size_neg_rev18th, fixed("\", \""), "")
btip_size_neg_rev18th <- str_replace_all(btip_size_neg_rev18th, fixed("\", \n\""), "")
btip_size_neg_rev18th <- str_replace_all(btip_size_neg_rev18th, "\\)\\([^()]+\\)", "\\)")
btip_size_neg_rev18th <- str_replace_all(btip_size_neg_rev18th, "2001\\([^()]+\\)|2002\\([^()]+\\)|2003\\([^()]+\\)|2004\\([^()]+\\)|2005\\([^()]+\\)|2006\\([^()]+\\)|2007\\([^()]+\\)|2008\\([^()]+\\)|2009\\([^()]+\\)|2010\\([^()]+\\)|2011\\([^()]+\\)|2012\\([^()]+\\)|Jan. 2013\\([^()]+\\)|Feb. 2013\\([^()]+\\)|Mär. 2013\\([^()]+\\)|Apr. 2013\\([^()]+\\)|Mai 2013\\([^()]+\\)|Jun. 2013\\([^()]+\\)|Jul. 2013\\([^()]+\\)|Aug. 2013\\([^()]+\\)| 1. Sep. 2013\\([^()]+\\)| 2. Sep. 2013\\([^()]+\\)| 3. Sep. 2013\\([^()]+\\)| 4. Sep. 2013\\([^()]+\\)| 5. Sep. 2013\\([^()]+\\)| 6. Sep. 2013\\([^()]+\\)| 7. Sep. 2013\\([^()]+\\)| 8. Sep. 2013\\([^()]+\\)| 9. Sep. 2013\\([^()]+\\)| 10. Sep. 2013\\([^()]+\\)| 11. Sep. 2013\\([^()]+\\)| 12. Sep. 2013\\([^()]+\\)| 13. Sep. 2013\\([^()]+\\)| 14. Sep. 2013\\([^()]+\\)| 15. Sep. 2013\\([^()]+\\)| 16. Sep. 2013\\([^()]+\\)| 17. Sep. 2013\\([^()]+\\)| 18. Sep. 2013\\([^()]+\\)| 19. Sep. 2013\\([^()]+\\)| 20. Sep. 2013\\([^()]+\\)| 21. Sep. 2013\\([^()]+\\)| 22. Sep. 2013\\([^()]+\\)", "")
btip_size_neg_rev18th <- str_replace_all(btip_size_neg_rev18th, "\\.", "")
btip_size_neg_rev18th <- str_extract_all(btip_size_neg_rev18th, "(?<=\\-)[[:digit:]]+")
btip_size_neg_rev18th <- rbind.fill(lapply(btip_size_neg_rev18th,function(y){as.data.frame(t(y),stringsAsFactors=FALSE)}))
btip_size_neg_rev18th <- as.data.frame(apply(btip_size_neg_rev18th, 2,as.numeric))
btip_size_neg_rev18th <- rowSums(btip_size_neg_rev18th[sapply(btip_size_neg_rev18th, is.numeric)], na.rm = TRUE)
btip_size_neg_rev18th <- as.list(btip_size_neg_rev18th)
head(btip_size_neg_rev18th)

# reverts from Bundestag IPs - 16th BT --------------------------------------------------
btip_reverts16th <- as.character(extIpBtComments(folder = "./htmls/htmlrevh16thBT"))
btip_reverts16th <- str_replace_all(btip_reverts16th, fixed("\", \""), "")
btip_reverts16th <- str_replace_all(btip_reverts16th, fixed("\", \n\""), "")
btip_reverts16th <- str_replace_all(btip_reverts16th, "\\)\\([^()]+\\)", "\\)")
btip_reverts16th <- str_replace_all(btip_reverts16th, "\\(|\\)", "")
btip_reverts16th <- str_replace_all(btip_reverts16th, "2001.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2002.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2003.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2004.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2010.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2011.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2012.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2014.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2015.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jan. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Feb. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mär. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Apr. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mai 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jun. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jul. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Aug. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 1. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 2. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 3. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 4. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 5. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 6. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 7. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 8. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 9. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 10. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 11. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 12. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 13. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 14. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 15. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 16. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 17. Sep. 2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 28. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 29. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 30. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Okt. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Nov. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Dez. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)", "")
btip_reverts16th <- tolower(btip_reverts16th)
btip_reverts16th <- as.numeric(str_count(btip_reverts16th, "wiederhergestellt|rückgängig|verworfen|zurückgesetzt|revert"))
head(btip_reverts16th)

# reverts from Bundestag IPs - 17th BT --------------------------------------------------
btip_reverts17th <- as.character(extIpBtComments(folder = "./htmls/htmlrevh17thBT"))
btip_reverts17th <- str_replace_all(btip_reverts17th, fixed("\", \""), "")
btip_reverts17th <- str_replace_all(btip_reverts17th, fixed("\", \n\""), "")
btip_reverts17th <- str_replace_all(btip_reverts17th, "\\)\\([^()]+\\)", "\\)")
btip_reverts17th <- str_replace_all(btip_reverts17th, "\\(|\\)", "")
btip_revert17th <- str_replace_all(btip_reverts17th, "2001.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2002.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2003.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2004.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2006.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2007.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2008.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2014.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2015.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jan. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Feb. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mär. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Apr. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mai 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jun. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jul. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Aug. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 1. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 2. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 3. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 4. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 5. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 6. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 7. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 8. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 9. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 10. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 11. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 12. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 13. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 14. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 15. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 16. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 17. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 18. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 19. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 20. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 21. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 22. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 23. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 24. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 25. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 26. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 27. Sep. 2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 23. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 24. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 25. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 26. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 27. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 28. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 29. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 30. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Okt. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Nov. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Dez. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)", "")
btip_reverts17th <- tolower(btip_revert17th)
btip_reverts17th <- as.numeric(str_count(btip_reverts17th, "wiederhergestellt|rückgängig|verworfen|zurückgesetzt|revert"))
head(btip_reverts17th)

# reverts from Bundestag IPs - 18th BT --------------------------------------------------
btip_reverts18th <- as.character(extIpBtComments(folder = "./htmls/htmlrevh18thBT"))
btip_reverts18th <- str_replace_all(btip_reverts18th, fixed("\", \""), "")
btip_reverts18th <- str_replace_all(btip_reverts18th, fixed("\", \n\""), "")
btip_reverts18th <- str_replace_all(btip_reverts18th, "\\)\\([^()]+\\)", "\\)")
btip_reverts18th <- str_replace_all(btip_reverts18th, "\\(|\\)", "")
btip_reverts18th <- str_replace_all(btip_reverts18th, "2001.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2002.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2003.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2004.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2005.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2006.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2007.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2008.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2009.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2010.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2011.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|2012.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jan. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Feb. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mär. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Apr. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Mai 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jun. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Jul. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)|Aug. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 1. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 2. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 3. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 4. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 5. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 6. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 7. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 8. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 9. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 10. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 11. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 12. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 13. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 14. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 15. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 16. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 17. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 18. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 19. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 20. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 21. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\"$)| 22. Sep. 2013.+?(?=[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]], |\\\")$", "")
btip_reverts18th <- tolower(btip_reverts18th)
btip_reverts18th <- as.numeric(str_count(btip_reverts18th, "wiederhergestellt|rückgängig|verworfen|zurückgesetzt|revert"))
head(btip_reverts18th)

# change in size (kB) of MPs Wikipedia pages - 16thBT -----------------------------------
setwd("./htmls/htmlwiki16thBTbeg")
filesize_beg_16thBT <- file.size(dir(getwd()))
setwd("../../")
setwd("./htmls/htmlwiki16thBTend")
filesize_end_16thBT <- file.size(dir(getwd()))
setwd("../../")
filesize_beg_16thBT <- humanReadable(filesize_beg_16thBT)
filesize_beg_16thBT <- as.numeric(str_replace_all(filesize_beg_16thBT, " |KiB", ""))
filesize_end_16thBT <- humanReadable(filesize_end_16thBT)
filesize_end_16thBT <- as.numeric(str_replace_all(filesize_end_16thBT, " |KiB", ""))
names_match_filesize_end_16thBT <- names_rev_hist16th[-idx_nolink_end_16thBT]
filesize_beg_16thBT <- mapply(c, names_rev_hist16th, filesize_beg_16thBT, SIMPLIFY = FALSE)
filesize_beg_16thBT <- data.frame(matrix(unlist(filesize_beg_16thBT), nrow = 641, byrow = T))
filesize_end_16thBT <- mapply(c, names_match_filesize_end_16thBT, filesize_end_16thBT, SIMPLIFY = FALSE)
filesize_end_16thBT <- data.frame(matrix(unlist(filesize_end_16thBT), nrow = 639, byrow = T))
filesize_16thBT <- merge(filesize_beg_16thBT, filesize_end_16thBT, by="X1", all=TRUE)
idx_nolink_end_16thBT2 <- which(is.na(filesize_16thBT$X2.y))
filesize_16thBT$X2.x[idx_nolink_end_16thBT2] <- NA
filesize_beg_16thBT <- as.vector(filesize_16thBT$X2.x)
filesize_end_16thBT <- as.vector(filesize_16thBT$X2.y)
filesize_beg_16thBT <- as.numeric(replace(filesize_beg_16thBT, idx_nolink_end_16thBT2, 0))
filesize_end_16thBT <- as.numeric(replace(filesize_end_16thBT, idx_nolink_end_16thBT2, 0))
filesize_16thBT <- filesize_end_16thBT - filesize_beg_16thBT # Already sorted!!!

# change in size (kB) of MPs Wikipedia pages - 17thBT -----------------------------------
setwd("./htmls/htmlwiki17thBTbeg")
filesize_beg_17thBT <- file.size(dir(getwd()))
setwd("../../")
setwd("./htmls/htmlwiki17thBTend")
filesize_end_17thBT <- file.size(dir(getwd()))
setwd("../../")
filesize_beg_17thBT <- humanReadable(filesize_beg_17thBT)
filesize_beg_17thBT <- as.numeric(str_replace_all(filesize_beg_17thBT, " |KiB", ""))
filesize_end_17thBT <- humanReadable(filesize_end_17thBT)
filesize_end_17thBT <- as.numeric(str_replace_all(filesize_end_17thBT, " |KiB", ""))
filesize_17thBT <- mapply(c, names_rev_hist17th, filesize_beg_17thBT, filesize_end_17thBT, SIMPLIFY = FALSE)
filesize_17thBT <- data.frame(matrix(unlist(filesize_17thBT), nrow = 652, byrow = T))
filesize_beg_17thBT <- as.numeric(filesize_17thBT$X2)
filesize_end_17thBT <- as.numeric(filesize_17thBT$X3)
filesize_17thBT <- filesize_end_17thBT - filesize_beg_17thBT # Not sorted!!!

# change in size (kB) of MPs Wikipedia pages - 18thBT -----------------------------------
setwd("./htmls/htmlwiki18thBTbeg")
filesize_beg_18thBT <- file.size(dir(getwd()))
setwd("../../")
setwd("./htmls/htmlwiki18thBTend")
filesize_end_18thBT <- file.size(dir(getwd()))
setwd("../../")
filesize_beg_18thBT <- humanReadable(filesize_beg_18thBT)
filesize_beg_18thBT <- as.numeric(str_replace_all(filesize_beg_18thBT, " |KiB", ""))
filesize_end_18thBT <- humanReadable(filesize_end_18thBT)
filesize_end_18thBT <- as.numeric(str_replace_all(filesize_end_18thBT, " |KiB", ""))
names_match_filesize_beg_18thBT <- names_rev_hist18th[-idx_nolink_beg_18thBT]
filesize_beg_18thBT <- mapply(c, names_match_filesize_beg_18thBT, filesize_beg_18thBT, SIMPLIFY = FALSE)
filesize_beg_18thBT <- data.frame(matrix(unlist(filesize_beg_18thBT), nrow = 645, byrow = T))
filesize_end_18thBT <- mapply(c, names_rev_hist18th, filesize_end_18thBT, SIMPLIFY = FALSE)
filesize_end_18thBT <- data.frame(matrix(unlist(filesize_end_18thBT), nrow = 646, byrow = T))
filesize_18thBT <- merge(filesize_end_18thBT, filesize_beg_18thBT, by="X1", all=TRUE)
idx_nolink_beg_18thBT2 <- which(is.na(filesize_18thBT$X2.y))
filesize_18thBT$X2.x[idx_nolink_beg_18thBT2] <- NA
filesize_beg_18thBT <- as.vector(filesize_18thBT$X2.y)
filesize_end_18thBT <- as.vector(filesize_18thBT$X2.x)
filesize_beg_18thBT <- as.numeric(replace(filesize_beg_18thBT, idx_nolink_beg_18thBT2, 0))
filesize_end_18thBT <- as.numeric(replace(filesize_end_18thBT, idx_nolink_beg_18thBT2, 0))
filesize_18thBT <- filesize_end_18thBT - filesize_beg_18thBT # Already sorted!!!

library(dplyr)
# page views on MPs' Wikipedia pages - 16thBT -------------------------------------------
wiki_ger_df$date <- NULL
page_views_16thBT <- colSums(wiki_ger_df, na.rm = FALSE, dims = 1)
page_views_16thBT <- data.frame(page_views_16thBT)
page_views_16thBT <- cbind(X1 = rownames(page_views_16thBT), page_views_16thBT)
names_match_page_views16th <- list.files("./htmls/htmlwiki16thBT/")
names_match_page_views16th <- data.frame(str_replace_all(names_match_page_views16th, "\\.html", ""))
names(names_match_page_views16th)[1] <- "X1"
page_views_16thBT$match <- as.numeric(page_views_16thBT$X1 %in% names_match_page_views16th$X1)
page_views_16thBT <-page_views_16thBT[!(page_views_16thBT$match==0),]
page_views_16thBT <- subset(page_views_16thBT, select = -c(3) )
page_views_16thBT <- merge(names_match_page_views16th, page_views_16thBT, by="X1", all=TRUE, sort=FALSE)
page_views_16thBT <- as.numeric(page_views_16thBT$page_views_16thBT)
length(page_views_16thBT)

# page views on MPs' Wikipedia pages - 17thBT -------------------------------------------
page_views_17thBT <- colSums(wiki_ger_df, na.rm = FALSE, dims = 1)
page_views_17thBT <- data.frame(page_views_17thBT)
page_views_17thBT <- cbind(X1 = rownames(page_views_17thBT), page_views_17thBT)
levels(page_views_17thBT$X1)[1029] <- c("Ursula_von_der_Leyen")
levels(page_views_17thBT$X1)[983] <- c("Thomas_de_Maizi%C3%A8re")
levels(page_views_17thBT$X1)[367] <- c("Hans-Georg_von_der_Marwitz")
names_match_page_views17th <- list.files("./htmls/htmlwiki17thBT/")
names_match_page_views17th <- data.frame(str_replace_all(names_match_page_views17th, "\\.html", ""))
names(names_match_page_views17th)[1] <- "X1"
page_views_17thBT$match <- as.numeric(page_views_17thBT$X1 %in% names_match_page_views17th$X1)
page_views_17thBT <- page_views_17thBT[!(page_views_17thBT$match==0),]
page_views_17thBT <- subset(page_views_17thBT, select = -c(3))
page_views_17thBT <- merge(names_match_page_views17th, page_views_17thBT, by="X1", all=TRUE, sort=FALSE)
page_views_17thBT$X1 <- as.character(page_views_17thBT$X1)
page_views_17thBT$X1[144] <- str_replace(string = page_views_17thBT$X1[144],  pattern = "Elisabeth_Paus", replacement = "Lisa_Paus")
page_views_17thBT <- arrange(page_views_17thBT, X1)
page_views_17thBT <- as.numeric(page_views_17thBT$page_views_17thBT)
length(page_views_17thBT)

# page views on MPs' Wikipedia pages - 18thBT -------------------------------------------
page_views_18thBT <- colSums(wiki_ger_df, na.rm = FALSE, dims = 1)
page_views_18thBT <- data.frame(page_views_18thBT)
page_views_18thBT <- cbind(X1 = rownames(page_views_18thBT), page_views_18thBT)
levels(page_views_18thBT$X1)[1029] <- c("Ursula_von_der_Leyen")
levels(page_views_18thBT$X1)[983] <- c("Thomas_de_Maizi%C3%A8re")
levels(page_views_18thBT$X1)[367] <- c("Hans-Georg_von_der_Marwitz")
levels(page_views_18thBT$X1)[581] <- c("Kees_de_Vries")
levels(page_views_18thBT$X1)[1] <- c("C3%96zcan_Mutlu")
names_match_page_views18th <- list.files("./htmls/htmlwiki18thBT/")
names_match_page_views18th <- data.frame(str_replace_all(names_match_page_views18th, "\\.html", ""))
names(names_match_page_views18th)[1] <- "X1"
page_views_18thBT$match <- as.numeric(page_views_18thBT$X1 %in% names_match_page_views18th$X1)
page_views_18thBT <- page_views_18thBT[!(page_views_18thBT$match==0),]
page_views_18thBT <- subset(page_views_18thBT, select = -c(3))
page_views_18thBT <- merge(names_match_page_views18th, page_views_18thBT, by="X1", all=TRUE, sort=FALSE)
page_views_18thBT$X1 <- as.character(page_views_18thBT$X1)
page_views_18thBT$X1[14] <- str_replace(string = page_views_18thBT$X1[14],  pattern = "Alois_Georg_Josef_Rainer", replacement = "Alois_Rainer")
page_views_18thBT$X1[165] <- str_replace(string = page_views_18thBT$X1[165],  pattern = "Elisabeth_Paus", replacement = "Lisa_Paus")
page_views_18thBT <- arrange(page_views_18thBT, X1)
page_views_18thBT <- as.numeric(page_views_18thBT$page_views_18thBT)
length(page_views_18thBT)
detach("package:dplyr")


#### DATA GENERATION FROM BUNDESTAG PAGE HTMLS ==========================================

# MPs' names - 16thBT -------------------------------------------------------------------
names_party_bt16th <- as.character(extNamesPartyBt(folder = "./htmls/htmlbt16th"))
names_party_bt16th <- str_replace_all(names_party_bt16th, ", .+| \\(.+|Dr\\. |Prof. |h\\. c\\. |h.c. |\\\r\\\r\\\n.+", "")
names_party_bt16th <- str_replace_all(names_party_bt16th, "Ã¶", "ö")
names_party_bt16th <- str_replace_all(names_party_bt16th, "Ã¼", "ü")
names_party_bt16th <- str_replace_all(names_party_bt16th, "Ã¤", "ä")
names_party_bt16th <- str_replace_all(names_party_bt16th, "Ã©", "é")
names_party_bt16th <- str_replace_all(names_party_bt16th, "Ä.", "ğ")
names_party_bt16th <- str_replace_all(names_party_bt16th, "Ã.", "ß")
names_party_bt16th <- str_replace_all(names_party_bt16th, "Å¡kovig", "skovic")
names_party_bt16th <- str_replace(names_party_bt16th, "list.+", "Michael Fuchs")
head(names_party_bt16th)

# MPs' names - 17thBT -------------------------------------------------------------------
names_party_bt17th <- as.character(extNamesPartyBt(folder = "./htmls/htmlbt17th"))
names_party_bt17th <- str_replace_all(names_party_bt17th, ", .+| \\(.+|Dr\\. |h\\. c\\. |\\\r\\\r\\\n.+|h\\.c\\. |Prof. ", "")
names_party_bt17th <- str_replace_all(names_party_bt17th, "Ne.kovi.", "Neskovic")
names_party_bt17th <- str_replace_all(names_party_bt17th, "Da.delen", "Dagdelen")
names_party_bt17th <- str_replace_all(names_party_bt17th, "Özo.uz", "Özoguz")
head(names_party_bt17th)

# MPs' names - 18thBT -------------------------------------------------------------------
names_party_bt18th <- as.character(extNamesPartyBt(folder = "./htmls/htmlbt18th"))
names_party_bt18th <- str_replace_all(names_party_bt18th, ", .+| \\(.+|Dr\\. |h\\. c\\. |\\\r\\\r\\\n.+|h\\.c\\. |Prof\\. |rer\\. |nat\\. |pol\\. |iur\\. ", "")
names_party_bt18th <- replace(names_party_bt18th, 579, "Karl-Heinz Huber")
head(names_party_bt18th)

# MPs' mandate - 16 thBT ----------------------------------------------------------------
mp_mandate16th <- as.character(extMPMandateDistrict16th(folder = "./htmls/htmlbt16th"))
mp_mandate16th <- str_extract_all(mp_mandate16th, "Direkt|Landesliste")
mp_mandate16th <- replace(mp_mandate16th, 148, "Direkt")
head(mp_mandate16th)

# MPs' mandate - 17 thBT ----------------------------------------------------------------
mp_mandate17th <- as.character(extMPMandate1718th(folder = "./htmls/htmlbt17th"))
mp_mandate17th <- str_extract_all(mp_mandate17th, "Direkt|Landesliste")
head(mp_mandate17th)
  
# MPs' mandate - 18 thBT ----------------------------------------------------------------
mp_mandate18th <- as.character(extMPMandate1718th(folder = "./htmls/htmlbt18th"))
mp_mandate18th <- str_extract_all(mp_mandate18th, "Direkt|Landesliste")
head(mp_mandate18th)
  
# MPs' electoral district - 16th BT -----------------------------------------------------
mp_district16th <- as.character(extMPMandateDistrict16th(folder = "./htmls/htmlbt16th"))
mp_district16th <- str_extract_all(mp_district16th, "[[:digit:]]+(?=\\:)")
mp_district16th <- replace(mp_district16th, c(561, 562, 572, 555, 531, 514, 510, 476, 455, 420, 407, 401, 399, 392, 385, 374, 361, 344, 325, 286, 285, 262, 259, 258, 252, 235, 229, 222, 215, 208, 156, 148, 102, 80, 53, 35, 16), "")
head(mp_district16th)

# MPs' electoral district - 17th BT -----------------------------------------------------
mp_district17th <- as.character(extMPDistrict1718th(folder = "./htmls/htmlbt17th"))
mp_district17th <- str_extract_all(mp_district17th, "[[:digit:]]+(?=\\:)")
mp_district17th <- replace(mp_district17th, c(615, 597, 547, 467, 444, 405, 368, 351, 327, 255, 247, 226, 222, 221, 176, 89, 80, 5, 4), "")
head(mp_district17th)
  
# MPs' electoral district - 18th BT -----------------------------------------------------
mp_district18th <- as.character(extMPDistrict1718th(folder = "./htmls/htmlbt18th"))
mp_district18th <- str_extract_all(mp_district18th, "[[:digit:]]+(?=\\:)")
mp_district18th <- replace(mp_district18th, c(646, 644, 642, 641, 640, 639, 638, 635, 634, 633, 630, 624, 623, 619, 618, 613, 596, 580, 570, 563, 546, 544, 539, 494, 472, 329, 286, 265, 158, 125, 103, 65, 56, 36, 9, 7, 3), "")
head(mp_district18th)

# MPs' legislative term - 16th BT -------------------------------------------------------
term16th <- c(1:641)
term16th <- replace(term16th, 1:641, "16th")
head(term16th)

# MPs' legislative term - 17th BT -------------------------------------------------------
term17th <- c(1:652)
term17th <- replace(term17th, 1:652, "17th")
head(term17th)

# MPs' legislative term - 18th BT -------------------------------------------------------
term18th <- c(1:646)
term18th <- replace(term18th, 1:646, "18th")
head(term18th)


#### CONSTRUCTION OF DATA FRAMES ========================================================

# data frame - 16th BT ------------------------------------------------------------------
data_wiki16th <- mapply(c, names_rev_hist16th, total_rev16th, pos_rev16th, neg_rev16th, nul_rev16th, size_pos_rev16th, size_neg_rev16th, reverts16th, btip_total_rev16th, btip_pos_rev16th, btip_neg_rev16th, btip_null_rev16th, btip_size_pos_rev16th, btip_size_neg_rev16th, btip_reverts16th, page_views_16thBT, SIMPLIFY = FALSE)
data_wiki16th <- data.frame(matrix(unlist(data_wiki16th), nrow = 641, byrow = T))
data_wiki16th <- rename(data_wiki16th, c("X1" = "MP", "X2" = "total_revisions", "X3" = "insertions", "X4" = "deletions", "X5" = "null_changes", "X6" = "insertions_size", "X7" = "deletions_size", "X8" = "reverts", "X9" = "bt_edits", "X10" = "bt_insertions", "X11" = "bt_deletions", "X12" = "bt_null_changes", "X13" = "bt_insertions_size", "X14" = "bt_deletions_size", "X15" = "bt_reverts", "X16" = "page_views"))
attach(data_wiki16th)
data_wiki16th <- data_wiki16th[order(MP),]
detach(data_wiki16th)
data_wiki16th$page_growth <- filesize_16thBT

data_wikip16th <- mapply(c, names_wiki_pages16th, mp_age16th, mp_gen16th, SIMPLIFY = FALSE)
data_wikip16th <- data.frame(matrix(unlist(data_wikip16th), nrow = 641, byrow = T))
data_wikip16th <- rename(data_wikip16th, c("X1" = "MP", "X2" = "age", "X3" = "gender"))
attach(data_wikip16th)
data_wikip16th <- data_wikip16th[order(MP),]
detach(data_wikip16th)

data_bt16th <- mapply(c, names_party_bt16th, mp_mandate16th, mp_district16th, term16th, SIMPLIFY = FALSE)
data_bt16th <- data.frame(matrix(unlist(data_bt16th), nrow = 641, byrow = T))
data_bt16th <- rename(data_bt16th, c("X1" = "MP", "X2" = "mandate", "X3" = "district", "X4" = "term"))
attach(data_bt16th)
data_bt16th <- data_bt16th[order(MP),]
detach(data_bt16th)

data_wikil16th <- mapply(c, names_wiki_list16th, mp_party16th, mp_origin16th, SIMPLIFY = FALSE)
data_wikil16th <- data.frame(matrix(unlist(data_wikil16th), nrow = 641, byrow = T))
data_wikil16th <- rename(data_wikil16th, c("X1" = "MP", "X2" = "party", "X3" = "origin"))
attach(data_wikil16th)
data_wikil16th <- data_wikil16th[order(MP),]
detach(data_wikil16th)

data16th <- merge(data_wiki16th, data_wikil16th)
data16th <- merge(data16th, data_wikip16th)
data16th <- merge(data16th, data_bt16th)
data16th <- data16th[c(1, 21, 20, 19, 18, 22:24, 16:17, 2:15)]

data16th <- transform(data16th, MP = as.character(MP), total_revisions = as.numeric(as.character(total_revisions)),  insertions = as.numeric(as.character(insertions)), deletions = as.numeric(as.character(deletions)), null_changes = as.numeric(as.character(null_changes)), insertions_size = as.numeric(as.character(insertions_size)), deletions_size = as.numeric(as.character(deletions_size)), bt_edits = as.numeric(as.character(bt_edits)), bt_insertions = as.numeric(as.character(bt_insertions)), bt_deletions = as.numeric(as.character(bt_deletions)), bt_null_changes = as.numeric(as.character(bt_null_changes)), bt_insertions_size = as.numeric(as.character(bt_insertions_size)), bt_deletions_size = as.numeric(as.character(bt_deletions_size)), gender = as.factor(gender), age = as.numeric(as.character(age)), party = as.factor(party), mandate = as.factor(mandate), origin = as.factor(origin), district = as.numeric(as.character(district)), term = as.factor(as.character(term)), reverts = as.numeric(as.character(reverts)), bt_reverts = as.numeric(as.character(bt_reverts)), page_views = as.numeric(as.character(page_views)), page_growth = as.numeric(as.character(page_growth)))
sapply(data16th, class)

# data frame - 17th BT ------------------------------------------------------------------
data_wiki17th <- mapply(c, names_rev_hist17th, total_rev17th, pos_rev17th, neg_rev17th, nul_rev17th, size_pos_rev17th, size_neg_rev17th, reverts17th, btip_total_rev17th, btip_pos_rev17th, btip_neg_rev17th, btip_null_rev17th, btip_size_pos_rev17th, btip_size_neg_rev17th, btip_reverts17th, page_views_17thBT, filesize_17thBT, SIMPLIFY = FALSE)
data_wiki17th <- data.frame(matrix(unlist(data_wiki17th), nrow = 652, byrow = T))
data_wiki17th <- rename(data_wiki17th, c("X1" = "MP", "X2" = "total_revisions", "X3" = "insertions", "X4" = "deletions", "X5" = "null_changes", "X6" = "insertions_size", "X7" = "deletions_size", "X8" = "reverts", "X9" = "bt_edits", "X10" = "bt_insertions", "X11" = "bt_deletions", "X12" = "bt_null_changes", "X13" = "bt_insertions_size", "X14" = "bt_deletions_size", "X15" = "bt_reverts", "X16" = "page_views", "X17" = "page_growth"))
attach(data_wiki17th)
data_wiki17th <- data_wiki17th[order(MP),]
detach(data_wiki17th)

data_wikip17th <- mapply(c, names_wiki_pages17th, mp_age17th, mp_gen17th, SIMPLIFY = FALSE)
data_wikip17th <- data.frame(matrix(unlist(data_wikip17th), nrow = 652, byrow = T))
data_wikip17th <- rename(data_wikip17th, c("X1" = "MP", "X2" = "age", "X3" = "gender"))
attach(data_wikip17th)
data_wikip17th <- data_wikip17th[order(MP),]
detach(data_wikip17th)

data_bt17th <- mapply(c, names_party_bt17th, mp_mandate17th, mp_district17th, term17th, SIMPLIFY = FALSE)
data_bt17th <- data.frame(matrix(unlist(data_bt17th), nrow = 652, byrow = T))
data_bt17th <- rename(data_bt17th, c("X1" = "MP", "X2" = "mandate", "X3" = "district", "X4" = "term"))
attach(data_bt17th)
data_bt17th <- data_bt17th[order(MP),]
detach(data_bt17th)

data_wikil17th <- mapply(c, names_wiki_list17th, mp_party17th, mp_origin17th, SIMPLIFY = FALSE)
data_wikil17th <- data.frame(matrix(unlist(data_wikil17th), nrow = 652, byrow = T))
data_wikil17th <- rename(data_wikil17th, c("X1" = "MP", "X2" = "party", "X3" = "origin"))
attach(data_wikil17th)
data_wikil17th <- data_wikil17th[order(MP),]
detach(data_wikil17th)

data17th <- merge(data_wiki17th, data_wikil17th)
data17th <- merge(data17th, data_wikip17th)
data17th <- merge(data17th, data_bt17th)
data17th <- data17th[c(1, 21, 20, 19, 18, 22:24, 16:17, 2:15)]

data17th <- transform(data17th, MP = as.character(MP), total_revisions = as.numeric(as.character(total_revisions)),  insertions = as.numeric(as.character(insertions)), deletions = as.numeric(as.character(deletions)), null_changes = as.numeric(as.character(null_changes)), insertions_size = as.numeric(as.character(insertions_size)), deletions_size = as.numeric(as.character(deletions_size)), bt_edits = as.numeric(as.character(bt_edits)), bt_insertions = as.numeric(as.character(bt_insertions)), bt_deletions = as.numeric(as.character(bt_deletions)), bt_null_changes = as.numeric(as.character(bt_null_changes)), bt_insertions_size = as.numeric(as.character(bt_insertions_size)), bt_deletions_size = as.numeric(as.character(bt_deletions_size)), gender = as.factor(gender), age = as.numeric(as.character(age)), party = as.factor(party), mandate = as.factor(mandate), origin = as.factor(origin), district = as.numeric(as.character(district)), term = as.factor(as.character(term)), reverts = as.numeric(as.character(reverts)), bt_reverts = as.numeric(as.character(bt_reverts)), page_views = as.numeric(as.character(page_views)), page_growth = as.numeric(as.character(page_growth)))
sapply(data17th, class)

# data frame - 18th BT ------------------------------------------------------------------
data_wiki18th <- mapply(c, names_rev_hist18th, total_rev18th, pos_rev18th, neg_rev18th, nul_rev18th, size_pos_rev18th, size_neg_rev18th, reverts18th, btip_total_rev18th, btip_pos_rev18th, btip_neg_rev18th, btip_null_rev18th, btip_size_pos_rev18th, btip_size_neg_rev18th, btip_reverts18th, page_views_18thBT, SIMPLIFY = FALSE)
data_wiki18th <- data.frame(matrix(unlist(data_wiki18th), nrow = 646, byrow = T))
data_wiki18th <- rename(data_wiki18th, c("X1" = "MP", "X2" = "total_revisions", "X3" = "insertions", "X4" = "deletions", "X5" = "null_changes", "X6" = "insertions_size", "X7" = "deletions_size", "X8" = "reverts", "X9" = "bt_edits", "X10" = "bt_insertions", "X11" = "bt_deletions", "X12" = "bt_null_changes", "X13" = "bt_insertions_size", "X14" = "bt_deletions_size", "X15" = "bt_reverts", "X16" = "page_views"))
attach(data_wiki18th)
data_wiki18th <- data_wiki18th[order(MP),]
detach(data_wiki18th)
data_wiki18th$page_growth <- filesize_18thBT

data_wikip18th <- mapply(c, names_wiki_pages18th, mp_age18th, mp_gen18th, SIMPLIFY = FALSE)
data_wikip18th <- data.frame(matrix(unlist(data_wikip18th), nrow = 646, byrow = T))
data_wikip18th <- rename(data_wikip18th, c("X1" = "MP", "X2" = "age", "X3" = "gender"))
attach(data_wikip18th)
data_wikip18th <- data_wikip18th[order(MP),]
detach(data_wikip18th)

data_bt18th <- mapply(c, names_party_bt18th, mp_mandate18th, mp_district18th, term18th, SIMPLIFY = FALSE)
data_bt18th <- data.frame(matrix(unlist(data_bt18th), nrow = 646, byrow = T))
data_bt18th <- rename(data_bt18th, c("X1" = "MP", "X2" = "mandate", "X3" = "district", "X4" = "term"))
attach(data_bt18th)
data_bt18th <- data_bt18th[order(MP),]
detach(data_bt18th)

data_wikil18th <- mapply(c, names_wiki_list18th, mp_party18th, mp_origin18th, SIMPLIFY = FALSE)
data_wikil18th <- data.frame(matrix(unlist(data_wikil18th), nrow = 646, byrow = T))
data_wikil18th <- rename(data_wikil18th, c("X1" = "MP", "X2" = "party", "X3" = "origin"))
attach(data_wikil18th)
data_wikil18th <- data_wikil18th[order(MP),]
detach(data_wikil18th)

data18th <- merge(data_wiki18th, data_wikil18th)
data18th <- merge(data18th, data_wikip18th)
data18th <- merge(data18th, data_bt18th)
data18th <- data18th[c(1, 21, 20, 19, 18, 22:24, 16:17, 2:15)]

data18th <- transform(data18th, MP = as.character(MP), total_revisions = as.numeric(as.character(total_revisions)),  insertions = as.numeric(as.character(insertions)), deletions = as.numeric(as.character(deletions)), null_changes = as.numeric(as.character(null_changes)), insertions_size = as.numeric(as.character(insertions_size)), deletions_size = as.numeric(as.character(deletions_size)), bt_edits = as.numeric(as.character(bt_edits)), bt_insertions = as.numeric(as.character(bt_insertions)), bt_deletions = as.numeric(as.character(bt_deletions)), bt_null_changes = as.numeric(as.character(bt_null_changes)), bt_insertions_size = as.numeric(as.character(bt_insertions_size)), bt_deletions_size = as.numeric(as.character(bt_deletions_size)), gender = as.factor(gender), age = as.numeric(as.character(age)), party = as.factor(party), mandate = as.factor(mandate), origin = as.factor(origin), district = as.numeric(as.character(district)), term = as.factor(as.character(term)), reverts = as.numeric(as.character(reverts)), bt_reverts = as.numeric(as.character(bt_reverts)), page_views = as.numeric(as.character(page_views)), page_growth = as.numeric(as.character(page_growth)))
sapply(data18th, class)

# data frame - combined -----------------------------------------------------------------
data_combined <- rbind(data16th, data17th, data18th)
data_combined <- data_combined[!(data_combined$party=="fraktionslos"),]
data_combined$party <- droplevels(data_combined$party)
data_combined$party <- factor(data_combined$party, levels = c("Die Linke", "Bündnis 90/Die Grünen", "SPD", "FDP", "CDU", "CSU"))

# export data frames into Stata's .dta format -------------------------------------------
write.dta(data_combined, "./data/data_combined.dta")
write.dta(data16th, "./data/data16th.dta")
write.dta(data17th, "./data/data17th.dta")
write.dta(data18th, "./data/data18th.dta")

