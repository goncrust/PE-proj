# Loading data from csv into a data frame
time_use <- read.csv("TIME_USE_24092022.csv", header=TRUE);

# Selecting the data to be used
data <- time_use[time_use$País != "África do Sul",];
data <- data[data$Sexo == "Total",];
data <- data[data$Ocupação == "Trabalho não remunerado" | data$Ocupação == "Cuidados pessoais",];

# Visualizing the data
boxplot(Tempo ~ Ocupação, data = data, 
        col = "lightblue", border = "darkblue",
        outlier.col = "black", outlier.bg = "red",
        xlab = "Ocupação", ylab = "Tempo");
par(las = 2)