library(tidyverse)
library(readxl)

path = "C:/Users/Valued Customer/Downloads/6160055001_do003.xlsx"

list = excel_sheets(path)

list = list[list != 'Contents']
list

read_all_sheets <- function(list) {
  read_excel(path, sheet = list)
}

lapply(list, read_all_sheets)
