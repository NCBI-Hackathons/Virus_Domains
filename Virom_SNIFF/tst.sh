out=$(awk 'NR%2 == 1 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' SRR1553459.fastq)
first=${out%% *}
#echo $first
       #seconout=$(awk 'NR==1{print $2}' $out)
#echo $seconout
#echo $out
