**********************************************************************
**        Political advertising on the Wikipedia marketplace        **
**                			  of information						**
**																	**
**					  Sascha Göbel and Simon Munzert				**					 
**********************************************************************
** Analysis script							                        **
** January 2016														**
**********************************************************************

version 13
set scheme s1mono
* requires spost13


*---------------------------------------*
* Preparations				            |
*---------------------------------------*
* import data
use ".\data\data_combined.dta", clear

* generate daily average of page views
gen avgd_page_views = page_views/2820

* generate logarithm of page views
gen ln_page_views = ln(page_views)

* recode gender
recode gender(2=0)
label define gender 0 "male", modify


*---------------------------------------*
* Figures and Models					|
*---------------------------------------*
/* Figure 1: Members of parliament (MPs) ordered by Wikipedia page edits */
clear
use ".\data\data16th.dta"
sort total_revisions
gen MP_sort_tot = _n
sort insertions
gen MP_sort_ins = _n
sort deletions
gen MP_sort_del = _n
sort reverts
gen MP_sort_rev = _n

twoway (lpoly total_revisions MP_sort_tot, kernel(biweight) c(1)      ///
		lpattern(solid) lcolor(black) lwidth(medthick)) 		      ///
	   (lpoly insertions MP_sort_ins, kernel(biweight) c(1)			  ///
		lpattern(shortdash) lcolor(black) lwidth(medthick)) 		  ///
	   (lpoly deletions MP_sort_del, kernel(biweight) c(1)		      ///
		lpattern(longdash_dot) lcolor(black) lwidth(medthick))		  ///
	   (lpoly reverts MP_sort_rev, kernel(biweight) c(1)		      ///
		lpattern(dash) lcolor(black) lwidth(medthick)), 	  		  ///
	    ylabel(0(250)1000, grid glpattern(shortdash) glcolor(gs10) 	  ///
						  glwidth(thin) labsize(large)) 			  ///
		xlabel(0(100)600, nolabel noticks grid glpattern(shortdash)   ///
						  glcolor(gs10) glwidth(thin)) 				  ///
		ytitle("") 			  										  ///
		xtitle("") 				  					  				  ///
		legend(off) 												  ///
		fysize(51) fxsize(56) 									      ///
		name(lpol16th, replace)

clear
use ".\data\data17th.dta"
sort total_revisions
gen MP_sort_tot = _n
sort insertions
gen MP_sort_ins = _n
sort deletions
gen MP_sort_del = _n
sort reverts
gen MP_sort_rev = _n

twoway (lpoly total_revisions MP_sort_tot, kernel(biweight) c(1)      ///
		lpattern(solid) lcolor(black) lwidth(medthick)) 		      ///
	   (lpoly insertions MP_sort_ins, kernel(biweight) c(1)			  ///
		lpattern(shortdash) lcolor(black) lwidth(medthick)) 		  ///
	   (lpoly deletions MP_sort_del, kernel(biweight) c(1)		      ///
		lpattern(longdash_dot) lcolor(black) lwidth(medthick))		  ///
	   (lpoly reverts MP_sort_rev, kernel(biweight) c(1)		      ///
		lpattern(dash) lcolor(black) lwidth(medthick)),		 	  	  ///
	    ylabel(0(250)1000, nolabel noticks grid glpattern(shortdash)  ///
						  glcolor(gs10) glwidth(thin)) 				  ///
		xlabel(0(100)600, nolabel noticks grid glpattern(shortdash)	  /// 
						  glcolor(gs10) 							  ///
					      glwidth(thin)) 							  ///
		ytitle("") 				  									  ///
		xtitle("") 				  					  				  ///
		legend(off) 												  ///
		fysize(51) fxsize(50) 										  ///
		name(lpol17th, replace)
				
		
clear
use ".\data\data18th.dta"
sort total_revisions
gen MP_sort_tot = _n
sort insertions
gen MP_sort_ins = _n
sort deletions
gen MP_sort_del = _n
sort reverts
gen MP_sort_rev = _n

twoway (lpoly total_revisions MP_sort_tot, kernel(biweight) c(1)      ///
		lpattern(solid) lcolor(black) lwidth(medthick)) 		      ///
	   (lpoly insertions MP_sort_ins, kernel(biweight) c(1)			  ///
		lpattern(shortdash) lcolor(black) lwidth(medthick)) 		  ///
	   (lpoly deletions MP_sort_del, kernel(biweight) c(1)		      ///
		lpattern(longdash_dot) lcolor(black) lwidth(medthick))		  ///
	   (lpoly reverts MP_sort_rev, kernel(biweight) c(1)		      ///
		lpattern(dash) lcolor(black) lwidth(medthick)), 	  		  ///
	    ylabel(0(250)1000, nolabel noticks grid glpattern(shortdash)  ///
						  glcolor(gs10) glwidth(thin)) 				  ///
		xlabel(0(100)600, nolabel noticks grid glpattern(shortdash)   ///
						  glcolor(gs10) 	  						  ///
					      glwidth(thin)) 							  ///
		ytitle("") 				 									  ///
		xtitle("") 				  					  				  ///
		legend(off) 												  ///
		fysize(51) fxsize(50) 										  ///
		name(lpol18th, replace)

clear
use ".\data\data16th.dta"
sort bt_edits
gen MP_sort_bte = _n
sort bt_insertions
gen MP_sort_bti = _n
sort bt_deletions
gen MP_sort_btd = _n
sort bt_reverts
gen MP_sort_btr = _n

twoway (lpoly bt_edits MP_sort_bte, kernel(biweight) c(1)      		  ///
		lpattern(solid) lcolor(black) lwidth(medthick)) 		      ///
	   (lpoly bt_insertions MP_sort_bti, kernel(biweight) c(1)		  ///
		lpattern(shortdash) lcolor(black) lwidth(medthick)) 		  ///
	   (lpoly bt_deletions MP_sort_btd, kernel(biweight) c(1)		  ///
		lpattern(longdash_dot) lcolor(black) lwidth(medthick))		  ///
	   (lpoly bt_reverts MP_sort_btr, kernel(biweight) c(1)		  	  ///
		lpattern(dash) lcolor(black) lwidth(medthick)),       		  ///
	    ylabel(0(5)25, grid glpattern(shortdash) glcolor(gs10) 		  ///
			     glwidth(thin) labsize(large)) 					      ///
		xlabel(0(100)600, nolabel noticks grid glpattern(shortdash)   ///
						  glcolor(gs10) glwidth(thin)) 				  ///
		ytitle("") 			  										  ///
		xtitle("") 				  					  				  ///
		b1title("{bf:16{superscript:th} Bundestag}", margin(medsmall) ///
		      size(vlarge)) 										  ///
		legend(off) 												  ///
		fysize(51) fxsize(56) 									      ///
		name(lpolip16th, replace)

clear
use ".\data\data17th.dta"
sort bt_edits
gen MP_sort_bte = _n
sort bt_insertions
gen MP_sort_bti = _n
sort bt_deletions
gen MP_sort_btd = _n
sort bt_reverts
gen MP_sort_btr = _n

twoway (lpoly bt_edits MP_sort_bte, kernel(biweight) c(1)      		  ///
		lpattern(solid) lcolor(black) lwidth(medthick)) 		      ///
	   (lpoly bt_insertions MP_sort_bti, kernel(biweight) c(1)		  ///
		lpattern(shortdash) lcolor(black) lwidth(medthick)) 		  ///
	   (lpoly bt_deletions MP_sort_btd, kernel(biweight) c(1)		  ///
		lpattern(longdash_dot) lcolor(black) lwidth(medthick))		  ///
	   (lpoly bt_reverts MP_sort_btr, kernel(biweight) c(1)		  	  ///
		lpattern(dash) lcolor(black) lwidth(medthick)), 	  		  ///
	    ylabel(0(5)25, nolabel noticks grid glpattern(shortdash)      ///
			           glcolor(gs10) glwidth(thin)) 				  ///
		xlabel(0(100)600, nolabel noticks grid glpattern(shortdash)   ///
						  glcolor(gs10) 	  						  ///
					      glwidth(thin)) 							  ///
		ytitle("") 				  					  				  ///
		xtitle("") 				  					  				  ///
		b1title("{bf:17{superscript:th} Bundestag}", margin(medsmall) ///
			  size(vlarge)) 										  ///
		legend(off) 												  ///
		fysize(51) fxsize(50) 										  ///
		name(lpolip17th, replace)

clear
use ".\data\data18th.dta"
sort bt_edits
gen MP_sort_bte = _n
sort bt_insertions
gen MP_sort_bti = _n
sort bt_deletions
gen MP_sort_btd = _n
sort bt_reverts
gen MP_sort_btr = _n

