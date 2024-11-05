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
####### Under the null hypothesis H0.
## Simulate mixture data:
mixt1 <- twoComp_mixt(n = 300, weight = 0.6,
                      comp.dist = list("norm", "norm"),
                      comp.param = list(c("mean" = 2, "sd" = 0.5),
                                        c("mean" = 0, "sd" = 1)))
data1 <- getmixtData(mixt1)
## Define the admixture model:
admixMod <- admix_model(knownComp_dist = mixt1$comp.dist[[2]],
                        knownComp_param = mixt1$comp.param[[2]])
admix_test(samples = list(data1), admixMod = list(admixMod), conf_level = 0.95,
           test_method = "poly", ask_poly_param = FALSE, support = "Real")

## -----------------------------------------------------------------------------
mixt1 <- twoComp_mixt(n = 600, weight = 0.8,
                      comp.dist = list("norm", "norm"),
                      comp.param = list(list("mean" = 3, "sd" = 0.5),
                                        list("mean" = 0, "sd" = 1)))
mixt2 <- twoComp_mixt(n = 800, weight = 0.7,
                      comp.dist = list("norm", "norm"),
                      comp.param = list(list("mean" = 3, "sd" = 0.5),
                                        list("mean" = 0, "sd" = 1)))
data1 <- getmixtData(mixt1)
data2 <- getmixtData(mixt2)
## Define the admixture models:
admixMod1 <- admix_model(knownComp_dist = mixt1$comp.dist[[2]],
                         knownComp_param = mixt1$comp.param[[2]])
admixMod2 <- admix_model(knownComp_dist = mixt2$comp.dist[[2]],
                         knownComp_param = mixt2$comp.param[[2]])
## Using expansion coefficients in orthonormal polynomial basis:
admix_test(samples = list(data1,data2), admixMod = list(admixMod1,admixMod2), conf_level = 0.95,
           test_method = "poly", ask_poly_param = FALSE, support = "Real")

## -----------------------------------------------------------------------------
mixt1 <- twoComp_mixt(n = 450, weight = 0.4,
                      comp.dist = list("norm", "norm"),
                      comp.param = list(c("mean" = -2, "sd" = 0.5),
                                        c("mean" = 0, "sd" = 1)))
mixt2 <- twoComp_mixt(n = 600, weight = 0.24,
                      comp.dist = list("norm", "norm"),
                      comp.param = list(c("mean" = -2, "sd" = 0.5),
                                        c("mean" = -1, "sd" = 1)))
mixt3 <- twoComp_mixt(n = 400, weight = 0.53,
                      comp.dist = list("norm", "norm"),
                      comp.param = list(c("mean" = -2, "sd" = 0.5),
                                        c("mean" = 2, "sd" = 1)))
data1 <- getmixtData(mixt1)
data2 <- getmixtData(mixt2)
data3 <- getmixtData(mixt3)
admixMod1 <- admix_model(knownComp_dist = mixt1$comp.dist[[2]],
                         knownComp_param = mixt1$comp.param[[2]])
admixMod2 <- admix_model(knownComp_dist = mixt2$comp.dist[[2]],
                         knownComp_param = mixt2$comp.param[[2]])
admixMod3 <- admix_model(knownComp_dist = mixt3$comp.dist[[2]],
                         knownComp_param = mixt3$comp.param[[2]])
admix_test(samples = list(data1, data2, data3), 
           admixMod = list(admixMod1, admixMod2, admixMod3), 
           conf_level = 0.95, test_method = "icv", n_sim_tab = 8, 
           tune_penalty = FALSE, parallel = FALSE, n_cpu = 2)

