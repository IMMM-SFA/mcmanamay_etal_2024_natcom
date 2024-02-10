##outputs from DEMETER_SELECT INTEGRATION 
files <- list.files(path="[YOUR FILE PATH]/outputs/", pattern="*.csv", full.names=TRUE)


library(vroom)
library(dplyr)
library(tidyr)

mdat <- vroom(files)

mdat$Forest <- (mdat$PFT1 + mdat$PFT10 + mdat$PFT11 + mdat$PFT2 + mdat$PFT3 + mdat$PFT4 + mdat$PFT5 + mdat$PFT6 + mdat$PFT7 + mdat$PFT8 + mdat$PFT9)*-1

mdat$Grass <- (mdat$PFT13 + mdat$PFT14)*-1

mdat$Agr <- (mdat$PFT15 + mdat$PFT16 + mdat$PFT17 + mdat$PFT18 + mdat$PFT19 + 
  mdat$PFT20 + mdat$PFT21 + mdat$PFT22 + mdat$PFT23 + mdat$PFT24 + mdat$PFT25 + mdat$PFT26 + 
  mdat$PFT27 + mdat$PFT28 + mdat$PFT29 + mdat$PFT30)*-1

mdat$For_temp <- (mdat$PFT1 + mdat$PFT5 + mdat$PFT7 + mdat$PFT9 + mdat$PFT10)*-1

mdat$For_bor <- (mdat$PFT2 + mdat$PFT3 + mdat$PFT8 + mdat$PFT11)*-1

mdat$For_trop <- (mdat$PFT4 + mdat$PFT6)*-1

mdat$Corn <- (mdat$PFT15 + mdat$PFT16)*-1

mdat$Wheat <- (mdat$PFT17 + mdat$PFT18)*-1

mdat$Soybean <- (mdat$PFT19 + mdat$PFT20)*-1

mdat$Cotton <- (mdat$PFT21 + mdat$PFT22)*-1

mdat$Rice <- (mdat$PFT23 + mdat$PFT24)*-1

mdat$Sugar <- (mdat$PFT25 + mdat$PFT26)*-1

mdat$Other <- (mdat$PFT27 + mdat$PFT28)*-1

mdat$Bioenergy <- (mdat$PFT29 + mdat$PFT30)*-1

mdat$Rainfed <- (mdat$PFT15 + mdat$PFT17 + mdat$PFT19 + mdat$PFT21 + mdat$PFT23 + mdat$PFT25 + mdat$PFT27 + mdat$PFT29)*-1
  
mdat$Irrigated <- (mdat$PFT16 + mdat$PFT18 + mdat$PFT20 + mdat$PFT22 + mdat$PFT24 + mdat$PFT26 + mdat$PFT28 + mdat$PFT30)*-1


write.csv(mdat, file="C://Users/Ryan_McManamay/Documents/Land_Integration/LandChange/Demeter_Select_LandChange_FINAL/combined/all_scenarios.csv")


#Scenarios
#harmonized = LU_harmonized_ssp1_rcp26_gfdl_2015.nc
#non-harmonized = LU_ssp5_rcp85_noresm_2100.nc

mdat1A <- mdat[1:544050,]
mdat1B <- mdat[544051:1088100,]

#mdat1A, col1 =  LU_harmonized_ssp1_rcp26_gfdl_2015.nc
#mdat1B, col1 =  LU_ssp1_rcp26_gfdl_2015.nc

mdat1A <- separate(mdat1A, col=1, into=c("Anal","Source","SSP","RCP","GCM", "Year"), sep="_")
mdat1B <- separate(mdat1B, col=1, into=c("Anal","SSP","RCP","GCM", "Year"), sep="_")
mdat1B$Source <- NA

mdat2 <- rbind(mdat1A, mdat1B)
mdat2$Year2 <- substr(mdat2$Year, 1,4)
mdat2$Year2 <- as.numeric(mdat2$Year2)

write.csv(mdat2, file="[YOUR FILE PATH]/combined/all_scenarios_final.csv")