twoway (lpoly bt_edits MP_sort_bte, kernel(biweight) c(1)      		  ///
		lpattern(solid) lcolor(black) lwidth(medthick)) 		      ///
	   (lpoly bt_insertions MP_sort_bti, kernel(biweight) c(1)		  ///
		lpattern(shortdash) lcolor(black) lwidth(medthick)) 		  ///
	   (lpoly bt_deletions MP_sort_btd, kernel(biweight) c(1)		  ///
		lpattern(longdash_dot) lcolor(black) lwidth(medthick))		  ///
	   (lpoly bt_reverts MP_sort_btr, kernel(biweight) c(1)		  	  ///
		lpattern(dash) lcolor(black) lwidth(medthick)), 	  		  ///
	    ylabel(0(5)25, nolabel noticks grid glpattern(shortdash) 	  ///
					   glcolor(gs10) glwidth(thin)) 				  ///
		xlabel(0(100)600, nolabel noticks grid glpattern(shortdash)   ///
						  glcolor(gs10) 	 						  ///
					      glwidth(thin)) 							  ///
		ytitle("") 				  					  				  ///
		xtitle("") 				  					  				  ///
		b1title("{bf:18{superscript:th} Bundestag}", margin(medsmall) ///
			  size(vlarge)) 										  ///
		fysize(51) fxsize(50) 										  ///
		legend(off) 												  ///
		name(lpolip18th, replace)

graph combine lpolip16th lpolip17th lpolip18th, row(1) imargin(b=0 t=0 ///
			  r=-3 l=-3) fysize(50) fxsize(150) 					   ///
			  t1title("{bf:(b) Edits from the Bundestag IT network}",  ///
			  size(medlarge) margin(small)) name(lpolip, replace)

graph combine lpol16th lpol17th lpol18th, col(3) imargin(b=0 t=0 	   ///
			  r=-3 l=-3) fysize(44) fxsize(150) 					   ///
			  t1title("{bf:(a) All edits}", size(medlarge) 			   ///
			  margin(small)) name(lpol, replace)
 
graph combine lpol lpolip, row(2) col(1) imargin(r=-3 l=-3 b=2  	   ///
			  t=2) ysize(2) xsize(3) l1title("{bf: Aggregated edits}", ///
			  size(medsmall) margin(small))
			  		
/* Legend */
			
clear
use ".\data\data_combined.dta"
sort total_revisions
gen MP_sort_tot = _n
sort insertions
gen MP_sort_ins = _n
sort reverts
gen MP_sort_rev = _n
sort deletions
gen MP_sort_del = _n

twoway (lpoly total_revisions MP_sort_tot, kernel(biweight) c(1)      ///
		lpattern(solid) lcolor(black) lwidth(medthick)) 		      ///
	   (lpoly insertions MP_sort_ins, kernel(biweight) c(1)			  ///
		lpattern(shortdash) lcolor(black) lwidth(medthick)) 		  ///
	   (lpoly deletions MP_sort_del, kernel(biweight) c(1)		      ///
		lpattern(longdash_dot) lcolor(black) lwidth(medthick))		  ///
	   (lpoly reverts MP_sort_rev, kernel(biweight) c(1)		      ///
		lpattern(dash) lcolor(black) lwidth(medthick)),				  ///
	    legend(cols(2) label(1 "total revisions") label(2             ///
			   "insertions") label(3 "deletions") label(4 "reverts")  ///
			   label(5 "size of insertions") label(6 "seize of deletions"))
			   

			   

/* Figure 2: . Page views of MPs’ Wikipedia entries over time */			   
clear
use ".\data\data_views_ts.dta"
generate newdate = date( date, "YMD")
format newdate %td_YYMonDD
tsset newdate
					  
tsline wiki_agg, lcolor(black) lwidth(thin) ///
					  ylabel(0(250000)1500000 0"0K" 250000" " 500000"500K" 750000" " 1000000"1000K" 1250000" " 1500000"1500K", grid ///
						     glpattern(shortdash) glcolor(gs10) 	  ///
							 glwidth(thin)) 						  ///
					  tlabel(01jan2008 "2008" 01jan2009 "2009" 01jan2010 "2010" ///
						     01jan2011 "2011" 01jan2012 "2012" 01jan2013 "2013" ///
							 01jan2014 "2014" 01jan2015 "2015" 01jan2016 "2016", nolabels notick   ///
							 angle(45) labsize(vlarge) labgap(tiny)     ///
							 grid glpattern(shortdash) glcolor(gs10)  ///
							 glwidth(thin)) ///
					  ytitle("") xtitle("")	 ///
					  title("{bf:(a) All MPs}", margin(small) size(medsmall)) 										  ///
					  tline(22sep2013, lcolor(black) lwidth(medium)       	  ///
					                     lpattern(solid)) 			  ///
				      tline(27sep2009, lcolor(black) lwidth(medium)  		  ///
										 lpattern(solid)) ///
					  fysize(100) ///
					  name(ts_agg_1, replace)
										 
clear
use ".\data\data_views_ts_spec.dta"
generate newdate = date( date, "YMD")
format newdate %td_YYMonDD
tsset newdate
					  
tsline wiki_agg_vips, lcolor(black) lwidth(thin) || tsline wiki_agg_novips, lcolor(gs9) lwidth(thin)								  ///
					  ylabel(0(250000)1250000 0"0K" 250000" " 500000"500K" 750000" " 1000000"1000K" 1250000" ", grid 			  ///
						     glpattern(shortdash) glcolor(gs10) 	  ///
							 glwidth(thin)) 						  ///
					  tlabel(01jan2008 "2008" 01jan2009 "2009" 01jan2010 "2010" ///
						     01jan2011 "2011" 01jan2012 "2012" 01jan2013 "2013" ///
							 01jan2014 "2014" 01jan2015 "2015" 01jan2016 "2016", nolabels notick   ///
							 angle(45) labsize(vlarge) labgap(tiny)     ///
							 grid glpattern(shortdash) glcolor(gs10)  ///
							 glwidth(thin)) ///
					  legend(off) ///
					  ytitle("") xtitle("")	 ///
					  title("{bf:(b) Popular MPs (black) vs. non-popular (grey) MPs}", margin(small) size(medsmall)) 										  ///
					  tline(22sep2013, lcolor(black) lwidth(medium)       	  ///
					                     lpattern(solid)) 			  ///
				      tline(27sep2009, lcolor(black) lwidth(medium)  		  ///
										 lpattern(solid)) ///
					  fysize(100) ///
					  name(ts_agg_2, replace)
										 
clear
use ".\data\data_views_ts_spec.dta"
generate newdate = date( date, "YMD")
format newdate %td_YYMonDD
tsset newdate
					  
tsline wiki_agg_direct, lcolor(black) lwidth(thin) || tsline wiki_agg_list, lcolor(gs9) lwidth(thin)								  ///
					  ylabel(0(20000)100000 0"0K" 20000" " 40000"40K" 60000" " 80000"80K" 100000" ", grid 			  ///
						     glpattern(shortdash) glcolor(gs10) 	  ///
							 glwidth(thin)) 						  ///
					  tlabel(01jan2008 "2008" 01jan2009 "2009" 01jan2010 "2010" ///
						     01jan2011 "2011" 01jan2012 "2012" 01jan2013 "2013" ///
							 01jan2014 "2014" 01jan2015 "2015" 01jan2016 "2016", ///
							 angle(45) labgap(tiny)     ///
							 grid glpattern(shortdash) glcolor(gs10)  ///
							 glwidth(thin)) ///
					  legend(off) ///
					  ytitle("") xtitle("")	 ///
					  title("{bf:(c) District- (black) vs. List-elected (grey) non-popular MPs}", margin(small) size(medsmall)) ///
					  tline(22sep2013, lcolor(black) lwidth(medium)       	  ///
					                     lpattern(solid)) 			  ///
				      tline(27sep2009, lcolor(black) lwidth(medium)  		  ///
										 lpattern(solid)) ///
					  fysize(124.5) ///
					  name(ts_agg_3, replace)
					  
graph combine ts_agg_1 ts_agg_2 ts_agg_3, row(3) imargin(b=0 t=0   ///
											 r=-3 l=-3) ysize(2) 	  ///
											 xsize(2) l1title("{bf: Aggregated page views}", margin(small) size(small))

			   
/* Figure 3: Edits on members of parliament (MPs’) Wikipedia entries over time */

clear
use ".\data\data_ts.dta"
format date %td_DDMonYY
generate mdate = mofd(date)
format mdate %tm_MonYY
gen revisions = 1
collapse (count) revisions, by(mdate)
tsset mdate
tsfill
replace revisions = 0 if revisions==.

