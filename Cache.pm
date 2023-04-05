package Wikibase::Cache;

use strict;
use warnings;

use Class::Utils qw(set_params);
use English;
use Error::Pure qw(err);

our $VERSION = 0.01;

sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	$self->{'backend'} = 'Basic';

	# Process parameters.
	set_params($self, @params);

	# Load backend module.
	my $backend_module = 'Wikibase::Cache::Backend::'.$self->{'backend'};
	eval "require $backend_module;";
	if ($EVAL_ERROR) {
		err "Cannot load module '$backend_module'.",
			'Error', $EVAL_ERROR;
	}
	$self->{'_backend'} = $backend_module->new;

	return $self;
}

sub get {
	my ($self, $type, $key) = @_;

	return $self->{'_backend'}->get($type, $key);
}

sub save {
	my ($self, $type, $key, $value) = @_;

	return $self->{'_backend'}->save($type, $key, $value);
}

1;
