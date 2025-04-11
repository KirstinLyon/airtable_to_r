#PROJECT:  Push Random Indicator from World Bank DataBank to AirTable
#AUTHOR: Krstin Lyon
#PURPOSE This script pulls a random indicator from the World Bank DataBank and pushes it to AirTable
#LICENSE: MIT
#DATE: 2025-04-11


# LOAD LIBRARIES ---------------------------------------------------------
library(rairtable)
library(dplyr)
library(tidyr)
library(wbstats)

# GLOBAL VARIABLES ---------------------------------------------------------

# SADC countries
SADC <- c("COD", "AGO", "NAM", "ZAF", "LSO", "SWZ", 
          "BWA", "ZWE", "ZMB", "MOZ", "MWI", 
          "MDG", "COM", "SYC", "MUS")

START_YEAR = 2000
END_YEAR = 2025


# EXTRACT DATA FROM WORLD BANK -------------------------------------------

# Find indicators related to Tuberculosis
TB_HIV_indicators <- wbstats::wb_search("Tuberculosis|HIV")

# Select a random indicator
sample_indicator <- TB_HIV_indicators |> 
    sample_n(1) |> 
    select(indicator_id) |> 
    pull()


## Meta-data ----
indicators_metadata <- wbstats::wb_indicators() |> 
    select(indicator_id, indicator, indicator_desc, source_org) |> 
    filter(indicator_id == sample_indicator) 

# Get the data for the random indicator
wb_data_sample <- wbstats::wb_data(
    indicator = sample_indicator,
    country = SADC,
    start_date = START_YEAR,
    end_date = END_YEAR
)

## Convert to a long format ----
wb_data_sample <- wb_data_sample %>% 
    select(-c(obs_status, footnote, iso2c, unit)) |> 
    pivot_longer(!c(country, date, iso3c, last_updated),
                 names_to = "indicator_id",
                 values_to = "value")

## Combine to get the completed dataset
wb_data_final <- wb_data_sample |> 
    left_join(indicators_metadata, by = "indicator_id") 

write_csv(wb_data_final, "Dataout/wb_data_final.csv")



