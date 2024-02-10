
library(sf)
library(broom)
library(ggplot2)
library(raster)
library(rgdal)
library(maptools)
library(viridis)
library(dplyr)
library(mapproj)


## read in Morai Region/basins shapefile
base_basin <- st_read("[Your file path]/Morai_DemeberBase_BasinID.shp")

base_basin_moll <- st_transform(base_basin, crs="+proj=moll +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")

## read in alternative Morai Region/basins shapefile
base_basin_O <- readOGR(dsn = "[Your file path]/Morai_DemeberBase_BasinID.shp", stringsAsFactors = T)


# try different plotting
plot(base_basin)
plot(base_basin_moll)

## this works with sf or st-read
ggplot(base_basin_moll)+geom_sf()

ggplot(base_basin)+geom_sf()


## this does not work
ggplot(base_basin_O) + geom_sf


###
## this works
ggplot() + geom_polygon(data = base_basin_O, aes(x = long, y = lat, group = group), colour = "black", fill = NA)


## converting shapefile to data frame
base_basin_O2 <- tidy(base_basin_O)
                      

#this didn't work
#base_basin2 <- as.numeric(unlist(base_basin))
#base_basin2 <- tidy(base_basin2, region="D_basin_id")


## read in crop basin summary from MSD Live repository
crop_loss_basin <- read.csv(file="[Your file path]/Crop_BasinSum.csv", header=TRUE)

crop_loss_basin$D_basin_id <- crop_loss_basin$basin_id.x


##  SSP5, GFDL, Harmonized, 2100, RCP8.5
crop_loss_basin_scenario1 <- crop_loss_basin[which(crop_loss_basin$Source=="harmonized"& crop_loss_basin$SSP=="ssp5" &
                                                     crop_loss_basin$RCP=="rcp85" &
                                                     crop_loss_basin$GCM=="gfdl" &
                                                     crop_loss_basin$Year2=="2100"),]


crop_loss_basin_scenario1$CornLog <- log(crop_loss_basin_scenario1$cCorn.sum*-1+1)*-1
crop_loss_basin_scenario1$WheatLog <- log(crop_loss_basin_scenario1$cWheat.sum*-1+1)*-1
crop_loss_basin_scenario1$cSoybeanLog <- log(crop_loss_basin_scenario1$cSoybean.sum*-1+1)*-1
crop_loss_basin_scenario1$RiceLog <- log(crop_loss_basin_scenario1$cRice.sum*-1+1)*-1

crop_loss_basin_scenario1[is.na(crop_loss_basin_scenario1)] <- 0

## first attempt with just regular merge 
base_crop_loss_scenario1 <- merge(base_basin, crop_loss_basin_scenario1, by="D_basin_id")


## join using dplyr

base_crop_loss_scenario1 <- base_basin %>%
  left_join(crop_loss_basin_scenario1, by=c("D_basin_id"="D_basin_id"))

base_crop_loss_scenario1 <- base_basin_moll %>%
  left_join(crop_loss_basin_scenario1, by=c("D_basin_id"="D_basin_id"))



## Base Plot

plot(base_crop_loss_scenario1["cCorn.sum"], lwd=0.5, border=0)

grid(nx = NULL, ny = NULL,
     lty = 2, col = "dark gray", lwd = 2)

