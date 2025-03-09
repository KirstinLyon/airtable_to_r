# test.R script

# Load required libraries
if (!require(rairtable)) {
    install.packages("rairtable")
    library(rairtable)
} else {
    library(rairtable)
}
library(readr)

# Retrieve the API key from the environment (this is injected by GitHub Actions)
api_key <- Sys.getenv("AIRTABLE_PAT")

# Check if the API key is present
if (api_key == "") {
    stop("ERROR: API Key not found! Ensure that the AIRTABLE_PAT secret is set in GitHub.")
} else {
    print("API Key successfully retrieved.")
}

# Define Airtable base and table
base_id <- "appn19UZdWMJDGQyD"       # Replace with your actual Base ID
table_name <- "test" # Replace with your actual Table Name

# Use rairtable package to pull data from Airtable
airtable_data <- read_airtable(base = base_id, table = table_name, token = api_key)

# Save the data to a CSV file
write_csv(airtable_data, "airtable_data.csv")

# Print success message
print("Data pulled successfully and saved as airtable_data.csv")


