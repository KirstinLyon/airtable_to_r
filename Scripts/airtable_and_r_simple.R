#PROJECT:  Automate Airtable to R connection
#AUTHOR: Kirstin Lyon
#PURPOSE:  To automate a connection between Airtable and R
#LICENSE:  MIT License
#DATE:  2021-07-07
#UPDATED:

# LOAD LIBRARIES ----------------------------------------------------------

library(rairtable)

# GLOBAL VARIABLES ----------------------------------------------------------

TABLE_NAME <- "your_table_name" # Replace with your actual table name
PERSONAL_ACCESS_TOKEN <- "your_personal_access_token" # Replace with your actual personal access token
BASE_ID <- "your_base_id" # Replace with your actual base ID


# READ IN DATA -------------------------------------------------------------

#set your personal token
set_airtable_api_key(PERSONAL_ACCESS_TOKEN)

# Pull table
table <- airtable(TABLE_NAME, BASE_ID)

# Read data from Airtable
airtable_data <- read_airtable(table, id_to_col = TRUE, max_rows = 1000)

