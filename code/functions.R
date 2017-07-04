# ---------------------------------------------------------------------------------------
# POLITICAL ADVERTISING ON THE WIKIPEDIA MARKETPLACE OF INFORMATION
# Sascha Göbel and Simon Munzert
# Functions script
# November 2015
# ---------------------------------------------------------------------------------------


#### BUILD FUNCTIONS ====================================================================

# links to MPs' wikipedia page revision histories ---------------------------------------
extRevHistLinks <- function(links_url) {
  links_parsed <- html(links_url, encoding = "UTF-8")
  rev_hist <- xpathSApply(links_parsed, "//div/ul/li//span/a[contains(text(), 'Versionsgeschichte')]", xmlGetAttr, "href")
  return(rev_hist)
}

# MPs' wikipedia pages ------------------------------------------------------------------
dlwikiHtmls <- function(pageurl, folder , handle) {
  dir.create(folder, showWarnings = FALSE)
  page_name <- str_c(str_extract(pageurl, "[[:upper:]][[:print:]]+?[^&]*"), ".html")
  if (!file.exists(str_c(folder, "/", page_name))) {
    content <- try(getURL(pageurl, cainfo = signatures))
    write(content, str_c(folder, "/", page_name))
    Sys.sleep(1)
  }
}

# MPs' wikipedia pages (old id and corresponding dates) ---------------------------------
extWikiLinksOldId <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  links <- llply(pages_parsed, xpathSApply, "//input[@type='radio']/following-sibling::a", xmlGetAttr, "href")
  return(links)
}

extWikiLinksOldIdDates <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  links <- llply(pages_parsed, xpathSApply, "//input[@type='radio']/following-sibling::a", xmlValue)
  return(links)
}

# MPs' wikipedia page revision histories ------------------------------------------------
dlRevHistHtmls <- function(pageurl, folder , handle) {
  dir.create(folder, showWarnings = FALSE)
  page_name <- str_c(str_extract(pageurl, "[[:upper:]].+"), ".html")
  if (!file.exists(str_c(folder, "/", page_name))) {
    content <- try(getURL(pageurl, cainfo = signatures))
    write(content, str_c(folder, "/", page_name))
    Sys.sleep(1)
  }
}

# MPs' Bundestag page htmls - 16th BT ---------------------------------------------------
dlBtHtmls16thBT <- function(pageurl, folder ,handle) {
  dir.create(folder, showWarnings = FALSE)
  page_name <- str_c(str_extract(pageurl, "[[:lower:]]+_?[[:lower:]]+(wo|[[:digit:]])"), ".html")
  if (!file.exists(str_c(folder, "/", page_name))) {
    content <- try(getURL(pageurl, curl = handle))
    write(content, str_c(folder, "/", page_name))
    Sys.sleep(1)
  }
}

# MPs' Bundestag page htmls - 17th BT ---------------------------------------------------
dlBtHtmls17thBT <- function(pageurl, folder ,handle) {
  dir.create(folder, showWarnings = FALSE)
  page_name <- str_c(str_extract(pageurl, "[[:lower:]]+(_|-)[[:lower:]]+"), ".html")
  if (!file.exists(str_c(folder, "/", page_name))) {
    content <- try(getURL(pageurl, curl = handle))
    write(content, str_c(folder, "/", page_name))
    Sys.sleep(1)
  }
}

# MPs' Bundestag page htmls - 18th BT ---------------------------------------------------
dlBtHtmls18thBT <- function(pageurl, folder ,handle) {
  dir.create(folder, showWarnings = FALSE)
  page_name <- str_c(str_extract(pageurl, "[[:digit:]]+$"), ".html")
  if (!file.exists(str_c(folder, "/", page_name))) {
    content <- try(getURL(pageurl, curl = handle))
    write(content, str_c(folder, "/", page_name))
    Sys.sleep(1)
  }
}

# MPs' age and gender (from wikiprofile) ------------------------------------------------
extPersonal <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  personal <- llply(pages_parsed, xpathSApply, "//div[@id='mw-content-text']/p[1]", xmlValue)
  return(personal)
}

# MPs' names (from wikiprofile) ---------------------------------------------------------
extNamesRevHist <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  names_rev_hist <- llply(pages_parsed, xpathSApply, "//h1[@id='firstHeading']", xmlValue)
  return(names_rev_hist)
}

# total revisions (dates) ---------------------------------------------------------------
extTotRev <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  tot_rev <- llply(pages_parsed, xpathSApply, "//li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", xmlValue)
  return(tot_rev)
}

# negative revisions (dates) ------------------------------------------------------------
extNegRev <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  neg_rev <- llply(pages_parsed, xpathSApply, "//li//u/u/*[@class='mw-plusminus-neg']/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", xmlValue)
  return(neg_rev)
}

