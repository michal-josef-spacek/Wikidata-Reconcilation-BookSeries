use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Wikidata reconcilation class for book series.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Wikidata-Reconcilation-BookSeries';
perl_version 5.006002;
readme_from 'BookSeries.pm';
recursive_author_tests('xt');
requires 'WQS::SPARQL::Query::Select' => 0;
requires 'Wikidata::Reconcilation' => 0.05;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Wikidata-Reconcilation-BookSeries/issues',
resources 'homepage' => 'https://github.com/michal-josef-spacek/Wikidata-Reconcilation-BookSeries';
resources 'repository' => 'git://github.com/michal-josef-spacek/Wikidata-Reconcilation-BookSeries';
test_requires 'English' => 0;
test_requires 'Error::Pure::Utils' => 0;
test_requires 'Test::MockObject' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
