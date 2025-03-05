tar -xvzf netMHCIIpan-4.1a.Linux.tar.gz
cd netMHCIIpan-4.1a
chmod +x netMHCIIpan

library(netmhc2pan)
fasta_filename <- system.file(
  "extdata", "example.fasta", package = "netmhc2pan"
)
all_alleles <- get_netmhc2pan_alleles()
testit::assert(length(all_alleles) > 5000)
alleles <- all_alleles[1:300]
bindings <- run_netmhcpan(
  fasta_filename = fasta_filename,
  alleles = alleles
)
knitr::kable(bindings)
