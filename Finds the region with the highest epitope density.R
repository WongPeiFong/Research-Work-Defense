library(dplyr)

window_size <- 100

max_epitopes <- 0
best_start <- 0

for (start in min(epitopes$Start_Position):(max(epitopes$Start_Position) - window_size)) {
  count <- sum(epitopes$Start_Position >= start & epitopes$Start_Position < (start + window_size))
  
  if (count > max_epitopes) {
    max_epitopes <- count
    best_start <- start
  }
}

best_region <- epitopes %>%
  filter(Start_Position >= best_start & Start_Position < (best_start + window_size))

cat("Best 100-aa region starts at position:", best_start, "\n")
cat("Number of epitopes in this region:", max_epitopes, "\n")
print(best_region)