# positive revisions (dates) ------------------------------------------------------------
extPosRev <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  pos_rev <- llply(pages_parsed, xpathSApply, "//li//u/u/*[@class='mw-plusminus-pos']/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", xmlValue)
  return(pos_rev)
}

# null revisions (dates) ----------------------------------------------------------------
extNulRev <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  nul_rev <- llply(pages_parsed, xpathSApply, "//li//u/u/*[@class='mw-plusminus-null']/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", xmlValue)
  return(nul_rev)
}

# size of positive revisions ------------------------------------------------------------
doublequery <- c("//li//u/u/*[@class='mw-plusminus-pos']/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", "//*[@class='mw-plusminus-pos']")
extSizePosRev <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  size_pos_rev <- llply(pages_parsed, xpathSApply, doublequery, xmlValue)
  return(size_pos_rev)
}

# size of negative revisions ------------------------------------------------------------
doublequery2 <- c("//li//u/u/*[@class='mw-plusminus-neg']/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", "//*[@class='mw-plusminus-neg']")
extSizeNegRev <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  size_neg_rev <- llply(pages_parsed, xpathSApply, doublequery2, xmlValue)
  return(size_neg_rev)
}

# edit comments -------------------------------------------------------------------------
doublequery6 <- c("//li//u/u/*[@class='comment']/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", "//*[@class='comment']")
extComments <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  comments <- llply(pages_parsed, xpathSApply, doublequery6, xmlValue)
  return(comments)
}

# edit dates ----------------------------------------------------------------------------
extEditDates <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  edit_dates <- llply(pages_parsed, xpathSApply, "//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", xmlValue)
  return(edit_dates)
}

# total revisions from Bundestag IPs (dates) --------------------------------------------
extIpBt <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  ip_bt <- llply(pages_parsed, xpathSApply, "//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", xmlValue)
  return(ip_bt)
}

# positive revisions stemming from Bundestag IPs (dates and size) -----------------------
doublequery3 <- c("//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", "//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'mw-plusminus-pos')]")
extIpBtPos <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  ip_bt_pos <- llply(pages_parsed, xpathSApply, doublequery3, xmlValue)
  return(ip_bt_pos)
}

# negative revisions stemming from Bundestag IPs (dates and size) -----------------------
doublequery4 <- c("//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", "//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'mw-plusminus-neg')]")
extIpBtNeg <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  ip_bt_neg <- llply(pages_parsed, xpathSApply, doublequery4, xmlValue)
  return(ip_bt_neg)
}

# null revisions stemming from Bundestag IPs (dates and size) ---------------------------
doublequery5 <- c("//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", "//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'mw-plusminus-null')]")
extIpBtNull <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  ip_bt_null <- llply(pages_parsed, xpathSApply, doublequery5, xmlValue)
  return(ip_bt_null)
}

# comments for edits stemming from Bundestag IPs ----------------------------------------
doublequery7 <- c("//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", "//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'comment')]")
extIpBtComments <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  comments <- llply(pages_parsed, xpathSApply, doublequery7, xmlValue)
  return(comments)
}

# edit dates for edits stemming from Bundestag IPs --------------------------------------
extBtIpEditDates <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  ip_bt_edit_dates <- llply(pages_parsed, xpathSApply, "//span[@class='history-user']/a[contains(text(), '193.17.2')]/ancestor::li//*[contains(@class,'mw-changeslist-date') or contains(@class ,'history-deleted')]", xmlValue)
  return(ip_bt_edit_dates)
}

# MPs' names (from Bundestag page) ------------------------------------------------------
extNamesPartyBt <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  names_party_bt <- llply(pages_parsed, xpathSApply, "//h1[contains(text(), ',')]", xmlValue)
  return(names_party_bt)
}

# MPs' mandate and district -------------------------------------------------------------
extMPMandateDistrict16th <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  mandate <- llply(pages_parsed, xpathSApply, "//div[@id='context']", xmlValue)
  return(mandate)
}

extMPMandate1718th <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  mandate <- llply(pages_parsed, xpathSApply, "//div[@id='context']/div/h2[contains(text(), 'Direkt')] | //div[@id='context']/div/h2[contains(text(), 'Landesliste')]", xmlValue)
  return(mandate)
}

extMPDistrict1718th <- function(folder) {
  pages_parsed <- lapply(str_c(folder, "/", dir(folder)), htmlParse)
  district <- llply(pages_parsed, xpathSApply, "//div[@class='linkIntern']/a[contains(text(), 'Wahlkreis')]", xmlValue)
  return(district)
}