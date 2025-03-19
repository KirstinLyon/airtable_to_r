# Load necessary libraries
library(httr)

# Retrieve the PAT from GitHub Secrets
AIRTABLE_PAT <- Sys.getenv("AIRTABLE_PAT")

# Check if the PAT is available
if (AIRTABLE_PAT == "") {
    stop("GitHub PAT not found. Please ensure it is set in GitHub Secrets.")
}

# Use the PAT to authenticate with the GitHub API
response <- GET(
    url = "https://api.github.com/user",
    add_headers(Authorization = paste("token", github_pat))
)

# Check the response
if (status_code(response) == 200) {
    user_info <- content(response)
    cat("Authenticated as:", user_info$login, "\n")
} else {
    cat("Failed to authenticate. Status code:", status_code(response), "\n")
}


