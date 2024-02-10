library(raster)
library(ggplot2)
library(broom)
library(viridis)
library(ncdf4)


##  Select data
spath1 <- "[YOUR FILE PATH]/SELECT/0.05_data/"
#example selecting 1 scenario
name <- paste(spath1, "Select_ssp5_2100_sum.tif", sep="")
s1 <- raster(sname)

s1_area <- area(s1)

##demeter data example
ncpath <- "[YOUR FILE PATH]/GCAM-Demeter/GCAM-Harmonized/GCMs/gfdl/"
ncfname <- paste(ncpath, "GCAM_demeter_LU_harmonized_ssp5_rcp85_gfdl_2100.nc", sep="")
nc1 <- nc_open(ncfname)

PFT31m <- ncvar_get(nc1, "PFT31")
PFT31<- raster(PFT31m, xmn=-180, xmx=180, ymn=-90, ymx=90, crs="+proj=longlat +datum=WGS84 +no_defs")
rm(PFT31m)

s1d <- (s1 - PFT31/100)

urb <- s1*s1_area


plot(s1d)+box()

ext <- extent()

plot(urb, ylim=c(-50,75), bg="blue")


s1d_proj <- projectRaster(s1d, crs="+proj=moll +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")
urb_proj <- projectRaster(urb, crs="+proj=moll +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")

s1d_df <- as.data.frame(s1d, xy=TRUE)
s1d_df_proj <- as.data.frame(s1d_proj, xy=TRUE)

urb_df <- as.data.frame(urb, xy=TRUE)
urb_df_proj <- as.data.frame(urb_proj, xy=TRUE)

#urban fraction delta
ggplot() +
  geom_raster(data = s1d_df, aes(x = x, y = y, fill = layer))+
  ylim(-80,100) +
  scale_fill_gradientn(colours=c("#A1E3FE","#02002E","#FF0000FF"))

ggplot() +
  geom_raster(data = s1d_df_proj, aes(x = x, y = y, fill = layer))+
  scale_fill_gradientn(colours=c("#030E73","white","#FF0000FF"))


ggplot() +
  geom_raster(data = s1d_df_proj, aes(x = x, y = y, fill = layer))+
  scale_fill_gradientn(colours=c("#A1E3FE","#02002E","#FF0000FF"))


#option:
scale_fill_gradientn(colours=c("#0000FFFF","#FFFFFFFF","#FF0000FF"))

# urban land
ggplot() +
  geom_raster(data = urb_df, aes(x = x, y = y, fill = layer))+
  ylim(-80,100) + scale_fill_viridis_c(option = "B")

ggplot() +
  geom_raster(data = urb_df, aes(x = x, y = y, fill = layer))+
  ylim(-80,100) + 
  scale_fill_gradientn(colours=c("#E5E4E2","#EE9A24","#6500B3"))


ggplot() +
  geom_raster(data = urb_df, aes(x = x, y = y, fill = layer))+
  ylim(-80,100) + 
  scale_fill_gradientn(colours=c("#030E73","#6500B3","#EE9A24"))


ggplot() +
  geom_raster(data = urb_df_proj, aes(x = x, y = y, fill = layer))+
  scale_fill_viridis_c(option = "B")

ggplot() +
  geom_raster(data = urb_df_proj, aes(x = x, y = y, fill = layer))+
  scale_fill_gradientn(colours=c("#030E73","white","#FF0000FF"))

scale_fill_viridis_c(option = "B")



## only focus on Eastern US and China

#Eastern US
ggplot() +
  geom_raster(data = urb_df, aes(x = x, y = y, fill = layer))+
  ylim(25,50) + xlim(-100,-65) + scale_fill_viridis_c(option = "B")


#China
ggplot() +
  geom_raster(data = urb_df, aes(x = x, y = y, fill = layer))+
  ylim(0,50) + xlim(90,150) + scale_fill_viridis_c(option = "B")




scale_fill_gradientn(colours=c("#0000FFFF","#02002E","#FF0000FF"))

#option:
scale_fill_gradientn(colours=c("#0000FFFF","#FFFFFFFF","#FF0000FF"))

scale_fill_gradientn(colours=c("#A1E3FE","#02002E","#FF0000FF"))

#Eastern US
ggplot() +
  geom_raster(data = s1d_df, aes(x = x, y = y, fill = layer))+
  ylim(25,50) + xlim(-100,-65) +scale_fill_gradientn(colours=c("#030E73","white","#FF0000FF"))


#China
ggplot() +
  geom_raster(data = s1d_df, aes(x = x, y = y, fill = layer))+
  ylim(0,50) + xlim(90,150) + scale_fill_gradientn(colours=c("#A1E3FE","#02002E","#FF0000FF"))


ggplot() +
  geom_raster(data = s1d_df, aes(x = x, y = y, fill = layer))+
  ylim(0,50) + xlim(90,150) + scale_fill_gradientn(colours=c("#A1E3FE","#FFFFFFFF","#FF0000FF"))
#010101


ggplot() +
  geom_raster(data = s1d_df, aes(x = x, y = y, fill = layer))+
  ylim(0,50) + xlim(90,150) + scale_fill_gradientn(colours=c("#030E73","white","#FF0000FF"))



red: #D50C09
blue: #1114A8
dark blue: #02056A
  
grey  #E5E4E2