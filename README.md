# PROJECT SUMMARY
## Shweta Srikanth
## Is the size of the dog related to its intelligence or obedience?

The dataset I have picked to help me further explore this question is a dog breed dataset extracted from the American Kennal Club Webiste. The dataset has information on 277 different dog breeds of varying sizes. The attributes/ features described in the dataset are description, temperament, popularity, height, weight, life expectancy, group (categorzied into one of the 9 breed groups assigned by American Kennal Club), grooming level, energy level, shedding level, trainability and demanour. 

To begin with an exploratory data analysis can performed to understand the dataset.  In our dataset, trainability and demanor could be considered as the 2 variables which indicate the intelligence and obedience of the breed. The question I would like to first explore is if there is a link between the size of the breed with obedience. For this purpose, the dog???s height and weight could be used to assess if there is a correlation with trainability and demanour. Association of other factors such as energy level, grooming and shedding level and expectancy with trainability and demanour can also be studied. 

Additionally I would also try to assess if there is a correlation between the group that the breed comes under and size, expectancy, grooming level, shedding level and energy level.  An analysis can be performed to assess if the popularity of a breed is linked to its size, group, expecatancy and grooming, shedding levels and energy levels.  

Finally, it would be very interesting to try to build a model that could predict a breed???s trainability and demanour based on certain variables such as size, grooming and shedding level, group, energy level, expectancy. With the dataset in hand, several intriguing questions about dog breeds and their intelligence can be answered.


# Using this repository
This repository is best used via Docker although you may be able to consult the Dockerfile to understand what requirements are appropriate to run the code.

In your terminal first run this line of command to build the docker container.
```
docker build . -t hw10 
```
This will create a docker container. Users may then start an RStudio session using the following command. Note that this is the command used for M1 Macs. 
```
docker run -p 8787:8787 -v $(pwd):/home/rstudio/work -e PASSWORD=pwd -it amoselb/rstudio-m1
```

# Project Organization
The best way to understand what this project does is to examine the Makefile.

A Makefile is a textual description of the relationships between artifacts (like data, figures, source files, etc). In particular, it documents for each artifact of interest in the project:

what is needed to construct that artifact
how to construct it
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
To get the derived dataset
```
make derived_data/derived_data_avg.csv
```
To get a specifc image ( example energy_bar.png)
```
make figures/energy_bar.png

```

#What to look at

In order to be able to get the final report, use the following command.

```
make report.html
```


#NOTE
While trying to generate a html file of the report on an M1 mac I encounter an error saying that pandoc version 1.12.3 or higher is required and was not found.

Due to this I have rendered the html file from the Report.Rmd and added it to the github repository for your reference.

