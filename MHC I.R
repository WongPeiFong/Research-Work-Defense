library(netmhcpan)
fasta_filename <- system.file(
  "extdata", "example.fasta", package = "netmhcpan"
)
all_alleles <- get_netmhcpan_alleles()
testit::assert(length(all_alleles) > 5000)
alleles <- all_alleles[1:300]
bindings <- run_netmhcpan(
  fasta_filename = fasta_filename,
  alleles = alleles
)
knitr::kable(bindings)
