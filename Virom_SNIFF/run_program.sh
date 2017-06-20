#!/usr/bin/env
acc_file=$1

data='/workdir'
cd $data
mkdir $data/results
#> $data/start_log.txt

data='/workdir'
cd $data
cat $data/$acc_file | while read LINE
do
    if grep $LINE "$acc_file";then
	:
    else
	echo $LINE >> $data/start_log.txt
	/home/ubuntu/virus_team/sratoolkit.2.8.2-1-ubuntu64/bin/prefetch $LINE
#	prefetch -a "/opt/aspera/connect/bin/ascp|/opt/aspera/connect/etc/asperaweb_id_dsa.openssh" $LINE
	wait
	echo $LINE.sra downloaded
	fastq-dump -split-spot -W -M 20 -I $data/sra/$LINE.sra
	echo $LINE dumped
	trim_galore -q -lenght $LINE.fastq
	# map
	MMSeq2
	rm $data/sra/$LINE.sra
	rm $LINE.fastq
    fi
done
/home/ubuntu/ncbi/public/sra/SRR3190527.sr



data='/workdir'
cd $data

#start log of analyze samples
> $data/start_log.txt

data='/workdir'
cd $data

#read sample list file
cat $data/RNA_seq_samples.txt | while read LINE
do
    if grep $LINE "$data/start_log.txt";then
	:
    else
	echo $LINE >> $data/start_log.txt
	#fetch sra file
	prefetch -a "/opt/aspera/connect/bin/ascp|/opt/aspera/connect/etc/asperaweb_id_dsa.openssh" $LINE
	wait
	echo $LINE.sra downloaded
	#convert to fastq
	fastq-dump -split-spot -W -M 20 -I $data/sra/$LINE.sra
	echo $LINE dumped
	#do adaptive adaptor trimming
	trim_galore -q -lenght $LINE.fastq
	# do enrichment for viral like sequences
	MMSeq2



	#take MMSeq2 output and do de novo assembly using spades


	#do blastn search on assemble contigs
	blastn -db $database -query $contig.fa -out $outfile -evalue $par1 -perc_identity $par2 -outfmt 6 -max_target_seqs $par3 -num_threads $par4

	#parse results and make new fasta with contigs with no hits and below threshold blast hits

	#do tblastx search on leftover contigs
	tblastx  -db $database -query $blastn_no_hits.fa -out $outfile -evalue $par5 -outfmt 6 -max_target_seqs $par6 -num_threads $par4

	#parse results and make new fasta with contigs with no hits and below threshold tblastx hits

	#do CD search using Hammer search

	rm $data/sra/$LINE.sra
	rm $LINE.fastq

    fi
done
