# Virus_Domains
A NYGC Hackathon Project to Discover and Leverage New Viral Protein Domains

VIROME_SNIFF is a pipeline that searches Next Generation Sequencing reads using NCBI magicBLAST tool using virus protein database. 
This tool finds already known viral sequences and viruses-like proteins and discovers knew Viral Protein Domains in any single genome or metagenome sequence pool. 


#WORKFLOW
1. Detecting NGS sequences for virus using MMseq2 k-mer based algorithm for protin detection
2. Assemble matched reads using Abyss
3. Characterize known sequences and their aboundaces
4. 



git clone https://github.com/NCBI-Hackathons/Virus_Domains


# Dependencies

Install the following:

["MMseq2"](https://github.com/soedinglab/MMseqs2)  
["Spades 3.10.1"](http://spades.bioinf.spbau.ru/release3.10.1/manual.html#sec2)


["cutadapt (>= 1.12)"](http://cutadapt.readthedocs.io/en/stable/installation.html)




#Database containing multiple differetnt viral sequences compiled form Viral Zone DB, VPR and Viral Genomes
is build and can be obtained from here: 


BUILDING DATABASE



#BASIC USAGE




#OPTIONAL PARAMETERS












