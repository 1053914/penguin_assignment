# penguin_assignment

The file "penguin_assignment.r" contains the script used to load the data, run the statistical analysis, and generate and save the plots.

Once the libraries are loaded and the functions are defined, the "penguins_raw" data from the Palmer Penguins package is saved to "penguins_raw.csv" to preserve it in the "data_raw" file.

"penguins_raw" is then cleaned by removing any relevant NAs and renaming the headers to be consistent. The resulting dataset is saved as "penguins_clean", and is preserved as "penguins_clean.csv" in the "data_clean" file

Using "penguins_clean", a linear regression model is fitted between bill length and body mass, and the results are generated.

This model is graphically represented with a scatter plot, and the linear regression model is shown as a red line. The resulting plot is saved to the "figures file" as a png and/or svg file called "regression_plot".
