
npp_avg <- read.csv(file="[Your file path]/npp_average_final.csv", header=TRUE)

npp_hi <- read.csv(file="[Your file path]/npp_high_final.csv", header=TRUE)

npp_lo <- read.csv(file="[Your file path]/npp_low_final.csv", header=TRUE)

## Npp units in 
# KgC/m2/yr * 10000


#colnames(mdat2)
#[1] "X"          "Anal"       "Source"     "SSP"        "RCP"        "GCM"        "Year"       "region_id"  "basin_id"   "PFT0"      
#[11] "PFT1"       "PFT2"       "PFT3"       "PFT4"       "PFT5"       "PFT6"       "PFT7"       "PFT8"       "PFT9"       "PFT10"     
#[21] "PFT11"      "PFT12"      "PFT13"      "PFT14"      "PFT15"      "PFT16"      "PFT17"      "PFT18"      "PFT19"      "PFT20"     
#[31] "PFT21"      "PFT22"      "PFT23"      "PFT24"      "PFT25"      "PFT26"      "PFT27"      "PFT28"      "PFT29"      "PFT30"     
#[41] "PFT31"      "PFT32"      "urban_land" "urb_delta"  "Forest"     "Grass"      "Agr"        "For_bor"    "For_trop"   "Corn"      
#[51] "Wheat"      "Soybean"    "Cotton"     "Rice"       "Sugar"      "Other"      "Bioenergy"  "Rainfed"    "Irrigated"  "Year2"     
#[61] "For_temp"

mdat2$reg_bas <- paste0(mdat2$region_id,"_",mdat2$basin_id)

# colnames(npp_avg)
#[1] "region_id" "basin_id"  "reg_bas"   "PFT1"      "PFT10"     "PFT11"     "PFT12"     "PFT13"     "PFT14"     "PFT15"     "PFT16"    
#[12] "PFT17"     "PFT18"     "PFT19"     "PFT2"      "PFT20"     "PFT21"     "PFT22"     "PFT23"     "PFT24"     "PFT25"     "PFT26"    
#[23] "PFT27"     "PFT28"     "PFT29"     "PFT3"      "PFT30"     "PFT32"     "PFT4"      "PFT5"      "PFT6"      "PFT7"      "PFT8"     
#[34] "PFT9"  


mdat_npp <- merge(mdat2, npp_avg, by="reg_bas", all.x=TRUE)
mdat_npp$Source[is.na(mdat_npp$Source)] <- "Non-harmonized"

## PFTs (from mdat2) represent changes in land in km^2
## Positive values indicate land lost to urbanization, whereas negative indicate overestimation of urban extent -
##  Therefore all values are multiplied by -1
## npp data need to be rescaled to kgC/m^2/year by multiplying by 0.0001
## npp data then need to be convered from a per m2 to a per km^2 basis (kgC/km^2/year) by multiplying by 1000000
## 

