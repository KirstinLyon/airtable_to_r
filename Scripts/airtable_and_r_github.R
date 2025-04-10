#PROJECT: Auaomate Airtable to R connection
#AUTHOR: Kirstin Lyon
#PURPOSE: To connect to airtable with a personal access token stored in GitHub
#LICENSE: MIT License
#DATE: 2021-07-07
#UPDATED:

# LOAD LIBRARIES ----------------------------------------------------------
library(rairtable)
library(readr)

# GLOBAL VARIABLES ----------------------------------------------------------
TABLE_NAME <- 'starwars'  # name of table in Airtable
PERSONAL_ACCESS_TOKEN <- Sys.getenv("AIRTABLE_PAT")  # personal access token stored in GitHub
BASE_ID <- Sys.getenv("AIRTABLE_BASE_ID")  # base id of table in Airtable

# Set Airtable API key in environment
Sys.setenv(AIRTABLE_API_KEY = PERSONAL_ACCESS_TOKEN)

# Validate API key
if (PERSONAL_ACCESS_TOKEN == "") {
    stop("No Airtable API key set. Use `airtable_api_key()` to set your API key.")
} else {
    cat("Airtable API key is set.\n")
}

# READ DATA ---------------------------------------------------------------------

tryCatch({
    cat("Setting Airtable API key...\n")
    rairtable::set_airtable_api_key(PERSONAL_ACCESS_TOKEN, install = TRUE)
    cat("API key set successfully.\n")
    
    cat("Fetching table metadata...\n")
    data <- rairtable::airtable(TABLE_NAME, BASE_ID)
    cat("Fetched table metadata successfully.\n")
    
    cat("Reading data from Airtable...\n")
    all_data <- rairtable::read_airtable(data, id_to_col = TRUE, max_rows = 1000)
    cat("Fetched data successfully.\n")
    
    cat("Writing data to CSV...\n")
    # Need to include since it's being saved as an artefact
    write_csv(all_data, "Dataout/starwars.csv")
    cat("Data written to Dataout/starwars.csv successfully.\n")
    
}, error = function(e) {
    cat("An error occurred: ", e$message, "\n")
    stop(e)
})

