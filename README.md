# SSMD: A semi-supervised approach for a robust identification of cell types and deconvolution of mouse transcriptomics data

## Description

Deconvolution of mouse transcriptomic data is challenged by the fact that mouse models carry various genetic and physiological perturbations, making it questionable to assume fixed cell types and cell type marker genes for different dataset scenarios. We developed a **S**emi-**S**upervised **M**ouse data **D**econvolution (SSMD) method to study the mouse tissue microenvironment (TME). SSMD is featured by (i) a novel non-parametric method to discover data set specific cell type signature genes; (ii) a community detection approach for fixing cell types and their marker genes; (iii) a constrained matrix decomposition method to solve cell type relative proportions that is robust to diverse experimental platforms. In summary, SSMD addressed several key challenges in the deconvolution of mouse tissue data, including: (1) varied cell types and marker genes caused by highly divergent genotypic and phenotypic conditions of mouse experiment, (2) diverse experimental platforms of mouse transcriptomics data, (3) small sample size and limited training data source, and (4) capable to estimate the proportion of 35 cell types in blood, inflammatory, central nervous or hematopoietic systems. In silico and experimental validation of SSMD demonstrated its high sensitivity and accuracy in identifying (sub) cell types and predicting cell proportions comparing to state-of-the-arts methods. A user-friendly R package and a web server of SSMD are released via https://ssmd.ccbb.iupui.edu.

![](./README.png)

## Installation

```
install.packages("devtools")
devtools::install_github("zy26/SSMD")
```

## Usage

```
estimate.proportion <- function(data, lambda = lambda)
```

## Arguments

* `data`        input gene expression matrix. MGI gene symbol should be as their row names
* `parameter`   threshold of mean correlation to define rank-1 co-expression module

## Value

An object of class is also invisibly returned. This is a list containing
the following components:

* `Stat_all`      statistics for all rank-1 co-expression module. `CT`: cell type; mean: mean correlation inside the module; `Core_overlap_number`: Overlap number with core marker list; `Core_overlap_rate`: overlap rate with core marker list; `BCV_rank`: bcv rank of the first base
* `module_keep`   modules with the high overlap number with core marker list for each cell type
* `proportion`     estimated proportion for each cell type

## Examples

```
#load your own gene expression data
load('example_bulk.RData')
estimate.proportion(data, lambda = 0.8)
```
