library(reshape)
library(viridis)
install.packages("viridis")
#install.packages("circlize")
library(circlize)

# crop yields in tons per hectare - read from data depository MSD LIVE
crop <- read.csv(file="[YOUR FILE PATH]/Crop_summary_basin_region.csv", header=TRUE)

crop$reg_bas <- paste0(crop$region_id, "_", crop$basin_id)

mdat_crop <- merge(mdat2, crop, by="reg_bas", all.x=TRUE)
mdat_crop$Source[is.na(mdat_npp$Source)] <- "Non-harmonized"

### Crop yields in tons per hectare
##  100 hectares in 1 km^2, so multiply by 100
## changes in PFT groups are changes in land area (km^2) from urbanization
## negative values MEAN losses due to urbanization (already converted previously)

mdat_crop$cCotton <- mdat_crop$Cotton*mdat_crop$cotton*100
mdat_crop$cCorn <- mdat_crop$Corn*mdat_crop$maize*100
mdat_crop$cwheat <- mdat_crop$wheat*mdat_crop$wheat*100
mdat_crop$cSoybean <- mdat_crop$Soybean*mdat_crop$soybean*100
mdat_crop$cSugar <- mdat_crop$Sugar*mdat_crop$sugar*100
mdat_crop$cwheat <- mdat_crop$wheat*mdat_crop$wheat*100


crop_avg_sum1 <- summaryBy(cCotton + cCorn + cwheat + cSoybean + cSugar + cwheat ~ region_id.x + Source + SSP + RCP + GCM + Year2, data=mdat_crop, FUN=c(sum), na.rm=TRUE)

write.csv(crop_avg_sum1, file="C://Users/Ryan_McManamay/Documents/Land_Integration/Land_NPP_Crop_response/NPP_changes_LULCC/Crop_RegionSum.csv")                        



crop_avg_sum2 <- summaryBy(cCotton + cCorn + cwheat + cSoybean + cSugar + cwheat ~ Source + SSP + RCP + GCM + Year2, data=mdat_crop, FUN=c(sum), na.rm=TRUE)

write.csv(crop_avg_sum2, file="C://Users/Ryan_McManamay/Documents/Land_Integration/Land_NPP_Crop_response/NPP_changes_LULCC/Crop_GlobalSum.csv")                        



crop_avg_sum3 <- summaryBy(cCotton + cCorn + cwheat + cSoybean + cSugar + cwheat ~ basin_id.x + Source + SSP + RCP + GCM + Year2, data=mdat_crop, FUN=c(sum), na.rm=TRUE)

write.csv(crop_avg_sum3, file="C://Users/Ryan_McManamay/Documents/Land_Integration/Land_NPP_Crop_response/NPP_changes_LULCC/Crop_BasinSum.csv")                        


dat_global_a <- summaryBy(urban_land + urb_delta+Forest+Grass+Agr + For_bor + For_trop + Corn + wheat + Soybean + Cotton + 
                            wheat + Sugar + Other + Bioenergy + Rainfed + Irrigated
                          ~ Source + RCP + GCM + Year, data= mdat2, FUN=c(sum), na.rm=TRUE)


dat_global_b <- summaryBy(urban_land.sum + urb_delta.sum+For2.sum+Grass2.sum+Agr2.sum 
                          ~ ssp + gcm + year, data=dat_global_a, FUN= function(x) c(mean=mean(x), Quantile=quantile(x, probs=c(0.05,0.95))))


dat_global_c <- summaryBy(urban_land.sum + urb_delta.sum+For2.sum+Grass2.sum+Agr2.sum 
                          ~ ssp + gcm + year, data=dat_global_a, FUN=c(mean, min, max))



crop_SUM_globala <- summaryBy(cCotton.sum + cCorn.sum + cwheat.sum + cSoybean.sum + cSugar.sum + cwheat.sum ~ SSP + RCP + Year2, data=crop_avg_sum2, FUN=c(mean), na.rm=TRUE)
colnames(crop_SUM_globala) <- c("SSP", "RCP", "Year", "Cotton", "Corn", "wheat", "Soybean", "Sugar", "wheat")

crop_SUM_globalc <- melt(crop_SUM_globala, id=c("SSP", "RCP", "Year"))
crop_SUM_globalc$MillTonLoss <- (crop_SUM_globalc$value)/-1000000
crop_SUM_globalc <- crop_SUM_globalc[which(crop_SUM_globalc$variable!="Cotton"),]




##SSP1 RCP26
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp1" & crop_SUM_globalc$RCP=="rcp26"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))

dev.off()

##SSP1 RCP45
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp1" & crop_SUM_globalc$RCP=="rcp45"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))




##SSP1 RCP60
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp1" & crop_SUM_globalc$RCP=="rcp60"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))



##SSP2 RCP26
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp2" & crop_SUM_globalc$RCP=="rcp26"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))




##SSP2 RCP45
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp2" & crop_SUM_globalc$RCP=="rcp45"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))



