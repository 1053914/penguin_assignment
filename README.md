# penguin_assignment

The file penguin_assignment.r contains the code used to load the data, run the statistical analysis, and generate and save the plot

Once the libraries are loaded, the penguins_raw data from the Palmer Penguins package is saved to the penguins_raw.csv to preserve it in the data_raw file

penguins_raw is then cleaned, by removing any NAs and renaming the headers to be consistent. The resulting dataset is saved as penguins_clean, and is preserved as penguins_clean.csv in the data_clean file

Using penguins_clean, a linear regression model is fitted between bill length and body mass
This model is graphically represented, and the resulting plot is saved to the figures file.
