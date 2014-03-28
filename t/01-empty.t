#!/usr/local/bin/perl

use Test::More;

ok !system("rm -rf t/01-empty_repository");
ok !system("git init t/01-empty_repository");
ok !system("cd t/01-empty_repository; date>timestamp");
ok !system("cd t/01-empty_repository; git add --all .; ../../metagit commit -a -m test");
ok !system("cd t/01-empty_repository; ../../metagit meta unpack");
ok !system("rm -rf t/01-empty_repository/.git");
ok !system("git init t/01-empty_repository");

done_testing;
