#PROJECT:  Automate Airtable to R connection
#AUTHOR: Kirstin Lyon
#PURPOSE:  To automate a connection between Airtable and R
#LICENSE:  MIT License
#DATE:  2021-07-07
#UPDATED:

# LOAD LIBRARIES ----------------------------------------------------------

library(rairtable)
library(readr)
library(dplyr)



# GLOBAL VARIABLES ----------------------------------------------------------
#TABLE_NAME <- 'test'
#PERSONAL_ACCESS_TOKEN<- "patk6waxUO69PLrzo.c5e8823b92cb1d1a7a7b6298c75d6550c92b012172f0e1fbfb09724c4617857a"
#BASE_ID <- "appn19UZdWMJDGQyD"


TABLE_NAME <- "your_table_name" # Replace with your actual table name
PERSONAL_ACCESS_TOKEN <- "your_personal_access_token" # Replace with your actual personal access token
BASE_ID <- "your_base_id" # Replace with your actual base ID


# READ IN DATA -------------------------------------------------------------

#set your personal token
set_airtable_api_key(PERSONAL_ACCESS_TOKEN)

table <- airtable(TABLE_NAME, BASE_ID)

airtable_data <- read_airtable(table, id_to_col = TRUE, max_rows = 1000)

write_csv(airtable_data, "Dataout/data.csv")
