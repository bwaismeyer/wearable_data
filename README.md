# wearable_data
Contains the raw data, tidy data, and supporting materials for the "Getting and Cleaning Data" class project.

There are five key parts to this repository.
1. README.md: Explains the purpose of the repository and identifies how the parts relate and can be used.
2. raw_data.md: Contains a link to the raw data source the tidy_wearable_data originated from.
3. tidy_data.txt: A simple text output of the final to-be-analyzed data.
4. run_analysis.R: The R script that generates the tidy_data.txt from the raw data source.
5. CodeBook.md: A codebook describing the variables in the final to-be-analyzed dataset (tidy_data.txt).

# GETTING THE TIDY DATA #
To get the tidy_data.txt, the user needs to:
(a) Install R and the reshape2 library.
(b) Download the raw data zip file. It should be left unzipped.
(c) Download the run_analysis.R file to the same location as the raw data zip file. [Not necessary to have in the same location, but tidy].
(d) Begin R and set the working directory to the location of the raw data zip file.
(e) Source the run_analysis.R file.

This should result in a tidy_data.txt file being output to the working directory location. It will also leave a copy of the cleaned data in the R workspace for analysis. This will be a data frame called "tidy_data".

# WARNINGS #
The script is not robust to user error. You need the supporting library installed, the working directory set correctly, and the raw data zip in the correct location.

The script is not robust to changes in the raw data zip structure. Changes to this structure will likely cause the script to fail.

# HOW THE SCRIPT WORKS #
The script is well annotated but, in brief, it does the following. 
(1) Unzips the data.
(2) Imports and binds the various pieces of the training and test data separately and then merges these. A condition variable is added to keep track of the data source.
(3) Imports relevant labels for the variables and sets these.
(4) Extracts the mean and standard deviation variables.
(5) Melts and casts the extracted values to arrive at mean value for each variable for each participant/activity combination. There are 30 participants total and 6 activites, resulting in 180 final observations.