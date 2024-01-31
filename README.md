# Toronto-Bike-Theft
 Repository for exploring bike theft data in Toronto
 
## Overview

In this project I explore the relationship between bike theft numbers, and year. This data is further examined through the lense of urban vs suburban infustructure.

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## How to Run

- Run scripts/00-simulate_data.R to simulate envisioned data
- Run scripts/01-download_data.R to download raw data from opendatatoronto
- Run scripts/02-data_cleaning.R to generate cleaned data
- Render outputs/paper/paper.qmd to generate the PDF of the paper

## LLMs

Statement on LLM usage: Aspects of my R code were written and edited with the assistance of the chat. The chat history with both models are available in inputs/llms