mdat_npp$nPFT1 <- mdat_npp$PFT1.x*mdat_npp$PFT1.y*1000000*-1*0.0001
mdat_npp$nPFT2 <- mdat_npp$PFT2.x*mdat_npp$PFT2.y*1000000*-1*0.0001
mdat_npp$nPFT3 <- mdat_npp$PFT3.x*mdat_npp$PFT3.y*1000000*-1*0.0001
mdat_npp$nPFT4 <- mdat_npp$PFT4.x*mdat_npp$PFT4.y*1000000*-1*0.0001
mdat_npp$nPFT5 <- mdat_npp$PFT5.x*mdat_npp$PFT5.y*1000000*-1*0.0001
mdat_npp$nPFT6 <- mdat_npp$PFT6.x*mdat_npp$PFT6.y*1000000*-1*0.0001
mdat_npp$nPFT7 <- mdat_npp$PFT7.x*mdat_npp$PFT7.y*1000000*-1*0.0001
mdat_npp$nPFT8 <- mdat_npp$PFT8.x*mdat_npp$PFT8.y*1000000*-1*0.0001
mdat_npp$nPFT9 <- mdat_npp$PFT9.x*mdat_npp$PFT9.y*1000000*-1*0.0001
mdat_npp$nPFT10 <- mdat_npp$PFT10.x*mdat_npp$PFT10.y*1000000*-1*0.0001
mdat_npp$nPFT11 <- mdat_npp$PFT11.x*mdat_npp$PFT11.y*1000000*-1*0.0001
mdat_npp$nPFT12 <- mdat_npp$PFT12.x*mdat_npp$PFT12.y*1000000*-1*0.0001
mdat_npp$nPFT13 <- mdat_npp$PFT13.x*mdat_npp$PFT13.y*1000000*-1*0.0001
mdat_npp$nPFT14 <- mdat_npp$PFT14.x*mdat_npp$PFT14.y*1000000*-1*0.0001
mdat_npp$nPFT15 <- mdat_npp$PFT15.x*mdat_npp$PFT15.y*1000000*-1*0.0001
mdat_npp$nPFT16 <- mdat_npp$PFT16.x*mdat_npp$PFT16.y*1000000*-1*0.0001
mdat_npp$nPFT17 <- mdat_npp$PFT17.x*mdat_npp$PFT17.y*1000000*-1*0.0001
mdat_npp$nPFT18 <- mdat_npp$PFT18.x*mdat_npp$PFT18.y*1000000*-1*0.0001
mdat_npp$nPFT19 <- mdat_npp$PFT19.x*mdat_npp$PFT19.y*1000000*-1*0.0001
mdat_npp$nPFT20 <- mdat_npp$PFT20.x*mdat_npp$PFT20.y*1000000*-1*0.0001
mdat_npp$nPFT21 <- mdat_npp$PFT21.x*mdat_npp$PFT21.y*1000000*-1*0.0001
mdat_npp$nPFT22 <- mdat_npp$PFT22.x*mdat_npp$PFT22.y*1000000*-1*0.0001
mdat_npp$nPFT23 <- mdat_npp$PFT23.x*mdat_npp$PFT23.y*1000000*-1*0.0001
mdat_npp$nPFT24 <- mdat_npp$PFT24.x*mdat_npp$PFT24.y*1000000*-1*0.0001
mdat_npp$nPFT25 <- mdat_npp$PFT25.x*mdat_npp$PFT25.y*1000000*-1*0.0001
mdat_npp$nPFT26 <- mdat_npp$PFT26.x*mdat_npp$PFT26.y*1000000*-1*0.0001
mdat_npp$nPFT27 <- mdat_npp$PFT27.x*mdat_npp$PFT27.y*1000000*-1*0.0001
mdat_npp$nPFT28 <- mdat_npp$PFT28.x*mdat_npp$PFT28.y*1000000*-1*0.0001
mdat_npp$nPFT29 <- mdat_npp$PFT29.x*mdat_npp$PFT29.y*1000000*-1*0.0001
mdat_npp$nPFT30 <- mdat_npp$PFT30.x*mdat_npp$PFT30.y*1000000*-1*0.0001
mdat_npp$nPFT32 <- mdat_npp$PFT32.x*mdat_npp$PFT32.y*1000000*-1*0.0001

mdat_npp$nFor_bor <- mdat_npp$nPFT2 + mdat_npp$nPFT3 + mdat_npp$nPFT8 + mdat_npp$nPFT11
mdat_npp$nFor_trop <- mdat_npp$nPFT4 + mdat_npp$nPFT6
mdat_npp$nFor_temp <- mdat_npp$nPFT1 + mdat_npp$nPFT5 + mdat_npp$nPFT7 + mdat_npp$nPFT9 + mdat_npp$nPFT10
mdat_npp$nForest <- mdat_npp$nFor_bor + mdat_npp$nFor_trop + mdat_npp$nFor_temp
mdat_npp$nGrass <- mdat_npp$nPFT13 + mdat_npp$nPFT14
mdat_npp$nCorn <- mdat_npp$nPFT15 + mdat_npp$nPFT16
mdat_npp$nWheat <- mdat_npp$nPFT17 + mdat_npp$nPFT18
mdat_npp$nSoybean <- mdat_npp$nPFT19 + mdat_npp$nPFT20
mdat_npp$nCotton <- mdat_npp$nPFT21 + mdat_npp$nPFT22
mdat_npp$nRice <- mdat_npp$nPFT23 + mdat_npp$nPFT24
mdat_npp$nSugar <- mdat_npp$nPFT25 + mdat_npp$nPFT26
mdat_npp$nOther <- mdat_npp$nPFT27 + mdat_npp$nPFT28
mdat_npp$nBioenergy <- mdat_npp$nPFT29 + mdat_npp$nPFT30
mdat_npp$nRainfed <- mdat_npp$nPFT15 + mdat_npp$nPFT17 + mdat_npp$nPFT19 + mdat_npp$nPFT21 + mdat_npp$nPFT23 + mdat_npp$nPFT25 +
                     mdat_npp$nPFT27 + mdat_npp$nPFT29
