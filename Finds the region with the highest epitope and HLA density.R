window_size <- 100

max_epitopes <- 0
max_hla_count <- 0
best_start <- 0

for (start in min(epitopes$Start_Position):(max(epitopes$Start_Position) - window_size)) {
  # Filter epitopes in the window
  region_epitopes <- epitopes %>%
    filter(Start_Position >= start & Start_Position < (start + window_size))
  
  epitope_count <- nrow(region_epitopes)
  
  hla_count <- length(unique(unlist(strsplit(paste(region_epitopes$HLA_Alleles, collapse = ","), ", "))))
  
  if (epitope_count > max_epitopes || (epitope_count == max_epitopes && hla_count > max_hla_count)) {
    max_epitopes <- epitope_count
    max_hla_count <- hla_count
    best_start <- start
  }
}

best_region <- epitopes %>%
  filter(Start_Position >= best_start & Start_Position < (best_start + window_size))

cat("Best 100-aa region starts at position:", best_start, "\n")
cat("Number of epitopes in this region:", max_epitopes, "\n")
cat("Number of unique HLA alleles in this region:", max_hla_count, "\n")
print(best_region)
