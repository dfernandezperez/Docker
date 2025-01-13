source('/Rscripts/install_packages_function.R')

# packages for single cell analysis
# force package multtest to avoid installation error when it's required as dependency
packages_to_install <- c(
  'destiny',
  'DropletUtils',
  'glmGamPoi',
  'phateR',
  'Seurat',
  'scater',
  'scde',
  'scDblFinder',
  'SCpubr',
  'scran',
  'sctransform',
  'SingleR',
  'slingshot',
  'UCell'
)

install_packages(packages_to_install)

# alternative location for R packagesq
place_for_other_libraries <- '/other_R_libraries'
dir.create(place_for_other_libraries, recursive = TRUE)
