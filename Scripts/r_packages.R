# Set library path to the cached directory
.libPaths(Sys.getenv("R_LIBS_USER"))

# Load packages
library(dplyr)
library(readr)

# Your script logic here
print("Packages loaded successfully!")