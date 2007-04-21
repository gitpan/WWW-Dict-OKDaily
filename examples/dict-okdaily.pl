#!/usr/bin/env perl
use strict;
use warnings;
use encoding 'utf8';

use lib '../lib';
use WWW::Dict::OKDaily;

$\ = "\n";

my $word = shift;
my $dict = WWW::Dict::OKDaily->new();
my $def = $dict->define($word);
print "$word: $def->[0]->{chinese}";
