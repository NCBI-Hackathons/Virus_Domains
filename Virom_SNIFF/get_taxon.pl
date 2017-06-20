#!/usr/bin/env perl
use strict;
use Data::Dumper;
use warnings;
use List::Util qw(max);
use Bio::SeqIO;
use Bio::Seq;
use Bio::AlignIO;
use 5.010;
use Scalar::Util qw(looks_like_number);




use Bio::DB::Taxonomy;
my $db = Bio::DB::Taxonomy->new(-source => 'entrez');
# use NCBI Entrez over HTTP
my $taxonid = $db->get_taxonid('Homo sapiens');

# get a taxon
my $taxon = $db->get_taxon(-taxonid => $taxonid);

my $filename = shift @ARGV;
