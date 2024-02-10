library(ggplot2)
library(doBy)
library(lme4)
library(dplyr)

## read data from combined output files
mdat <- read.csv(file="[YOUR FILE PATH]/combined/all_scenarios_final.csv", header=TRUE)
mdat$Source[is.na(mdat$Source)] <- "Non-harmonized"
mdat2 <- mdat

US_mdat2 <- mdat2[which(mdat2$region_id==1),]


#columns
#[1] "Anal"       "Source"     "SSP"        "RCP"        "GCM"        "Year"       "region_id"  "basin_id"   "PFT0"       "PFT1"      
#[11] "PFT2"       "PFT3"       "PFT4"       "PFT5"       "PFT6"       "PFT7"       "PFT8"       "PFT9"       "PFT10"      "PFT11"     
#[21] "PFT12"      "PFT13"      "PFT14"      "PFT15"      "PFT16"      "PFT17"      "PFT18"      "PFT19"      "PFT20"      "PFT21"     
#[31] "PFT22"      "PFT23"      "PFT24"      "PFT25"      "PFT26"      "PFT27"      "PFT28"      "PFT29"      "PFT30"      "PFT31"     
#[41] "PFT32"      "urban_land" "urb_delta"  "Forest"     "Grass"      "Agr"        "For_bor"    "For_trop"   "Corn"       "Wheat"     
#[51] "Soybean"    "Cotton"     "Rice"       "Sugar"      "Other"      "Bioenergy"  "Rainfed"    "Irrigated"  "Year2"     

##################
####
## Effect Models

## Forest, Agr, For_bor, For_trop, Corn, Wheat, Soybean, Cotton, Rice, Sugar, Other, Bioenergy, Rainfed, Irrigated


##
## Global model

#Forest
Forest_global <- mdat2[which(mdat2$Forest!="NA"),]
Forest_global$region_id <- as.factor(Forest_global$region_id)

Forest_modelglobal <- lm(Forest ~ region_id + Source + SSP + RCP + GCM + Year2, data=Forest_global)
summary(Forest_modelglobal)
Forest_anovaglobal <- anova(Forest_modelglobal)
afss <- Forest_anovaglobal$"Sum Sq"
print(cbind(Forest_anovaglobal,PctExp=afss/sum(afss)*100))

# Agr

Agr_global <- mdat2[which(mdat2$Agr!="NA"),]
Agr_global$region_id <- as.factor(Agr_global$region_id)

Agr_modelglobal <- lm(Agr ~ region_id + Source + SSP + RCP + GCM + Year2, data=Agr_global)
summary(Agr_modelglobal)
Agr_anovaglobal <- anova(Agr_modelglobal)
afss <- Agr_anovaglobal$"Sum Sq"
print(cbind(Agr_anovaglobal,PctExp=afss/sum(afss)*100))


#Forest_bor
Forbor_global <- mdat2[which(mdat2$For_bor!="NA"),]
Forbor_global$region_id <- as.factor(Forbor_global$region_id)

Forbor_modelglobal <- lm(For_bor ~ region_id + Source + SSP + RCP + GCM + Year2, data=Forbor_global)
summary(Forbor_modelglobal)
Forbor_anovaglobal <- anova(Forbor_modelglobal)
afss <- Forbor_anovaglobal$"Sum Sq"
print(cbind(Forbor_anovaglobal,PctExp=afss/sum(afss)*100))


#Forest_trop
Fortrop_global <- mdat2[which(mdat2$For_trop!="NA"),]
Fortrop_global$region_id <- as.factor(Fortrop_global$region_id)

Fortrop_modelglobal <- lm(For_trop ~ region_id + Source + SSP + RCP + GCM + Year2, data=Fortrop_global)
summary(Fortrop_modelglobal)
Fortrop_anovaglobal <- anova(Fortrop_modelglobal)
afss <- Fortrop_anovaglobal$"Sum Sq"
print(cbind(Fortrop_anovaglobal,PctExp=afss/sum(afss)*100))



#Forest_temp
Fortemp_global <- mdat2[which(mdat2$For_temp!="NA"),]
Fortemp_global$region_id <- as.factor(Fortemp_global$region_id)

Fortemp_modelglobal <- lm(For_temp ~ region_id + Source + SSP + RCP + GCM + Year2, data=Fortemp_global)
summary(Fortemp_modelglobal)
Fortemp_anovaglobal <- anova(Fortemp_modelglobal)
afss <- Fortemp_anovaglobal$"Sum Sq"
print(cbind(Fortemp_anovaglobal,PctExp=afss/sum(afss)*100))


#Grass
Grass_global <- mdat2[which(mdat2$Grass!="NA"),]
Grass_global$region_id <- as.factor(Grass_global$region_id)

Grass_modelglobal <- lm(Grass ~ region_id + Source + SSP + RCP + GCM + Year2, data=Grass_global)
summary(Grass_modelglobal)
Grass_anovaglobal <- anova(Grass_modelglobal)
afss <- Grass_anovaglobal$"Sum Sq"
print(cbind(Grass_anovaglobal,PctExp=afss/sum(afss)*100))



