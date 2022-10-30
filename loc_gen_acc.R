loc_gen_acc <- function(file, reps) {
   mismatches=NULL
   counter=length(colnames(file))   
   for(i in colnames(file)) {                                         ### loop through every column
      for(j in reps) {                                                ### double loop through names of replicates
	     samp <- file[grep(j,rownames(file)),]                          ### isolate the replicate alleles
		 thing1 <- samp[1,i]                                              ### original sample
		 thing2 <- samp[2,i]                                              ### duplicate sample
		 if((!is.na(thing1) & !is.na(thing2)) & (thing1 != thing2)){      ### compare
		    mismatches <- c(mismatches, i)                                ### mismatched alleles get recorded
		 }
	  }
   print(counter)
   counter <- counter - 1
   }
   return(mismatches)                                                ### all allelic mismatches are outputted
}
