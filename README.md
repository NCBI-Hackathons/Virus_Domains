
# VIROME SNIFF

A NCBI Hackathon Project Generating a Pipeline that searches Next Generation Sequencing reads using virus protein database. 
This tool finds already known viral sequences and viruses-like proteins and discovers sequences that match Viral Protein Domains in any single genome or metagenome sequence pool. Initial development took place at New York Genome Center, June 19-21, 2017.



* [Introduction](#Introduction)

* [Command Line Interface Usage](#Command-Line-Interface-Usage)

* [Workflow schematics](#Workflow-schematics)

* [Sample Input Files](#Sample-Input-Files)
* [Building Database](#Building-Database)
* [Sample Input Files](#Software-Dependencies)
* [Resources and references](#Resources-and-references) 
 


## Background
We aimed to search for viruses in protein, rather than nucleotide space in order to capture and characterize larger number of viruses and detect virus- associated domains in the sample.  
 
Once we have taken in any Illumina base next generation sequencing datasets (and performed adapter trimming), the workflow takes FASTQ data reads  where the input genomic data is matched directly against viral protein database in order to filter out all the other sequences that are not related to viruses. The workflow further takes virus- related sequences and an assembly of those reads is performed. All the contigs that we successfully assembled are further characterized into known virus proteins, homologous virus proteins, and as virus protein domains. Know and homologous virus proteins are quantified and plotted, and taxonomical classification of those sequences is provided. Finally, samples geographical distribution and representation can be plotted on the map. 



## Command Line Interface Usage
```
usage: run_program.sh [-h] -f FASTQ [-r REVERSE FASTQ] -s SAMPLE SHEET -b
                   BARCODES [-e ERROR RATE]

optional arguments:
  -h, --help            show this help message and exit
  -f FASTQ, --Provide single-end, paire-end FASTQ file
  -s SRA, --sample-sheet SAMPLE SHEET
                        Sample table
 
  -e E-value, --provide optiaonal trashold for blast, deafualt values are .....
```

## Workflow schematics 
1. Building viral protein database
1. Trimming sequences for adapter 
2. Detecting NGS sequences for virus using MMseq2 k-mer based algorithm for protein detection
2. Assemble matched reads using Abyss
3. Characterize known sequences and their aboundaces
4. Visuaize viral content, taxonomy and geographical origin 


![alt text](http://i.imgur.com/02j3NGx.jpg)

## Sample Input Files
- FASTQ File: [link](/test.cases/FASTQ_short_example.txt)


## Building Database
This is an optional step. We build a Database containing multiple differetnt viral sequences by combining three databases using MMseq2.

Databases used to create our final database

Viral Zone DB (http://viralzone.expasy.org/)

VPR (https://www.viprbrc.org/brc/home.spg?decorator=vipr)

Viral Genomes (https://www.ncbi.nlm.nih.gov/genome/viruses/)

If a new database compatible with MMseq2 needs to be created the following commnads could be used: 
mmseqs createdb  virus_cluster.fasta MMSEQ_DB
mmseqs createindex MMSEQ_DB


## Software Dependencies

The following software needs to be installed: 

-sratoolkit (https://github.com/ncbi/sra-tools/)

-TrimGalore (https://github.com/FelixKrueger/TrimGalore)

-MMseq2 (https://github.com/soedinglab/MMseqs2)  

-Spades 3.10.1 (http://spades.bioinf.spbau.ru/release3.10.1/manual.html#sec2)


## Resources and references

* [How to use/run a Docker image](https://github.com/NCBI-Hackathons/Cancer_Epitopes_CSHL/blob/master/doc/Docker.md)