tsline revisions, lcolor(black) lwidth(medium) 						  ///
				  tlabel(2006m1 2007m1 2008m1 2009m1 2010m1 2011m1    ///
						 2012m1 2013m1 2014m1 2015m1 2016m1, notick nolabels  ///
						 angle(45) labsize(large) labgap(vsmall) grid 				  ///
						 glpattern(shortdash) glcolor(gs10) 		  ///
						 glwidth(thin)) 							  ///
				  ylabel(, labsize(large) grid glpattern(shortdash) glcolor(gs10)    ///
				           glwidth(thin)) 							  ///
				  ytitle("") 				  ///
				  xtitle("") 										  ///
				  title("{bf:(a) All edits}", margin(small) size(large)) ///
				  tline(2013m9, lcolor(cranberry) lwidth(medthick)       	  ///
					                     lpattern(solid)) 			  ///
				  tline(2009m9, lcolor(cranberry) lwidth(medthick)  		  ///
										 lpattern(solid))  			  ///
				  tline(2005m9, lcolor(cranberry) lwidth(medthick)			  ///
										lpattern(solid)) ///
				  fysize(100) ///
				  name(ts_ed_1, replace)
										  
clear
use ".\data\data_tsip.dta"
format date %td_DDMonYY
generate mdate = mofd(date)
format mdate %tm_MonYY
gen btrevisions = 1
collapse (count) btrevisions, by(mdate)
tsset mdate
tsfill
replace btrevisions = 0 if btrevisions==.

tsline btrevisions, lcolor(black) lwidth(medium) 					      ///
                    tlabel(2006m1 2007m1 2008m1 2009m1  			  ///
					       2010m1 2011m1 2012m1 2013m1 2014m1 2015m1 2016m1, ///
						   format(%tmCY) angle(45) labsize(large) labgap(vsmall) grid  ///
						   glpattern(shortdash) glcolor(gs10)         ///
						   glwidth(thin))                             ///
					ylabel(, labsize(large) grid glpattern(shortdash) glcolor(gs10)  ///
					         glwidth(thin)) 						  ///
					ytitle("") 		  ///
					xtitle("") 									  ///
					title("{bf:(b) Edits from the Bundestag IT network}", margin(small) size(large)) ///
					tline(2013m9, lcolor(cranberry) lwidth(medthick)  ///
								  lpattern(solid))  			      ///
					tline(2009m9, lcolor(cranberry) lwidth(medthick)  ///
										 lpattern(solid)) 			  ///
					tline(2005m9, lcolor(cranberry) lwidth(medthick)  ///
										 lpattern(solid))  ///
					fysize(122.8) ///
				    name(ts_ed_2, replace)

graph combine ts_ed_1 ts_ed_2, row(2) imargin(b=1 t=0   ///
											 r=-3 l=-3) ysize(1.3) 	  ///
											 xsize(2) l1title("{bf: Aggregated edits}", margin(small) size(medlarge))
										 
/* Figure 4: Edits on members of parliament (MPs’) Wikipedia entries from the Bundestag IT 
network during elections */

clear
use ".\data\data_ts16th.dta"
format date %td_DDMonYY
generate wdate = wofd(date)
format wdate %tw
gen revisions = 1
collapse (count) revisions, by(wdate)
tsset wdate
tsfill
replace revisions = 0 if revisions==.

tsline revisions if tin(2005w1, 2005w52), lcolor(black) lwidth(medium) /// 
					ylabel(0(200)1200, labsize(huge) grid 			  ///
						   glpattern(shortdash) glcolor(gs10) 		  ///
						   glwidth(thin)) 							  ///
					tlabel(2005w1 "Jan" 2005w5 " " 2005w9 "Mar" 	  ///
						   2005w13 " " 2005w18 "May" 2005w22 " "      ///
						   2005w26 "Jul" 2005w31 " " 2005w35 "Sep"    ///
						   2005w39 " " 2005w44 "Nov" 2005w48 " ",     ///
						   angle(45) labsize(huge) labgap(tiny) grid  ///
						   glpattern(shortdash) glcolor(gs10) 		  ///
						   glwidth(thin)) 							  ///
					ytitle("{bf:Edits}", size(huge) margin(small))    ///
					xtitle("{bf:2005}", size(huge)) 				  ///
					tline(2005w37, lcolor(orange_red) lwidth(medthick) ///
						           lpattern(solid)) 				  ///
					fysize(110) fxsize(95.4) ///
					name(edits2005, replace)
clear
use ".\data\data_ts17th.dta"
format date %td_DDMonYY
generate wdate = wofd(date)
format wdate %tw
gen revisions = 1
collapse (count) revisions, by(wdate)
tsset wdate
tsfill
replace revisions = 0 if revisions==.
					
tsline revisions if tin(2009w1, 2009w52), lcolor(black) lwidth(medium)  ///
					ylabel(0(200)1200, notick nolabels grid 		  ///
						   glpattern(shortdash) glcolor(gs10) 		  ///
						   glwidth(thin)) 							  ///
					tlabel(2009w1 "Jan" 2009w6 " " 2009w10 "Mar" 	  ///
						   2009w14 " " 2009w18 "May" 2009w23 " "      ///
						   2009w27 "Jul" 2009w31 " " 2009w36 "Sep"    ///
						   2009w40 " " 2009w45 "Nov" 2009w49 " ",     ///
						   angle(45) labsize(huge) labgap(tiny) grid  ///
						   glpattern(shortdash) glcolor(gs10)         ///
						   glwidth(thin)) 							  ///
					ytitle("") 										  ///
					xtitle("{bf:2009}", size(huge)) 				  ///
					tline(2009w39, lcolor(orange_red) lwidth(medthick) ///
								   lpattern(solid))				      ///
					fysize(110) fxsize(80.5) ///
					name(edits2009, replace)

clear
use ".\data\data_ts18th.dta"
format date %td_DDMonYY
generate wdate = wofd(date)
format wdate %tw
gen revisions = 1
collapse (count) revisions, by(wdate)
tsset wdate
tsfill
replace revisions = 0 if revisions==.
					
tsline revisions if tin(2013w1, 2013w52), lcolor(black) lwidth(medium)  ///
					ylabel(0(200)1200, notick nolabels grid 		  ///
					       glpattern(shortdash) glcolor(gs10)         ///
						   glwidth(thin)) 							  ///
					tlabel(2013w1 "Jan" 2013w5 " " 2013w9 "Mar"       ///
					       2013w14 " " 2013w18 "May" 2013w22 " "      ///
						   2013w27 "Jul" 2013w31 " " 2013w36 "Sep"    ///
						   2013w40 " " 2013w44 "Nov" 2013w49 " ",     ///
						   angle(45) labsize(huge) labgap(tiny) grid  ///
						   glpattern(shortdash) glcolor(gs10)         ///
						   glwidth(thin))                             ///
					ytitle("") 										  ///
					xtitle("{bf:2013}", size(huge))                   ///
					tline(2013w38, lcolor(orange_red) lwidth(medthick) ///
					               lpattern(solid))                   ///
					fysize(110) fxsize(80.5) ///
					name(edits2013, replace)

graph combine edits2005 edits2009 edits2013, row(1) imargin(b=0 t=0   ///
											 r=-3 l=-3) ysize(2) 	  ///
											 xsize(5)


clear
use ".\data\data_tsip16th.dta"
format date %td_DDMonYY
generate wdate = wofd(date)
format wdate %tw
gen btrevisions = 1
collapse (count) btrevisions, by(wdate)
tsset wdate
tsfill
replace btrevisions = 0 if btrevisions==.

tsline btrevisions if tin(2005w1, 2005w52), lcolor(black) 			  ///
					  lwidth(medium)								  ///
					  ylabel(0(5)20, labsize(6.7) grid 			  ///
							 glpattern(shortdash) glcolor(gs10) 	  ///
							 glwidth(thin)) 						  ///
					  tlabel(2005w1 "Jan" 2005w5 " " 2005w9 "Mar" 	  ///
							 2005w13 " " 2005w18 "May" 2005w22 " "    ///
							 2005w26 "Jul" 2005w31 " " 2005w35 "Sep"  ///
							 2005w39 " " 2005w44 "Nov" 2005w48 " ",   ///
							 angle(45) labsize(6.7) labgap(tiny)     ///
							 grid glpattern(shortdash) glcolor(gs10)  ///
							 glwidth(thin)) 						  ///
					  ytitle("")    /// 
					  xtitle("")				  ///
					  tline(2005w37, lcolor(black) lwidth(medium) ///
							lpattern(solid)) 						  ///
					  fysize(100) fxsize(89.4)		///
					  name(btedits2005, replace)

					  
clear
use ".\data\data_tsip17th.dta"
format date %td_DDMonYY
generate wdate = wofd(date)
format wdate %tw
gen btrevisions = 1
collapse (count) btrevisions, by(wdate)
tsset wdate
tsfill
replace btrevisions = 0 if btrevisions==.
					  
