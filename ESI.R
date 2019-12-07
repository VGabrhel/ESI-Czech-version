Matice <- read.csv("ESI_CFA.csv", header = TRUE, sep = ";", dec = ",")

model1 <- '
#latent variable definitions
#unstandardised coeff for first listed observed variable is fixed at 1 using code below
COS =~ q1 + q6 + q11 + q16 + q21 + q26
EPD =~ q2 + q7 + q12 + q17 + q22 + q27
EWB =~ q3 + q8 + q13 + q18 + q23 + q28
PAR =~ q4 + q9 + q14 + q19 + q24 + q29
RLG =~ q5 + q10 + q15 + q20 + q25 + q30
'

cfa1 <- lavaan(model1, data=Matice, 
               auto.var=TRUE, #residual variances and the variances of latent variables
               #are included in the model as free parameters
               #See red lines in "Our model in the script"
               auto.fix.first=TRUE,
               auto.cov.lv.x=TRUE, #latent variable covariances included as free parameters
               #Blue line in "Our model in the script"
               mimic = "lavaan",
               #missing = "fiml", #not necessary here; the default is "default", which depends on the value for mimic
               test = "standard") #to adjust for lack of multivariate normality
#test default is "standard"
summary(cfa1, fit.measures=TRUE, standardized = TRUE)