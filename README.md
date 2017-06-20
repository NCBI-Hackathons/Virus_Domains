# Virus_Domains
A NYGC Hackathon Project to Discover and Leverage New Viral Protein Domains

VIROME_SNIFF is a pipeline that searches Next Generation Sequencing reads using NCBI magicBLAST tool using virus protein database. 
This tool finds already known viral sequences and viruses-like proteins and discovers knew Viral Protein Domains in any single genome or metagenome sequence pool. 


#WORKFLOW
1. Detecting NGS sequences for virus using MMseq2 k-mer based algorithm for protin detection
2. Assemble matched reads using Abyss
3. Characterize known sequences and their aboundaces
4. Visuaize viral content, taxonomy and geographical origin 


git clone https://github.com/NCBI-Hackathons/Virus_Domains


# Dependencies

Install the following:

["sratoolkit.2.8.2-1"] (https://github.com/ncbi/sra-tools/wiki/Downloads)

["MMseq2"](https://github.com/soedinglab/MMseqs2)  

["Spades 3.10.1"](http://spades.bioinf.spbau.ru/release3.10.1/manual.html#sec2)

["TrimGalore"] (https://github.com/FelixKrueger/TrimGalore)

#Database containing multiple differetnt viral sequences compiled form Viral Zone DB, VPR and Viral Genomes
is build with MMseq2 and can be obtained from here: 

If a new database compatible with MMseq2 needs to be created the following commnads could be used: 

#BUILDING DATABASE
mmseqs createdb  virus_cluster.fasta MMSEQ_DB
mmseqs createindex MMSEQ_DB


# VIROME SNIFF
A NCBI Hackathon Project Generating a Pipeline that searches Next Generation Sequencing reads using virus protein database. 
This tool finds already known viral sequences and viruses-like proteins and discovers sequences that match Viral Protein Domains in any single genome or metagenome sequence pool. Initial development took place at New York Genome Center, June 19-21, 2017.

## Introduction
We aimed to search for viruses in protein, rather than nucleotide space in order to capture and caracterize larger number of viruses and detec virus- associated domains in the sample.  

Once we have taken in any Illumina base next generatin sequenceing datasets (and performed adapter trimming), the workflow takes FASTQ data reads  where the input genomic data is matched directly against viaral protein database in order to filter out all the other sequnces that ae not related to viruses. The workflow further takes virus- related seqeunces and an assembly of those reads is performed. All the contigs that we sucessfuly assebled are furhter characterzed into known virus proteins, homologous virus proteins, and as virus protein domains. Know and homologus virus proteins are quntified and plotted, and taxonomical clasification of those sequences is provided. Finally, samples geographical distribution and representaiton can be plotted on the map. 


## Command Line Interface Usage
```
usage: Barcodes.py [-h] -f FORWARD FASTQ [-r REVERSE FASTQ] -s SAMPLE SHEET -b
                   BARCODES [-e ERROR RATE]

optional arguments:
  -h, --help            show this help message and exit
  -f FORWARD FASTQ, --forward-fastq FORWARD FASTQ
                        Provide the forward or single-end FASTQ file
  -r REVERSE FASTQ, --reverse-fastq REVERSE FASTQ
                        Provide the reverse FASTQ file [optional]
  -s SAMPLE SHEET, --sample-sheet SAMPLE SHEET
                        Sample table
  -b BARCODES, --barcodes BARCODES
                        Barcodes CSV file
  -e ERROR RATE, --error-rate ERROR RATE
                        Barcodes error rate, defaults to '2'
```

## Project Architecture
![alt text](https://i.imgur.com/JZrY1Yi.png) 

## Sample Input Files
- FASTQ File: [link](/test.cases/FASTQ_short_example.txt)
- Barcode.csv: [link](barcodes_csv.txt)
- sample_sheet.tab: [link](Sample_sheet.txt)

## Software Dependencies

The following software needs to be installed: 

-sratoolkit (https://github.com/ncbi/sra-tools/)

-MMseq2 (https://github.com/soedinglab/MMseqs2)  

-Spades 3.10.1 (http://spades.bioinf.spbau.ru/release3.10.1/manual.html#sec2)

-TrimGalore (https://github.com/FelixKrueger/TrimGalore)