tsline btrevisions if tin(2009w1, 2009w52), lcolor(black) 			  ///
					  lwidth(medium) 								  ///
					  ylabel(0(5)20, notick nolabels grid 			  ///
							 glpattern(shortdash) glcolor(gs10) 	  ///
							 glwidth(thin)) 						  ///
					  tlabel(2009w1 "Jan" 2009w6 " " 2009w10 "Mar" 	  ///
							 2009w14 " " 2009w18 "May" 2009w23 " " 	  ///
							 2009w27 "Jul" 2009w31 " " 2009w36 "Sep"  ///
							 2009w40 " " 2009w45 "Nov" 2009w49 " ",   ///
							 angle(45) labsize(6.7) labgap(tiny)     ///
							 grid glpattern(shortdash) glcolor(gs10)  ///
							 glwidth(thin)) 						  ///
					  ytitle("") xtitle("") 									  ///
					  tline(2009w39, lcolor(black) lwidth(medium) ///
							lpattern(solid)) 						  ///
					  fysize(100) fxsize(80.5) ///
					  name(btedits2009, replace)

clear
use ".\data\data_tsip18th.dta"
format date %td_DDMonYY
generate wdate = wofd(date)
format wdate %tw
gen btrevisions = 1
collapse (count) btrevisions, by(wdate)
tsset wdate
tsfill
replace btrevisions = 0 if btrevisions==.
					  
tsline btrevisions if tin(2013w1, 2013w52), lcolor(black) 		      ///
					  lwidth(medium) 								  ///
					  ylabel(0(5)20, notick nolabels grid 			  ///
						     glpattern(shortdash) glcolor(gs10) 	  ///
							 glwidth(thin)) 						  ///
					  tlabel(2013w1 "Jan" 2013w5 " " 2013w9 "Mar"     ///
							 2013w14 " " 2013w18 "May" 2013w22 " "    ///
							 2013w27 "Jul" 2013w31 " " 2013w36 "Sep"  ///
							 2013w40 " " 2013w44 "Nov" 2013w49 " ",   ///
							 angle(45) labsize(6.7) labgap(tiny)     ///
							 grid glpattern(shortdash) glcolor(gs10)  ///
							 glwidth(thin)) 						  ///
					  ytitle("") xtitle("")								  ///
					  tline(2013w38, lcolor(black) lwidth(medium)  ///
					        lpattern(solid)) 						  ///
					  fysize(100) fxsize(80.5) ///
					  name(btedits2013, replace)
										  
clear
use ".\data\data_tsip16th.dta"
format date %td
gen btrevisions = 1
collapse (count) btrevisions, by(date)
tsset date
tsfill

twoway (tsline btrevisions if tin(1sep2005, 30sep2005), lcolor(black) ///
						lwidth(thin) ylabel(0(2)10, labsize(6.7) grid glpattern(shortdash) 	  ///
									   glcolor(gs10) glwidth(thin))  ///
						tlabel(1sep2005 "1/9" 2sep2005 " " 		  ///
						3sep2005 " " 4sep2005 " " 5sep2005 "5/9"    ///
						6sep2005 " " 7sep2005 " " 8sep2005 " "        /// 
						9sep2005 " " 10sep2005 "10/9" 11sep2005 " " /// 
						12sep2005 " " 13sep2005 " " 14sep2005 " "     ///
						15sep2005 "15/9" 16sep2005 " " 17sep2005    ///
						" " 18sep2005 " " 19sep2005 " " 20sep2005    ///
						"20/9" 21sep2005 " " 22sep2005 " " 		  ///
						23sep2005 " " 24sep2005 " " 25sep2005         ///
						"25/9" 26sep2005 " " 27sep2005 " " 		  ///
						28sep2005 " " 29sep2005 " " 30sep2005 "30/9", angle(45) labsize(6.7) labgap(tiny)     ///
							 grid glpattern(shortdash) glcolor(gs10)  ///
							 glwidth(thin)) 				  		  ///
						recast(spike) lwidth(thick) lcolor(black) 	  ///
						ytitle("")    ///		  
						xtitle("{bf:2005}", size(huge))),     ///
						legend(off)					  ///
						fysize(110) fxsize(89.4) ///
						name(btedits2005w, replace)
	
clear
use ".\data\data_tsip17th.dta"
format date %td
gen btrevisions = 1
collapse (count) btrevisions, by(date)
tsset date
tsfill

twoway (tsline btrevisions if tin(1sep2009, 30sep2009), ///
						ylabel(0(2)10, notick nolabels grid glpattern(shortdash) 	  ///
									   glcolor(gs10) glwidth(thin))  ///
						tlabel(1sep2009 "1/9" 2sep2009 " " 		  ///
						3sep2009 " " 4sep2009 " " 5sep2009 "5/9"    ///
						6sep2009 " " 7sep2009 " " 8sep2009 " "        /// 
						9sep2009 " " 10sep2009 "10/9" 11sep2009 " " /// 
						12sep2009 " " 13sep2009 " " 14sep2009 " "     ///
						15sep2009 "15/9" 16sep2009 " " 17sep2009    ///
						" " 18sep2009 " " 19sep2009 " " 20sep2009     ///
						"20/9" 21sep2009 " " 22sep2009 " " 		  ///
						23sep2009 " " 24sep2009 " " 25sep2009         ///
						"25/9" 26sep2009 " " 27sep2009 " " 		  ///
						28sep2009 " " 29sep2009 " " 30sep2009 "30/9", angle(45) labsize(6.7) labgap(tiny)     ///
							 grid glpattern(shortdash) glcolor(gs10)  ///
							 glwidth(thin)) 				  		  ///
						recast(spike) lwidth(thick) lcolor(black)     ///
						ytitle("") xtitle("{bf:2009}", size(huge))), 	  ///
						legend(off) ///
						fysize(110) fxsize(80.5) ///
						name(btedits2009w, replace)
							   
clear
use ".\data\data_tsip18th.dta"
format date %td
gen btrevisions = 1
collapse (count) btrevisions, by(date)
tsset date
tsfill

twoway (tsline btrevisions if tin(1sep2013, 30sep2013),				  ///
						ylabel(0(2)10, notick nolabels grid glpattern(shortdash) 	  ///
									   glcolor(gs10) glwidth(thin))   ///
						tlabel(1sep2013 "1/9" 2sep2013 " " 		  ///
						3sep2013 " " 4sep2013 " " 5sep2013 "5/9"    ///
						6sep2013 " " 7sep2013 " " 8sep2013 " "        /// 
						9sep2013 " " 10sep2013 "10/9" 11sep2013 " " /// 
						12sep2013 " " 13sep2013 " " 14sep2013 " "     ///
						15sep2013 "15/9" 16sep2013 " " 17sep2013    ///
						" " 18sep2013 " " 19sep2013 " " 20sep2013     ///
						"20/9" 21sep2013 " " 22sep2013 " " 		  ///
						23sep2013 " " 24sep2013 " " 25sep2013         ///
						"25/9" 26sep2013 " " 27sep2013 " " 		  ///
						28sep2013 " " 29sep2013 " " 30sep2013 "30/9", angle(45) labsize(6.7) labgap(tiny)     ///
							 grid glpattern(shortdash) glcolor(gs10)  ///
							 glwidth(thin)) 					  ///
						recast(spike) lwidth(thick) lcolor(black)     ///
						ytitle("") ///
						xtitle("{bf:2013}", size(huge))), 	  					  ///
						legend(off) ///
						fysize(110) fxsize(80.5) ///
						name(btedits2013w, replace)
						
graph combine btedits2005 btedits2009 btedits2013, row(1) imargin(b=0 t=0 ///
			  r=-3 l=-3) fysize(50) fxsize(150) t1title("{bf:(a) Edits from the Bundestag IT network during election years}", size(5.1) margin(small)) name(ts_ip_spec1, replace)
			  
			  
graph combine btedits2005w btedits2009w btedits2013w , col(3) imargin(b=0 t=0 ///
			  r=-3 l=-3) fysize(56.2) fxsize(150) t1title("{bf:(b) Edits from the Bundestag IT network during election months}", size(5.1) margin(small)) name(ts_ip_spec2, replace)

			  
graph combine ts_ip_spec1 ts_ip_spec2, row(2) imargin(b=0 t=0 ///
			  r=-3 l=-3) ysize(1.7) xsize(3) l1title("{bf: Aggregated edits}", size(4.5) margin(small))


/* Figure 5: First differences in factors associated with edits from the parliament’s IP range AND
   Table 2: Estimates of Factors Associated With Edits From the Parliament’s IP Range */

*** INFLATION COMPONENT

* Female M1	 
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange gender, predict(pr) statistics(ci)
drop in 2/1938
matrix B1 = r(table)
svmat B1
mkmat B11 B12 B13, matrix(B1)
matrix rownames B1 = Female1

* Female M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange gender, predict(pr) statistics(ci)
drop in 2/1928
matrix B2 = r(table)
svmat B2
mkmat B21 B22 B23, matrix(B2)
matrix rownames B2 = Female2

* Female M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange gender, predict(pr) statistics(ci)
drop in 2/1916
matrix B3 = r(table)
svmat B3
mkmat B31 B32 B33, matrix(B3)
matrix rownames B3 = Female3	

* Female M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange gender, predict(pr) statistics(ci)
drop in 2/1728
matrix B4 = r(table)
svmat B4
mkmat B41 B42 B43, matrix(B4)
matrix rownames B4 = Female4

