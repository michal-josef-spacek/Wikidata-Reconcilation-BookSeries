use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::MockObject;
use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Reconcilation::BookSeries;

# Test.
my $obj = Wikidata::Reconcilation::BookSeries->new;
isa_ok($obj, 'Wikidata::Reconcilation::BookSeries');

# Test.
eval {
	Wikidata::Reconcilation->new(
		'lwp_user_agent' => Test::MockObject->new,
	);
};
is($EVAL_ERROR, "Parameter 'lwp_user_agent' must be a 'LWP::UserAgent' object.\n",
	"Parameter 'lwp_user_agent' must be a 'LWP::UserAgent' object (another object).");
clean();