##SSP2 RCP60
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp2" & crop_SUM_globalc$RCP=="rcp60"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))



##SSP3 RCP45
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp3" & crop_SUM_globalc$RCP=="rcp45"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))



##SSP3 RCP60
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp3" & crop_SUM_globalc$RCP=="rcp60"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))

dev.off()

##SSP4 RCP26
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp4" & crop_SUM_globalc$RCP=="rcp26"),]

pdf(file="C://Users/Ryan_McManamay/Documents/Land_Integration/Land_NPP_Crop_response/Crop_changes_LULCC/Plots/SSP4_RCP26.pdf")

ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))



##SSP4 RCP45
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp4" & crop_SUM_globalc$RCP=="rcp45"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))


##SSP4 RCP60
crop_SUM_globalc_ssp1 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp4" & crop_SUM_globalc$RCP=="rcp60"),]


ggplot(crop_SUM_globalc_ssp1, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons")+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))




##SSP5 RCP26
crop_SUM_globalc_ssp5 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp5" & crop_SUM_globalc$RCP=="rcp26"),]


ggplot(crop_SUM_globalc_ssp5, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons") +
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))



##SSP5 RCP45
crop_SUM_globalc_ssp5 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp5" & crop_SUM_globalc$RCP=="rcp45"),]


ggplot(crop_SUM_globalc_ssp5, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons") +
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))


##SSP5 RCP60
crop_SUM_globalc_ssp5 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp5" & crop_SUM_globalc$RCP=="rcp60"),]

ggplot(crop_SUM_globalc_ssp5, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,265) + ylab("Million Tons") +
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))


##SSP5 RCP85
crop_SUM_globalc_ssp5 <- crop_SUM_globalc[which(crop_SUM_globalc$SSP=="ssp5" & crop_SUM_globalc$RCP=="rcp85"),]

ggplot(crop_SUM_globalc_ssp5, aes(x=Year, y=MillTonLoss, fill=variable)) + 
  geom_area(alpha=0.6 , size=0.75, colour="white") +
  scale_fill_viridis(discrete = T) + ylim(0,255) + ylab("Million Tons") +
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))





#### circular bar plots

##Corn
crop_SUM_globalc_corn_2050 <- crop_SUM_globalc[which(crop_SUM_globalc$variable=="Corn" & crop_SUM_globalc$Year=="2100"),]
max(crop_SUM_globalc_corn_2050$MillTonLoss)
crop_SUM_globalc_corn_2050$Sectors <- paste0(crop_SUM_globalc_corn_2050$SSP, "_", crop_SUM_globalc_corn_2050$RCP)
color_corn =c("#d8d0ff", "#cdc1f2", "#c2b2e6", "#b8a3da", "#ad94cd", "#a285c1", "#9877b5", "#8e68a9", "#845a9e", "#7a4c92", "#6f3e86", "#652f7a", "#5b216e", "#501161", "#440154")
  
  
circos.clear
circos.par("start.degree" = 90, cell.padding = c(0, 0, 0, 0))

circos.initialize("a", xlim=c(0,200)) 
circos.track(ylim = c(0.5, length(crop_SUM_globalc_corn_2050$MillTonLoss)+0.5), track.height = 0.8, 
             bg.border = NA, panel.fun = function(x, y) {
               xlim = CELL_META$xlim
               circos.segments(rep(xlim[1], 15), 1:15,
                               rep(xlim[2], 15), 1:15,
                               col = "#CCCCCC")
               circos.rect(rep(0, 15), 1:15 - 0.5, crop_SUM_globalc_corn_2050$MillTonLoss, 1:15 + 0.5,
                           col = color_corn, border = "white")
               circos.text(rep(xlim[1], 15), 1:15, 
                           crop_SUM_globalc_corn_2050$Sectors, 
                           facing = "downward", adj = c(1.05, 0.5), cex = 0.8)
               breaks = seq(0, 200, by = 20)
               circos.axis(h = "top", major.at = breaks,
                           labels.cex = 0.8)
             })


circos.clear
##wheat
crop_SUM_globalc_wheat_2050 <- crop_SUM_globalc[which(crop_SUM_globalc$variable=="wheat" & crop_SUM_globalc$Year=="2100"),]
max(crop_SUM_globalc_wheat_2050$MillTonLoss)
crop_SUM_globalc_wheat_2050$Sectors <- paste0(crop_SUM_globalc_wheat_2050$SSP, "_", crop_SUM_globalc_wheat_2050$RCP)
color_wheat = c("#f3ff18", "#edf91a", "#e7f21c", "#e2ec1e", "#dce621", "#d6e023", "#d0d925", "#cbd327", "#c5cd29", "#bfc62b", "#b9c02d", "#b3ba30", "#aeb432", "#a8ad34", "#a2a736")

color_wheat = c("#fff9ee", "#fff8e3", "#fff7d7", "#fff6cb", "#fff5bf", "#fef4b2", "#fef2a5", "#fef198", "#fef089", "#feef7a", "#feed6b", "#feec5b", "#fdea4a", "#fde938", "#fde725")

