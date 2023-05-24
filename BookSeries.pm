package Wikidata::Reconcilation::BookSeries;

use base qw(Wikidata::Reconcilation);
use strict;
use warnings;

use WQS::SPARQL::Query::Select;

our $VERSION = 0.01;

sub _reconcile {
	my ($self, $reconcilation_rules_hr) = @_;

	my @sparql = ();

	# Reconcilation over external references.
	foreach my $external_property_key (keys %{$reconcilation_rules_hr->{'external_identifiers'}}) {
		push @sparql, WQS::SPARQL::Query::Select->new->select_value({
			'P31' => 'Q277759',
			$external_property_key => $reconcilation_rules_hr->{'external_identifiers'}->{$external_property_key},
		});
	}

	# TODO Series name and publisher.

	# Naive reconcilation by label name.
	if (exists $reconcilation_rules_hr->{'name'}) {
		my $series_name = $reconcilation_rules_hr->{'name'};
		push @sparql, <<"END";
SELECT DISTINCT ?item WHERE {
  ?item p:P31 ?stmt.
  ?stmt ps:P31 wd:Q277759;
  wikibase:rank ?rank.
  FILTER(?rank != wikibase:DeprecatedRank)
  ?item (rdfs:label|skos:altLabel) ?label .
  FILTER(LANG(?label) = "cs").
  FILTER(STR(?label) = "$series_name")
}
END
	}

	return @sparql;
}

1;

__END__
