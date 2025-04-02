# process_airtable_data.R

# Load necessary libraries
library(httr)
library(jsonlite)

# Fetch data from Airtable
fetch_airtable_data <- function(api_key, base_id, table_name) {
    url <- sprintf("https://api.airtable.com/v0/%s/%s", base_id, table_name)
    response <- GET(url, add_headers(Authorization = sprintf("Bearer %s", api_key)))
    
    if (status_code(response) == 200) {
        data <- fromJSON(content(response, "text"))
        return(data$records)
    } else {
        stop("Failed to fetch data from Airtable")
    }
}

# Process the fetched data
process_data <- function(data) {
    # Example processing: Extract fields from records
    processed_data <- lapply(data, function(record) {
        record$fields
    })
    return(processed_data)
}

# Main execution
api_key <- Sys.getenv("AIRTABLE_PAT")
base_id <- "appAjIp3Kv6qyqGoU"
table_name <- "starwars"

# Fetch and process data
data <- fetch_airtable_data(api_key, base_id, table_name)
processed_data <- process_data(data)

# Print or save the processed data
print(processed_data)
