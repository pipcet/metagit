#!/usr/local/bin/perl

use Test::More;

ok !system("rm -rf t/empty_repository");
ok !system("git init t/empty_repository");
ok !system("cd t/empty_repository; date>timestamp");
ok !system("cd t/empty_repository; git add --all .; ../../metagit commit -a -m test");
ok !system("cd t/empty_repository; ../../metagit meta unpack");
ok !system("rm -rf t/empty_repository/.git");
ok !system("git init t/empty_repository");
ok !system("cd t/empty_repository; git add --all .; ../../metagit commit -a -m test");
ok !system("cd t/empty_repository; ../../metagit meta pack");
ok !system("cd t/empty_repository; git log -1");

done_testing;