circos.par("start.degree" = 90, cell.padding = c(0, 0, 0, 0))

circos.initialize("a", xlim=c(0,30)) 
circos.track(ylim = c(0.5, length(crop_SUM_globalc_wheat_2050$MillTonLoss)+0.5), track.height = 0.8, 
             bg.border = NA, panel.fun = function(x, y) {
               xlim = CELL_META$xlim
               circos.segments(rep(xlim[1], 15), 1:15,
                               rep(xlim[2], 15), 1:15,
                               col = "#CCCCCC")
               circos.rect(rep(0, 15), 1:15 - 0.5, crop_SUM_globalc_wheat_2050$MillTonLoss, 1:15 + 0.5,
                           col = color_wheat, border = "white")
               circos.text(rep(xlim[1], 15), 1:15, 
                           crop_SUM_globalc_wheat_2050$Sectors, 
                           facing = "downward", adj = c(1.05, 0.5), cex = 0.8)
               breaks = seq(0, 30, by = 5)
               circos.axis(h = "top", major.at = breaks,
                           labels.cex = 0.8)
             })



circos.clear
##Rice
crop_SUM_globalc_rice_2050 <- crop_SUM_globalc[which(crop_SUM_globalc$variable=="Rice" & crop_SUM_globalc$Year=="2050"),]
max(crop_SUM_globalc_rice_2050$MillTonLoss)
crop_SUM_globalc_rice_2050$Sectors <- paste0(crop_SUM_globalc_rice_2050$SSP, "_", crop_SUM_globalc_rice_2050$RCP)
color_rice= c("#c5f1ff", "#bbe6f7", "#b1daee", "#a7cfe6", "#9ec4de", "#94b8d6", "#8aadcd", "#80a2c5", "#7696bd", "#6c8bb4", "#627fac", "#5974a4", "#4f699c", "#455d93", "#3b528b")

circos.par("start.degree" = 90, cell.padding = c(0, 0, 0, 0))

circos.initialize("a", xlim=c(0,45)) 
circos.track(ylim = c(0.5, length(crop_SUM_globalc_rice_2050$MillTonLoss)+0.5), track.height = 0.8, 
             bg.border = NA, panel.fun = function(x, y) {
               xlim = CELL_META$xlim
               circos.segments(rep(xlim[1], 15), 1:15,
                               rep(xlim[2], 15), 1:15,
                               col = "#CCCCCC")
               circos.rect(rep(0, 15), 1:15 - 0.5, crop_SUM_globalc_rice_2050$MillTonLoss, 1:15 + 0.5,
                           col = color_rice, border = "white")
               circos.text(rep(xlim[1], 15), 1:15, 
                           crop_SUM_globalc_rice_2050$Sectors, 
                           facing = "downward", adj = c(1.05, 0.5), cex = 0.8)
               breaks = seq(0, 45, by = 5)
               circos.axis(h = "top", major.at = breaks,
                           labels.cex = 0.8)
             })


circos.clear
##Soybean
crop_SUM_globalc_soybean_2050 <- crop_SUM_globalc[which(crop_SUM_globalc$variable=="Soybean" & crop_SUM_globalc$Year=="2050"),]
max(crop_SUM_globalc_soybean_2050$MillTonLoss)
crop_SUM_globalc_soybean_2050$Sectors <- paste0(crop_SUM_globalc_soybean_2050$SSP, "_", crop_SUM_globalc_soybean_2050$RCP)
color_soybean= c("#baffea", "#aff7e3", "#a4efdd", "#99e7d6", "#8ee0cf", "#83d8c8", "#78d0c2", "#6ec8bb", "#63c0b4", "#58b8ae", "#4db0a7", "#42a9a0", "#37a199", "#2c9993", "#21918c")
  
circos.par("start.degree" = 90, cell.padding = c(0, 0, 0, 0))

circos.initialize("a", xlim=c(0,15)) 
circos.track(ylim = c(0.5, length(crop_SUM_globalc_soybean_2050$MillTonLoss)+0.5), track.height = 0.8, 
             bg.border = NA, panel.fun = function(x, y) {
               xlim = CELL_META$xlim
               circos.segments(rep(xlim[1], 15), 1:15,
                               rep(xlim[2], 15), 1:15,
                               col = "#CCCCCC")
               circos.rect(rep(0, 15), 1:15 - 0.5, crop_SUM_globalc_soybean_2050$MillTonLoss, 1:15 + 0.5,
                           col = color_soybean, border = "white")
               circos.text(rep(xlim[1], 15), 1:15, 
                           crop_SUM_globalc_soybean_2050$Sectors, 
                           facing = "downward", adj = c(1.05, 0.5), cex = 0.8)
               breaks = seq(0, 15, by = 2)
               circos.axis(h = "top", major.at = breaks,
                           labels.cex = 0.8)
             })