mdat_npp$nIrrigated <- mdat_npp$nPFT16 + mdat_npp$nPFT18 + mdat_npp$nPFT20 + mdat_npp$nPFT22 + mdat_npp$nPFT24 + mdat_npp$nPFT26 +
                      mdat_npp$nPFT28 + mdat_npp$nPFT30
mdat_npp$nAgr <- mdat_npp$nCorn + mdat_npp$nWheat + mdat_npp$nSoybean + mdat_npp$nCotton + mdat_npp$nRice + mdat_npp$nSugar + mdat_npp$nOther +
                mdat_npp$nBioenergy


npp_avg_sum1 <- summaryBy(nPFT1 + nPFT2 + nPFT3 + nPFT4 + nPFT5 + nPFT6 + nPFT7 + nPFT8 + nPFT9 + nPFT10 + nPFT11 + nPFT12 + nPFT13 
                         + nPFT14 + nPFT15 + nPFT16 + nPFT17 + nPFT18 + nPFT19 + nPFT20 + nPFT21 + nPFT22 + nPFT23 + nPFT24 + nPFT25
                         + nPFT26 + nPFT27 + nPFT28 + nPFT29 + nPFT30 + nPFT32 ~ Source + SSP + RCP + GCM + Year2, data=mdat_npp, FUN=c(sum), na.rm=TRUE)
   
write.csv(npp_avg_sum1, file="[Your file Path]/NPP_GlobalSum_PFT.csv")                        
  


npp_avg_sum2 <- summaryBy(nForest + nFor_temp + nFor_bor + nFor_trop + nGrass + nAgr + nCorn + nWheat + nSoybean + nCotton + 
                            nRice + nSugar + nOther + nBioenergy + nRainfed + nIrrigated ~ Source + SSP + RCP + GCM + Year2, data=mdat_npp, FUN=c(sum), na.rm=TRUE)

write.csv(npp_avg_sum2, file="[Your file Path]/NPP_GlobalSum_PFTgroups.csv")                        





npp_avg_sum1 <- summaryBy(nPFT1 + nPFT2 + nPFT3 + nPFT4 + nPFT5 + nPFT6 + nPFT7 + nPFT8 + nPFT9 + nPFT10 + nPFT11 + nPFT12 + nPFT13 
                          + nPFT14 + nPFT15 + nPFT16 + nPFT17 + nPFT18 + nPFT19 + nPFT20 + nPFT21 + nPFT22 + nPFT23 + nPFT24 + nPFT25
                          + nPFT26 + nPFT27 + nPFT28 + nPFT29 + nPFT30 + nPFT32 ~ Source + region_id.x + SSP + RCP + GCM + Year2, data=mdat_npp, FUN=c(sum), na.rm=TRUE)

write.csv(npp_avg_sum1, file="[Your file Path]/PP_RegionSum_PFT.csv")                        



npp_avg_sum2 <- summaryBy(nForest +  nFor_temp + nFor_bor + nFor_trop + nGrass + nAgr + nCorn + nWheat + nSoybean + nCotton + 
                            nRice + nSugar + nOther + nBioenergy + nRainfed + nIrrigated ~ Source + region_id.x +SSP + RCP + GCM + Year2, data=mdat_npp, FUN=c(sum), na.rm=TRUE)

write.csv(npp_avg_sum2, file="[Your file Path]/NPP_RegionSum_PFTgroups.csv")                        

                       #  "Forest"     "Grass"      "Agr"        "For_bor"    "For_trop"   "Corn"      
                         #[51] "Wheat"      "Soybean"    "Cotton"     "Rice"       "Sugar"      "Other"      "Bioenergy"  "Rainfed"    "Irrigated"  "Year2"     
                         #[61] "For_temp"
                         

library(ggplot2)

