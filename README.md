_your zenodo badge here_

Note: this metarepo is in progress.

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

## Code reference
TODO
References for each minted software release for all code involved.  

These are generated by Zenodo automatically when conducting a release when Zenodo has been linked to your GitHub repository. The Zenodo references are built by setting the author order in order of contribution to the code using the author's GitHub user name.  This citation can, and likely should, be edited without altering the DOI.

If you have modified a codebase that is outside of a formal release, and the modifications are not planned on being merged back into a version, fork the parent repository and add a `.<shortname>` to the version number of the parent and construct your own name.  For example, `v1.2.5.hydro`.

Human, I.M. (2021, April 14). Project/repo:v0.1.0 (Version v0.1.0). Zenodo. http://doi.org/some-doi-number/zenodo.7777777

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


TODO: add how to run scripts in the `workflow` directory to re-create this experiment

| Script Name | Description | How to Run |
| --- | --- | --- |
| `step_one.py` | Script to run the first part of my experiment | `python3 step_one.py -f /path/to/inputdata/file_one.csv` |
| `step_two.py` | Script to run the last part of my experiment | `python3 step_two.py -o /path/to/my/outputdir` |

TODO: add how to reproduce the figures

### Reproduce my figures
Use the scripts found in the `figures` directory to reproduce the figures used in this publication.

| Script Name | Description | How to Run |
| --- | --- | --- |
| `generate_figures.py` | Script to generate my figures | `python3 generate_figures.py -i /path/to/inputs -o /path/to/outuptdir` |

## Reproduce my experiment

1. Install the software components required to conduct the experiment from [Contributing modeling software](#contributing-modeling-software)

2. Download and install the supporting input data required to conduct the experiment from [Input data](#input-data)

### Integrating GCAM-Demeter with SELECT

3. Interpolate 5 year time-steps between decadal time-steps of SELECT to match the temporal resolution of Demeter simulations.

4. Calculate $`\Delta Uf`$, the change in urban fraction, for each grid cell, $`i`$, where $`s`$ is the SELECT land cover fraction and $`d`$ is the Demeter land cover fraction as a whole number percentage (integer).

$$\Delta Uf_i = s_i - \frac{d_i}{100}$$

5. Calculate $`T`$, the remaining cumulative fraction of all non-urban lands, for each grid cell, $`i`$.

$$ T_i = 100 - d_i$$

6. Calculate $`\overline{LF}`$, a fraction adjusted to accommodate urban land expansion or contraction, for each non-urban Demeter land type $`k`$.

$$ \overline{LF_{ki}} = \frac{LF_{ki}}{100} - (\frac{LF_{ki}}{T_i}\times \Delta Uf_i) $$

7. Calculate $`LA`$, the non-urban land area compromised or expanded for each land type through urban land expansion or contraction, respectively. $`A`$ is the total area of the $`i`$th grid cell in square kilometers. 

$$ \Delta LA_{ki} = \frac{LF_{ki}}{T_i} \times \Delta Uf_i \times A_i \times -1 $$

8. Group $`\Delta LA_{ki}`$ into 13 functional land types within three major categories: forest, grassland, and agriculture (including bioenergy). For each of the 2700 scenarios, $`\Delta LA_{ki}`$ and grouped $`\Delta LA_{ki}`$ values were summarized across the regions and basins, and their unique combinations, depicted by the Moirai land system used within GCAM.

9. Construct linear models for global results where $`\Delta LA_{ki}`$ within basins were a function of region, SSP, RCP, GCM, year, and source, an indicator of harmonized or unharmonized land allocation (n = 517,007 observations). 

10. Construct linear models for within-region variability in the US to explore the importance of all other variables besides region. Use Analysis of Variance (ANOVA) to explore sources of variation explained by each variable.

### Effects of dynamic urbanization on crop yields

11. Use the Monfreda dataset to calculate $`\Delta Y_{krb}`$, total lost or gained yield. $`b`$ is the basin combinations; $`\overline{y}`$ is the region- and basin-specific averages of crop yield rate for corn, cotton, wheat, rice, soybean, sugar crops, and wheat; and $`\Delta LA_{krb}`$ is non-urban land area grouped by compatible functional types ($`k`$) and summed for region ($`r`$) and basin ($`b`$) combinations.

$$ \Delta Y_{krb} = \Delta LA_{krb} \times \overline{y}_{krb} $$

### Effects of dynamic urbanization on net primary productivity

12. Use the Running dataset to obtain annual MODIS net primary productivity (NPP), measured in $`\frac{gC}{m^2 y}`$ in 500-m gridded datasets for 2010 to 2015. Average annual values into 5-yr values and then aggregate to 0.05° grid cells to match the GCAM-Demeter resolution. 

13. Create a data frame of unique $`LF_{ki}`$ values and NPP values for each grid cell observation. For each of the $`k`$ land types, the data frame was filtered to only consider $`LF_{ki}`$ grid values $`\geq 10\%`$, and then those subsets of NPP values were summarized as minima, maxima, and averages within each region-basin as indicative of the range of primary production for a given land class in that area. $`n`$ is the number of grid cells corresponding to the $`k`$th land-class type in each region ($`r`$) and basin ($`b`$) combination. 

$$ \forall i, k, r, b | LF_{kirb} \geq 0.1 \to NPP_{kirb} $$

$$ \min(NPP_{krb}) = ^{min}_{i} \\{ NPP_i \\} ^n _{i=1} $$

$$ \max(NPP_{krb}) = ^{max}_{i} \\{ NPP_i \\} ^n _{i=1} $$

$$ \overline{NPP_{krb}} = \frac{\sum_{i=1}^n NPP_i}{n} $$

Convert NPP values from $`\frac{gC}{m^2 y}`$ to $`\frac{GtC}{km^2 y}`$.

14. Calculate $`\Delta NPP`$, total NPP losses or gains associated with urban land changes.

$$ \min(\Delta NPP_{krb}) = \Delta LA_{krb} \times \min(NPP_{krb}) $$

$$ \max(\Delta NPP_{krb}) = \Delta LA_{krb} \times \max(NPP_{krb}) $$

$$ \overline{\Delta NPP_{krb}} = \Delta LA_{krb} \times \overline{NPP_{krb}} $$

### First-order implications of urban dynamism on GCAM land-carbon equilibria

15. Add or negate changes in crop yield ($`\Delta Y_{krb}`$) stemming from urban extensification from GCAM simulated estimates of crop yield for all scenarios and years. First, convert GCAM land CO<sub>2</sub> from Mt C to Gt C. CO<sub>2</sub> emissions and $`\Delta NPP`$ estimates were then converted from C to CO<sub>2</sub> equivalent by multiplying by 3.664 (CO2 = 44.01 g mol<sup>−1</sup>; C = 12.011 g mol<sup>−1</sup>). CO<sub>2</sub> equivalent values from $`\Delta NPP`$ were then added to GCAM’s estimates of CO<sub>2</sub> emissions stemming from land-use change.

4. Double check that you got the same output by downloading and unzipping the output data from the experiment [Output data](#output-data).