* Age M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange age, amount(sd) predict(pr) statistics(ci)
matrix C1 = r(table)
svmat C1
drop in 2/1938
mkmat C11 C12 C13, matrix(C1)
matrix rownames C1 = Age1

* Age M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange age, amount(sd) predict(pr) statistics(ci)
matrix C2 = r(table)
svmat C2
drop in 2/1928
mkmat C21 C22 C23, matrix(C2)
matrix rownames C2 = Age2

* Age M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange age, amount(sd) predict(pr) statistics(ci)
matrix C3 = r(table)
svmat C3
drop in 2/1916
mkmat C31 C32 C33, matrix(C3)
matrix rownames C3 = Age3

* Age M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange age, amount(sd) predict(pr) statistics(ci)
matrix C4 = r(table)
svmat C4
drop in 2/1728
mkmat C41 C42 C43, matrix(C4)
matrix rownames C4 = Age4


* West M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange origin, predict(pr) statistics(ci) 
drop in 2/1938
matrix E1 = r(table)
svmat E1
mkmat E11 E12 E13, matrix(E1)
matrix rownames E1 = West1	

* West M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange origin, predict(pr) statistics(ci) 
drop in 2/1928
matrix E2 = r(table)
svmat E2
mkmat E21 E22 E23, matrix(E2)
matrix rownames E2 = West2

* West M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange origin, predict(pr) statistics(ci) 
drop in 2/1916
matrix E3 = r(table)
svmat E3
mkmat E31 E32 E33, matrix(E3)
matrix rownames E3= West3

* West M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange origin, predict(pr) statistics(ci) 
drop in 2/1728
matrix E4 = r(table)
svmat E4
mkmat E41 E42 E43, matrix(E4)
matrix rownames E4 = West4

* Linke M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix G1 = r(table)
svmat G1
drop in 1
drop in 2/1937
mkmat G11 G12 G13, matrix(G1)
matrix rownames G1 = Linke1

* Linke M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix G2 = r(table)
svmat G2
drop in 1
drop in 2/1927
mkmat G21 G22 G23, matrix(G2)
matrix rownames G2 = Linke2

* Linke M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix G3 = r(table)
svmat G3
drop in 1
drop in 2/1915
mkmat G31 G32 G33, matrix(G3)
matrix rownames G3 = Linke3

* Linke M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix G4 = r(table)
svmat G4
drop in 1
drop in 2/1727
mkmat G41 G42 G43, matrix(G4)
matrix rownames G4 = Linke4

* Grünen M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix H1 = r(table)
svmat H1
drop in 1/5
drop in 2/1933
mkmat H11 H12 H13, matrix(H1)
matrix rownames H1 = Grünen1

* Grünen M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix H2 = r(table)
svmat H2
drop in 1/5
drop in 2/1923
mkmat H21 H22 H23, matrix(H2)
matrix rownames H2 = Grünen2

* Grünen M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix H3 = r(table)
svmat H3
drop in 1/5
drop in 2/1911
mkmat H31 H32 H33, matrix(H3)
matrix rownames H3 = Grünen3

* Grünen M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix H4 = r(table)
svmat H4
drop in 1/5
drop in 2/1723
mkmat H41 H42 H43, matrix(H4)
matrix rownames H4 = Grünen4

* FDP M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix I1 = r(table)
svmat I1
drop in 1/9
drop in 2/1929
mkmat I11 I12 I13, matrix(I1)
matrix rownames I1 = FDP1

* FDP M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix I2 = r(table)
svmat I2
drop in 1/9
drop in 2/1919
mkmat I21 I22 I23, matrix(I2)
matrix rownames I2 = FDP2

* FDP M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix I3 = r(table)
svmat I3
drop in 1/9
drop in 2/1907
mkmat I31 I32 I33, matrix(I3)
matrix rownames I3 = FDP3

* FDP M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix I4 = r(table)
svmat I4
drop in 1/9
drop in 2/1719
mkmat I41 I42 I43, matrix(I4)
matrix rownames I4 = FDP4

* CDU M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix J1 = r(table)
svmat J1
drop in 1/10
drop in 2/1928
mkmat J11 J12 J13, matrix(J1)
matrix rownames J1 = CDU1

* CDU M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix J2 = r(table)
svmat J2
drop in 1/10
drop in 2/1918
mkmat J21 J22 J23, matrix(J2)
matrix rownames J2 = CDU2

* CDU M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix J3 = r(table)
svmat J3
drop in 1/10
drop in 2/1906
mkmat J31 J32 J33, matrix(J3)
matrix rownames J3 = CDU3

* CDU M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci)
matrix J4 = r(table)
svmat J4
drop in 1/10
drop in 2/1718
mkmat J41 J42 J43, matrix(J4)
matrix rownames J4 = CDU4

* CSU M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci) 
matrix K1 = r(table)
svmat K1
drop in 1/11
drop in 2/1927
mkmat K11 K12 K13, matrix(K1)
matrix rownames K1 = CSU1

* CSU M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci) 
matrix K2 = r(table)
svmat K2
drop in 1/11
drop in 2/1917
mkmat K21 K22 K23, matrix(K2)
matrix rownames K2 = CSU2

* CSU M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci) 
matrix K3 = r(table)
svmat K3
drop in 1/11
drop in 2/1905
mkmat K31 K32 K33, matrix(K3)
matrix rownames K3 = CSU3

* CSU M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, predict(pr) statistics(ci) 
matrix K4 = r(table)
svmat K4
drop in 1/11
drop in 2/1717
mkmat K41 K42 K43, matrix(K4)
matrix rownames K4 = CSU4

* List M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange mandate, predict(pr) statistics(ci) 
drop in 2/1938
matrix M1 = r(table)
svmat M1
mkmat M11 M12 M13, matrix(M1)
matrix rownames M1 = List1

* List M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange mandate, predict(pr) statistics(ci) 
drop in 2/1928
matrix M2 = r(table)
svmat M2
mkmat M21 M22 M23, matrix(M2)
matrix rownames M2 = List2

* List M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange mandate, predict(pr) statistics(ci) 
drop in 2/1916
matrix M3 = r(table)
svmat M3
mkmat M31 M32 M33, matrix(M3)
matrix rownames M3 = List3

* List M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange mandate, predict(pr) statistics(ci) 
drop in 2/1728
matrix M4 = r(table)
svmat M4
mkmat M41 M42 M43, matrix(M4)
matrix rownames M4 = List4

* 17th term M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, predict(pr) statistics(ci) 
matrix O1 = r(table)
svmat O1
drop in 2/1938
mkmat O11 O12 O13, matrix(O1)
matrix rownames O1 = 17th1

* 17th term M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, predict(pr) statistics(ci) 
matrix O2 = r(table)
svmat O2
drop in 2/1928
mkmat O21 O22 O23, matrix(O2)
matrix rownames O2 = 17th2

* 17th term M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, predict(pr) statistics(ci) 
matrix O3 = r(table)
svmat O3
drop in 2/1916
mkmat O31 O32 O33, matrix(O3)
matrix rownames O3 = 17th3

* 17th term M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(term)
mchange term, predict(pr) statistics(ci) 
matrix O4 = r(table)
svmat O4
drop in 2/1728
mkmat O41 O42 O43, matrix(O4)
matrix rownames O4 = 17th4

* 18th term M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, predict(pr) statistics(ci) 
matrix P1 = r(table)
svmat P1
drop in 1
drop in 2/1937
mkmat P11 P12 P13, matrix(P1)
matrix rownames P1 = 18th1

* 18th term M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, predict(pr) statistics(ci) 
matrix P2 = r(table)
svmat P2
drop in 1
drop in 2/1927
mkmat P21 P22 P23, matrix(P2)
matrix rownames P2 = 18th2

* 18th term M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, predict(pr) statistics(ci) 
matrix P3 = r(table)
svmat P3
drop in 1
drop in 2/1915
mkmat P31 P32 P33, matrix(P3)
matrix rownames P3 = 18th3

* 18th term M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(term)
mchange term, predict(pr) statistics(ci) 
matrix P4 = r(table)
svmat P4
drop in 1
drop in 2/1727
mkmat P41 P42 P43, matrix(P4)
matrix rownames P4 = 18th4

* page growth M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange page_growth, predict(pr) amount(sd) statistics(ci) 
drop in 2/1938
matrix Q1 = r(table)
svmat Q1
mkmat Q11 Q12 Q13, matrix(Q1)
matrix rownames Q1 = page_growth1

* page growth M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange page_growth, predict(pr) amount(sd) statistics(ci) 
drop in 2/1928
matrix Q2 = r(table)
svmat Q2
mkmat Q21 Q22 Q23, matrix(Q2)
matrix rownames Q2 = page_growth2

* page growth M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange page_growth, predict(pr) amount(sd) statistics(ci) 
drop in 2/1916
matrix Q3 = r(table)
svmat Q3
mkmat Q31 Q32 Q33, matrix(Q3)
matrix rownames Q3 = page_growth3

