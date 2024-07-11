# Exploration
# file path needs to be changed for reading the data
protein_data <- read.csv("/Users/stanislav_puscasu/Downloads/PCA Protein data.csv")

protein_data

# show the first 5 rows
head(protein_data)

dimension <- dim(protein_data)
n_rows <- dimension[1]
n_cols <- dimension[2]

cat("Number of rows:", n_rows, "\n")
cat("Number of columns:", n_cols, "\n")

str(protein_data)

colSums(is.na(protein_data))

install.packages("corrr")
library("corrr")

# Select numerical columns
numerical_data <- protein_data[,2:10]
head(numerical_data)

# Normalize the data
data_normalized <- scale(numerical_data)
head(data_normalized)

# Compute the correlation matrix
corr_matrix <- cor(data_normalized)
corr_matrix

# Install and load the package for plotting the matrix as heatmap.
install.packages("ggcorrplot")
library(ggcorrplot)

ggcorrplot(corr_matrix)

# Applying PCA

install.packages("FactoMineR")
install.packages("factoextra")

library("FactoMineR")
library("factoextra")

# Apply PCA
data.pca <- princomp(corr_matrix)

# Summary of the PCA analysis
summary(data.pca)

str(data.pca)

# Check the loadings of the first two components.
data.pca$loadings[, 1:2]

# Plot the result
library(devtools)
install_github("vqv/ggbiplot")

fviz_eig(data.pca, addlabels = TRUE)

# Graph of the variables
fviz_pca_var(data.pca, col.var = "black")

fviz_cos2(data.pca, choice = "var", axes = 1:2)

fviz_pca_var(data.pca, col.var = "cos2",
             gradient.cols = c("black", "orange", "green"),
             repel = TRUE)
