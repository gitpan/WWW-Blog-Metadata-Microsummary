use strict;
use Test::Base;
use WWW::Blog::Metadata::Microsummary;

plan tests => 1 * blocks;
filters qw(chomp);

run {
    my $block = shift;
    my $meta = WWW::Blog::Metadata->extract_from_uri($block->page_uri);
    my $microsummary_uri = $meta->microsummary_uri;
    is $microsummary_uri, $block->microsummary_uri, 'extract microsummary URI from the specified page URI';
}

__END__
===
--- page_uri
http://reader.livedoor.com/about/http://search.cpan.org/uploads.rdf
--- microsummary_uri
http://reader.livedoor.com/microsummary/livedoor-reader-subscribers-count.xml
