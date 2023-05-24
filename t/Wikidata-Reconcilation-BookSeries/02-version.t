use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Reconcilation::BookSeries;

# Test.
is($Wikidata::Reconcilation::BookSeries::VERSION, 0.01, 'Version.');
