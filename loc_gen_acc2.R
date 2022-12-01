loc_gen_acc2 <- function(file) {
   mismatches=NULL
   counter=length(colnames(file))
   for(i in colnames(file)) {
      for(j in unique(substr(rownames(file),1,8))) {
             samp <- file[grep(j,rownames(file)),]
                 thing1 <- samp[1,i]
                 thing2 <- samp[2,i]
                 if((!is.na(thing1) & !is.na(thing2)) & (thing1 != thing2)){
                    mismatches <- c(mismatches, i)
                 }
          }
   print(counter)
   counter <- counter - 1
   }
   return(mismatches)
}

### Generally the same as loc_gen_acc1,
### but it only takes the data frame as input,
### and instead of looping through a vector of replicate sample names (line 5),
### it looks for identical sample names in the same data set and compares those.
