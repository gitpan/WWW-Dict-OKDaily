package WWW::Dict::OKDaily;

use warnings;
use strict;

=head1 NAME

WWW::Dict::OKDaily - OKDaily Web Dictionary Interface

=head1 VERSION

Version 0.02

=cut

use Class::Field qw'field const';
use Encode;
use WWW::Mechanize;

our $VERSION = '0.02';
const dict_url => 'http://www.okdaily.com/cgi-bin/ecdict.cgi';

field ua => -init => 'WWW::Mechanize->new(agent_alias => "Mac Mozilla")';

=head1 SYNOPSIS

    use WWW::Dict::OKDaily;
    my $dict = WWW::Dict::OKDaily->new();
    my $def = $dict->define("tea");
    print $def->[0]->{chinese};

=head1 DESCRIPTION

OKDaily dictionary is the website
L<http://www.okdaily.com/cgi-bin/ecdict.cgi>, which provide a very
simple dictionary database from English to Chinese. This module
is a basic interface to this web site.

=head1 EXPORT

This module doesn't export any functions.

=head1 Methods

=head2 new

Object constructor. No arguments are required for this method.

=cut

sub new {
    my $class = shift;
    my $self = {};
    return bless $self, $class;
}


=head2 define

=cut

sub define {
    my $self = shift;
    my $word = shift;
    my $def = [];
    my $ua = $self->ua;
    $ua->get($self->dict_url . "?english=$word");
    my $content = $ua->content();
    push @$def, $self->_parse_content( Encode::decode('big5',$ua->content) );
    return $def;
}

sub _parse_content {
    my $self = shift;
    my $content = shift;
    $content =~ /Chinese\(Big5\):\s*(.*?)\s*<br>/;
    return { chinese => $1 }
}


=head1 AUTHOR

Kang-min Liu, C<< <gugod at gugod.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-www-dict-okdaily at rt.cpan.org>, or through the web
interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Dict-OKDaily>.
I will be notified, and then you'll automatically be notified of
progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Dict::OKDaily

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW-Dict-OKDaily>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW-Dict-OKDaily>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW-Dict-OKDaily>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW-Dict-OKDaily>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2007 Kang-min Liu, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of WWW::Dict::OKDaily
