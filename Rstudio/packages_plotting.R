source('/Rscripts/install_packages_function.R')

# packages for plotting
packages_to_install <- c(
  'alluvial',
  'circlize',
  'ComplexHeatmap',
  'cowplot',
  'ggalluvial',
  'ggbeeswarm',
  'ggdendro',
  'ggExtra',
  'ggforce',
  'ggpointdensity',
  'ggpubr',
  'ggraph',
  'ggrastr',
  'ggrepel',
  'ggridges',
  'ggsci',
  'ggsignif',
  'ggthemes',
  'jcolors',
  'paletteer',
  'patchwork',
  'pheatmap',
  'plotly',
  'prismatic',
  'RColorBrewer',
  'scico',
  'UpSetR',
  'VennDiagram',
  'viridis',
  'wesanderson'
)

install_packages(packages_to_install)
