package WWW::Blog::Metadata::Microsummary;

use strict;
use warnings;

our $VERSION = '0.01';

use WWW::Blog::Metadata;
WWW::Blog::Metadata->mk_accessors(qw(microsummary_uri));

sub on_got_tag {
    my $class = shift;
    my($meta, $tag, $attr, $base_uri) = @_;
    if ($tag eq 'link' && $attr->{rel} =~ /\bmicrosummary\b/i) {
        $meta->microsummary_uri(URI->new_abs($attr->{href}, $base_uri)->as_string);
    }
}

sub on_got_tag_order { 99 }

1;

__END__

=head1 NAME

WWW::Blog::Metadata::Microsummary - Extract Microsummary URI from a
page

=head1 VERSION

This document describes WWW::Blog::Metadata::Microsummary version 0.01

=head1 SYNOPSIS

  use WWW::Blog::Metadata;
  my $meta = WWW::Blog::Metadata->extract_from_uri($uri)
      or die WWW::Blog::Metadata->errstr;

  ## or

  my $meta = WWW::Blog::Metadata->extract_from_html(\$html, $base_uri)
      or die WWW::Blog::Metadata->errstr;

  my $microsummary_uri = $meta->microsummary_uri;

=head1 DESCRIPTION

WWW::Blog::Metadata::Microsummary is a WWW::Blog::Metadata plugin to
look for and extract a URI which idendifies where a microsummary or a
microsummary generator of a page is located in.

=head1 METHODS

=head2 microsummary_uri

=over 4

  my $microsummary_uri = $meta->microsummary_uri;

Returns a URI string locates where the microsummary or the
microsummary generator of the specified page is, if it's found.

=back

=head1 SEE ALSO

=over 4

=item * L<WWW::Blog::Metadata>

You might as well consult the documentaion of WWW::Blog::Metadata for
more usage.

=item * Microsummary documentation on MozillaWiki

L<http://wiki.mozilla.org/Microsummaries>

=back

=head1 AUTHOR

Kentaro Kuribayashi E<lt>kentaro@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE (The MIT License)

Copyright (c) 2006, Kentaro Kuribayashi E<lt>kentaro@cpan.orgE<gt>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation files
(the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=cut
