library(raster)
library(ncdf4)
library(maptools)
library(rasterVis)
library(maps)
library(rgdal)
library(dplyr)



##  File path for SELECT raster data aggregated from 1-km to 0.05 resolution
spath1 <- "[YOUR FILE PATH HERE]/SELECT/0.05_data/"




### File path for Chen et al. 2020 (Scientific data) data files that meet conditions
ncpath <- "[YOUR FILE PATH HERE]/GCAM-Demeter/GCAM-Harmonized/GCMs/gfdl/"



##start loop 
  
for(i in 1:nrow(variable_list3)){
    ssp <- variable_list3[i,"ssps"]
    rcp <- variable_list3[i, "rcps"]
    gcm <- variable_list3[i, "gcms"]
    year <- variable_list3[i, "years"]
    
    
#import correct year of SELECT data
sname <- paste0(spath1, "Select_", ssp, "_", year, "_sum.tif")
s1 <- raster(sname)
    
    
    
ncfname <- paste0(ncpath, "GCAM_demeter_LU_harmonized_", ssp,"_",rcp,"_",gcm,"_",year,".nc")
nc1 <- nc_open(ncfname)
    
    
  
  PFT0m <- ncvar_get(nc1, "PFT0")
  PFT1m <- ncvar_get(nc1, "PFT1")
  PFT2m <- ncvar_get(nc1, "PFT2")
  PFT3m <- ncvar_get(nc1, "PFT3")
  PFT4m <- ncvar_get(nc1, "PFT4")
  PFT5m <- ncvar_get(nc1, "PFT5")
  PFT6m <- ncvar_get(nc1, "PFT6")
  PFT7m <- ncvar_get(nc1, "PFT7")
  PFT8m <- ncvar_get(nc1, "PFT8")
  PFT9m <- ncvar_get(nc1, "PFT9")
  PFT10m <- ncvar_get(nc1, "PFT10")
  PFT11m <- ncvar_get(nc1, "PFT11")
  PFT12m <- ncvar_get(nc1, "PFT12")
  PFT13m <- ncvar_get(nc1, "PFT13")
  PFT14m <- ncvar_get(nc1, "PFT14")
  PFT15m <- ncvar_get(nc1, "PFT15")
  PFT16m <- ncvar_get(nc1, "PFT16")
  PFT17m <- ncvar_get(nc1, "PFT17")
  PFT18m <- ncvar_get(nc1, "PFT18")
  PFT19m <- ncvar_get(nc1, "PFT19")
  PFT20m <- ncvar_get(nc1, "PFT20")
  PFT21m <- ncvar_get(nc1, "PFT21")
  PFT22m <- ncvar_get(nc1, "PFT22")
  PFT23m <- ncvar_get(nc1, "PFT23")
  PFT24m <- ncvar_get(nc1, "PFT24")
  PFT25m <- ncvar_get(nc1, "PFT25")
  PFT26m <- ncvar_get(nc1, "PFT26")
  PFT27m <- ncvar_get(nc1, "PFT27")
  PFT28m <- ncvar_get(nc1, "PFT28")
  PFT29m <- ncvar_get(nc1, "PFT29")
  PFT30m <- ncvar_get(nc1, "PFT30")
  PFT31m <- ncvar_get(nc1, "PFT31")
  PFT32m <- ncvar_get(nc1, "PFT32")
  
  PFT0<- raster(PFT0m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT0m)
  PFT1<- raster(PFT1m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT1m)
  PFT2<- raster(PFT2m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT2m)
  PFT3<- raster(PFT3m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT3m)
  PFT4<- raster(PFT4m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT4m)
  PFT5<- raster(PFT5m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT5m)
  PFT6<- raster(PFT6m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT6m)
  PFT7<- raster(PFT7m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT7m)
  PFT8<- raster(PFT8m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT8m)
  PFT9<- raster(PFT9m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT9m)
  PFT10<- raster(PFT10m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT10m)
  PFT11<- raster(PFT11m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT11m)
  PFT12<- raster(PFT12m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT12m)
  PFT13<- raster(PFT13m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT13m)
  PFT14<- raster(PFT14m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT14m)
  PFT15<- raster(PFT15m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT15m)
  PFT16<- raster(PFT16m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT16m)
  PFT17<- raster(PFT17m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT17m)
  PFT18<- raster(PFT18m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT18m)
  PFT19<- raster(PFT19m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT19m)
  PFT20<- raster(PFT20m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT20m)
  PFT21<- raster(PFT21m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT21m)
  PFT22<- raster(PFT22m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT22m)
  PFT23<- raster(PFT23m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT23m)
  PFT24<- raster(PFT24m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT24m)
  PFT25<- raster(PFT25m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT25m)
  PFT26<- raster(PFT26m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT26m)
  PFT27<- raster(PFT27m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT27m)
  PFT28<- raster(PFT28m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT28m)
  PFT29<- raster(PFT29m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT29m)
  PFT30<- raster(PFT30m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT30m)
  PFT31<- raster(PFT31m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT31m)
  PFT32<- raster(PFT32m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
  rm(PFT32m)
  
  #adjust s1.sum for existing urban
  s1d <- (s1 - PFT31/100)
  TF <- 100 - PFT31
  
  PFT0 <- (PFT0/TF)*s1d*s1_area
  PFT1 <- (PFT1/TF)*s1d*s1_area
  PFT2 <- (PFT2/TF)*s1d*s1_area
  PFT3 <- (PFT3/TF)*s1d*s1_area
  PFT4 <- (PFT4/TF)*s1d*s1_area
  PFT5 <- (PFT5/TF)*s1d*s1_area
  PFT6 <- (PFT6/TF)*s1d*s1_area
  PFT7 <- (PFT7/TF)*s1d*s1_area
  PFT8 <- (PFT8/TF)*s1d*s1_area
  PFT9 <- (PFT9/TF)*s1d*s1_area
  PFT10 <- (PFT10/TF)*s1d*s1_area
  PFT11 <- (PFT11/TF)*s1d*s1_area
  PFT12 <- (PFT12/TF)*s1d*s1_area
  PFT13 <- (PFT13/TF)*s1d*s1_area
  PFT14 <- (PFT14/TF)*s1d*s1_area
  PFT15 <- (PFT15/TF)*s1d*s1_area
  PFT16 <- (PFT16/TF)*s1d*s1_area
  PFT17 <- (PFT17/TF)*s1d*s1_area
  PFT18 <- (PFT18/TF)*s1d*s1_area
  PFT19 <- (PFT19/TF)*s1d*s1_area
  PFT20 <- (PFT20/TF)*s1d*s1_area
  PFT21 <- (PFT21/TF)*s1d*s1_area
  PFT22 <- (PFT22/TF)*s1d*s1_area
  PFT23 <- (PFT23/TF)*s1d*s1_area
  PFT24 <- (PFT24/TF)*s1d*s1_area
  PFT25 <- (PFT25/TF)*s1d*s1_area
  PFT26 <- (PFT26/TF)*s1d*s1_area
  PFT27 <- (PFT27/TF)*s1d*s1_area
  PFT28 <- (PFT28/TF)*s1d*s1_area
  PFT29 <- (PFT29/TF)*s1d*s1_area
  PFT30 <- (PFT30/TF)*s1d*s1_area
  PFT31 <- (PFT31/TF)*s1d*s1_area
  PFT32 <- (PFT32/TF)*s1d*s1_area
  urb <- s1*s1_area
  
  s1_comp <- stack(baser, PFT0, PFT1,PFT2,PFT3,PFT4,PFT5,PFT6,PFT7, PFT8, PFT9, PFT10,PFT11,PFT12,PFT13,PFT14,PFT15,
                   PFT16,PFT17, PFT18, PFT19, PFT20,PFT21,PFT22, PFT23, PFT24,PFT25, PFT26, PFT27, PFT28, PFT29,
                   PFT30, PFT31, PFT32, urb, s1d)
  rm(PFT0, PFT1,PFT2,PFT3,PFT4,PFT5,PFT6,PFT7, PFT8, PFT9, PFT10, PFT11,PFT12,PFT13,PFT14,PFT15,
     PFT16,PFT17, PFT18, PFT19, PFT20,PFT21,PFT22, PFT23, PFT24,PFT25, PFT26, PFT27, PFT28, PFT29,
     PFT30, PFT31, PFT32)
  s1_comp.db <- as.data.frame(s1_comp)
  s1_comp.db$fid <- s1_comp.db$layer.1
  #s1_comp.db$reg_id <- s1_comp.db$layer.37
  #s1_comp.db$basin_id <- s1_comp.db$layer.38
  #regbas <- cbind(base$fid, base$region_id, base$basin_id)
  #colnames(regbas) <- c("fid", "region_id", "basin_id")
  s1_new <- merge(regbas, s1_comp.db, by="fid", all.x=TRUE)
  
  s1_new[is.na(s1_new)] <- 0
  
  urb_s1_calc <- s1_new %>%
    group_by(region_id, basin_id) %>%
    summarize(PFT0=sum(layer.2), PFT1=sum(layer.3),	PFT2=sum(layer.4),	PFT3=sum(layer.5),	PFT4=sum(layer.6),	PFT5=sum(layer.7),	
              PFT6=sum(layer.8),	PFT7=sum(layer.9),	PFT8=sum(layer.10),	PFT9=sum(layer.11),	PFT10=sum(layer.12),
              PFT11=sum(layer.13),	PFT12=sum(layer.14),	PFT13=sum(layer.15),	PFT14=sum(layer.16),	PFT15=sum(layer.17),	
              PFT16=sum(layer.18),	PFT17=sum(layer.19),	PFT18=sum(layer.20),	PFT19=sum(layer.21),	PFT20=sum(layer.22),
              PFT21=sum(layer.23), PFT22=sum(layer.24), PFT23=sum(layer.25), PFT24=sum(layer.26), PFT25=sum(layer.27), PFT26=sum(layer.28),
              PFT27=sum(layer.29), PFT28=sum(layer.30), PFT29=sum(layer.31), PFT30=sum(layer.32), PFT31=sum(layer.33), PFT32=sum(layer.34),
              urban_land=sum(layer.35), urb_delta=sum(layer.36))	
  
  
  datpath <- "[YOUR OUTPUT FILE PATH HERE]"
  sumdat <- paste0(datpath, "GCAM_demeter_LU_harmonized_", ssp,"_",rcp,"_",gcm,"_",year,".csv")
  
  write.csv(urb_s1_calc, file=sumdat)
}
