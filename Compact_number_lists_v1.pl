#!/bin/perl -w

use strict;
use feature 'say';

sub Compact_number_lists{
	my @input = sort {$a <=> $b} @_;
	my $num;
	my $re = 0;
	my @result;

	foreach (0 .. $#input){
		if ($input[$_] + 1 == ($input[$_+1] // $input[$_] - 1)){
			$num += 1;
			$re = 1;
		}
		elsif ($re == 1){
			push(@result, ($input[$_-$num] . '-' . $input[$_]));
			($num, $re) = (0, 0);	
		}
		else {
			push(@result, $input[$_])
		}
	}
	
	return join(',', @result) 
}

say(Compact_number_lists(1, 2, 3, 4, 9, 10, 14, 15, 16)); # 1-4,9-10,14-16
say(Compact_number_lists(1, 5, 3, 7, 19, 18, 4, 22, 16)); # 1,3-5,7,16,18-19,22
