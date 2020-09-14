# SSMD: Semi-Supervised Mouse data Deconvolution 
## Description

Deconvolution of mouse transcriptomic data is challenged by the fact that mouse models carry various genetic and physiological perturbations, making it questionable to assume fixed cell types and cell type marker genes for different dataset scenarios. We developed a **S**emi-**S**upervised **M**ouse data **D**econvolution (**SSMD**) method to study the mouse tissue microenvironment (TME). SSMD is featured by (i) a novel non-parametric method to discover data set specific cell type signature genes; (ii) a community detection approach for fixing cell types and their marker genes; (iii) a constrained matrix decomposition method to solve cell type relative proportions that is robust to diverse experimental platforms. In summary, SSMD addressed several key challenges in the deconvolution of mouse tissue data, including: (1) varied cell types and marker genes caused by highly divergent genotypic and phenotypic conditions of mouse experiment, (2) diverse experimental platforms of mouse transcriptomics data, (3) small sample size and limited training data source, and (4) capable to estimate the proportion of 35 cell types in blood, inflammatory, central nervous or hematopoietic systems. In silico and experimental validation of SSMD demonstrated its high sensitivity and accuracy in identifying (sub) cell types and predicting cell proportions comparing to state-of-the-arts methods. A user-friendly web server of SSMD are released via https://ssmd.ccbb.iupui.edu.

![](./README.png)

## Installation

```
#install.packages("nnls")

#install.packages("devtools")

devtools::install_github("xiaoyulu95/SSMD")
```

## Usage

```
estimate.proportion <- SSMD(bulk_data=example_bulk,tissue = 'Inflammatory')
```

## Arguments

* `bulk_data`    Input bulk tissue gene expression matrix. MGI gene symbol should be as their row names
* `tissue`   Tissue type of gene expression data, which can be `"Inflammatory"`, `"Central Nervous System"`, `"Hematopoietic System"` or `"Blood"`.


## Value

An object of class is also invisibly returned. This is a list containing
the following elements:

* `Proportion`    Estimated proportion for each identified cell type
* `marker_gene`    Gene modules used as markers for each predicted cell type
* `Escore`    Explanation Score for each marker genes used in deconvolution


## Examples

```
#load bulk tissue gene expression data 
# Example bulk tissue data can be downloaded: https://github.com/xiaoyulu95/SSMD/blob/master/data/example_bulk.RData

load('example_bulk.RData')

SSMD(bulk_data=example_bulk,tissue = 'Inflammatory')
```

## Contact Information

- [Xiaoyu Lu](https://zcslab.github.io/people/xiaoyu/)
(lu14@iu.edu)

Ph.D candidate at [Biomedical Data Research Lab (BDRL)](https://zcslab.github.io/) , Indiana University School of Medicine


## Citations
If you find the code helpful in your resarch or work, please cite our paper.

Lu, X. Tu, S. Chang, W. Wan, C. Wang, J. Ramdas, B. Kapur, R. Lu, X. Cao, S. Zhang, C. 2020. SSMD: A semi-supervised approach for a robust cell type identification and deconvolution of mouse transcriptomics data
