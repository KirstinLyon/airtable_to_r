# Load required libraries
library(rairtable)
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
base_id <- "your_base_id"       # Replace with your actual Base ID
table_name <- "your_table_name" # Replace with your actual Table Name

# Initialize Airtable connection using the API key
table <- get_airtable(base = base_id, table = table_name, token = api_key)

# Fetch the data from Airtable
airtable_data <- read_airtable(table, id_to_col = TRUE, max_rows = 1000)

# Save the data to a CSV file
write_csv(airtable_data, "airtable_data.csv")

# Print success message
print("Data pulled successfully and saved as airtable_data.csv")