use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Cache::Property;

# Test.
is($Wikibase::Cache::Property::VERSION, 0.01, 'Version.');
