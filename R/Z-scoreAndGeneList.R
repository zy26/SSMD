#epic_LM <- cal_Zscore_small(EPIC_info_list$refProfiles[EPIC_info_list$sigGenes,])

cal_Zscore_small <- function(aaa)
{
  mmm <- matrix(0, nrow(aaa), ncol(aaa))
  rownames(mmm) <- rownames(aaa)
  colnames(mmm) <- colnames(aaa)
  for(i in 1:nrow(aaa)){
    vv <- matrix(NA, 1, ncol(aaa))
    vv <- aaa[i, ]
    
    gene_sd <- sd(vv) * sqrt( (length(vv)-1) / (length(vv))  )
    gene_mean <- mean(vv)
    
    #z-score calculation
    z <- (vv - gene_mean) / gene_sd
    
    p_yellow <- pnorm(z)
    p_blue <- 1 - p_yellow
    #which(p_blue < cutoff)
    zz <- matrix(0,1,ncol(aaa))
    zz[,which.min(p_blue)] <- 1
    mmm[i, ] <- zz
  }
  
  return(mmm)
  
}

# example: sig_gene_list <- find_1_genelist(epic_LM)
find_1_genelist <- function(aaa) # aaa is the LM (0 and 1)
{
  gene_list <- list()
  for(i in 1:ncol(aaa))
  {
    gene_list[[i]] <- names(which(aaa[,i]==1))
    
  }
  names(gene_list) <- colnames(aaa)
  
  return(gene_list)
}

do_nnlr_regression_s <- function(XX, YY)
{
  #YY is m*n matrix
  #XX is m*k matrix
  #return SS is k*n matrix
  library(nnls)
  SS <- matrix(0, nrow(YY), nrow(XX))
  for(i in 1:nrow(YY))
  {
    y <- YY[i, ]
    s <- nnls(t(XX),y)$x
    SS[i, ] <- s
  }
  
  return(SS)
}

SSMD_cal_escore <- function(sigmatrix, predict_propor, bulk)
{
  common_nn <- intersect(rownames(sigmatrix), rownames(bulk))
  bulk00 <- bulk[common_nn,]
  #calculate true sigmatrix
  uuu <- do_nnlr_regression_s(predict_propor, bulk00)
  bulk_tilde <- uuu %*% predict_propor
  escore_gene <- R2_two_mat(bulk_tilde, bulk00)
  rownames(escore_gene) <- rownames(bulk00)
  return(escore_gene)
}



