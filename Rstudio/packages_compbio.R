source('/Rscripts/install_packages_function.R')

# packages for compbio
packages_to_install <- c(
  'bedr',
  'biomaRt',
  # 'BSgenome.Hsapiens.UCSC.hg19',
  # 'BSgenome.Mmusculus.UCSC.mm10',
  'ChIPseeker',
  'clusterProfiler',
  'DelayedArray',
  'DelayedMatrixStats',
  'DESeq2',
  'DiffBind',
  'edgeR',
  # 'EnsDb.Hsapiens.v75',
  # 'EnsDb.Mmusculus.v79',
  'fgsea',
  'GenomicFeatures',
  'GenomicRanges',
  'Libra',
  'msigdbr',
  'org.Hs.eg.db',
  'org.Mm.eg.db',
  'plyranges',
  'ReactomePA',
  'Rsamtools',
  'Rsubread',
  'TxDb.Hsapiens.UCSC.hg38.knownGene',
  'TxDb.Mmusculus.UCSC.mm10.knownGene',
  'tximport'
)

install_packages(packages_to_install)
