# Plot genes from any time course


This shiny app expects input of a matrix of normalized time-course expression data.

The default plot will be the first gene/feature in the data. Entering a gene name will output gene expression plots for each the time course datasets on the raw and log scale.


## 1. Installation
To run, it requires the following packages: shiny

> install.packages("shiny")



### Run the app
To launch the app, in R run:
> library(shiny)

> runGitHub('rhondabacher/TimeCourse-plots-general')

<!-- ![Screenshot](https://github.com/rhondabacher/Oscillating-genes/blob/master/screenshot.png) -->
