#!/usr/bin/env perl
#<th: look up a word in the thesaurus
use Modern::Perl;
$ENV{'PATH'} = join ":", qw(/usr/local/bin /bin /usr/bin);

my @arr;
my $pfh;
my $thesaurus = "mthesaur.txt";
my $arg       = shift @ARGV || die "I need a word to look for.\n";

open(my $ifh, "look \"$arg\" $thesaurus |") || die "look $thesaurus";

while (<$ifh>) {
    chomp;
    # @arr = split(/,/, $_);
    # print "$arr[0]\n";
    # shift(@arr);
    # open(my $pfh, "| pr -3t -w85 | expand") || die "pr";
    # foreach (@arr) { print $pfh "  $_\n"; }
    # print $pfh "\n";
    # close($pfh);
    my @synonyms = split(/,/, $_);
    print "\n---\U$synonyms[0]---\n";
    
    shift(@synonyms);  # Discard the word being looked up

    for my $synonym (@synonyms) {
        print "$synonym\n";
    }
}

close($ifh);
exit(0);