* page growth M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange page_growth, predict(pr) amount(sd) statistics(ci) 
drop in 2/1728
matrix Q4 = r(table)
svmat Q4
mkmat Q41 Q42 Q43, matrix(Q4)
matrix rownames Q4 = page_growth4

* page views M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange avgd_page_views, predict(pr) amount(sd) statistics(ci) 
drop in 2/1938
matrix R1 = r(table)
svmat R1
mkmat R11 R12 R13, matrix(R1)
matrix rownames R1 = page_views1

* page views M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange avgd_page_views, predict(pr) amount(sd) statistics(ci) 
drop in 2/1928
matrix R2 = r(table)
svmat R2
mkmat R21 R22 R23, matrix(R2)
matrix rownames R2 = page_views2

* page views M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange avgd_page_views, predict(pr) amount(sd) statistics(ci) 
drop in 2/1916
matrix R3 = r(table)
svmat R3
mkmat R31 R32 R33, matrix(R3)
matrix rownames R3 = page_views3

* page views M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange avgd_page_views, predict(pr) amount(sd) statistics(ci) 
drop in 2/1728
matrix R4 = r(table)
svmat R4
mkmat R41 R42 R43, matrix(R4)
matrix rownames R4 = page_views4

* Plot
coefplot (matrix(B1[,1]), ci((B1[.,2] B1[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(B2[,1]), ci((B2[.,2] B2[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(B3[,1]), ci((B3[.,2] B3[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(B4[,1]), ci((B4[.,2] B4[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(C1[,1]), ci((C1[.,2] C1[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
												mcolor(black))				///
		 (matrix(C2[,1]), ci((C2[.,2] C2[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(C3[,1]), ci((C3[.,2] C3[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(C4[,1]), ci((C4[.,2] C4[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(E1[,1]), ci((E1[.,2] E1[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(E2[,1]), ci((E2[.,2] E2[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(E3[,1]), ci((E3[.,2] E3[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(E4[,1]), ci((E4[.,2] E4[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(G1[,1]), ci((G1[.,2] G1[.,3])) msymbol(none) msize(medsmall)					 ///
												mcolor(none)) ///
		 (matrix(G2[,1]), ci((G2[.,2] G2[.,3])) msymbol(none) msize(medsmall)					 ///	
												mcolor(none)) ///
		 (matrix(G3[,1]), ci((G3[.,2] G3[.,3])) msymbol(none) msize(medsmall)					 ///
												mcolor(none)) ///
		 (matrix(G4[,1]), ci((G4[.,2] G4[.,3])) msymbol(none) msize(medsmall)					 ///
												mcolor(none)) ///
		 (matrix(H1[,1]), ci((H1[.,2] H1[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(H2[,1]), ci((H2[.,2] H2[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(H3[,1]), ci((H3[.,2] H3[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(H4[,1]), ci((H4[.,2] H4[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(I1[,1]), ci((I1[.,2] I1[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(I2[,1]), ci((I2[.,2] I2[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(I3[,1]), ci((I3[.,2] I3[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(I4[,1]), ci((I4[.,2] I4[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(J1[,1]), ci((J1[.,2] J1[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(J2[,1]), ci((J2[.,2] J2[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(J3[,1]), ci((J3[.,2] J3[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(J4[,1]), ci((J4[.,2] J4[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 				 ///
		 (matrix(K1[,1]), ci((K1[.,2] K1[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 			 ///
		 (matrix(K2[,1]), ci((K2[.,2] K2[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 			 ///
		 (matrix(K3[,1]), ci((K3[.,2] K3[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 			 ///
		 (matrix(K4[,1]), ci((K4[.,2] K4[.,3])) msymbol(none) msize(medsmall) ///
												mcolor(none)) 			 ///
		 (matrix(M1[,1]), ci((M1[.,2] M1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(M2[,1]), ci((M2[.,2] M2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(M3[,1]), ci((M3[.,2] M3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(M4[,1]), ci((M4[.,2] M4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(O1[,1]), ci((O1[.,2] O1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(O2[,1]), ci((O2[.,2] O2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(O3[,1]), ci((O3[.,2] O3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
	     (matrix(O4[,1]), ci((O4[.,2] O4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(P1[,1]), ci((P1[.,2] P1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(P2[,1]), ci((P2[.,2] P2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(P3[,1]), ci((P3[.,2] P3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(P4[,1]), ci((P4[.,2] P4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(Q1[,1]), ci((Q1[.,2] Q1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(Q2[,1]), ci((Q2[.,2] Q2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(Q3[,1]), ci((Q3[.,2] Q3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(Q4[,1]), ci((Q4[.,2] Q4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(R1[,1]), ci((R1[.,2] R1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(R2[,1]), ci((R2[.,2] R2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(R3[,1]), ci((R3[.,2] R3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(R4[,1]), ci((R4[.,2] R4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)), 	///
		 ciopts(lwidth(thin) lcolor(black))							 	 ///
		 coeflabels(Female1 = "Female vs. male   (1)" 						 	 ///
					Female2 = "   (2)"											 ///
					Female3 = "   (3)"											 ///
					Female4 = "   (4)"											 ///
					Age1 = "Age (+1 SD)   (1)"    							 	 ///
					Age2 = "   (2)" 												 ///
					Age3 = "   (3)" 												 ///
					Age4 = "   (4)" 												 ///
					West1 = "West vs. east   (1)" 							 	 ///
					West2 = "   (2)" 							 				 ///
					West3 = "   (3)" 							 				 ///
					West4 = "   (4)" 							 				 ///
					Linke1 = "Linke vs. SPD   (1)" 						     ///
					Linke2 = "   (2)" 						     				 ///
					Linke3 = "   (3)" 						     				 ///
					Linke4 = "   (4)" 						     				 ///
					Grünen1 = "Grünen vs. SPD   (1)" 							 		 ///
					Grünen2 = "   (2)" 							 		 		 	 ///
					Grünen3 = "   (3)" 							 		 		 	 ///
					Grünen4 = "   (4)" 							 		 		 	 ///
					FDP1 = "FDP vs. SPD   (1)" 					   		  		 ///
					FDP2 = "   (2)" 					   		  		 			 ///
					FDP3 = "   (3)" 					   		  		 			 ///
					FDP4 = "   (4)" 					   		  		 			 ///
					CDU1 = "CDU vs. SPD   (1)" 						     		 ///
					CDU2 = "   (2)" 						     		 			 ///
					CDU3 = "   (3)" 						     		 			 ///
					CDU4 = "   (4)" 						     		 			 ///
					CSU1 = "CSU vs. SPD   (1)" 							 		 ///
					CSU2 = "   (2)" 							 		  			 ///
					CSU3 = "   (3)" 							 		  			 ///
					CSU4 = "   (4)" 							 		  			 ///
					List1 = "List vs. district   (1)" 						 		 ///
					List2 = "   (2)" 						 		 				 ///
					List3 = "   (3)" 						 		 				 ///
					List4 = "   (4)" 						 		 				 ///
					17th1 = "17{sup:th} vs. 16{sup:th} term   (1)" 			 	 ///
					17th2 = "   (2)" 			 									 ///
					17th3 = "   (3)" 			 									 ///
					17th4 = "   (4)" 			 									 ///
					18th1 = "18{sup:th} vs. 16{sup:th} term   (1)" 			 	 ///
					18th2 = "   (2)" 			 	 								 ///
					18th3 = "   (3)" 			 	 								 ///
					18th4 = "   (4)" 			 	 								 ///
					page_growth1 = "Page growth (+1 SD)   (1)" 				 	 ///
					page_growth2 = "   (2)" 				 	 					 ///
					page_growth3 = "   (3)" 				 	 					 ///
					page_growth4 = "   (4)" 				 	 					 ///
					page_views1 = "Page views (+1 SD)   (1)" 				 		 ///
					page_views2 = "   (2)" 				 		 				 ///
					page_views3 = "   (3)" 				 		 				 ///
					page_views4 = "   (4)", 				 		 				 ///
					noticks labgap(2) labsize(small)) 			 		 	 ///
		 xaxis (1 2) ///
		 xlabel(-0.4(0.1)0.5, axis(1) labsize(small)      							 ///
			    nogrid) 	     ///
		 xlabel(-0.4(0.1)0.5, axis(2) labsize(small)      							 ///
			    nogrid) 	     ///
		 xtitle({bf:  (a) Pr of zero edits    }, size(small))				 ///
		 grid(within glpattern(none) glcolor(none) glwidth(thin)) 		 ///
		 xline(0, lpattern(dash) lcolor(black) lwidth(thin)) nooffsets legend(off)   	 ///
		 yline(4.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(8.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(12.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(16.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(20.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(24.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(28.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(32.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(36.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(40.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(44.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(48.5, lwidth(vthin) lcolor(gs13)) ///
		 fxsize(80) fysize(200) name(A, replace)	

		 
*** COUNT COMPONENT

* Female M1	 
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange gender, expression(exp(predict(xb))) statistics(ci)
drop in 2/1938
matrix B1 = r(table)
svmat B1
mkmat B11 B12 B13, matrix(B1)
matrix rownames B1 = Female1

* Female M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange gender, expression(exp(predict(xb))) statistics(ci)
drop in 2/1928
matrix B2 = r(table)
svmat B2
mkmat B21 B22 B23, matrix(B2)
matrix rownames B2 = Female2

* Female M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange gender, expression(exp(predict(xb))) statistics(ci)
drop in 2/1916
matrix B3 = r(table)
svmat B3
mkmat B31 B32 B33, matrix(B3)
matrix rownames B3 = Female3	

* Female M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange gender, expression(exp(predict(xb))) statistics(ci)
drop in 2/1728
matrix B4 = r(table)
svmat B4
mkmat B41 B42 B43, matrix(B4)
matrix rownames B4 = Female4

* Age M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange age, amount(sd) expression(exp(predict(xb))) statistics(ci)
matrix C1 = r(table)
svmat C1
drop in 2/1938
mkmat C11 C12 C13, matrix(C1)
matrix rownames C1 = Age1

* Age M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange age, amount(sd) expression(exp(predict(xb))) statistics(ci)
matrix C2 = r(table)
svmat C2
drop in 2/1928
mkmat C21 C22 C23, matrix(C2)
matrix rownames C2 = Age2

* Age M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange age, amount(sd) expression(exp(predict(xb))) statistics(ci)
matrix C3 = r(table)
svmat C3
drop in 2/1916
mkmat C31 C32 C33, matrix(C3)
matrix rownames C3 = Age3

* Age M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange age, amount(sd) expression(exp(predict(xb))) statistics(ci)
matrix C4 = r(table)
svmat C4
drop in 2/1728
mkmat C41 C42 C43, matrix(C4)
matrix rownames C4 = Age4


* West M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange origin, expression(exp(predict(xb))) statistics(ci) 
drop in 2/1938
matrix E1 = r(table)
svmat E1
mkmat E11 E12 E13, matrix(E1)
matrix rownames E1 = West1	

* West M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange origin, expression(exp(predict(xb))) statistics(ci) 
drop in 2/1928
matrix E2 = r(table)
svmat E2
mkmat E21 E22 E23, matrix(E2)
matrix rownames E2 = West2

* West M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange origin, expression(exp(predict(xb))) statistics(ci) 
drop in 2/1916
matrix E3 = r(table)
svmat E3
mkmat E31 E32 E33, matrix(E3)
matrix rownames E3= West3

* West M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange origin, expression(exp(predict(xb))) statistics(ci) 
drop in 2/1728
matrix E4 = r(table)
svmat E4
mkmat E41 E42 E43, matrix(E4)
matrix rownames E4 = West4


* Linke M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix G1 = r(table)
svmat G1
drop in 1
drop in 2/1937
replace G11 = -G11
replace G12 = abs(G12)
replace G13 = -G13
mkmat G11 G12 G13, matrix(G1)
matrix rownames G1 = Linke1

* Linke M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix G2 = r(table)
svmat G2
drop in 1
drop in 2/1927
replace G21 = -G21
replace G22 = abs(G22)
replace G23 = -G23
mkmat G21 G22 G23, matrix(G2)
matrix rownames G2 = Linke2

* Linke M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix G3 = r(table)
svmat G3
drop in 1
drop in 2/1915
replace G31 = -G31
replace G32 = abs(G32)
replace G33 = -G33
mkmat G31 G32 G33, matrix(G3)
matrix rownames G3 = Linke3

* Linke M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix G4 = r(table)
svmat G4
drop in 1
drop in 2/1727
replace G41 = -G41
replace G42 = -G42
replace G43 = -G43
mkmat G41 G42 G43, matrix(G4)
matrix rownames G4 = Linke4

* Grünen M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix H1 = r(table)
svmat H1
drop in 1/5
drop in 2/1933
replace H11 = -H11
replace H12 = abs(H12)
replace H13 = -H13
mkmat H11 H12 H13, matrix(H1)
matrix rownames H1 = Grünen1

* Grünen M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix H2 = r(table)
svmat H2
drop in 1/5
drop in 2/1923
replace H21 = abs(H21)
replace H22 = abs(H22)
replace H23 = -H23
mkmat H21 H22 H23, matrix(H2)
matrix rownames H2 = Grünen2

* Grünen M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix H3 = r(table)
svmat H3
drop in 1/5
drop in 2/1911
replace H31 = -H31
replace H32 = abs(H32)
replace H33 = -H33
mkmat H31 H32 H33, matrix(H3)
matrix rownames H3 = Grünen3

* Grünen M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix H4 = r(table)
svmat H4
drop in 1/5
drop in 2/1723
replace H41 = -H41
replace H42 = abs(H42)
replace H43 = -H43
mkmat H41 H42 H43, matrix(H4)
matrix rownames H4 = Grünen4

* FDP M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix I1 = r(table)
svmat I1
drop in 1/9
drop in 2/1929
mkmat I11 I12 I13, matrix(I1)
matrix rownames I1 = FDP1

* FDP M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix I2 = r(table)
svmat I2
drop in 1/9
drop in 2/1919
mkmat I21 I22 I23, matrix(I2)
matrix rownames I2 = FDP2

* FDP M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix I3 = r(table)
svmat I3
drop in 1/9
drop in 2/1907
mkmat I31 I32 I33, matrix(I3)
matrix rownames I3 = FDP3

* FDP M4
clear
use ".data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix I4 = r(table)
svmat I4
drop in 1/9
drop in 2/1719
mkmat I41 I42 I43, matrix(I4)
matrix rownames I4 = FDP4

* CDU M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix J1 = r(table)
svmat J1
drop in 1/10
drop in 2/1928
mkmat J11 J12 J13, matrix(J1)
matrix rownames J1 = CDU1

* CDU M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix J2 = r(table)
svmat J2
drop in 1/10
drop in 2/1918
mkmat J21 J22 J23, matrix(J2)
matrix rownames J2 = CDU2

* CDU M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix J3 = r(table)
svmat J3
drop in 1/10
drop in 2/1906
mkmat J31 J32 J33, matrix(J3)
matrix rownames J3 = CDU3

* CDU M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci)
matrix J4 = r(table)
svmat J4
drop in 1/10
drop in 2/1718
mkmat J41 J42 J43, matrix(J4)
matrix rownames J4 = CDU4

* CSU M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci) 
matrix K1 = r(table)
svmat K1
drop in 1/11
drop in 2/1927
mkmat K11 K12 K13, matrix(K1)
matrix rownames K1 = CSU1

* CSU M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci) 
matrix K2 = r(table)
svmat K2
drop in 1/11
drop in 2/1917
mkmat K21 K22 K23, matrix(K2)
matrix rownames K2 = CSU2

* CSU M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci) 
matrix K3 = r(table)
svmat K3
drop in 1/11
drop in 2/1905
mkmat K31 K32 K33, matrix(K3)
matrix rownames K3 = CSU3

* CSU M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange party, expression(exp(predict(xb))) statistics(ci) 
matrix K4 = r(table)
svmat K4
drop in 1/11
drop in 2/1717
mkmat K41 K42 K43, matrix(K4)
matrix rownames K4 = CSU4

* List M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange mandate, expression(exp(predict(xb))) statistics(ci) 
drop in 2/1938
matrix M1 = r(table)
svmat M1
mkmat M11 M12 M13, matrix(M1)
matrix rownames M1 = List1

* List M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange mandate, expression(exp(predict(xb))) statistics(ci) 
drop in 2/1928
matrix M2 = r(table)
svmat M2
mkmat M21 M22 M23, matrix(M2)
matrix rownames M2 = List2

* List M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange mandate, expression(exp(predict(xb))) statistics(ci) 
drop in 2/1916
matrix M3 = r(table)
svmat M3
mkmat M31 M32 M33, matrix(M3)
matrix rownames M3 = List3

* List M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange mandate, expression(exp(predict(xb))) statistics(ci) 
drop in 2/1728
matrix M4 = r(table)
svmat M4
mkmat M41 M42 M43, matrix(M4)
matrix rownames M4 = List4

* 17th term M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, expression(exp(predict(xb))) statistics(ci) 
matrix O1 = r(table)
svmat O1
drop in 2/1938
mkmat O11 O12 O13, matrix(O1)
matrix rownames O1 = 17th1

* 17th term M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, expression(exp(predict(xb))) statistics(ci) 
matrix O2 = r(table)
svmat O2
drop in 2/1928
mkmat O21 O22 O23, matrix(O2)
matrix rownames O2 = 17th2

* 17th term M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, expression(exp(predict(xb))) statistics(ci) 
matrix O3 = r(table)
svmat O3
drop in 2/1916
mkmat O31 O32 O33, matrix(O3)
matrix rownames O3 = 17th3

* 17th term M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, expression(exp(predict(xb))) statistics(ci) 
matrix O4 = r(table)
svmat O4
drop in 2/1728
mkmat O41 O42 O43, matrix(O4)
matrix rownames O4 = 17th4

* 18th term M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, expression(exp(predict(xb))) statistics(ci) 
matrix P1 = r(table)
svmat P1
drop in 1
drop in 2/1937
mkmat P11 P12 P13, matrix(P1)
matrix rownames P1 = 18th1

* 18th term M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, expression(exp(predict(xb))) statistics(ci) 
matrix P2 = r(table)
svmat P2
drop in 1
drop in 2/1927
mkmat P21 P22 P23, matrix(P2)
matrix rownames P2 = 18th2

* 18th term M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange term, expression(exp(predict(xb))) statistics(ci) 
matrix P3 = r(table)
svmat P3
drop in 1
drop in 2/1915
mkmat P31 P32 P33, matrix(P3)
matrix rownames P3 = 18th3

* 18th term M4
clear
use ".data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(term)
mchange term, expression(exp(predict(xb))) statistics(ci) 
matrix P4 = r(table)
svmat P4
drop in 1
drop in 2/1727
mkmat P41 P42 P43, matrix(P4)
matrix rownames P4 = 18th4

* page growth M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange page_growth, expression(exp(predict(xb))) amount(sd) statistics(ci) 
drop in 2/1938
matrix Q1 = r(table)
svmat Q1
mkmat Q11 Q12 Q13, matrix(Q1)
matrix rownames Q1 = page_growth1

* page growth M2
clear
use ".\data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange page_growth, expression(exp(predict(xb))) amount(sd) statistics(ci) 
drop in 2/1928
matrix Q2 = r(table)
svmat Q2
mkmat Q21 Q22 Q23, matrix(Q2)
matrix rownames Q2 = page_growth2

* page growth M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange page_growth, expression(exp(predict(xb))) amount(sd) statistics(ci) 
drop in 2/1916
matrix Q3 = r(table)
svmat Q3
mkmat Q31 Q32 Q33, matrix(Q3)
matrix rownames Q3 = page_growth3

* page growth M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange page_growth, expression(exp(predict(xb))) amount(sd) statistics(ci) 
drop in 2/1728
matrix Q4 = r(table)
svmat Q4
mkmat Q41 Q42 Q43, matrix(Q4)
matrix rownames Q4 = page_growth4

* page views M1
clear
use ".\data\data_combined.dta"
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange avgd_page_views, expression(exp(predict(xb))) amount(sd) statistics(ci) 
drop in 2/1938
matrix R1 = r(table)
svmat R1
mkmat R11 R12 R13, matrix(R1)
matrix rownames R1 = page_views1

* page views M2
clear
use ".data\data_combined.dta"
drop if bt_edits > 16
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange avgd_page_views, expression(exp(predict(xb))) amount(sd) statistics(ci) 
drop in 2/1928
matrix R2 = r(table)
svmat R2
mkmat R21 R22 R23, matrix(R2)
matrix rownames R2 = page_views2

* page views M3
clear
use ".\data\data_combined.dta"
drop if bt_edits > 12
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange avgd_page_views, expression(exp(predict(xb))) amount(sd) statistics(ci) 
drop in 2/1916
matrix R3 = r(table)
svmat R3
mkmat R31 R32 R33, matrix(R3)
matrix rownames R3 = page_views3

* page views M4
clear
use ".\data\data_combined.dta"
drop if avgd_page_views > 50
zinb bt_edits i.gender age i.origin ib3.party i.mandate i.term page_growth 	 ///
	 avgd_page_views, inflate(age i.origin i.mandate i.term ///
	 page_growth avgd_page_views) cluster(MP)
mchange avgd_page_views, expression(exp(predict(xb))) amount(sd) statistics(ci) 
drop in 2/1728
matrix R4 = r(table)
svmat R4
mkmat R41 R42 R43, matrix(R4)
matrix rownames R4 = page_views4		 
		 

coefplot (matrix(B1[,1]), ci((B1[.,2] B1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(B2[,1]), ci((B2[.,2] B2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(B3[,1]), ci((B3[.,2] B3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(B4[,1]), ci((B4[.,2] B4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(C1[,1]), ci((C1[.,2] C1[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
												mcolor(black))				///
		 (matrix(C2[,1]), ci((C2[.,2] C2[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(C3[,1]), ci((C3[.,2] C3[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(C4[,1]), ci((C4[.,2] C4[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(E1[,1]), ci((E1[.,2] E1[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(E2[,1]), ci((E2[.,2] E2[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(E3[,1]), ci((E3[.,2] E3[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(E4[,1]), ci((E4[.,2] E4[.,3])) msymbol(smcircle) msize(medsmall) 				 ///
		 										mcolor(black))				///
		 (matrix(G1[,1]), ci((G1[.,2] G1[.,3])) msymbol(smcircle) msize(medsmall)					 ///
												mcolor(black)) ///
		 (matrix(G2[,1]), ci((G2[.,2] G2[.,3])) msymbol(smcircle) msize(medsmall)					 ///	
												mcolor(black)) ///
		 (matrix(G3[,1]), ci((G3[.,2] G3[.,3])) msymbol(smcircle) msize(medsmall)					 ///
												mcolor(black)) ///
		 (matrix(G4[,1]), ci((G4[.,2] G4[.,3])) msymbol(smcircle) msize(medsmall)					 ///
												mcolor(black)) ///
		 (matrix(H1[,1]), ci((H1[.,2] H1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(H2[,1]), ci((H2[.,2] H2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(H3[,1]), ci((H3[.,2] H3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(H4[,1]), ci((H4[.,2] H4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(I1[,1]), ci((I1[.,2] I1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(I2[,1]), ci((I2[.,2] I2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(I3[,1]), ci((I3[.,2] I3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(I4[,1]), ci((I4[.,2] I4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(J1[,1]), ci((J1[.,2] J1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(J2[,1]), ci((J2[.,2] J2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(J3[,1]), ci((J3[.,2] J3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(J4[,1]), ci((J4[.,2] J4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 				 ///
		 (matrix(K1[,1]), ci((K1[.,2] K1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 			 ///
		 (matrix(K2[,1]), ci((K2[.,2] K2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 			 ///
		 (matrix(K3[,1]), ci((K3[.,2] K3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 			 ///
		 (matrix(K4[,1]), ci((K4[.,2] K4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 			 ///
		 (matrix(M1[,1]), ci((M1[.,2] M1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(M2[,1]), ci((M2[.,2] M2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(M3[,1]), ci((M3[.,2] M3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(M4[,1]), ci((M4[.,2] M4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(O1[,1]), ci((O1[.,2] O1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(O2[,1]), ci((O2[.,2] O2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(O3[,1]), ci((O3[.,2] O3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
	     (matrix(O4[,1]), ci((O4[.,2] O4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(P1[,1]), ci((P1[.,2] P1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(P2[,1]), ci((P2[.,2] P2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(P3[,1]), ci((P3[.,2] P3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(P4[,1]), ci((P4[.,2] P4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(Q1[,1]), ci((Q1[.,2] Q1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(Q2[,1]), ci((Q2[.,2] Q2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(Q3[,1]), ci((Q3[.,2] Q3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(Q4[,1]), ci((Q4[.,2] Q4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(R1[,1]), ci((R1[.,2] R1[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(R2[,1]), ci((R2[.,2] R2[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(R3[,1]), ci((R3[.,2] R3[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)) 	///
		 (matrix(R4[,1]), ci((R4[.,2] R4[.,3])) msymbol(smcircle) msize(medsmall) ///
												mcolor(black)), 	///
		 ciopts(lwidth(thin) lcolor(black))							 	 ///
		 coeflabels(, noticks nolabels)		 ///
		 xaxis(1 2) ///
		 xlabel(-1.5(0.5)2, axis(2) labsize(small)      							 ///
			    nogrid) 	     ///
		 xlabel(-1.5(0.5)2, axis(1) labsize(small)      							 ///
			    nogrid) 	     ///
		 xtitle({bf:  (b) Amount of edits   }, size(small))				 ///
		 grid(within glpattern(none) glcolor(none) glwidth(thin)) 		 ///
		 xline(0, lpattern(dash) lcolor(black) lwidth(thin)) nooffsets legend(off)   	 ///
		 yline(4.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(8.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(12.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(16.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(20.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(24.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(28.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(32.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(36.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(40.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(44.5, lwidth(vthin) lcolor(gs13)) ///
		 yline(48.5, lwidth(vthin) lcolor(gs13)) ///
		 fxsize(51.5) fysize(200) name(B, replace)		 
		 
		 
graph combine A B, col(2) imargin(b=0 t=0 r=2 l=0) ysize(7) xsize(5) 	 

exit
