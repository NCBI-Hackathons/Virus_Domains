# Virus_Domains
A NYGC Hackathon Project to Discover and Leverage New Viral Protein Domains

VIROME_SNIFF is a pipeline that searches Next Generation Sequencing reads using NCBI magicBLAST tool using virus protein database. 
This tool finds already known viral sequences and viruses-like proteins and discovers knew Viral Protein Domains in any single genome or metagenome sequence pool. 


#WORKFLOW
1. Detecting NGS sequences for virus using NCBI magicBLAST/k-mers
2. Assemble matched reads
3. Detect 



git clone https://github.com/NCBI-Hackathons/Virus_Domains


# Dependencies

Install the following:

["magicblast (>= 1.2.0)"](https://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/LATEST)  

["samtools (>= 1.4)"](http://samtools.sourceforge.net/)

["bioperl (>= 1.7)"](http://search.cpan.org/~cjfields/BioPerl-1.007001/BioPerl.pm)

["cutadapt (>= 1.12)"](http://cutadapt.readthedocs.io/en/stable/installation.html)

["abyss (>= 2.0.2)"](https://github.com/bcgsc/abyss)



Installing the following for detection: 

Perl version 5.10.0 or higher. Perl is installed by default on most Linux systems
BioPerl version 1.006 or higher. Please check http://www.bioperl.org and wiki/Installing_BioPerl for more details on installation of BioPerl.

BWA 0.7.10. Provided in VirusDetect.

SAMtools v0.1.18. Provided in VirusDetect.

Velvet v1.1.07. Provided in VirusDetect.

NCBI BLAST package 2.2.16. Provided in VirusDetect.

HISAT (for RNA-Seq datasets)



#BASIC USAGE


#OPTIONAL PARAMETERS












