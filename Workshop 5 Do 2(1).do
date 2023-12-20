

clear all
use "C:\Users\jnavj\OneDrive - University of Bristol\Communicating Economics\Data Visualisation/db_item.dta"
*browse
**Comment: from here you can see all of the items. You can use CTRL-F to search for a specific word.

clear
*use "C:\Users\hi19329\Desktop\prices\db_prices.dta"
use "C:\Users\jnavj\OneDrive - University of Bristol\Communicating Economics\Data Visualisation/db_prices.dta"
*browse
**Comment: this file should be over 43 million observations.

// Keep only the item we are interested in (here: Aluminium Foil), but for your assignment use any item or items you are interested in:
keep if item_id==410103

// Make first scatter:
* scatter price quote_date

// Merge in date data:
*merge m:1 quote_date using "C:\Users\hi19329\Desktop\prices\db_date.dta"
merge m:1 quote_date using "C:\Users\jnavj\OneDrive - University of Bristol\Communicating Economics\Data Visualisation/db_date.dta"

// Make scatter with correct dates and formatting (see Do-File 1):
scatter price dateStata, graphregion(color(white)) msize(tiny) mcolor(ebblue%30) mlwidth(none) ///
xtitle("") ytitle("Price, £") ylabel(, angle(0)) title("Price of a Doughnut in the UK") ///
subtitle("Source: ONS and Davies (2021)", size(small)) ///
tlabel(01jan1990 01jan2000 01jan2010 01jan2020, format(%tdCCYY))

* The collapse command reduces the data down to some summary measures of variables
* Since we might want meany measures of prices (mean, median, sd etc) then one trick is to simply make copies of the price data and calculate the statistics based on those variables:
* Make copies:
gen price2 = price
gen price3 = price
gen price4 = price
* Collapse to get summary statistics (calculate statistics for each item and quote date): 
collapse (mean) price (p75) price2 (p50) price3 (p25) price4, by(item_id quote_date dateStata)
//collapse (mean) price, by(item_id quote_date dateStata)

// After a collapse it is good practice to rename and relabel your varibles:
* rename variables:
rename price p_mean

* relabel variables:
label variable p_mean "Mean Price"

*rename item
gen itemName = "."
replace itemName = "Average Private Rent Cost in England, 1995-2015" if item_id==410101
drop if itemName=="."

// You now have a data set which contains statistics for prices for 4 items. Browse the data to see what the amended data set looks like
browse

line p* dateStata,xlabel(,angle(45)) by(item_id, yrescale) 

*** improve format
line p* dateStata, legend(row(1)) xlabel(,angle(0)) by(itemName, legend(position(6)) yrescale graphregion(color(white)) note("Source: ONS and Davies (2020)", size(tiny))) legend(size(tiny)) subtitle(, size(small) fcolor(white) lcol(white)) ytitle("£", size(small)) xtitle("Date", size(small)) ylabel(,angle(0)) tlabel(01jan1995 01jan2000 01jan2005 01jan2010 01jan2015 , format(%tdCCYY))



* The collapse command reduces the data down to some summary measures of variables
* Since we might want meany measures of prices (mean, median, sd etc) then one trick is to simply make copies of the price data and calculate the statistics based on those variables:
* Make copies:
gen price2 = price
gen price3 = price
gen price4 = price
* Collapse to get summary statistics (calculate statistics for each item and quote date): 
//collapse (mean) price (p75) price2 (p50) price3 (p25) price4, by(item_id quote_date dateStata)
collapse (mean) price, by(item_id quote_date dateStata)

// After a collapse it is good practice to rename and relabel your varibles:
* rename variables:
rename price p_mean

* relabel variables:
label variable p_mean "Mean Price"

*rename item
gen itemName = "."
replace itemName = "Average Private Rent Cost in England, 1995-2015" if item_id==410103
drop if itemName=="."

// You now have a data set which contains statistics for prices for 4 items. Browse the data to see what the amended data set looks like
browse

line p* dateStata,xlabel(,angle(45)) by(item_id, yrescale) 

*** improve format
line p* dateStata, legend(row(1)) xlabel(,angle(0)) by(itemName, legend(position(6)) yrescale graphregion(color(white)) note("Source: ONS and Davies (2020)", size(tiny))) legend(size(tiny)) subtitle(, size(small) fcolor(white) lcol(white)) ytitle("£", size(small)) xtitle("Date", size(small)) ylabel(,angle(0)) tlabel(01jan1995 01jan2000 01jan2005 01jan2010 01jan2015 , format(%tdCCYY))

