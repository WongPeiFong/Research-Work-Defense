install_github("richelbilderbeek/netmhc2pan")
library(netmhc2pan)
install_netmhc2pan("Link")
fasta_filename <- system.file(
  "extdata", "example.fasta", package = "netmhc2pan"
)
# NetMHCIIpan supports more than 5000 alleles:
all_alleles <- get_netmhc2pan_alleles()
testit::assert(length(all_alleles) > 5000)
# select HLA
alleles <- all_alleles[1:300]
bindings <- run_netmhcpan(
  fasta_filename = fasta_filename,
  alleles = alleles
)
knitr::kable(bindings)