#Corn
Corn_global <- mdat2[which(mdat2$Corn!="NA"),]
Corn_global$region_id <- as.factor(Corn_global$region_id)

Corn_modelglobal <- lm(Corn ~ region_id + Source + SSP + RCP + GCM + Year2, data=Corn_global)
summary(Corn_modelglobal)
Corn_anovaglobal <- anova(Corn_modelglobal)
afss <- Corn_anovaglobal$"Sum Sq"
print(cbind(Corn_anovaglobal,PctExp=afss/sum(afss)*100))


#Wheat
Wheat_global <- mdat2[which(mdat2$Wheat!="NA"),]
Wheat_global$region_id <- as.factor(Wheat_global$region_id)

Wheat_modelglobal <- lm(Wheat ~ region_id + Source + SSP + RCP + GCM + Year2, data=Wheat_global)
summary(Wheat_modelglobal)
Wheat_anovaglobal <- anova(Wheat_modelglobal)
afss <- Wheat_anovaglobal$"Sum Sq"
print(cbind(Wheat_anovaglobal,PctExp=afss/sum(afss)*100))


#Soybean
Soybean_global <- mdat2[which(mdat2$Soybean!="NA"),]
Soybean_global$region_id <- as.factor(Soybean_global$region_id)

Soybean_modelglobal <- lm(Soybean ~ region_id + Source + SSP + RCP + GCM + Year2, data=Soybean_global)
summary(Soybean_modelglobal)
Soybean_anovaglobal <- anova(Soybean_modelglobal)
afss <- Soybean_anovaglobal$"Sum Sq"
print(cbind(Soybean_anovaglobal,PctExp=afss/sum(afss)*100))


#Cotton
Cotton_global <- mdat2[which(mdat2$Cotton!="NA"),]
Cotton_global$region_id <- as.factor(Cotton_global$region_id)

Cotton_modelglobal <- lm(Cotton ~ region_id + Source + SSP + RCP + GCM + Year2, data=Cotton_global)
summary(Cotton_modelglobal)
Cotton_anovaglobal <- anova(Cotton_modelglobal)
afss <- Cotton_anovaglobal$"Sum Sq"
print(cbind(Cotton_anovaglobal,PctExp=afss/sum(afss)*100))


#Rice
Rice_global <- mdat2[which(mdat2$Rice!="NA"),]
Rice_global$region_id <- as.factor(Rice_global$region_id)

Rice_modelglobal <- lm(Rice ~ region_id + Source + SSP + RCP + GCM + Year2, data=Rice_global)
summary(Rice_modelglobal)
Rice_anovaglobal <- anova(Rice_modelglobal)
afss <- Rice_anovaglobal$"Sum Sq"
print(cbind(Rice_anovaglobal,PctExp=afss/sum(afss)*100))


#Sugar
Sugar_global <- mdat2[which(mdat2$Sugar!="NA"),]
Sugar_global$region_id <- as.factor(Sugar_global$region_id)

Sugar_modelglobal <- lm(Sugar ~ region_id + Source + SSP + RCP + GCM + Year2, data=Sugar_global)
summary(Sugar_modelglobal)
Sugar_anovaglobal <- anova(Sugar_modelglobal)
afss <- Sugar_anovaglobal$"Sum Sq"
print(cbind(Sugar_anovaglobal,PctExp=afss/sum(afss)*100))


#Other
Other_global <- mdat2[which(mdat2$Other!="NA"),]
Other_global$region_id <- as.factor(Other_global$region_id)

Other_modelglobal <- lm(Other ~ region_id + Source + SSP + RCP + GCM + Year2, data=Other_global)
summary(Other_modelglobal)
Other_anovaglobal <- anova(Other_modelglobal)
afss <- Other_anovaglobal$"Sum Sq"
print(cbind(Other_anovaglobal,PctExp=afss/sum(afss)*100))

#Bioenergy
Bio_global <- mdat2[which(mdat2$Bioenergy!="NA"),]
Bio_global$region_id <- as.factor(Bio_global$region_id)

Bio_modelglobal <- lm(Bioenergy ~ region_id + Source + SSP + RCP + GCM + Year2, data=Bio_global)
summary(Bio_modelglobal)
Bio_anovaglobal <- anova(Bio_modelglobal)
afss <- Bio_anovaglobal$"Sum Sq"
print(cbind(Bio_anovaglobal,PctExp=afss/sum(afss)*100))


#Rainfed
Rainfed_global <- mdat2[which(mdat2$Rainfed!="NA"),]
Rainfed_global$region_id <- as.factor(Rainfed_global$region_id)

Rainfed_modelglobal <- lm(Rainfed ~ region_id + Source + SSP + RCP + GCM + Year2, data=Rainfed_global)
summary(Rainfed_modelglobal)
Rainfed_anovaglobal <- anova(Rainfed_modelglobal)
afss <- Rainfed_anovaglobal$"Sum Sq"
print(cbind(Rainfed_anovaglobal,PctExp=afss/sum(afss)*100))


