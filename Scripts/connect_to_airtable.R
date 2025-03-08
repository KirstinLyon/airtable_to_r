library(tidyverse)
library(httr)
library(jsonlite)

#token <- 
    
#    https://airtable.com/appn19UZdWMJDGQyD/tbl6yiPXuuYHl4p64/viwK3Y7N0Nc7EKZ5H?blocks=hide

# Set your Airtable API credentials
personal_token <- "patk6waxUO69PLrzo.c5e8823b92cb1d1a7a7b6298c75d6550c92b012172f0e1fbfb09724c4617857a"  # Replace with your Airtable API key
base_id <- "appn19UZdWMJDGQyD"  # Replace with your Airtable Base ID
table_name <- "test"  # Replace with your table name


#https://api.airtable.com/v0/appn19UZdWMJDGQyD/TB_moz.csv


#api_key <- "your_api_key_here"  # Replace with your Airtable API key
#base_id <- "n19UZdWMJDGQyD"  # Base ID from the URL
#table_id <- "6yiPXuuYHl4p64"  # Table ID from the URL
#view_id <- "viwK3Y7N0Nc7EKZ5H"  # View ID from the URL (optional)

# Define the Airtable API endpoint
url <- paste0("https://api.airtable.com/v0/", base_id, "/", table_name)

#url <- "https://airtable.com/appn19UZdWMJDGQyD/tbl6yiPXuuYHl4p64/viwK3Y7N0Nc7EKZ5H?blocks=hide"

# Make a GET request to the Airtable API
response <- GET(
    url,
    add_headers(Authorization = paste("Bearer", personal_token))
)

cat(content(response, "text"))


# Check if the request was successful
if (status_code(response) == 200) {
    # Parse the JSON response
    data <- content(response, "text") %>%
        jsonlite::fromJSON(flatten = TRUE)
    
    # Extract the records into a data frame
    records <- data$records
    df <- records$fields
    
    # Print the data frame
    print(df)
} else {
    # Print an error message if the request failed
    cat("Error:", status_code(response), "\n")
    print(content(response, "text"))
}
