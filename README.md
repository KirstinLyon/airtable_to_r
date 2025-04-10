# Overview

This project integrates Airtable, R and GitHub to automate fetching of data. It emphasizes security and automation, utilizing GitHub Secrets for managing sensitive tokens and GitHub Actions for continuous integration.

## Features

-   **Airtable Integration**: Effortlessly connect to Airtable for data retrieval and updates.

-   **Secure Token Management**: Store API tokens securely using GitHub Secrets.

-   **Automated Workflows**: Using GitHub Actions for automated testing and deployment.

-   **R-based Data Analysis**: Use R to extract data for later use.

## Getting Started

### Prerequisites

-   R and RStudio/or preferred IDE installed.

-   An Airtable account and Personal Access Token.

-   Basic familiarity with Git and GitHub.

### Installation

1.  **Clone the Repository**:

``` r
git clone https://github.com/your-username/your-repo.git cd your-repo
```

2.  **Install Required Packages**:

``` r
install.packages(c("airtable", "dplyr", "readr"))
```

3.  **Set Up GitHub Secrets**:

-   Navigate to your GitHub repository.

-   Go to `Settings` \> `Secrets and variables` \> `Actions`.

-   Add a new secret named `AIRTABLE_PAT` with your Airtable Personal Access Token.

-   Add a new secret named AIRTABLE_BASE_ID with your Airtable base_id.

## Configuration

There are two scripts: The script "airtable_and_r_simple" is where you hard-code the values. This is useful for test purposes, but not to be shared. The script "airtable_and_r_github" pulls credentials from GitHub secrets and is more secure.

Update the R script "airtable_and_r_simple" with your table name, base_id and personal access token.

``` r
TABLE_NAME <- "your_table_name" # Replace with your actual table name
PERSONAL_ACCESS_TOKEN <- "your_personal_access_token" # Replace with your actual personal access token
BASE_ID <- "your_base_id" # Replace with your actual base ID
```

Update the R script "airtable_and_r_github" with your table name.

``` r
TABLE_NAME \<- 'starwars' \# name of table in Airtable
```

### Usage

-   **Run the Analysis (only airtable_and_r_simple)**: Open the project in your IDE and execute the `main.R` script to run the data analysis pipeline. This is useful for testing your script.

-   **GitHub Actions**: The R script "airtable_and_r_github" is used by the the workflow. The workflow is set to run each midnight or when triggered manually. Customize the workflow file `.github/workflows/fetch_airtable_data.yml` as needed.

## License

This project is licensed under the MIT License. See the [LICENSE](https://chat.mistral.ai/chat/LICENSE) file for details.

## Contact

For any questions or issues, please open an issue on the GitHub repository or contact the project maintainer.
