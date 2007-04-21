#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'WWW::Dict::OKDaily' );
}

diag( "Testing WWW::Dict::OKDaily $WWW::Dict::OKDaily::VERSION, Perl $], $^X" );
