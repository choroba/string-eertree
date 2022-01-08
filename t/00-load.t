#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'String::Eertree' ) || print "Bail out!\n";
}

diag( "Testing String::Eertree $String::Eertree::VERSION, Perl $], $^X" );
