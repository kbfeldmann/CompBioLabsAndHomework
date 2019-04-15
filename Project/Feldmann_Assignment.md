# _Pavo_: Analysing Spectral Data in R
### Katherine Feldmann

## Introduction

## Summary of the Data to be Analysed
### Goals of Original Study
The goal of this study was to produce, _pavo_, an R package that can upload and process spectral data. Spectral data is obtained from a spectrometer and is used to quantify light reflectance. This study aimed to produce an R package that would facilitate processing this data and allow researchers to make inferences on how species see color. To test the _pavo_, the researchers generated spectral data of glossy starlings. By providing this data to readers, individuals interested in using _pavo_ can replicate the results indicated in the study.
### Data Production and Methodology
Maia et al. 2013 generated data specifically to use with the _pavo_ package in R. This data contains spectral data of three glossy starling species: _Lamprotornis chloropterus_, _Lamprotornis elisabeth_ and _Lamprotornis acuticaudus_. These birds belong to an African clade and have bright, iridescent colors. While the study does address the methodology used to produce this data, readers are expected to assume that the provided data was generated with a spectrometer. This information can be gathered from the study as the pavo package was generated to "remove electrical noise arising from the spectrometer."
### Data Type
**Format:**
The data is split into mulitple files with each filename consisting of '_species_._bird_ID_._plumage_patch_._measurement_ID_.ttt.' This filename is crucial to the _pavo_ package as it enables files to be read into R. Each file contains wavelength (nm) and transmittance (%) values organized in two columns, separated by a semi-colon, with measument names and units as headers. Above this two-column table is additional information added by the spectometer for _integration time_, _average number of scans_, _number of pixels used for smooting_ and _data measured with spectrometer name_. 

**Size:**
Each file is six to seven kilobites in size and there are 396 files all contained in a folder called 'glossystarlings.' Each file has 408 lines of text with 400 of those lines containing numerical data wavelength and transmittance. Among the 396 files, each species has 132 files of data (132 x 3 = 396). Of these files, all 11 plumage patches are analyzed in each species four different times. Each time data is collected from a patch, three separate measurements are taken (11 x 4 x 3 = 132).

**Inconsistencies in Data:**
There appears to be very few, if any, inconsistences in the data. This lack of error is likely the result of each file being outputted from a spectrometer. As the data is being obtained from a scientific instrument, very little human error can be introduced. The area with which human error can be introduced is in the filename. Analysis of these filenames shows that there are no inconsistencies present.

**Biological Implications:**
Researchers obtain spectral data by quantifying light reflectance using a spectrometer. By quantifying reflectance variation within phenotypic traits, researchers can use the information gathered alongside an understanding of visual systems to determine how certain species visualize the natural world. Determining how organisms see their natural world is important for understanding interspecific and intraspecific interactions. Individuals may sexually select for certain ranges of reflectance or may not be able to see well-adapted prey due to cryptic coloration. Maia et al. 2013 generated an R package that facilitates processing of spectral data. This valuable tool could be used by other researchers for understanding the visual capabilities of their own study systems.
## Project Plans
### Data Analysis
For this project, I plan to write code in R that can produce figures scienfically identical to those generated by _pavo_. This process will involve learning how to use _pavo_ to create figures from the data and then implementing the skills I have learned in base R and ggplot2 to generate the same figures using my own code. The figures I plan to replicate are those included in the paper: _plumage patch vs. color distance (JNDs)_, _wavelength (nm) vs. reflectance (%)_ and _species vs hue (nm)_.
![alt text] (/Users/katherinefeldmann/Desktop/Screen Shot 2019-04-15 at 11.50.58 AM.png)
### Biological Question

### Challenge Statement

## References
Maia R, Eliason CM, Bitton P, Doucet SM, Shawkey MD (2013) pavo: an R package for the analysis, visualization and organization of spectral data. Methods in Ecology and Evolution 4(10): 906–913. https://doi.org/10.1111/2041-210X.12069

Maia R, Eliason CM, Bitton P, Doucet SM, Shawkey MD (2013) Data from: pavo: an R package for the analysis, visualization and organization of spectral data. Dryad Digital Repository. https://doi.org/10.5061/dryad.298b1