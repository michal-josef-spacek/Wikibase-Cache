package Wikibase::Cache;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Error::Pure qw(err);

sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# API object.
	$self->{'wikibase_api'} = undef;

	# Process parameters.
	set_params($self, @params);

	if (! defined $self->{'wikibase_api'}) {
		err "Parameter 'wikibase_api' is required.";
	}
	if (! $self->{'wikibase_api'}->isa('Wikibase::API')) {
		err "Parameter 'wikibase_api' must be a 'Wikibase::API' ".
			'object.';
	}

	return $self;
}

1;
