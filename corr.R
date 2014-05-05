# source("corr.R")
# source("complete.R")
# cr <- corr("specdata", 150)
# head(cr)
# ## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
# summary(cr)
# ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# ## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
# cr <- corr("specdata", 400)
# head(cr)
# ## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
# summary(cr)
# ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# ## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
# cr <- corr("specdata", 5000)
# summary(cr)
# ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# ## 
# length(cr)
# ## [1] 0
# cr <- corr("specdata")
# summary(cr)
# ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# ## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
# length(cr)
# ## [1] 323

corr <- function(directory = "directory", threshold = 0){
        results <- numeric(0)
        mydata1 <- complete(directory)
        mydata2 <- subset(mydata1, nobs > threshold)
        filenames <- as.character(list.files())
        if(nrow(mydata2) > 0){ 
                for(i in mydata2$id){
                        mydata3 <- read.csv(filenames[i])
                        mydata <- na.omit(mydata3)
                        results = append(results, cor(mydata$nitrate, mydata$sulfate))
                }
#                 mydata3 <- lapply(filenames[mydata2$id], read.csv, header = TRUE)
#                 mydata4 <- lapply(mydata3, na.omit)
#                 mydata5 <- lapply(mydata4, function(x) x[, 3:2]) 
#                 #mydata5 <- as.matrix(mydata4)
#                 mydata6 <- sapply(mydata5, cor)
#                 results <- c(results, mydata6)
                #options(digits=5)
                
                return(results)
        }
        else{
               #results <- c("numeric", length = 0) 
               return (results)
        }
}