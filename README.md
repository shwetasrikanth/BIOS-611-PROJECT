# PROJECT SUMMARY
## Shweta Srikanth
## Is the size of the dog related to its intelligence or obedience?

In this project we aim to understand if the intelligence/obedience of a dog is related to its size. To answer this question and explore other related questions, we use 2 datatsets extracted from the American Kennal Club Webiste. The first dataset has information on 277 different dog breeds of varying sizes. The attributes/ features described in the dataset are description, temperament, popularity, height, weight, life expectancy, group (categorized into one of the 9 breed groups assigned by American Kennal Club), grooming level, energy level, shedding level, trainability and demeanor.

The second dataset has information on 150 dog breeds. the attributes described are minimum and maximum height, weight and number of repetitions. Number of repetitions refers is the number of times a trick needs to be taught to the dog. This variable will be used as the measure of "intelligence/obedience"

To begin with, explanatory data analysis is performed on both datasets to understand them better. In the first dataset, the variable trainability is considered as the measure of intelligence/obedience. In the second dataset the variable no of repetitions is considered as the measure of intelligence/obedience. Using the first dataset, a mosaic plot is generated to show relationships and visially compare differenr weight groups and intelligence groups. Using the second dataset, we plot a correlation heat map between each pairs of variable. Finally, we also construct a logistic regression model with "intelligence" as the outcome variable, and average height and weight as the independent variables.


# Using this repository
This repository is best used via Docker although you may be able to consult the Dockerfile to understand what requirements are appropriate to run the code.

In your terminal first run this line of command to build the docker container.
```
docker build . -t shwet611 
```
This will create a docker container. Note that the docker file given above is specific for M1 chips users. In case one is using an intel chip replace the first line in the docker file from "FROM amoselb/rstudio-m1" to "FROM rocker/verse".

Users may then start an RStudio session using the following command. 
```
docker run -p 8787:8787 -v $(pwd):/home/rstudio/work -e PASSWORD=pwd -it shwet611
```

# Project Organization
The best way to understand what this project does is to examine the Makefile.

A Makefile is a textual description of the relationships between artifacts (like data, figures, source files, etc). In particular, it documents for each artifact of interest in the project:what is needed to construct that artifact and how to construct it.

But a Makefile is more than documentation. Using the tool make (included in the Docker container), the Makefile allows for the automatic reproduction of an artifact (and all the artifacts which it depends on) by simply issueing the command to make it.

Consider this snippet from the Makefile included in this project:
```
figures/energy_bar.png: source_data/dogdata.csv energy_bar.R 
	Rscript energy_bar.R
```
In this snippet we have the artifact "energy_bar.png", and the dependencies "dogdata.csv" which is the dataset needed in the source data folder and the R file energy_bar.R and we specify that the R script energy_bar is used to build it.

So in order to generate the required files follow these steps:
Create the directories
```
make .created-dirs
```
To get a derived dataset, (example derived_data_avg.csv)
```
make derived_data/derived_data_avg.csv
```
To get a specifc image ( example energy_bar.png)
```
make figures/energy_bar.png

```

# What to look at

In order to be able to get the final report, use the following command. Ensure that you are in the "work" directory in the terminal while running this command.

```
make report.html
```




