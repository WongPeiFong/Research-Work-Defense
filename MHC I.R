install_github("tzina97/netMHCpan")
library(netmhcpan)
install_netmhcpan("UPDATE LINK")
fasta_filename <- system.file(
  "extdata", "example.fasta", package = "netmhcpan"
)
# NetMHCIIpan supports more than 5000 alleles:
all_alleles <- get_netmhcpan_alleles()
testit::assert(length(all_alleles) > 5000)
# select alleles
alleles <- all_alleles[1:300]
bindings <- run_netmhcpan(
  fasta_filename = fasta_filename,
  alleles = alleles
)
knitr::kable(bindings)
