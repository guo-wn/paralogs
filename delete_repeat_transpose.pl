#!/usr/bin/env perl
use strict;
	open IN,"/home/wn/data/alignment/gene-paralog/Atha/pathway/Atha.gene.txt"|| die "$!";
	open OUT,">/home/wn/data/alignment/gene-paralog/Atha/pathway/Atha.gene1.txt"|| die "$!";
	
	my %hash = ();
	while ( <IN> )
	{
		chomp;
		$hash {$_} =1;
	}
	my @lines = sort keys (%hash);
	$"="\n";
	print OUT "@lines";
	
	close IN;
	close OUT;

	my @matrix;
	my $max_len = 0;
	my @fields;
	my $len;
	my $col;
	my $line;
		open IN1, "/home/wn/data/alignment/gene-paralog/Atha/pathway/Atha.gene1.txt"|| die "$!"; #transpose
		open OUT1, ">/home/wn/data/alignment/gene-paralog/Atha/pathway/Atha.gene2.txt"|| die "$!";
		while( <IN1> ){
			chomp;
			@fields = split "\t", $_;
			$len = @fields;
			$max_len = $max_len > $len ? $max_len : $len;
			push @matrix, [@fields];
		}
		
		for $col (0..$max_len - 1){
			for $line (@matrix){
				
				print OUT1 $line->[$col], "\t";
			}
			print OUT1 "\n";
		}
		close IN1;
		close OUT1;
	
