# Projeto de PE 2/10
# Francisco Fonseca
# Nº 102492

library(readxl)
library(dplyr)
library(ggplot2)

# Lê o ficheiro dado e elimina todos os dados referentes a África do Sul
data = read.csv('TIME_USE_24092022.csv') 
data <- data %>% filter(!grepl('África do Sul', País))

# Mantém apenas dados de sexo = Total e 
# Ocupação = (Cuidados Pessoais) ou (Trabalho Remunerado ou estudo)
data <- data %>% filter(grepl('Total', Sexo))

data <- data %>% filter(grepl('Trabalho remunerado ou estudo|Cuidados pessoais', Ocupação))

ggplot(data, aes(x = Ocupação, y = Tempo, fill=Ocupação)) +
  geom_boxplot(width = 0.5) +
  labs(title = "Tempo Médio Diário Dispendido por Atividade",
       caption = "Source: OCDE") +
  theme(plot.title = element_text(hjust = 0.5))