#Irrigated
Irrigated_global <- mdat2[which(mdat2$Irrigated!="NA"),]
Irrigated_global$region_id <- as.factor(Irrigated_global$region_id)

Irrigated_modelglobal <- lm(Irrigated ~ region_id + Source + SSP + RCP + GCM + Year2, data=Irrigated_global)
summary(Irrigated_modelglobal)
Irrigated_anovaglobal <- anova(Irrigated_modelglobal)
afss <- Irrigated_anovaglobal$"Sum Sq"
print(cbind(Irrigated_anovaglobal,PctExp=afss/sum(afss)*100))


####
##US models
## Forest, Agr, For_bor, For_trop, Corn, Wheat, Soybean, Cotton, Rice, Sugar, Other, Bioenergy, Rainfed, Irrigated

Forest_US <- US_mdat2[which(US_mdat2$Forest!="NA"),]

Forest_modelUS <- lm(Forest ~ Source + SSP + RCP + GCM + Year2, data=Forest_US)
summary(Forest_modelUS)
Forest_anovaUS <- anova(Forest_modelUS)
afss <- Forest_anovaUS$"Sum Sq"
print(cbind(Forest_anovaUS,PctExp=afss/sum(afss)*100))


Grass_US <- US_mdat2[which(US_mdat2$Grass!="NA"),]

Grass_modelUS <- lm(Grass ~ Source + SSP + RCP + GCM + Year2, data=Grass_US)
summary(Grass_modelUS)
Grass_anovaUS <- anova(Grass_modelUS)
afss <- Grass_anovaUS$"Sum Sq"
print(cbind(Grass_anovaUS,PctExp=afss/sum(afss)*100))




Agr_US <- US_mdat2[which(US_mdat2$Agr!="NA"),]
Agr_modelUS <- lm(Agr ~ Source + SSP + RCP + GCM + Year2, data=Agr_US)
summary(Agr_modelUS)
Agr_anovaUS <- anova(Agr_modelUS)
afss <- Agr_anovaUS $"Sum Sq"
print(cbind(Agr_anovaUS ,PctExp=afss/sum(afss)*100))


Forbor_US <- US_mdat2[which(US_mdat2$For_bor!="NA"),]
Forbor_modelUS <- lm(For_bor ~ Source + SSP + RCP + GCM + Year2, data=Forbor_US)
summary(Forbor_modelUS)
Forbor_anovaUS <- anova(Forbor_modelUS)
afss <- Forbor_anovaUS $"Sum Sq"
print(cbind(Forbor_anovaUS ,PctExp=afss/sum(afss)*100))

Fortrop_US <- US_mdat2[which(US_mdat2$For_trop!="NA"),]
Fortrop_modelUS <- lm(For_trop ~ Source + SSP + RCP + GCM + Year2, data=Fortrop_US)
summary(Fortrop_modelUS)
Fortrop_anovaUS <- anova(Fortrop_modelUS)
afss <- Fortrop_anovaUS $"Sum Sq"
print(cbind(Fortrop_anovaUS ,PctExp=afss/sum(afss)*100))

Fortemp_US <- US_mdat2[which(US_mdat2$For_temp!="NA"),]
Fortemp_modelUS <- lm(For_temp ~ Source + SSP + RCP + GCM + Year2, data=Fortemp_US)
summary(Fortemp_modelUS)
Fortemp_anovaUS <- anova(Fortemp_modelUS)
afss <- Fortemp_anovaUS$"Sum Sq"
print(cbind(Fortemp_anovaUS ,PctExp=afss/sum(afss)*100))


Corn_US <- US_mdat2[which(US_mdat2$Corn!="NA"),]
Corn_modelUS <- lm(Corn ~ Source + SSP + RCP + GCM + Year2, data=Corn_US)
summary(Corn_modelUS)
Corn_anovaUS <- anova(Corn_modelUS)
afss <- Corn_anovaUS$"Sum Sq"
print(cbind(Corn_anovaUS ,PctExp=afss/sum(afss)*100))

Wheat_US <- US_mdat2[which(US_mdat2$Wheat!="NA"),]
Wheat_modelUS <- lm(Wheat ~ Source + SSP + RCP + GCM + Year2, data=Wheat_US)
summary(Wheat_modelUS)
Wheat_anovaUS <- anova(Wheat_modelUS)
afss <- Wheat_anovaUS$"Sum Sq"
print(cbind(Wheat_anovaUS ,PctExp=afss/sum(afss)*100))

Soybean_US <- US_mdat2[which(US_mdat2$Soybean!="NA"),]
Soybean_modelUS <- lm(Soybean ~ Source + SSP + RCP + GCM + Year2, data=Soybean_US)
summary(Soybean_modelUS)
Soybean_anovaUS <- anova(Soybean_modelUS)
afss <- Soybean_anovaUS$"Sum Sq"
print(cbind(Soybean_anovaUS ,PctExp=afss/sum(afss)*100))


