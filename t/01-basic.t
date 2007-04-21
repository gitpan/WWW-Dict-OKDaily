#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 2;
use WWW::Dict::OKDaily;

my $dict = WWW::Dict::OKDaily->new();
my $def = $dict->define("tea");

ok(ref $def eq 'ARRAY');
ok(ref $def->[0] eq 'HASH');
