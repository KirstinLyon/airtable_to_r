#PROJECT: Auaomate Airtable to R connection
#AUTHOR: Kirstin Lyon
#PURPOSE: To connect to airtable with a personal access token stored in GitHub
#LICENSE: MIT License
#DATE: 2021-07-07
#UPDATED:

# LOAD LIBRARIES ----------------------------------------------------------
library(rairtable)
library(dplyr)
library(readr)

# GLOBAL VARIABLES ----------------------------------------------------------
TABLE_NAME <- 'starwars'  #name of table in Airtable
PERSONAL_ACCESS_TOKEN<- Sys.getenv("AIRTABLE_PAT")  #personal access token stored in GitHub
BASE_ID <- "appAjIp3Kv6qyqGoU"  #base id of table in Airtable

# Validate API key
if (PERSONAL_ACCESS_TOKEN == "") {
    stop("No Airtable API key set. Use `airtable_api_key()` to set your API key.")
}

# READ DATA ---------------------------------------------------------------------

tryCatch({
    rairtable::set_airtable_api_key(PERSONAL_ACCESS_TOKEN, install = TRUE)
    cat("API key set successfully.\n")
    
    data <- rairtable::airtable(TABLE_NAME, BASE_ID)
    cat("Fetched table metadata successfully.\n")
    
    all_data <- rairtable::read_airtable(data, id_to_col = TRUE, max_rows = 1000)
    cat("Fetched data successfully.\n")
    
    write_csv(all_data, "Dataout/starwars.csv")
    cat("Data written to Dataout/starwars.csv successfully.\n")
    
}, error = function(e) {
    cat("An error occurred: ", e$message, "\n")
    stop(e)
})