plot(base_crop_loss_scenario1["cWheat.sum"], lwd=0.5, border=0)

  viridis(10)

 breaks=c(0,-10000,-50000,-100000,-1000000,-3000000)

     #breaks=c(0,-500, -1000,-5000,-10000,-50000,-100000,-1000000,-1500000))
     
    

 ## ggplot mercators
 
 
 ggplot(base_crop_loss_scenario1) +
   geom_sf(aes(fill = RiceLog), color="white", lwd=0.1) +
   scale_fill_gradient(high="#D9E4F6", low="#043283") 
   theme(panel.grid=element_line(color="grey", size=0.1, linetype=2))
 
 ggplot(base_crop_loss_scenario1) +
   geom_sf(aes(fill = CornLog), color="white", lwd=0.1) +
   scale_fill_gradient(high="#D6C6DB", low="#4C0266") +
  theme(panel.grid=element_line(color="grey", size=0.1, linetype=2))
 
 
 ggplot(base_crop_loss_scenario1) +
   geom_sf(aes(fill = WheatLog), color="grey", lwd=0.1) +
   scale_fill_gradient(high="#FFFFD7", low="#F8FF0A") +
   theme(panel.grid=element_line(color="grey", size=0.1, linetype=2))


 ggplot(base_crop_loss_scenario1) +
   geom_sf(aes(fill = cSoybeanLog), color="white", lwd=0.1) +
   scale_fill_gradient(high="#81EED4", low="#018164") +
   theme(panel.grid=element_line(color="grey", size=0.1, linetype=2))+
 
   
 ### ggplot Mollweide
ggplot(base_crop_loss_scenario1) +
   geom_sf(aes(fill = RiceLog), color="white", lwd=0.1) +
   scale_fill_gradient(high="#D9E4F6", low="#043283") +
   theme(panel.grid=element_line(color="dark grey", size=0.1, linetype=2))+
   coord_sf(expand = FALSE)+
   theme(axis.text.x = element_text(size = 14), axis.text.y=element_blank() ) +
   theme(panel.grid.minor.y = element_line(color = "grey",
                                           size = 0.1,
                                           linetype = 2))+
   theme(panel.background = element_rect(fill="light grey")) 
   
   
ggplot(base_crop_loss_scenario1) +
   geom_sf(aes(fill = CornLog), color="white", lwd=0.1) +
   scale_fill_gradient(high="#D6C6DB", low="#4C0266") +
   theme(panel.grid=element_line(color="dark grey", size=0.1, linetype=2))+
   coord_sf(expand = FALSE)+
   theme(axis.text.x = element_text(size = 14), axis.text.y=element_blank() ) +
   theme(panel.grid.minor.y = element_line(color = "grey",
                                           size = 0.1,
                                           linetype = 2))+
   theme(panel.background = element_rect(fill="light grey"))   
     
ggplot(base_crop_loss_scenario1) +
   geom_sf(aes(fill = WheatLog), color="white", lwd=0.1) +
   scale_fill_gradient(high="#FFFFD7", low="#F8FF0A") +
   theme(panel.grid=element_line(color="dark grey", size=0.1, linetype=2))+
   coord_sf(expand = FALSE)+
   theme(axis.text.x = element_text(size = 14), axis.text.y=element_blank() ) +
   theme(panel.grid.minor.y = element_line(color = "grey",
                                           size = 0.1,
                                           linetype = 2))+
   theme(panel.background = element_rect(fill="light grey"))
 
 ggplot(base_crop_loss_scenario1) +
   geom_sf(aes(fill = cSoybeanLog), color="white", lwd=0.1) +
   scale_fill_gradient(high="#81EED4", low="#018164") +
   theme(panel.grid=element_line(color="dark grey", size=0.1, linetype=2))+
   coord_sf(expand = FALSE)+
   theme(axis.text.x = element_text(size = 14), axis.text.y=element_blank() ) +
 theme(panel.grid.minor.y = element_line(color = "grey",
                                       size = 0.1,
                                       linetype = 2))+
   theme(panel.background = element_rect(fill="light grey"))
 
 


 
## unused arguments
 xlim(c(-180, 180)) +
   ylim(c(-65, 90))+
 theme(panel.border = element_rect(color = "dark grey", fill = NA, size = 0.05))

 

 ## NPP Loss
 
 NPP_loss_basin <- read.csv(file="[Your file path]/NPP_BasinSum_PFTgroups.csv", header=TRUE)
 
NPP_loss_basin$D_basin_id <- NPP_loss_basin$basin_id.x
 
 
 ##  SSP5, GFDL, Harmonized, 2100, RCP8.5
