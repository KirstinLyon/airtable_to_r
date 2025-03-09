library(rairtable)
library(tidyverse)



TABLE_NAME <- 'test'
PERSONAL_ACCESS_TOKEN<- "patk6waxUO69PLrzo.c5e8823b92cb1d1a7a7b6298c75d6550c92b012172f0e1fbfb09724c4617857a"
BASE_ID <- "appn19UZdWMJDGQyD"



#set your personal token
set_airtable_api_key(PERSONAL_ACCESS_TOKEN)

table <- airtable(TABLE_NAME, BASE_ID)

airtable_data <- read_airtable(table, id_to_col = TRUE, max_rows = 1000)


