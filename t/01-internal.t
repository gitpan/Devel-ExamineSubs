#!perl -T

# for testing internal subs, either directly,
# or through an accessor

use Test::More tests => 2;
use Test::Exception;

BEGIN {
    use_ok( 'Devel::ExamineSubs' ) || print "Bail out!\n";
}
{
    eval { Devel::ExamineSubs->has({ file => 'badfile.none', search => 'text', }) };
    like ( $@, qr/Invalid file supplied/, "has() dies with error if file not found" );
}
