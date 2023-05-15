# Loading necessary libraries
library("ggplot2");

# Loading data from csv into a data frame
gender_emp <- read.table("GENDER_EMP_19032023152556091.txt", header=TRUE, sep="\t");

# Selecting the data to be used
data <- gender_emp[gender_emp$IND == "EMP2",];
data <- gender_emp[gender_emp$COU == "USA" & gender_emp$TIME == 2000,];
data <- gender_emp[gender_emp$AGE == 1524 | gender_emp$AGE == 2554 | gender_emp$AGE == 5564,];

# Visualizing the data
ggplot(data, aes(x = Age.Group, y = Value)) +
  geom_col(fill = "steelblue", width = 0.5) +
  labs(x = "Age Group", y = "Value") +
  ggtitle("EMP2 value by age group") +   theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, hjust = 1))
