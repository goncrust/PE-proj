# Projeto de PE 3/10

library(dplyr)
library(ggplot2)
library(data.table)

setwd("~/Desktop/Uni/IST/2º Ano/2º Semestre/PE/Projeto/3-10")

# Lê os dados do ficheiro .txt
data <- fread("GENDER_EMP_19032023152556091.txt")

# Filtra as colunas e linhas indesejadas
data <- data %>% filter(grepl('ESP', COU))
data <- data %>% filter(grepl('EMP5', IND))
data <- data %>% filter(TIME == 2015)
colnames(data)[8] = "Age"

data = select(data, c(SEX, Age,  Value))

# Altera legendas para facilitar leitura do gráfico
data <- data %>% mutate(SEX = recode(SEX,
                                     ALL_PERSONS = "All",
                                     MEN = "M",
                                     WOMEN = "W"), 
                        Age = recode(Age, Total = "All"))

# Cria um gráfico de barras 
ggplot(data, aes(SEX, Value, fill=Age)) + 
  geom_bar(stat = "identity", position = position_dodge2(1)) +
  scale_y_continuous(limits = c(0,100)) +
  labs(title = "Percentage of people employed in part-time employment",
       subtitle = "By Sex and Age Group in Spain, 2015", caption = "Source: OCDE") +
  facet_grid(cols = vars(Age))
