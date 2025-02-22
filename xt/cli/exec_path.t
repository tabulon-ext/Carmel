use strict;
use Test::More;
use lib ".";
use xt::CLI;

subtest 'carmel exec overwrites ENV' => sub {
    my $app = cli();

    $app->write_cpanfile(<<EOF);
requires 'App::Ack';
EOF

    $app->run("install");
    $app->run("exec", "which", "ack");
    like$app->stdout, qr!ack-.*/blib/script/ack! or diag $app->stderr;
};

done_testing;