Cotton_US <- US_mdat2[which(US_mdat2$Cotton!="NA"),]
Cotton_modelUS <- lm(Cotton ~ Source + SSP + RCP + GCM + Year2, data=Cotton_US)
summary(Cotton_modelUS)
Cotton_anovaUS <- anova(Cotton_modelUS)
afss <- Cotton_anovaUS$"Sum Sq"
print(cbind(Cotton_anovaUS ,PctExp=afss/sum(afss)*100))


Rice_US <- US_mdat2[which(US_mdat2$Rice!="NA"),]
Rice_modelUS <- lm(Rice ~ Source + SSP + RCP + GCM + Year2, data=Rice_US)
summary(Rice_modelUS)
Rice_anovaUS <- anova(Rice_modelUS)
afss <- Rice_anovaUS$"Sum Sq"
print(cbind(Rice_anovaUS ,PctExp=afss/sum(afss)*100))


Sugar_US <- US_mdat2[which(US_mdat2$Sugar!="NA"),]
Sugar_modelUS <- lm(Sugar ~ Source + SSP + RCP + GCM + Year2, data=Sugar_US)
summary(Sugar_modelUS)
Sugar_anovaUS <- anova(Sugar_modelUS)
afss <- Sugar_anovaUS$"Sum Sq"
print(cbind(Sugar_anovaUS ,PctExp=afss/sum(afss)*100))

#Other, Bioenergy, Rainfed, Irrigated


Other_US <- US_mdat2[which(US_mdat2$Other!="NA"),]
Other_modelUS <- lm(Other ~ Source + SSP + RCP + GCM + Year2, data=Other_US)
summary(Other_modelUS)
Other_anovaUS <- anova(Other_modelUS)
afss <- Other_anovaUS$"Sum Sq"
print(cbind(Other_anovaUS ,PctExp=afss/sum(afss)*100))


Bioenergy_US <- US_mdat2[which(US_mdat2$Bioenergy!="NA"),]
Bioenergy_modelUS <- lm(Bioenergy ~ Source + SSP + RCP + GCM + Year2, data=Bioenergy_US)
summary(Bioenergy_modelUS)
Bioenergy_anovaUS <- anova(Bioenergy_modelUS)
afss <- Bioenergy_anovaUS$"Sum Sq"
print(cbind(Bioenergy_anovaUS ,PctExp=afss/sum(afss)*100))

Rainfed_US <- US_mdat2[which(US_mdat2$Rainfed!="NA"),]
Rainfed_modelUS <- lm(Rainfed ~ Source + SSP + RCP + GCM + Year2, data=Rainfed_US)
summary(Rainfed_modelUS)
Rainfed_anovaUS <- anova(Rainfed_modelUS)
afss <- Rainfed_anovaUS$"Sum Sq"
print(cbind(Rainfed_anovaUS ,PctExp=afss/sum(afss)*100))

Irrigated_US <- US_mdat2[which(US_mdat2$Irrigated!="NA"),]
Irrigated_modelUS <- lm(Irrigated ~ Source + SSP + RCP + GCM + Year2, data=Irrigated_US)
summary(Irrigated_modelUS)
Irrigated_anovaUS <- anova(Irrigated_modelUS)
afss <- Irrigated_anovaUS$"Sum Sq"
print(cbind(Irrigated_anovaUS ,PctExp=afss/sum(afss)*100))



### Summary file development


mdat2[is.na(mdat2)] <- 0

dat_global_new <- mdat2 %>%
  group_by(SSP, RCP, GCM, Source, Anal, Year2) %>%
  summarize(urban_land=sum(urban_land), urb_delta_area=sum(urb_delta), Forest=sum(Forest), Grass=sum(Grass),
            Agr=sum(Agr), For_temp=sum(For_temp), For_bor=sum(For_bor), For_trop=sum(For_trop), Corn=sum(Corn), Wheat=sum(Wheat),
            Soybean=sum(Soybean), Cotton=sum(Cotton), Rice=sum(Rice), Sugar=sum(Sugar), Other=sum(Other), Bioenergy=sum(Bioenergy), 
            Rainfed=sum(Rainfed), Irrigated=sum(Irrigated))

dat_region_new <- mdat2 %>%
  group_by(region_id, SSP, RCP, GCM, Source, Anal, Year2) %>%
  summarize(urban_land=sum(urban_land), urb_delta_area=sum(urb_delta), Forest=sum(Forest), Grass=sum(Grass),
            Agr=sum(Agr), For_temp=sum(For_temp), For_bor=sum(For_bor), For_trop=sum(For_trop), Corn=sum(Corn), Wheat=sum(Wheat),
            Soybean=sum(Soybean), Cotton=sum(Cotton), Rice=sum(Rice), Sugar=sum(Sugar), Other=sum(Other), Bioenergy=sum(Bioenergy), 
            Rainfed=sum(Rainfed), Irrigated=sum(Irrigated))

