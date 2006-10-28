use inc::Module::Install;
name 'WWW-Blog-Metadata-Microsummary';
all_from 'lib/WWW/Blog/Metadata/Microsummary.pm';
license 'MIT';
requires 'WWW::Blog::Metadata';
build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
