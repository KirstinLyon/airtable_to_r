# Load necessary libraries
#library(httr)

# Retrieve the PAT from GitHub Secrets
#AIRTABLE_PAT <- Sys.getenv("AIRTABLE_PAT")

# Check if the PAT is available
#if (AIRTABLE_PAT == "") {
#    stop("GitHub PAT not found. Please ensure it is set in GitHub Secrets.")
#}

# Use the PAT to authenticate with the GitHub API
#response <- GET(
#    url = "https://api.github.com/user",
#    add_headers(Authorization = paste("token", github_pat))
#)

# Check the response
#if (status_code(response) == 200) {
#    user_info <- content(response)
#    cat("Authenticated as:", user_info$login, "\n")
#} else {
#    cat("Failed to authenticate. Status code:", status_code(response), "\n")
#}


#----------------------------------

# Load necessary libraries
if (!require(httr)) {
    install.packages("httr", repos = "https://cloud.r-project.org")
    library(httr)
}

# Retrieve the Airtable PAT from GitHub Secrets
AIRTABLE_PAT <- Sys.getenv("AIRTABLE_PAT")

# Check if the PAT is available
if (AIRTABLE_PAT == "") {
    stop("Airtable PAT not found. Please ensure it is set in GitHub Secrets.")
}

# Airtable API details
BASE_ID <- "appn19UZdWMJDGQyD"  #base id of table in Airtable
TABLE_NAME <- 'test'  #name of table in Airtable
airtable_url <- paste0("https://api.airtable.com/v0/", base_id, "/", table_name)

# Make a GET request to the Airtable API
response <- GET(
    url = airtable_url,
    add_headers(Authorization = paste("Bearer", AIRTABLE_PAT))
)

# Check the response
if (status_code(response) == 200) {
    data <- content(response, "parsed")
    cat("Successfully retrieved data from Airtable:\n")
    print(data)
} else {
    cat("Failed to retrieve data. Status code:", status_code(response), "\n")
    cat("Response content:", content(response, "text"), "\n")
}