#[1] "reg_bas"        "X"              "Anal"           "Source"         "SSP"            "RCP"            "GCM"           
# "Year"           "region_id.x"    "basin_id.x"     "PFT0"           "PFT1"           "PFT2"           "PFT3"          
#[15] "PFT4"           "PFT5"           "PFT6"           "PFT7"           "PFT8"           "PFT9"           "PFT10"         
#[22] "PFT11"          "PFT12"          "PFT13"          "PFT14"          "PFT15"          "PFT16"          "PFT17"         
#[29] "PFT18"          "PFT19"          "PFT20"          "PFT21"          "PFT22"          "PFT23"          "PFT24"         
#[36] "PFT25"          "PFT26"          "PFT27"          "PFT28"          "PFT29"          "PFT30"          "PFT31"         
#[43] "PFT32"          "urban_land"     "urb_delta"      "Forest"         "Grass"          "Agr"            "For_bor"       
#[50] "For_trop"       "Corn"           "Wheat"          "Soybean"        "Cotton"         "Rice"           "Sugar"         
#[57] "Other"          "Bioenergy"      "Rainfed"        "Irrigated"      "Year2"          "region_id.y"    "basin_id.y"    
#[64] "Area_mean"      "Area_sum"       "urb_delta_area"





# global

dat_global_a <- summaryBy(urban_land + urb_delta+Forest+Grass+Agr + For_temp + For_bor + For_trop + Corn + Wheat + Soybean + Cotton + 
                            Rice + Sugar + Other + Bioenergy + Rainfed + Irrigated
                             ~ Source + SSP + RCP + GCM + Year2, data= mdat2, FUN=c(sum), na.rm=TRUE)


dat_global_b <- summaryBy(urban_land.sum + urb_delta.sum+Forest.sum+Grass.sum+Agr.sum + For_bor.sum + For_trop.sum + Corn.sum + Wheat.sum +
                            Soybean.sum + Cotton.sum + Rice.sum + Sugar.sum + Other.sum + Bioenergy.sum + Rainfed.sum + Irrigated.sum
                          ~ SSP + Year2, data=dat_global_a, FUN= function(x) c(mean=mean(x), Quantile=quantile(x, probs=c(0.25,0.75))))


dat_global_c <- summaryBy(urban_land.sum + urb_delta.sum+Forest.sum+Grass.sum+Agr.sum + For_temp.sum + For_bor.sum + For_trop.sum + Corn.sum + Wheat.sum +
                            Soybean.sum + Cotton.sum + Rice.sum + Sugar.sum + Other.sum + Bioenergy.sum + Rainfed.sum + Irrigated.sum
                          ~ SSP + Year2, data=dat_global_a, FUN=c(mean, min, max))


## confidence intervals
dat_global_b$Forest <- dat_global_b$Forest.sum.mean
dat_global_b$ForestQ5 <- dat_global_b$`Forest.sum.Quantile.25%`
dat_global_b$ForestQ95 <- dat_global_b$`Forest.sum.Quantile.75%`
dat_global_b$Grass <- dat_global_b$Grass.sum.mean
dat_global_b$GrassQ5 <- dat_global_b$`Grass.sum.Quantile.25%`
dat_global_b$GrassQ95 <- dat_global_b$`Grass.sum.Quantile.75%`
dat_global_b$Agr <- dat_global_b$Agr.sum.mean
dat_global_b$AgrQ5 <- dat_global_b$`Agr.sum.Quantile.25%`
dat_global_b$AgrQ95 <- dat_global_b$`Agr.sum.Quantile.75%`


dat_global_b$urb_deltaQ5 <- dat_global_b$`urb_delta.sum.Quantile.5%`
dat_global_b$urb_deltaQ95 <- dat_global_b$`urb_delta.sum.Quantile.95%`


#min and max range
dat_global_c$Forest <- dat_global_c$For2.sum.mean
dat_global_c$Forest.min <- dat_global_c$For2.sum.min
dat_global_c$Forest.max <- dat_global_c$For2.sum.max
dat_global_c$Grass <- dat_global_c$Grass2.sum.mean
dat_global_c$Grass.min <- dat_global_c$Grass2.sum.min
dat_global_c$Grass.max <- dat_global_c$Grass2.sum.max
dat_global_c$Agr <- dat_global_c$Agr2.sum.mean
dat_global_c$Agr.min <- dat_global_c$Agr2.sum.min
dat_global_c$Agr.max <- dat_global_c$Agr2.sum.max

dat_global_c$For_temp <- dat_global_c$For_temp2.sum.mean
dat_global_c$For_temp.min <- dat_global_c$For_temp2.sum.min
dat_global_c$For_temp.max <- dat_global_c$For_temp2.sum.sum.max

dat_global_c$For_bor <- dat_global_c$For_bor2.sum.mean
dat_global_c$For_bor.min <- dat_global_c$For_bor2.sum.min
dat_global_c$For_bor.max <- dat_global_c$For_bor2.sum.sum.max

