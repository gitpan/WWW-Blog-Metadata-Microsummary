use strict;
use Test::Base;
use WWW::Blog::Metadata::Microsummary;

plan tests => 1 * blocks;
filters qw(chomp);

run {
    my $block = shift;
    my $html  = $block->html;
    my $meta = WWW::Blog::Metadata->extract_from_html(\$html, $block->base_uri);
    my $microsummary_uri = $meta->microsummary_uri;
    is $microsummary_uri, $block->microsummary_uri, 'extract microsummary URI from HTML content';
}

__END__
===
--- base_uri
http://example.com/
--- microsummary_uri
http://example.com/path/to/microsummary.xml
--- html
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <link rel="shortcut icon" href="/favicon.ico" />
        <link rel="microsummary" href="/path/to/microsummary.xml" />
        <link rel="stylesheet" type="text/css" href="/style.css" />
        <title>Test for WWW::Blog::Metadata::Microsummary</title>
    </head>
    <body>
        <h1>Test for WWW::Blog::Metadata::Microsummary</h1>
        <p>blah blah blah</p>
    </body>
    <address>Kentaro Kuribayashi &lt;<a href="mailto:kentaro@cpan.org">kentaro@cpan.org</a>&gt;</address>
</html>
