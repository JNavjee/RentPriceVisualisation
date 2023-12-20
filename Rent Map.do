clear 

cd "C:\Users\jnavj\OneDrive - University of Bristol\Communicating Economics\Data Visualisation"

ssc install spmap

ssc install shp2dta

ssc install mif2dta



//shp2dta using ukmap, database(ukdb) coordinates(ukcoord) genid(id)



use ukdb, clear 

describe



list id nuts118nm 


use regionrentpricechanges

merge 1:1 id using ukdb 

spmap rentpercentchange using ukcoord if id < 10 , id(id) fcolor(Blues)
