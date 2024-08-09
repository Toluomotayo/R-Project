# Load the required packages
library(rvest)
library(tidyverse)
# Specify the URL
url <- "https://en.wikipedia.org/wiki/List_of_largest_companies_in_Europe_by_revenue"
# Read the HTML content
page <- read_html(url)
# Extract the tables
tables <- page %>% 
  html_nodes("table") %>%
  html_table()
# Select the second table
second_table <- tables[[2]]
# Inspect and save to CSV
View(second_table)
head(second_table,10)
tail(second_table)
the_industry <- second_table$Industry
the_industry
# to view a particular column
# Write the data to a CSV file
write_csv(data, "largest_european_companies.csv")