NPP_loss_basin_scenario1 <- NPP_loss_basin[which(NPP_loss_basin$Source=="harmonized"& NPP_loss_basin$SSP=="ssp5" &
                                                      NPP_loss_basin$RCP=="rcp85" &
                                                       NPP_loss_basin$GCM=="gfdl" &
                                                      NPP_loss_basin$Year2=="2100"),]

NPP_loss_basin_scenario1$Tot_NPP  <- NPP_loss_basin_scenario1$nForest.sum + NPP_loss_basin_scenario1$nGrass.sum + NPP_loss_basin_scenario1$nAgr.sum


NPP_loss_basin_scenario1$Forest_NPP_log  <- log(NPP_loss_basin_scenario1$nForest.sum*-1+1)*-1
NPP_loss_basin_scenario1$Grass_NPP_log <- log(NPP_loss_basin_scenario1$nGrass.sum*-1+1)*-1
NPP_loss_basin_scenario1$Agr_NPP_log <- log(NPP_loss_basin_scenario1$nAgr.sum*-1+1)*-1
NPP_loss_basin_scenario1$Tot_NPP_log <- NPP_loss_basin_scenario1$Forest_NPP_log + NPP_loss_basin_scenario1$Grass_NPP_log + NPP_loss_basin_scenario1$Agr_NPP_log

NPP_loss_basin_scenario1[is.na(NPP_loss_basin_scenario1)] <- 0

## join using dplyr

base_npp_loss_scenario1 <- base_basin_moll %>%
   left_join(NPP_loss_basin_scenario1, by=c("D_basin_id"="D_basin_id"))

scale_fill_manual(values=c("#98d871", "#4d983d", "#025809"))

ggplot(base_npp_loss_scenario1) +
   geom_sf(aes(fill = nAgr.sum), color="white", lwd=0.1) +
   scale_fill_gradient(high="#98d871", low="#025809") +
   theme(panel.grid=element_line(color="dark grey", size=0.1, linetype=2))+
   coord_sf(expand = FALSE)+
   theme(axis.text.x = element_text(size = 14), axis.text.y=element_blank() ) +
   theme(panel.grid.minor.y = element_line(color = "grey",
                                           size = 0.1,
                                           linetype = 2))+
   theme(panel.background = element_rect(fill="light grey"))   


ggplot(base_npp_loss_scenario1) +
   geom_sf(aes(fill = nForest.sum), color="white", lwd=0.1) +
   scale_fill_gradient(high="#98d871", low="#025809") +
   theme(panel.grid=element_line(color="dark grey", size=0.1, linetype=2))+
   coord_sf(expand = FALSE)+
   theme(axis.text.x = element_text(size = 14), axis.text.y=element_blank() ) +
   theme(panel.grid.minor.y = element_line(color = "grey",
                                           size = 0.1,
                                           linetype = 2))+
   theme(panel.background = element_rect(fill="light grey"))  


ggplot(base_npp_loss_scenario1) +
   geom_sf(aes(fill = nGrass.sum), color="white", lwd=0.1) +
   scale_fill_gradient(high="#98d871", low="#025809") +
   theme(panel.grid=element_line(color="dark grey", size=0.1, linetype=2))+
   coord_sf(expand = FALSE)+
   theme(axis.text.x = element_text(size = 14), axis.text.y=element_blank() ) +
   theme(panel.grid.minor.y = element_line(color = "grey",
                                           size = 0.1,
                                           linetype = 2))+
   theme(panel.background = element_rect(fill="light grey"))  



ggplot(base_npp_loss_scenario1) +
   geom_sf(aes(fill = Tot_NPP), color="white", lwd=0.1) +
   scale_fill_gradient(high="#98d871", low="#025809") +
   theme(panel.grid=element_line(color="dark grey", size=0.1, linetype=2))+
   coord_sf(expand = FALSE)+
   theme(axis.text.x = element_text(size = 14), axis.text.y=element_blank() ) +
   theme(panel.grid.minor.y = element_line(color = "grey",
                                           size = 0.1,
                                           linetype = 2))+
   theme(panel.background = element_rect(fill="light grey"))  