dat_global_c$For_trop <- dat_global_c$For_trop2.sum.mean
dat_global_c$For_trop.min <- dat_global_c$For_trop2.sum.min
dat_global_c$For_trop.max <- dat_global_c$For_trop2.sum.sum.max


dat_global_c$Corn <- dat_global_c$Corn2.sum.mean
dat_global_c$Corn.min <- dat_global_c$Corn2.sum.min
dat_global_c$Corn.max <- dat_global_c$Corn2.sum.sum.max

dat_global_c$Wheat <- dat_global_c$Wheat2.sum.mean
dat_global_c$Wheat.min <- dat_global_c$Wheat2.sum.min
dat_global_c$Wheat.max <- dat_global_c$Wheat2.sum.sum.max

dat_global_c$Soybean <- dat_global_c$Soybean2.sum.mean
dat_global_c$Soybean.min <- dat_global_c$Soybean2.sum.min
dat_global_c$Soybean.max <- dat_global_c$Soybean2.sum.sum.max

dat_global_c$Cotton <- dat_global_c$Cotton2.sum.mean
dat_global_c$Cotton.min <- dat_global_c$Cotton2.sum.min
dat_global_c$Cotton.max <- dat_global_c$Cotton2.sum.sum.max

dat_global_c$Rice <- dat_global_c$Rice2.sum.mean
dat_global_c$Rice.min <- dat_global_c$Rice2.sum.min
dat_global_c$Rice.max <- dat_global_c$Rice2.sum.sum.max

dat_global_c$Sugar <- dat_global_c$Sugar2.sum.mean
dat_global_c$Sugar.min <- dat_global_c$Sugar2.sum.min
dat_global_c$Sugar.max <- dat_global_c$Sugar2.sum.sum.max

dat_global_c$Other <- dat_global_c$Other2.sum.mean
dat_global_c$Other.min <- dat_global_c$Other2.sum.min
dat_global_c$Other.max <- dat_global_c$Other2.sum.sum.max

dat_global_c$Bioenergy <- dat_global_c$Bioenergy2.sum.mean
dat_global_c$Bioenergy.min <- dat_global_c$Bioenergy2.sum.min
dat_global_c$Bioenergy.max <- dat_global_c$Bioenergy2.sum.sum.max

dat_global_c$Rainfed <- dat_global_c$Rainfed2.sum.mean
dat_global_c$Rainfed.min <- dat_global_c$Rainfed2.sum.min
dat_global_c$Rainfed.max <- dat_global_c$Rainfed2.sum.sum.max

dat_global_c$Irrigated <- dat_global_c$Irrigated2.sum.mean
dat_global_c$Irrigated.min <- dat_global_c$Irrigated2.sum.min
dat_global_c$Irrigated.max <- dat_global_c$Irrigated2.sum.sum.max


dat_global_c$urb_min <- dat_global_c$urb_delta.sum.min
dat_global_c$urb_max <- dat_global_c$urb_delta.sum.max






## US
dat_US <- dat[which(dat$region_id==1),]

dat_US_a <- summaryBy(urban_land + urb_delta+For2+Grass2+Agr2+ For_temp2 + For_bor2 + For_trop2 + Corn2 + Wheat2 + Soybean2 + Cotton2 + Rice2 + Sugar2 + Other2 + Bioenergy2 + Rainfed2 + Irrigated2
                          ~ ssp + rcp + gcm + year, data=dat_US, FUN=c(sum))


dat_US_b <- summaryBy(urban_land.sum + urb_delta.sum+For2.sum+Grass2.sum+Agr2.sum 
                          ~ ssp + gcm + year, data=dat_US_a, FUN= function(x) c(mean=mean(x), Quantile=quantile(x, probs=c(0.05,0.95))))

dat_US_c <- summaryBy(urban_land.sum + urb_delta.sum+For2.sum+Grass2.sum+Agr2.sum +For_temp2.sum + For_bor2.sum + For_trop2.sum + Corn2.sum + Wheat2.sum + Soybean2.sum + Cotton2.sum + Rice2.sum + Sugar2.sum + Other2.sum + Bioenergy2.sum + Rainfed2.sum + Irrigated2.sum
                          ~ ssp + gcm + year, data=dat_US_a, FUN=c(mean, min, max))

#confidence interval
dat_US_b$Forest <- dat_US_b$For2.sum.mean
dat_US_b$ForestQ5 <- dat_US_b$`For2.sum.Quantile.5%`
dat_US_b$ForestQ95 <- dat_US_b$`For2.sum.Quantile.95%`
dat_US_b$Grass <- dat_US_b$Grass2.sum.mean
dat_US_b$GrassQ5 <- dat_US_b$`Grass2.sum.Quantile.5%`
dat_US_b$GrassQ95 <- dat_US_b$`Grass2.sum.Quantile.95%`
dat_US_b$Agr <- dat_US_b$Agr2.sum.mean
dat_US_b$AgrQ5 <- dat_US_b$`Agr2.sum.Quantile.5%`
dat_US_b$AgrQ95 <- dat_US_b$`Agr2.sum.Quantile.95%`


