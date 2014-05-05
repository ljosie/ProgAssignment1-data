
corr = function(directory = "", threshold = 0) {
        
        directory <- paste("~/Desktop/coursera", directory, sep ="/")
        # Set the working directory for read.csv
        setwd(directory)
        # Save every file in variable "filenames"
        filenames <- as.character(list.files())
        data.tmp = NULL
        idnum = 1:332
        for (i in idnum) {
                data = lapply(filenames[i], read.csv, header = TRUE)
                data = na.omit(data)
                data.nrow = nrow(data)
                if (data.nrow >threshold) {
                        data.tmp = append(data.tmp, cor(data$nitrate, data$sulfate))
                }
                else if (NULL) cat("OK")
                else{
                        results <- c("numeric", length = 0) 
                        return (results)
                }
        }
        return (as.numeric(data.tmp))
}