 	#!/usr/bin/perl -w
	use strict;
	my @data;
	my @data1;
	my @data2;

	open IN, "/home/wn/data/alignment/gene-paralog/Atha/pathway/Pathway.TXT" || die "$!";
	while ( <IN> ){
		chomp;
		@data = split "\t",$_,7;
		#print $data[1],"\n";
		#@data1 = split ":",$data[1];
		$data[5] =~ s/, /\n/g; 
		open OUT,">/home/wn/data/alignment/gene-paralog/Atha/pathway/kegg/$data[1].kegg.txt" or die $!;
		print OUT $data[5],"\n";
	}
	close IN;
