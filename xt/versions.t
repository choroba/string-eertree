#!/usr/bin/perl
use warnings;
use strict;

use String::Eertree;
use String::Eertree::Node;
use String::Eertree::ToDot;


use Test::More tests => 2;

is $String::Eertree::VERSION, $String::Eertree::Node::VERSION, 'node';
is $String::Eertree::VERSION, $String::Eertree::ToDot::VERSION, '2dot';
