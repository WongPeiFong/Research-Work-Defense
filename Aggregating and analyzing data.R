library(dplyr)

selected_epitopes <- epitopes %>%
  filter(Immunogenicity > 0, 
         Antigenicity == 1, 
         Non_Allergenic == 1, 
         Conservancy > 90)

print(selected_epitopes)
