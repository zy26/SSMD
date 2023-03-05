# SSMD: Semi-Supervised Mouse data Deconvolution 
## Description

Deconvolution of mouse transcriptomic data is challenged by the fact that mouse models carry various genetic and physiological perturbations, making it questionable to assume fixed cell types and cell type marker genes for different dataset scenarios. We developed a **S**emi-**S**upervised **M**ouse data **D**econvolution (**SSMD**) method to study the mouse tissue microenvironment (TME). SSMD is featured by (i) a novel non-parametric method to discover data set specific cell type signature genes; (ii) a community detection approach for fixing cell types and their marker genes; (iii) a constrained matrix decomposition method to solve cell type relative proportions that is robust to diverse experimental platforms. In summary, SSMD addressed several key challenges in the deconvolution of mouse tissue data, including: (1) varied cell types and marker genes caused by highly divergent genotypic and phenotypic conditions of mouse experiment, (2) diverse experimental platforms of mouse transcriptomics data, (3) small sample size and limited training data source, and (4) capable to estimate the proportion of 35 cell types in blood, inflammatory, central nervous or hematopoietic systems. In silico and experimental validation of SSMD demonstrated its high sensitivity and accuracy in identifying (sub) cell types and predicting cell proportions comparing to state-of-the-arts methods. A user-friendly web server of SSMD are released via https://ssmd.ccbb.iupui.edu.

<div align=center> <img src="https://github.com/xiaoyulu95/SSMD/blob/master/fig/pipeline.png" width="800"  height="400"> </div>

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
* `Escore`    Explanation Score for each marker gene
* `potential_modules`    Rank-1 gene modules which may represent a distinct or rare cell type


## Examples

```
# load bulk tissue gene expression data 
# Example bulk tissue data can be downloaded: 
# https://github.com/xiaoyulu95/SSMD/blob/master/data/example_bulk.RData

load('example_bulk.RData')

```

Bulk_data is input data matrix each row is a gene and each column is a sample.

<div align=center> <img src="https://github.com/xiaoyulu95/SSMD/blob/master/fig/example_data.png" width="600"  height="170"> </div>

```
Prediction=SSMD(bulk_data=example_bulk,tissue = 'Inflammatory')
```

**`Prediction$Proportion`** is a data frame which contians predicted cell types and relative proportion in each samples. **`Prediction$marker_gene`** is a list of gene coexpression modules which are used as marker to predict corresponding cell proportions. **`Prediction$Escore`** is Explanation Score for each makrer gene. **`Prediction$potential_modules`** are rank-1 gene modules which may represent a distinct or rare cell type and not included in SSMD prediction. For more details, please see our [Tutorial](https://xiaoyulu95.github.io/SSMD/index.html)


## Contact Information

- [Xiaoyu Lu](https://zcslab.github.io/people/xiaoyu/)
(lu14@iu.edu)

Ph.D candidate at [Biomedical Data Research Lab (BDRL)](https://zcslab.github.io/) , Indiana University School of Medicine


## Citations
If you find the code helpful in your resarch or work, please cite our [SSMD Paper](https://academic.oup.com/bib/advance-article/doi/10.1093/bib/bbaa307/5998844?guestAccessKey=944ba892-d2ac-4e71-942f-6f05e4c2768f/):

Xiaoyu Lu, Szu-Wei Tu, Wennan Chang, Changlin Wan, Jiashi Wang, Yong Zang, Baskar Ramdas, Reuben Kapur, Xiongbin Lu, Sha Cao, Chi Zhang, SSMD: a semi-supervised approach for a robust cell type identification and deconvolution of mouse transcriptomics data, Briefings in Bioinformatics, 2020;, bbaa307, https://doi.org/10.1093/bib/bbaa307