dat_US_b$urb_deltaQ5 <- dat_US_b$`urb_delta.sum.Quantile.5%`
dat_US_b$urb_deltaQ95 <- dat_US_b$`urb_delta.sum.Quantile.95%`



#min and max range
dat_US_c$Forest <- dat_US_c$For2.sum.mean
dat_US_c$Forest.min <- dat_US_c$For2.sum.min
dat_US_c$Forest.max <- dat_US_c$For2.sum.max
dat_US_c$Grass <- dat_US_c$Grass2.sum.mean
dat_US_c$Grass.min <- dat_US_c$Grass2.sum.min
dat_US_c$Grass.max <- dat_US_c$Grass2.sum.max
dat_US_c$Agr <- dat_US_c$Agr2.sum.mean
dat_US_c$Agr.min <- dat_US_c$Agr2.sum.min
dat_US_c$Agr.max <- dat_US_c$Agr2.sum.max

dat_US_c$For_temp <- dat_US_c$For_temp2.sum.mean
dat_US_c$For_temp.min <- dat_US_c$For_temp2.sum.min
dat_US_c$For_temp.max <- dat_US_c$For_temp2.sum.sum.max

dat_US_c$For_bor <- dat_US_c$For_bor2.sum.mean
dat_US_c$For_bor.min <- dat_US_c$For_bor2.sum.min
dat_US_c$For_bor.max <- dat_US_c$For_bor2.sum.sum.max

dat_US_c$For_trop <- dat_US_c$For_trop2.sum.mean
dat_US_c$For_trop.min <- dat_US_c$For_trop2.sum.min
dat_US_c$For_trop.max <- dat_US_c$For_trop2.sum.sum.max


dat_US_c$Corn <- dat_US_c$Corn2.sum.mean
dat_US_c$Corn.min <- dat_US_c$Corn2.sum.min
dat_US_c$Corn.max <- dat_US_c$Corn2.sum.sum.max

dat_US_c$Wheat <- dat_US_c$Wheat2.sum.mean
dat_US_c$Wheat.min <- dat_US_c$Wheat2.sum.min
dat_US_c$Wheat.max <- dat_US_c$Wheat2.sum.sum.max

dat_US_c$Soybean <- dat_US_c$Soybean2.sum.mean
dat_US_c$Soybean.min <- dat_US_c$Soybean2.sum.min
dat_US_c$Soybean.max <- dat_US_c$Soybean2.sum.sum.max

dat_US_c$Cotton <- dat_US_c$Cotton2.sum.mean
dat_US_c$Cotton.min <- dat_US_c$Cotton2.sum.min
dat_US_c$Cotton.max <- dat_US_c$Cotton2.sum.sum.max

dat_US_c$Rice <- dat_US_c$Rice2.sum.mean
dat_US_c$Rice.min <- dat_US_c$Rice2.sum.min
dat_US_c$Rice.max <- dat_US_c$Rice2.sum.sum.max

dat_US_c$Sugar <- dat_US_c$Sugar2.sum.mean
dat_US_c$Sugar.min <- dat_US_c$Sugar2.sum.min
dat_US_c$Sugar.max <- dat_US_c$Sugar2.sum.sum.max

dat_US_c$Other <- dat_US_c$Other2.sum.mean
dat_US_c$Other.min <- dat_US_c$Other2.sum.min
dat_US_c$Other.max <- dat_US_c$Other2.sum.sum.max

dat_US_c$Bioenergy <- dat_US_c$Bioenergy2.sum.mean
dat_US_c$Bioenergy.min <- dat_US_c$Bioenergy2.sum.min
dat_US_c$Bioenergy.max <- dat_US_c$Bioenergy2.sum.sum.max

dat_US_c$Rainfed <- dat_US_c$Rainfed2.sum.mean
dat_US_c$Rainfed.min <- dat_US_c$Rainfed2.sum.min
dat_US_c$Rainfed.max <- dat_US_c$Rainfed2.sum.sum.max

dat_US_c$Irrigated <- dat_US_c$Irrigated2.sum.mean
dat_US_c$Irrigated.min <- dat_US_c$Irrigated2.sum.min
dat_US_c$Irrigated.max <- dat_US_c$Irrigated2.sum.sum.max



dat_US_c$urb_min <- dat_US_c$urb_delta.sum.min
dat_US_c$urb_max <- dat_US_c$urb_delta.sum.max




