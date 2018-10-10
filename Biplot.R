data = read.csv2('C:/Users/polami05/Desktop/Nuria_paper_analysis/PCA_method.csv')
datta = data[,-c(1,2,3,4)]
str(datta)
library(ggfortify)
library(ggplot2)
normalized = scale(datta, center = TRUE, scale = TRUE)
row.names(normalized) = data$Group

pca = prcomp(normalized)


bipl = autoplot(prcomp(normalized), datta = normalized, colour = 'black', size = 3,
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 3,loadings.label.vjust = 1,loadings.label.hjust = -0.2)
bipl
#ggsave('C:/Users/polami05/Desktop/biplot_version_1.tiff',  width = 15, height = 10, dpi = 100)

library(ggbiplot)
g <- ggbiplot(pca, obs.scale = 1, var.scale = 0.7,  ellipse = FALSE, circle = FALSE)
print(g)
#ggsave('C:/Users/polami05/Desktop/biplot_version_2.tiff',  width = 15, height = 10, dpi = 100)


#install.packages("factoextra")
library(factoextra)

fviz_pca_biplot(pca , axes = c(1,2), repel = TRUE,palette = c("#999999", "#E69F00", "#56B4E9"))
ggsave('C:/Users/polami05/Desktop/best_biplot.tiff',  width = 15, height = 10, dpi = 200)

fviz_pca_ind(pca,col.ind = "#FC4E07",repel=TRUE)
ggsave('C:/Users/polami05/Desktop/Individuals.tiff',  width = 15, height = 10, dpi = 200)