ggplot(data=npp_avg_sum2, aes(x=Year2, y=nAgr.sum, ymin=urb_delta.sum.min, ymax=urb_delta.sum.max, fill=ssp, linetype=ssp, color=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Urban Land Delta")



### NPP plots

## 
npp_global_sum_stacked <- read.csv(file="[Your File path]/NPP_GlobalSum_PFTgroups_stacked.csv", header=TRUE)
npp_global_sum_stacked <- melt(npp_global_sum_stacked, id=c("Source","SSP", "RCP", "GCM","Year2"))

library(stringr)
# Split name column into firstname and last name
npp_global_sum_stacked[c('LandType', 'Category')] <- str_split_fixed(npp_global_sum_stacked$variable, '_', 2)

## Convert kgC/yr into Gigatonne (GT/yr)
npp_global_sum_stacked$GTC_loss_per_year <- (npp_global_sum_stacked$value/1000000000000*-1)

npp_global_sum_stacked_sum <- summaryBy(GTC_loss_per_year ~ SSP + RCP + Year2 + LandType + Category, data=npp_global_sum_stacked, FUN=c(mean), na.rm=TRUE)
npp_global_sum_stacked_sum$SSP_RCP <- paste0(npp_global_sum_stacked_sum$SSP, "_", npp_global_sum_stacked_sum$RCP)


npp_global_sum_stacked_sum[npp_global_sum_stacked_sum=="Low"] <- "low"
npp_global_sum_stacked_sum$GTC_loss_per_year.mean[npp_global_sum_stacked_sum$GTC_loss_per_year.mean < 0] <- 0

npp_global_sum_stacked_sum$Category <- ordered(npp_global_sum_stacked_sum$Category, levels = c("low", "med", "high"))


npp_global_sum_stacked_sum$Land_Cat <- paste0(npp_global_sum_stacked_sum$LandType,"_",npp_global_sum_stacked_sum$Category)

## Forest

npp_global_sum_stacked_Forest_2100 <- npp_global_sum_stacked_sum[which(npp_global_sum_stacked_sum$LandType=="Forest" & npp_global_sum_stacked_sum$Year2==2100),]

npp_global_sum_stacked_Forest_2100$Category <- ordered(npp_global_sum_stacked_Forest_2100$Category, levels = c("low", "med", "high"))
with(score, score[order(sex, y, x),])

ggplot(npp_global_sum_stacked_Forest_2100, aes(fill=Category, y=GTC_loss_per_year.mean, x=SSP_RCP)) + 
  geom_bar(position=position_stack(reverse = TRUE), stat="identity") + xlab("SSP_RCP") + ylab("NPP Loss (GT yr-1)") +
  scale_fill_manual(values=c("#98d871", "#4d983d", "#025809")) +
 ylim(-0.25, 1.25) +
  theme(axis.title.x = element_text(size=14),
    axis.title.y = element_text(size=14), axis.text = element_text(size = 12), 
    panel.border = element_blank(),panel.background = element_blank(), axis.line = element_blank(),
    panel.grid.major = element_line(colour = "grey"), panel.grid.minor = element_line(colour = "grey")) +
coord_polar(theta = "x", start = 0, direction = 1) 


## All land classes
## Year 2100
npp_global_sum_stacked_2100 <- npp_global_sum_stacked_sum[which(npp_global_sum_stacked_sum$Year2==2100),]

ggplot(npp_global_sum_stacked_2100, aes(fill=Category, y=GTC_loss_per_year.mean, x=SSP_RCP)) + 
  geom_bar(position=position_stack(reverse = TRUE), stat="identity") + xlab("SSP_RCP") + ylab("NPP Loss (GT yr-1)") +
  scale_fill_manual(values=c("#98d871", "#4d983d", "#025809")) +
  facet_wrap(vars(LandType))+  ylim(-0.25, 2.5) +
  theme(axis.title.x = element_text(size=14),
        axis.title.y = element_text(size=14), axis.text = element_text(size = 8)) +
  coord_polar(theta = "x", start = 0, direction = 1) 


ggplot(npp_global_sum_stacked_2100, aes(fill=Category, y=GTC_loss_per_year.mean, x=SSP_RCP)) + 
  geom_bar(position=position_stack(reverse = TRUE), stat="identity") + xlab("SSP_RCP") + ylab("NPP Loss (GT yr-1)") +
  scale_fill_manual(values=c("#98d871", "#4d983d", "#025809")) +
  facet_wrap(vars(LandType))+  ylim(-0.25, 2.5) +
  theme(axis.title.x = element_text(size=14),
        axis.title.y = element_text(size=14), axis.text = element_blank()) +
  coord_polar(theta = "x", start = 0, direction = 1) 


write.csv(npp_global_sum_stacked_sum, file="[your file path]//NPP_Global_SSP_RCP_LOHIMED.csv")


npp_global_sum_stacked_sum$Land_Cat <- ordered(npp_global_sum_stacked_sum$Land_Cat, 
                                               levels = c("Agriculture_low", "Forest_low", "Grassland_low","Total_low",
                                                      "Agriculture_med", "Forest_med","Grassland_med","Total_med",
                                                      "Agriculture_high", "Forest_high","Grassland_high", "Total_high"))

npp_color_grad <- c("#d5f9a3", "#c6e69f", "#b6d39b", "#89e41b", "#7bcc18", "#6cb415", "#468413", "#396b10", "#2b510c")



##SSP5 RCP60
npp_global_sum_stacked_ssp5_rcp_60 <- npp_global_sum_stacked_sum[which(npp_global_sum_stacked_sum=="ssp5" & npp_global_sum_stacked_sum$RCP=="rcp60" & npp_global_sum_stacked_sum$LandType!="Total"),]


ggplot(npp_global_sum_stacked_ssp5_rcp_60, aes(x=Year2, y=GTC_loss_per_year.mean, fill=Land_Cat)) + 
  geom_area(alpha=0.75 , size=0.75, colour="white", position=position_stack(reverse = TRUE)) +
  scale_fill_manual(values=npp_color_grad) + ylab("NPP Loss (GT yr-1)") +xlab("Year") + ylim(0,2.35)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))
  




