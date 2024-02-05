
# Monocle 3
# devtools::install_url('https://cran.r-project.org/src/contrib/Archive/Matrix.utils/Matrix.utils_0.9.7.tar.gz')
BiocManager::install('cole-trapnell-lab/monocle3', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)

# cisTopic
BiocManager::install('aertslab/cisTopic', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)

# seurat-wrapper & seuratDisk
BiocManager::install('satijalab/seurat-wrappers', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)
remotes::install_github("mojaveazure/seurat-disk")

# metacell
BiocManager::install('metacell', site_repository = 'tanaylab.bitbucket.io/repo', quiet = TRUE)

# Cicero
BiocManager::install('Gviz', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)
remotes::install_github('cole-trapnell-lab/cicero-release', ref = 'monocle3')

# Signac
remotes::install_github("stuart-lab/signac", ref = "develop")

# Doublet finder
remotes::install_github('chris-mcginnis-ucsf/DoubletFinder')

# Seurat 5 performance
setRepositories(ind = 1:3, addURLs = c('https://satijalab.r-universe.dev', 'https://bnprks.r-universe.dev/'))
install.packages(c("BPCells", "presto", "glmGamPoi"))