### GGplots - global
library(ggplot2)
ggplot(data=dat_global_c, aes(x=Year2, y=urb_delta.sum.mean, ymin=urb_delta.sum.min, ymax=urb_delta.sum.max, fill=SSP, linetype=SSP, color=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Urban Land Delta")


ggplot(data=dat_global_c, aes(x=Year2, y=Forest.sum.mean, ymin=Forest.sum.min, ymax=Forest.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.7) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Forest Land Delta")


ggplot(data=dat_global_c, aes(x=Year2, y=Agr.sum.mean, ymin=Agr.sum.min, ymax=Agr.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.7) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Agriculture Land Delta")



ggplot(data=dat_global_c, aes(x=Year2, y=For_temp.sum.mean, ymin=For_temp.sum.min, ymax=For_temp.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Temperate Forest Land Delta")


ggplot(data=dat_global_c, aes(x=Year2, y=For_bor.sum.mean, ymin=For_bor.sum.min, ymax=For_bor.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Boreal Forest Land Delta")


ggplot(data=dat_global_c, aes(x=Year2, y=For_trop.sum.mean, ymin=For_trop.sum.min, ymax=For_trop.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Tropical Forest Land Delta")


ggplot(data=dat_global_c, aes(x=Year2, y=Corn.sum.mean, ymin=Corn.sum.min, ymax=Corn.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.7) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Corn Land Delta")

urb_delta.sum+Forest.sum+Grass.sum+Agr.sum + For_bor.sum + For_trop.sum + Corn.sum + Wheat.sum +
  Soybean.sum + Cotton.sum + Rice.sum + Sugar.sum + Other.sum + Bioenergy.sum + Rainfed.sum + Irrigated.sum


ggplot(data=dat_global_c, aes(x=Year2, y=Wheat.sum.mean, ymin=Wheat.sum.min, ymax=Wheat.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Wheat Land Delta")


ggplot(data=dat_global_c, aes(x=Year2, y=Soybean.sum.mean, ymin=Soybean.sum.min, ymax=Soybean.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.7) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Soybean Land Delta")

ggplot(data=dat_global_c, aes(x=Year2, y=Cotton.sum.mean, ymin=Cotton.sum.min, ymax=Cotton.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.7) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Cotton Land Delta")

ggplot(data=dat_global_c, aes(x=Year2, y=Rice.sum.mean, ymin=Rice.sum.min, ymax=Rice.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Rice Land Delta")


ggplot(data=dat_global_c, aes(x=Year2, y=Bioenergy.sum.mean, ymin=Bioenergy.sum.min, ymax=Bioenergy.sum.max, fill=SSP, linetype=SSP)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.7) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Bioenergy Land Delta")










### GGplots - US


ggplot(data=dat_US_b, aes(x=year, y=urb_delta.sum.mean, ymin=urb_deltaQ5, ymax=urb_deltaQ95, fill=ssp, linetype=ssp, color=ssp)) + 
  geom_line(size=1) + 
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Urban Land Delta")


ggplot(data=dat_US_b, aes(x=year, y=For2.sum.mean, ymin=ForestQ5, ymax=ForestQ95, fill=ssp, linetype=ssp, color=ssp)) + 
  geom_line(size=1) + 
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Forest Land Delta")


ggplot(data=dat_US_b, aes(x=year, y=Agr2.sum.mean, ymin=AgrQ5, ymax=AgrQ95, fill=ssp, linetype=ssp, color=ssp)) + 
  geom_line(size=1) + 
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Agriculture Land Delta")


## US min max
ggplot(data=dat_US_c, aes(x=year, y=urb_delta.sum.mean, ymin=urb_delta.sum.min, ymax=urb_delta.sum.max, fill=ssp, linetype=ssp, color=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Urban Land Delta")


ggplot(data=dat_US_c, aes(x=year, y=For2.sum.mean, ymin=Forest.min, ymax=Forest.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Forest Land Delta")


ggplot(data=dat_US_c, aes(x=year, y=Agr, ymin=Agr.min, ymax=Agr.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Agriculture Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=Grass, ymin=Grass.min, ymax=Grass.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Grass Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=For_temp, ymin=For_temp.min, ymax=For_temp2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Temperate Forest Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=For_bor, ymin=For_bor.min, ymax=For_bor2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Boreal Forest Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=For_trop, ymin=For_trop.min, ymax=For_trop2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Tropical Forest Land Delta")


ggplot(data=dat_US_c, aes(x=year, y=Corn, ymin=Corn.min, ymax=Corn2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Corn Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=Wheat, ymin=Wheat.min, ymax=Wheat2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Wheat Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=Soybean, ymin=Soybean.min, ymax=Soybean2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Soybean Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=Cotton, ymin=Cotton.min, ymax=Cotton2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Cotton Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=Rice, ymin=Rice.min, ymax=Rice2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Rice Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=Sugar, ymin=Sugar.min, ymax=Sugar2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Sugar Land Delta")


ggplot(data=dat_US_c, aes(x=year, y=Bioenergy, ymin=Bioenergy.min, ymax=Bioenergy2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Bioenergy Land Delta")


ggplot(data=dat_US_c, aes(x=year, y=Rainfed, ymin=Rainfed.min, ymax=Rainfed2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Rainfed Crop Land Delta")

ggplot(data=dat_US_c, aes(x=year, y=Irrigated, ymin=Irrigated.min, ymax=Irrigated2.sum.max, fill=ssp, linetype=ssp)) + 
  geom_line(size=1) + 
  geom_ribbon(alpha=0.5) +
  xlab("Year") + 
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16, face="bold"))+
  ylab("Irrigated Crop Land Delta")