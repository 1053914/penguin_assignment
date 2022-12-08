# Statistical test for Q4 of penguin assignment

# -------------
# Header code to access libraries
library(palmerpenguins)
library(ggplot2)
library(janitor)
library(dplyr)
library(ragg)
library(svglite)

# -------------
# Define cleaning() function
cleaning <- function(data_raw) {
  data_raw %>%
    clean_names() %>%
    remove_empty(c("rows", "cols")) %>%
    select(-starts_with("delta")) %>%
    select(-comments) %>%
    na.omit()
}

# -------------
# Define plot_regression() function
plot_regression <- function(penguins_clean) {
  penguins_clean %>%
    ggplot(aes(x = body_mass_g, y = culmen_length_mm)) +
    geom_point() +
    stat_smooth(method = "lm", col = "red") +
    labs(x = "Body mass (g)", 
         y = "Bill length (mm)", 
         title = "Linear Regression of Bill length against Body mass")
}

# -------------
# Define save_plot_png() function
save_plot_png <- function(penguins_clean, filename, size, res, scaling) {
  agg_png(filename, width   =  size, 
          height  =  size, 
          units   =  "cm", 
          res     =  res, 
          scaling =  scaling)
  regression_plot <- plot_regression(penguins_clean)
  print(regression_plot)
  dev.off()
}

# -------------
# Define save_plot_svg() function
save_plot_svg <- function(penguins_clean, filename, size, scaling) {
  size_inches = size/2.54
  svglite(filename, width   = size_inches, 
          height  = size_inches, 
          scaling = scaling)
  regression_plot <- plot_flipper_figure(penguins_flippers)
  print(flipper_boxplot)
  dev.off()
}

# -------------
# Check penguins_raw is correctly loaded
penguins_raw

# Preserve the penguins_raw in the "data_raw" file in the "penguin_assignment" directory
write.csv(penguins_raw, "data_raw/penguins_raw.csv")

# Clean penguins_raw headers and remove NAs in bill length, bill depth, flipper length, and body mass, and store the cleaned dataset in "penguins_clean"
# Write that dataset to a new csv file called "penguins_clean.csv" in the file "data_clean"
penguins_clean <- cleaning(penguins_raw)
write.csv(penguins_clean, "data_clean/penguins_clean.csv")

# Run a statistical test to investigate the relationship between body mass and bill length, and generate the results
body_mass_bill_length_model <- lm(culmen_length_mm ~ body_mass_g, data = penguins_clean)
summary(body_mass_bill_length_model)

# Generate a scatter diagram showing this linear regression in ggplot
plot <- plot_regression(penguins_clean)
plot

# Save scatter plot in a file called "regression_plot.png" in the "figures" file
save_plot_png(penguins_clean, "figures/regression_plot.png", size = 15, res = 600, scaling = 1)

# Save scatter plot in a file called "regression_plot.svg in the "figures" file
save_plot_svg(penguins_clean, "figures/regression_plot.svg", size = 15, scaling = 1)
