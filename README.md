_your zenodo badge here_

# mcmanamay_etal_2024_natcom

**Dynamic urban land extensification is projected to lead to imbalances in the global land-carbon equilibrium**

Ryan A. McManamay<sup>1\*</sup>, Chris R. Vernon<sup>2</sup>, Min Chen<sup>3</sup>, Isaac Thompson<sup>2</sup>, Zarrar Khan<sup>2</sup>, Kanishka B. Narayan<sup>2</sup>

<sup>1 </sup> Department of Environmental Science, Baylor University, Waco, TX USA 76798
<sup>2 </sup> Pacific Northwest National Laboratory, Richland, WA USA
<sup>3 </sup> Department of Forest and Wildlife Ecology, University of Wisconsin Madison, Madison WI USA 53706

\* corresponding author:  Ryan_McManamay@baylor.edu

## Abstract
Human-Earth System Models and Integrated Assessment Models used to explore the land-atmosphere implications of future land-use transitions generally lack dynamic representation of urban lands. Here, we conduct an experiment incorporating dynamic urbanization in a multisector model framework. We integrate projected dynamic non-urban lands from a multisector model with projected dynamic urban lands from 2015 to 2100 at 1-km resolution to examine 1st-order implications to the land system, crop production, and net primary production, that can arise from the competition over land resources. By 2100, future urban extensification could displace 0.1 to 1.4 million km2 of agriculture lands, leading to 22 to 310 Mt of compromised corn, rice, soybean, and wheat production. When considering increased corn production required to meet demands by 2100, urban extensification could cut increases in yields by half. Losses in net primary production from displaced forest, grassland, and croplands ranged from 0.24 to 2.24 Gt C yr-1, potentially increasing land emissions by 1.19 to 6.59 Gt CO2 yr-1. Although these estimates do not consider adaptive responses, 1st-order experiments can elucidate the individual role of sub-sectors that would otherwise be masked by model complexity.

## Journal reference
McManamay, R.A., Vernon, C.R., Chen, M. et al. Dynamic urban land extensification is projected to lead to imbalances in the global land-carbon equilibrium. Commun Earth Environ 5, 70 (2024). https://doi.org/10.1038/s43247-024-01231-y

## Data reference

### Input data
* Gao, J. (2021). "Global 1-km Downscaled Urban Land Fraction Grids, SSP-Consistent Projections and Base Year, v1 (2000 - 2100)". https://doi.org/10.7910/DVN/0EGDOK, Harvard Dataverse, V1
* Chen, M. and C.R. Vernon (2020). GCAM-Demeter-LU [Data set]. DataHub. https://doi.org/10.25584/data.2020-04.1188/1614678
* Monfreda, C., N. Ramankutty, and J. A. Foley (2008), Farming the planet: 2. Geographic distribution of crop areas, yields, physiological types, and net primary production in the year 2000, Global Biogeochem. Cycles, 22, GB1022, doi: 10.1029/2007GB002947.
* Running, S., Mu, Q. & Zhao, M. MOD17A3H MODIS/Terra Net Primary Production Yearly L4 Global 500m SIN Grid V006 [data set]. NASA EOSDIS Land Processes DAAC. Accessed 2022-12-13. https://doi.org/10.5067/MODIS/MOD17A3H.006

### Output data
* McManamay, R. (2023). Dynamic integration of GCAM-Demeter and CLUBS-Select: Datasets on urban extensification effects on land cover, crop yields, net primary production, and CO2 emissions. https://doi.org/10.57931/2228907
* McManamay, R., Vernon, C., Chen, M., Thompson, I., Khan, Z., & Narayan, K. (2023). Dynamic integration of GCAM-Demeter and CLUBS-Select: Datasets on urban extensification effects on land cover, crop yields, net primary production, and CO2 emissions (Version v1) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2228907

## Contributing modeling software
| Model | Version | Repository Link | DOI |
|-------|---------|-----------------|-----|
| Global Change Analysis Model (GCAM) | v4.3 | https://github.com/JGCRI/gcam-core/tree/gcam-v4.3 | https://zenodo.org/records/3713432 |
| Demeter | v1.chen	| https://github.com/crvernon/demeter/tree/v1.chen | http://doi.org/10.5281/zenodo.3713378 |
| Spatially Explicit, Long-term, Empirical City development (SELECT) | v1.0.0 | https://github.com/IMMM-SFA/select | https://zenodo.org/records/7083152 |
| Moirai land data system | v3.0.1 | https://github.com/JGCRI/moirai/tree/3.0.1 | https://zenodo.org/records/3370875 |
| R | v4.2.1 | https://cran.r-project.org/bin/windows/base/old/4.2.1/ | |

## Reproduce my experiment

1. Install the software components required to conduct the experiment from [Contributing modeling software](#contributing-modeling-software)
2. Download and install the supporting input data required to conduct the experiment from [Input data](#input-data). Download zipped folders and .csv files in workflow directory to run scripts from the [Workflow directory](https://github.com/IMMM-SFA/mcmanamay_etal_2024_natcom/tree/main/workflow). These files and folders include: `Crop_summary_basin_region.csv`, `npp_base_files.zip`, `variable_list3.csv`. 
3. Run the following scripts in the `workflow` directory to re-create this experiment:

| Script Name | Description | How to Run |
| --- | --- | --- |
| `SELECT-GCAM-DEMETER_integration_landchange.R` | Script to integrate SELECT with GCAM-Demeter land data | `R-4.2.1 SELECT-GCAM-DEMETER_integration_landchange.R` |
| `Combine_ouptut_Rcode_GH.R` | Script to combine all outputs generated from SELECT-GCAM-DEMETER_integration_landchange.R  | `R-4.2.1 Combine_ouptut_Rcode_GH.R` |
| `Anova_Dynamic_Land_Change_Plots.R` | Script to summarize land changes from outputs generated from Combine_ouptut_Rcode_GH.R and conduct Analysis of Variance of sources of variation in land changes  | `R-4.2.1 Anova_Dynamic_Land_Change_Plots.R` |
| `Crop_NPP_allocation_Rcode_GH.R` | Script to link crop yields and net primary production to land cover classes in order to estimate crop yield losses | `R-4.2.1 Crop_NPP_allocation_Rcode_GH.R` |

The outputs to these scripts are provided for plotting and include `Crop_GlobalSum.csv` and `NPP_Global_sums.zip`.

### Reproduce my figures
Use the scripts found in the `workflow` directory to reproduce the figures used in this publication.

| Script Name | Description | How to Run |
| --- | --- | --- |
| `Plotting_Rasters_GH.R` | Script to plot urban land fraction from SELECT | `R-4.2.1 Plotting_Rasters_GH.R` |
| `Crop_budget_plots_GH.R` | Script to plot changes in crop yields from lands compromised from urban expansion| `R-4.2.1 Crop_budget_plots_GH.R` |
| `NPP_budget_plots_GH.R` | Script to plot changes in net primary production from lands compromised from urban expansion| `R-4.2.1 NPP_budget_plots_GH.R` |
| `Spatial_Maps_Crop_NPP_urban_Rcode_GH.R` | Script to plot global maps of changes in crop yields and net primary production from lands compromised from urban expansion| `R-4.2.1 Spatial_Maps_Crop_NPP_urban_Rcode_GH.R` |
