#PROJECT: Auaomate Airtable to R connection
#AUTHOR: Kirstin Lyon
#PURPOSE: To connect to airtable with a personal access token stored in GitHub
#LICENSE: MIT License
#DATE: 2021-07-07
#UPDATED:

# LOAD LIBRARIES ----------------------------------------------------------
library(rairtable)
library(dplyr)





# GLOBAL VARIABLES ----------------------------------------------------------
TABLE_NAME <- 'starwars'  #name of table in Airtable
PERSONAL_ACCESS_TOKEN<- Sys.getenv("AIRTABLE_PAT")  #personal access token stored in GitHub
BASE_ID <- "appAjIp3Kv6qyqGoU"  #base id of table in Airtable

# Validate API key
if (PERSONAL_ACCESS_TOKEN == "") {
    stop("No Airtable API key set. Use `airtable_api_key()` to set your API key.")
}

# READ DATA ---------------------------------------------------------------------

rairtable::set_airtable_api_key(PERSONAL_ACCESS_TOKEN, install = TRUE)

data <- rairtable::airtable(TABLE_NAME, BASE_ID)

all_data <- rairtable::read_airtable(data, id_to_col = TRUE, max_rows = 1000)

