#!/usr/local/bin/perl -w
# -*- perl -*-

#
# $Id: test.pl,v 1.1 1998/04/15 03:41:26 eserte Exp $
# Author: Slaven Rezic
#
# Copyright (C) 1998 Slaven Rezic. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.
#
# Mail: eserte@cs.tu-berlin.de
# WWW:  http://user.cs.tu-berlin.de/~eserte/
#

BEGIN { print "1..5\n" }

use Tk;
use Tk::TIFF;
use File::Compare;

$ok = 1;
print "ok " . $ok++ . "\n";

$top = new MainWindow;

foreach (qw(test-2channel.tif test-lzw.tif test-none.tif test-packbits.tif)) {
    push @p, $top->Photo(-file => $_);
    print "ok " . $ok++ . "\n";
}

foreach (@p) {
    $top->Label(-image => $_)->pack(-side => 'left');
}
$p[0]->write('/tmp/tifftest2.tif');

print ((!-r '/tmp/tifftest2.tif' ? "not " : "") . "ok " . $ok++ . "\n");

$p2 = $top->Photo(-file => "/tmp/tifftest2.tif");
$p2->write('/tmp/tifftest3.tif');

print STDOUT ((compare("/tmp/tifftest2.tif", "/tmp/tifftest3.tif") != 0
	       ? "not " : "") . "ok " . $ok++ . "\n");

#MainLoop;
