use warnings;
use strict;

use Test::More;
use Devel::Unwind;

use constant MSG => "from unwind";
my $dying_at;

mark HI {
    eval {
        $dying_at = __LINE__; unwind HI MSG;
    };
};

like(
    $@,
    qr/^@{[MSG]} at .* line $dying_at\./,
    "line number in error message from unmark in eval");

done_testing;
