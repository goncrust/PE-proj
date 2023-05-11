# Loading necessary libraries
library("openxlsx");
library("ggplot2");

# Loading data from excel into a data frame
econ <- read.xlsx("econ.xlsx", sheet=1, detectDates=TRUE);

# Selecting the data to be used
data <- econ[econ$tempo >= "1971-01-01",][c("ddesemp", "tpp", "tempo")];
attach(data); # Placing data frame in search path for easier variable access

# Constants
ddesemp_mean <- mean(ddesemp);
ddesemp_sd <- sd(ddesemp);
tpp_mean <- mean(tpp);
tpp_sd <- sd(tpp);

# Calculating the desired values
data$ddesemp <- (ddesemp - ddesemp_mean)/ddesemp_sd;
data$tpp <- (tpp - tpp_mean)/tpp_sd;

# Visualizing the data
ggplot(data, aes(x=tempo)) +
  geom_line(aes(y=tpp), linewidth=1, color='blue') +
  geom_line(aes(y=ddesemp), linewidth=1, color='red') +
  scale_y_continuous(name = "Taxa de Poupança Pessoal", sec.axis = sec_axis(~.,name="Duração Mediana do Desemprego (semanas)")) + 
  theme(
    axis.title.x = element_text(color = 'black', size=13),
    axis.text.y = element_blank(),
    axis.title.y = element_text(color = 'blue', size=13),
    axis.title.y.right = element_text(color = 'red', size=13),
  );

detach() # Cleaning up