#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

use FindBin;

use File::Find::Rule;

	# find all the .blastm6 files in @INC
	my @files = File::Find::Rule->file()
                              ->name( 'Atha.gene.*.csv' )
                              ->in( '/home/wn/data/alignment/gene-paralog/Atha/stat' );
	open OUT1, ">/home/wn/data/alignment/gene-paralog/Atha/pathway/Atha.gene.txt"|| die "$!";

	foreach my $files( @files ){
		print $files,"\n";
	
	my @matrix;
	my $max_len = 0;
	my @fields;
	my $len;
	my $col;
	my $line;
		open IN, $files || die "$!"; #transpose
		while( <IN> ){
			chomp;
			@fields = split ",", $_;
			$len = @fields;
			$max_len = $max_len > $len ? $max_len : $len;
			push @matrix, [@fields];
		}
		
		for $col (0..$max_len - 1){
			for $line (@matrix){
				open OUT1, ">>/home/wn/data/alignment/gene-paralog/Atha/pathway/Atha.gene.txt"|| die "$!";
				print OUT1 $line->[$col], "\t";
			}
			print OUT1 "\n";
		}
		close IN;
		close OUT1;
	}
