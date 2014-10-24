#!perl -T

use Test::More tests => 7;
use Test::Exception;

BEGIN {
    use_ok( 'Devel::ExamineSubs' ) || print "Bail out!\n";
}

{
    my @res = Devel::ExamineSubs->all({ file => 't/sample.data', search => 'aaa' });
    ok ( $res[0] =~ '\w+', "all() returns an array" );
}
{
    my @res = Devel::ExamineSubs->all({ file => 't/sample.data', search => '' });
    ok ( @res, "all() returns an array if file exists and text is empty string" );
}
{
    my @res = Devel::ExamineSubs->all({ file => 't/sample.data', search => 'asdfasdf' });
    ok ( @res, "all() returns an array if file exists and search text not found" );
}
{
    my $res = Devel::ExamineSubs->all({ file => 't/sample.data' });
    ok ( ref \$res eq 'SCALAR', "all() returns a scalar when called in scalar context" );
}
{
    my $res = Devel::ExamineSubs->all({ file => 't/sample.data', search => 'this' });
    is ( $res, 5, "all() returns the proper count of names when data is found" );
}
{
    my $res = Devel::ExamineSubs->all({ file => 't/sample.data' });
    is ( $res, 5, "all() does the right thing with no text param" );
}

