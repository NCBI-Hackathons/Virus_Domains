#!/usr/bin/env


LINE=SRR1553459

echo SRR1553459 > acc_file
> ./start_log.txt


cat acc_file | while read LINE
do


	/home/ubuntu/virus_team/sratoolkit.2.8.2-1-ubuntu64/bin/prefetch -a "/home/ubuntu/.aspera/connect/bin/ascp|/home/ubuntu/.aspera/connect/etc/asperaweb_id_dsa.openssh"
	wait
	echo $LINE.sra downloaded

	fastq-dump -split-spot -W -M 20 -I /home/ubuntu/ncbi/public/sra/$LINE.sra
	echo $LINE dumped

	trim_galore -q 30 --length 20 $LINE.fastq
	mkdir MMseq_tmp
	mmseqs createdb $LINE'_trimmed.fq' $LINE.DNAdb
        mmseqs translatenucs $LINE.DNAdb $LINE.PROdb
	mmseqs search  $LINE.PROdb '/home/ubuntu/virus_team/virus_MMseq_DB/'MMSEQ_DB $LINE.RESULTdb MMseq_tmp
	mmseqs convertalis $LINE.PROdb '/home/ubuntu/virus_team/virus_MMseq_DB/'MMSEQ_DB $LINE.RESULTdb $LINE.blastp

        cut -f1  $LINE.blastp | uniq > $LINE.id
        grep -A 3 -Ff $LINE.id $LINE'_trimmed.fq' | sed '/--/d' > $LINE'_virus'.fastq
#	out=$(awk 'NR%2 == 1 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' SRR1553459.fastq)
	out=$(awk 'NR%2 == 1 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' $LINE.fastq)
	first=${out%% *}
	minkmer=$(($first-1))	

	# spades problem err -6
	python /home/ubuntu/virus_team/spades/SPAdes-3.10.1-Linux/bin/spades.py  --only-assembler -k $minkmer,21 -s $LINE'_virus.fastq'  -o $LINE'_contig'
        cd  $LINE'_contig'
        mv  contigs.fasta $LINE'_contig.fasta'
        mv $LINE'_contig.fasta' ..
        cd ..
#        rm -rf  $LINE'_contig'
done



