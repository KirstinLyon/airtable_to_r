# Access the GitHub PAT from environment variables
github_pat <- Sys.getenv("GITHUB_PAT")

# Use the PAT for authentication
library(httr)
headers <- c(`Authorization` = paste("token", github_pat))

# Make a GET request to GitHub API
response <- GET("https://api.github.com/user", add_headers(.headers = headers))

# Check the response
print(content(response))
