# I am using a simple Excel personal monthly expenses file from IBM Data analysis course  on Cousera 
# reading Excel file into R
library(readxl)
library(dplyr)
library (ggplot2)
library (plotly)
expenses <- read_excel("C:/Users/user/Documents/Coursera/Personal_Monthly_Expenditure.xlsx")
View(expenses)
summary(expenses)
# Check for missing values
missing_values <- expenses %>% summarise_all(~sum(is.na(.)))
missing_values
# Check for duplicates
duplicate_records <- expenses %>% filter(duplicated(.))
duplicate_records
class(expenses)
head(expenses$Housing, 3)
# Reorder the category based on value in descending order
expenses$Month <- reorder(expenses$Month, -expenses$`Bills & Utilities`)
# Create a column chart
ggplot(expenses, aes(x = expenses$Month, y = expenses$'Bills & Utilities', fill = Month)) +
  geom_col() +
  geom_text(aes(label =expenses$`Bills & Utilities`), vjust = -0.3) +  # Add labels
  labs(title = "Bills & Utilities Per Month ", x = "Month", y = " Bills & Utilities") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3")  # Custom color palette
# Save the plot

# Create a pie chart
pie_chart <- plot_ly(data = expenses, 
                     labels = ~Month, 
                     values = ~`Health & Fitness`, 
                     type = 'pie') %>%
  layout(title = "Money Spent on Health & Fitness Per Month")

# Display the pie chart
pie_chart