# Monocle 3
BiocManager::install('cole-trapnell-lab/monocle3', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)

# seurat-wrapper & seuratDisk
remotes::install_github('satijalab/seurat-wrappers')
remotes::install_github("mojaveazure/seurat-disk")

# SCPA
devtools::install_version("crossmatch", version = "1.3.1", repos = "http://cran.us.r-project.org")
devtools::install_version("multicross", version = "2.1.0", repos = "http://cran.us.r-project.org")
devtools::install_github("jackbibby1/SCPA")