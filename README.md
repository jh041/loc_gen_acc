# loc_gen_acc
An R function to find the genotyping accuracy at a locus using replicate samples

This function takes two pieces of input:

1. A data frame of genotypes, with one allele per column, sample names are row names and not their own column, and replicate individuals placed in consecutive rows, like this...
```
               Locus1.a1      Locus1.a2      Locus2.a1      Locus2.a2
indiv1                 A              C              A              C
indiv1B                A              C              A              C
indiv2                 T              T              A              C
indiv2B                T              T              A              C
```
2. A vector of sample names of the first replicates, with no sample names for the second ("B") replicates, in this way...
```
reps <- c("indiv1", "indiv2", "indiv3")
```
The function also has two assumptions:
1. There are only 1 original and 1 duplicate sample as a replicate and the duplicate sample name shares a unique element with the original sample name
2. Heterozygote alleles are always listed in the same order. For example, if one allele is an A, A always comes before C, C always comes before G, etc.

Usage:
```
mismatches <- loc_gen_acc(test_data, reps)
```
Examining results:
```
table(mismatches)

hist(table(mismatches))

mean(table(mismatches))
```

There is another version of the loc_gen_acc function called loc_gen_acc2 that only takes the genotypes as input and compares identical sample names. This is what I use to assess the genotyping accuracy between different SNP callers. Just concatenate the genotype dataframes from each caller, making sure that both data sets contain loci identified by both callers, in the same order, and the function will find like sample names and find the number of mismatches between them.

loc_gen_acc2 has the same 2 assumptions as loc_gen_acc.

Coming soon: a snakemake pipeline to automate my entire genotyping process