##SSP4 RCP60
npp_global_sum_stacked_ssp4_rcp_60 <- npp_global_sum_stacked_sum[which(npp_global_sum_stacked_sum=="ssp4" & npp_global_sum_stacked_sum$RCP=="rcp60" & npp_global_sum_stacked_sum$LandType!="Total"),]


ggplot(npp_global_sum_stacked_ssp4_rcp_60, aes(x=Year2, y=GTC_loss_per_year.mean, fill=Land_Cat)) + 
  geom_area(alpha=0.75 , size=0.75, colour="white", position=position_stack(reverse = TRUE)) +
  scale_fill_manual(values=npp_color_grad) + ylab("NPP Loss (GT yr-1)") +xlab("Year")+ ylim(0,2.35)+
theme(axis.text=element_text(size=16), axis.title=element_text(size=18, face="bold"))




##SSP3 RCP60
npp_global_sum_stacked_ssp3_rcp_60 <- npp_global_sum_stacked_sum[which(npp_global_sum_stacked_sum=="ssp3" & npp_global_sum_stacked_sum$RCP=="rcp60" & npp_global_sum_stacked_sum$LandType!="Total"),]


ggplot(npp_global_sum_stacked_ssp3_rcp_60, aes(x=Year2, y=GTC_loss_per_year.mean, fill=Land_Cat)) + 
  geom_area(alpha=0.75 , size=0.75, colour="white", position=position_stack(reverse = TRUE)) +
  scale_fill_manual(values=npp_color_grad) + ylab("NPP Loss (GT yr-1)") +xlab("Year")+ ylim(0,2.35)+
  theme(axis.text=element_text(size=16), axis.title=element_text(size=18, face="bold"))




##SSP2 RCP60
npp_global_sum_stacked_ssp2_rcp_60 <- npp_global_sum_stacked_sum[which(npp_global_sum_stacked_sum=="ssp2" & npp_global_sum_stacked_sum$RCP=="rcp60" & npp_global_sum_stacked_sum$LandType!="Total"),]


ggplot(npp_global_sum_stacked_ssp2_rcp_60, aes(x=Year2, y=GTC_loss_per_year.mean, fill=Land_Cat)) + 
  geom_area(alpha=0.75 , size=0.75, colour="white", position=position_stack(reverse = TRUE)) +
  scale_fill_manual(values=npp_color_grad) + ylab("NPP Loss (GT yr-1)") +xlab("Year")+ ylim(0,2.35)+
  theme(axis.text=element_text(size=16), axis.title=element_text(size=18, face="bold"))



##SSP1 RCP60
npp_global_sum_stacked_ssp1_rcp_60 <- npp_global_sum_stacked_sum[which(npp_global_sum_stacked_sum=="ssp1" & npp_global_sum_stacked_sum$RCP=="rcp60" & npp_global_sum_stacked_sum$LandType!="Total"),]


ggplot(npp_global_sum_stacked_ssp1_rcp_60, aes(x=Year2, y=GTC_loss_per_year.mean, fill=Land_Cat)) + 
  geom_area(alpha=0.75 , size=0.75, colour="white", position=position_stack(reverse = TRUE)) +
  scale_fill_manual(values=npp_color_grad) + ylab("NPP Loss (GT yr-1)") +xlab("Year")+ ylim(0,2.35)+
  theme(axis.text=element_text(size=16), axis.title=element_text(size=18, face="bold"))

