#!/usr/bin/perl

# CSS / JavaScript Packer Launcher
# (C)2015 @nanakochi123456

use CSS::Packer;
use JavaScript::Packer;
#use JavaScript::Minifier;

&main;

sub main {
	$file=$ARGV[0];
	if($file=~/\.[Cc][Ss][Ss]$/) {
		open(R,$file);
		foreach(<R>) {
			$buf.=$_;
		}
		close(R);
		print &css($buf);
	} elsif($file=~/\.[Jj][Ss]$/) {
		open(R,$file);
		foreach(<R>) {
			$buf.=$_;
		}
		close(R);
		print &js($buf);
	}
}

sub css {
	my $buf=shift;
    my $packer = CSS::Packer->init();
    $packer->minify( \$buf, {
		compress=>"pretty",
		remove_copyright=>1,
	});
	return $buf;
}

sub js {
	my $buf=shift;
    my $packer = JavaScript::Packer->init();
    $packer->minify( \$buf, {
		compress => 'best',
		remove_copyright=>1,
	});
	return $buf;
}
