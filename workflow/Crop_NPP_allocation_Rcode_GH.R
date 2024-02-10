install.packages("rgdal")
install.packages("raster")
install.packages("ncdf4")
install.packages("rasterVis")
install.packages("maptools")
install.packages("maps")
install.packages("rgdal")
install.packages("dplyr")
library(raster)
library(ncdf4)
library(maptools)
library(rasterVis)
library(maps)
library(rgdal)
library(dplyr)
library(reshape)


# first file   
##  Select near-base conditions in GCAM DEMETER outputs
ncpath <- "[Your file path]/GCAM-Demeter/GCMs/gfdl/"

ncpath <- "[Your FILE PATH]/GCAM-Harmonized/GCMs/gfdl/"
ncfname <- paste(ncpath, "GCAM_demeter_LU_harmonized_ssp1_rcp26_gfdl_2020.nc", sep="")
nc1 <- nc_open(ncfname)



PFT0m <- ncvar_get(nc1, "PFT0")
PFT0<- raster(PFT0m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
rm(PFT0m)
PFT1m <- ncvar_get(nc1, "PFT1")
PFT1<- raster(PFT1m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
rm(PFT1m)
PFT2m <- ncvar_get(nc1, "PFT2")
PFT2<- raster(PFT2m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
rm(PFT2m)


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
PFT32<- raster(PFT32m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
rm(PFT32m)



### Demeter Base from GitHUB demeter_inputs_chen_et_al_2020a
base <- read.csv(file=[YOUR FILE PATH]/demeter_inputs_chen_et_al_2020a/demeter_inputs_chen_et_al_2020a/base/baselayerdata_region_basin_0.05deg.csv", header=TRUE)
base_xy <- cbind(base$Loncoord, base$Latcoord)
baser <- rasterize(base_xy, PFT0, field=base$fid, fun='last', crs=" +proj=longlat +datum=WGS84 +no_defs")
extent(baser) <- extent(PFT0)

base_PFTs <- stack(baser, PFT1,PFT2,PFT3,PFT4,PFT5,PFT6,PFT7, PFT8, PFT9, PFT10, PFT11, PFT12, PFT13, PFT14, PFT15, PFT16, PFT17,
                   PFT18, PFT19, PFT20, PFT21, PFT22, PFT23, PFT24, PFT25, PFT26, PFT27, PFT28, PFT29, PFT30, PFT32)

rm(PFT1,PFT2,PFT3,PFT4,PFT5,PFT6,PFT7, PFT8, PFT9, PFT10, PFT11,PFT12,PFT13,PFT14,PFT15,
   PFT16,PFT17, PFT18, PFT19, PFT20,PFT21,PFT22, PFT23, PFT24,PFT25, PFT26, PFT27, PFT28, PFT29,
   PFT30, PFT31, PFT32)

base_PFTdf <- as.data.frame(base_PFTs)
colnames(base_PFTdf) <- c("fid", "PFT1","PFT2","PFT3","PFT4","PFT5","PFT6","PFT7", "PFT8", "PFT9", "PFT10", "PFT11", "PFT12", "PFT13", "PFT14", "PFT15", "PFT16", "PFT17",
                          "PFT18", "PFT19", "PFT20", "PFT21", "PFT22", "PFT23", "PFT24", "PFT25", "PFT26", "PFT27", "PFT28", "PFT29", "PFT30", "PFT32")

base_regbas <- cbind(base$fid, base$region_id, base$basin_id)
colnames(base_regbas) <- c("fid","region_id", "basin_id")
base_regbas <- as.data.frame(base_regbas)
base_reg

base_2020 <- merge(base_regbas,base_PFTdf, by="fid")

writeRaster(baser,file="D://MSD/Land_Integration/Demeter_SELECT/BaseFID.tif", format="GTiff")


## Monfreida crop data
mpath1 <- "[YOUR FILE PATH]/HarvestedAreaYield175Crops_Geotiff/HarvestedAreaYield175Crops_Geotiff/GeoTiff/"
mname <- paste(mpath1, "cotton/", "cotton_YieldPerHectare.tif", sep="")
cotton <- raster(mname)

cotton2 <- projectRaster(cotton, PFT0, method="bilinear") 

mname <- paste(mpath1, "maize/", "maize_YieldPerHectare.tif", sep="")
maize <- raster(mname)
mname <- paste(mpath1, "maizefor/", "maizefor_YieldPerHectare.tif", sep="")
maizefor <- raster(mname)
maizez <- maize + maizefor

maizez2 <- projectRaster(maizez, PFT0, method="bilinear")

mname <- paste(mpath1, "rice/", "rice_YieldPerHectare.tif", sep="")
rice <- raster(mname)
rice2 <- projectRaster(rice, PFT0, method="bilinear") 

mname <- paste(mpath1, "soybean/", "soybean_YieldPerHectare.tif", sep="")
soybean <- raster(mname)
soybean2 <- projectRaster(soybean, PFT0, method="bilinear")

mname <- paste(mpath1, "sugarbeet/", "sugarbeet_YieldPerHectare.tif", sep="")
sugarbeet <- raster(mname)
mname <- paste(mpath1, "sugarcane/", "sugarcane_YieldPerHectare.tif", sep="")
sugarcane <- raster(mname)
mname <- paste(mpath1, "sugarnes/", "sugarnes_YieldPerHectare.tif", sep="")
sugarnes <- raster(mname)
sugar <- max(sugarbeet, sugarcane, sugarnes)
sugar2 <- projectRaster(sugar, PFT0, method="bilinear")


mname <- paste(mpath1, "wheat/", "wheat_YieldPerHectare.tif", sep="")
wheat <- raster(mname)
wheat2 <- projectRaster(wheat, PFT0, method="bilinear")


crops <- stack(baser, cotton2, maizez2, rice2, soybean2, sugar2, wheat2)
cropsdf <- as.data.frame(crops)
colnames(cropsdf) <- c("fid", "cotton","maize","rice","soybean","sugar","wheat")
base_crops <- merge(base, cropsdf, by="fid", all.x=TRUE)

crop_calc <- base_crops %>%
  group_by(region_id, basin_id) %>%
  summarize(cotton=mean(cotton), maize=mean(maize),	rice=mean(rice),	soybean=mean(soybean),	sugar=mean(sugar),	wheat=mean(wheat))


## This generates crop summary per basin reigion
write.csv(crop_calc, file="[Your File Path]/Crop_summary_basin_region.csv")



##NPP
npp <- read.csv(file="[your file path]/npp_base_FID_zonal.csv", header=TRUE)
npp <- npp[c(2,8)]
colnames(npp) <- c("fid","npp")
npp_base <- merge(base,npp, by="fid",all.x=TRUE)

npp_base <- na.omit(npp_base)

npp_calc <- npp_base  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))


# This generates NPP summary file for regions and basins
write.csv(npp_calc, file="D[Your file path]/npp_reg_base_sum.csv")


base_npp_2020 <- merge(npp, base_2020, by="fid")


npp_PFT1 <- base_npp_2020[which(base_npp_2020$PFT1 >=10),]
npp_PFT2 <- base_npp_2020[which(base_npp_2020$PFT2 >=10),]
npp_PFT3 <- base_npp_2020[which(base_npp_2020$PFT3 >=10),]
npp_PFT4 <- base_npp_2020[which(base_npp_2020$PFT4 >=10),]
npp_PFT5 <- base_npp_2020[which(base_npp_2020$PFT5 >=10),]
npp_PFT6 <- base_npp_2020[which(base_npp_2020$PFT6 >=10),]
npp_PFT7 <- base_npp_2020[which(base_npp_2020$PFT7 >=10),]
npp_PFT8 <- base_npp_2020[which(base_npp_2020$PFT8 >=10),]
npp_PFT9 <- base_npp_2020[which(base_npp_2020$PFT9 >=10),]
npp_PFT10 <- base_npp_2020[which(base_npp_2020$PFT10 >=10),]
npp_PFT11 <- base_npp_2020[which(base_npp_2020$PFT11 >=10),]
npp_PFT12 <- base_npp_2020[which(base_npp_2020$PFT12 >=10),]
npp_PFT13 <- base_npp_2020[which(base_npp_2020$PFT13 >=10),]
npp_PFT14 <- base_npp_2020[which(base_npp_2020$PFT14 >=10),]
npp_PFT15 <- base_npp_2020[which(base_npp_2020$PFT15 >=10),]
npp_PFT16 <- base_npp_2020[which(base_npp_2020$PFT16 >=10),]
npp_PFT17 <- base_npp_2020[which(base_npp_2020$PFT17 >=10),]
npp_PFT18 <- base_npp_2020[which(base_npp_2020$PFT18 >=10),]
npp_PFT19 <- base_npp_2020[which(base_npp_2020$PFT19 >=10),]
npp_PFT20 <- base_npp_2020[which(base_npp_2020$PFT20 >=10),]
npp_PFT21 <- base_npp_2020[which(base_npp_2020$PFT21 >=10),]
npp_PFT22 <- base_npp_2020[which(base_npp_2020$PFT22 >=10),]
npp_PFT23 <- base_npp_2020[which(base_npp_2020$PFT23 >=10),]
npp_PFT24 <- base_npp_2020[which(base_npp_2020$PFT24 >=10),]
npp_PFT25 <- base_npp_2020[which(base_npp_2020$PFT25 >=10),]
npp_PFT26 <- base_npp_2020[which(base_npp_2020$PFT26 >=10),]
npp_PFT27 <- base_npp_2020[which(base_npp_2020$PFT27 >=10),]
npp_PFT28 <- base_npp_2020[which(base_npp_2020$PFT28 >=10),]
npp_PFT29 <- base_npp_2020[which(base_npp_2020$PFT29 >=10),]
npp_PFT30 <- base_npp_2020[which(base_npp_2020$PFT30 >=10),]
npp_PFT32 <- base_npp_2020[which(base_npp_2020$PFT32 >=10),]



npp_PFT1_calc <- npp_PFT1  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT2_calc <- npp_PFT2  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT3_calc <- npp_PFT3  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT4_calc <- npp_PFT4  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT5_calc <- npp_PFT5  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT6_calc <- npp_PFT6  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT7_calc <- npp_PFT7  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT8_calc <- npp_PFT8  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT9_calc <- npp_PFT9  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT10_calc <- npp_PFT10  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT11_calc <- npp_PFT11  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT12_calc <- npp_PFT12  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT13_calc <- npp_PFT13  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT14_calc <- npp_PFT14  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT15_calc <- npp_PFT15  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT16_calc <- npp_PFT16  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT17_calc <- npp_PFT17  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT18_calc <- npp_PFT18  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT19_calc <- npp_PFT19  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT20_calc <- npp_PFT20  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT21_calc <- npp_PFT21  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT22_calc <- npp_PFT22  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT23_calc <- npp_PFT23 %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT24_calc <- npp_PFT24  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT25_calc <- npp_PFT25  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT26_calc <- npp_PFT26  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT27_calc <- npp_PFT27  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT28_calc <- npp_PFT28  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT29_calc <- npp_PFT29  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT30_calc <- npp_PFT30  %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))

npp_PFT32_calc <- npp_PFT32 %>%
  group_by(region_id, basin_id) %>%
  summarize(npp_avg=mean(npp), npp_min=min(npp), npp_max=max(npp), npp_sd=sd(npp))


npp_PFT1_calc$PFT <- "PFT1"
npp_PFT2_calc$PFT <- "PFT2"
npp_PFT3_calc$PFT <- "PFT3"
npp_PFT4_calc$PFT <- "PFT4"
npp_PFT5_calc$PFT <- "PFT5"
npp_PFT6_calc$PFT <- "PFT6"
npp_PFT7_calc$PFT <- "PFT7"
npp_PFT8_calc$PFT <- "PFT8"
npp_PFT9_calc$PFT <- "PFT9"
npp_PFT10_calc$PFT <- "PFT10"
npp_PFT11_calc$PFT <- "PFT11"
npp_PFT12_calc$PFT <- "PFT12"
npp_PFT13_calc$PFT <- "PFT13"
npp_PFT14_calc$PFT <- "PFT14"
npp_PFT15_calc$PFT <- "PFT15"
npp_PFT16_calc$PFT <- "PFT16"
npp_PFT17_calc$PFT <- "PFT17"
npp_PFT18_calc$PFT <- "PFT18"
npp_PFT19_calc$PFT <- "PFT19"
npp_PFT20_calc$PFT <- "PFT20"
npp_PFT21_calc$PFT <- "PFT21"
npp_PFT22_calc$PFT <- "PFT22"
npp_PFT23_calc$PFT <- "PFT23"
npp_PFT24_calc$PFT <- "PFT24"
npp_PFT25_calc$PFT <- "PFT25"
npp_PFT26_calc$PFT <- "PFT26"
npp_PFT27_calc$PFT <- "PFT27"
npp_PFT28_calc$PFT <- "PFT28"
npp_PFT29_calc$PFT <- "PFT29"
npp_PFT30_calc$PFT <- "PFT30"
npp_PFT32_calc$PFT <- "PFT32"

npp_PFTall_calc <- rbind(npp_PFT1_calc,	npp_PFT2_calc,	npp_PFT3_calc,	npp_PFT4_calc,	npp_PFT5_calc,	npp_PFT6_calc,	
                         npp_PFT7_calc,	npp_PFT8_calc,	npp_PFT9_calc,	npp_PFT10_calc,	npp_PFT11_calc,	npp_PFT12_calc,	
                         npp_PFT13_calc,	npp_PFT14_calc,	npp_PFT15_calc,	npp_PFT16_calc,	npp_PFT17_calc,	npp_PFT18_calc,	
                         npp_PFT19_calc,	npp_PFT20_calc,	npp_PFT21_calc,	npp_PFT22_calc,	npp_PFT23_calc,	npp_PFT24_calc,	
                         npp_PFT25_calc,	npp_PFT26_calc,	npp_PFT27_calc,	npp_PFT28_calc,	npp_PFT29_calc,	npp_PFT30_calc,	npp_PFT32_calc)


write.csv(npp_PFTall_calc, file="[Your file path]/npp_PFTall_cal_10percent.csv")

npp_PFTall_calc_10 <- npp_PFTall_calc_10[c(-1)]
npp_PFTall_calc_10m <- melt(npp_PFTall_calc_10, id=c("basin_id","region_id","PFT"))


npp_PFTall_calc_10r <- cast(npp_PFTall_calc_10m, region_id + basin_id ~ PFT ~ variable, mean)
npp_PFTall_calc_10r

npp_PFTall_calc_10r <- as.data.frame(npp_PFTall_calc_10r)
