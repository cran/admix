## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message = FALSE
)

## ----setup--------------------------------------------------------------------
library(admix)

## -----------------------------------------------------------------------------
set.seed(123)
## Simulate mixture data:
mixt1 <- twoComp_mixt(n = 6000, weight = 0.8,
                      comp.dist = list("gamma", "exp"),
                      comp.param = list(list("shape" = 16, "scale" = 1/4),
                                        list("rate" = 1/3.5)))
mixt2 <- twoComp_mixt(n = 6000, weight = 0.7,
                      comp.dist = list("gamma", "exp"),
                      comp.param = list(list("shape" = 14, "scale" = 1/2),
                                        list("rate" = 1/5)))
mixt3 <- twoComp_mixt(n = 6000, weight = 0.6,
                      comp.dist = list("gamma", "gamma"),
                      comp.param = list(list("shape" = 16, "scale" = 1/4),
                                        list("shape" = 12, "scale" = 1/2)))
mixt4 <- twoComp_mixt(n = 6000, weight = 0.5,
                      comp.dist = list("exp", "exp"),
                      comp.param = list(list("rate" = 1/2),
                                        list("rate" = 1/7)))
mixt5 <- twoComp_mixt(n = 6000, weight = 0.5,
                      comp.dist = list("gamma", "exp"),
                      comp.param = list(list("shape" = 14, "scale" = 1/2),
                                        list("rate" = 1/6)))
data1 <- getmixtData(mixt1)
data2 <- getmixtData(mixt2)
data3 <- getmixtData(mixt3)
data4 <- getmixtData(mixt4)
data5 <- getmixtData(mixt5)
admixMod1 <- admix_model(knownComp_dist = mixt1$comp.dist[[2]],
                         knownComp_param = mixt1$comp.param[[2]])
admixMod2 <- admix_model(knownComp_dist = mixt2$comp.dist[[2]],
                         knownComp_param = mixt2$comp.param[[2]])
admixMod3 <- admix_model(knownComp_dist = mixt3$comp.dist[[2]],
                         knownComp_param = mixt3$comp.param[[2]])
admixMod4 <- admix_model(knownComp_dist = mixt4$comp.dist[[2]],
                         knownComp_param = mixt4$comp.param[[2]])
admixMod5 <- admix_model(knownComp_dist = mixt5$comp.dist[[2]],
                         knownComp_param = mixt5$comp.param[[2]])
## Look for the clusters:
admix_cluster(samples = list(data1,data2,data3,data4,data5), 
              admixMod = list(admixMod1,admixMod2,admixMod3,admixMod4,admixMod5),
              conf_level = 0.95, parallel = FALSE, n_cpu = 2, n_sim_tab = 10, 
              tune_penalty = FALSE, tabul_dist = NULL, echo = FALSE)

