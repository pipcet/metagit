#!/usr/local/bin/perl

use Test::More;

ok !system("rm -rf t/02-empty_repository");
ok !system("git init t/02-empty_repository");
ok !system("cd t/02-empty_repository; date>timestamp");
ok !system("cd t/02-empty_repository; git add --all .; ../../metagit commit -a -m test");
ok !system("cd t/02-empty_repository; git add --all .; git commit -a -m metatest");
ok !system("cd t/02-empty_repository; git log -1");

done_testing;
