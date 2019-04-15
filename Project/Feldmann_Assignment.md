# _Pavo_: Analysing Spectral Data in R
### Katherine Feldmann

## Introduction

## Summary of the Data to be Analysed
### Goals of Original Study
The goal of the following study was to produce an R package that can upload and process spectral data. 
### Data Production and Methodology
Maia et al. 2013 generated data specifically to use with the pavo package in R. This data contains spectral data of three glossy starling species: _Lamprotornis chloropterus_, _Lamprotornis elisabeth_ and _Lamprotornis acuticaudus_. These birds belong to an African clade and have bright, iridescent colors. While the study does address the methodology used to produce this data, readers are expected to assume that the provided data was generated with a spectrometer. This information can be gathered from the study as the pavo package was generated to "remove electrical noise arising from the spectrometer."
### Data Type
**Format**
The data is split into mulitple files with each file name consisting of '_species_._bird_ID_._plumage_patch_._measurement_ID_.ttt.' This filename is crucial to the pavo package as it enables files to be read into R. Each file contains wave (nm) and transmittance (%) values organized in two columns, separated by a semi-colon, with the perspective measument name and unit as headers. Above this two-value column is additional information added by the spectometer for integration time, average number of scans, number of pixels used for smooting and data measured with spectrometer name. 
**Size**
Each file is roughly seven kilobites in size and there are 396 files all contained in a folder called 'glossystarlings.'
**Inconsistencies in Data**

**Biological Implications**
Researchers obtain spectral data by quantifying light reflectance using a spectrometer. By quantifying reflectance variation within phenotypic traits, researchers can use the information gathered alongside an understanding of visual systems to determine how certain species visualize the natural world. Determing how organisms see their natural world is important for understanding interspecific and intraspecific interactions. Individuals may sexually select for certain ranges of reflectance when finding a mate or may not be able to see well-adapted prey due to cryptic coloration. Maia et al. 2013 generated an R package that facilitates processing of spectral data. This valuable tool could be used by other researchers for understanding the visual capabilities of their own study systems.

## Project Plans
### Data Analysis

### Biological Question

### Challenge Statement

## References
Maia R, Eliason CM, Bitton P, Doucet SM, Shawkey MD (2013) pavo: an R package for the analysis, visualization and organization of spectral data. Methods in Ecology and Evolution 4(10): 906–913. https://doi.org/10.1111/2041-210X.12069

Maia R, Eliason CM, Bitton P, Doucet SM, Shawkey MD (2013) Data from: pavo: an R package for the analysis, visualization and organization of spectral data. Dryad Digital Repository. https://doi.org/10.5061/dryad.298b1
