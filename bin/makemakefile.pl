#!/usr/bin/perl

# tdiary_themer compressor
# (C)2015 @nanakochi123456

$optipng_cmd="optipng -o7 -fix -silent";
$mozjpeg_cmd="/opt/mozjpeg/bin/cjpeg -optimize";
$csspack_cmd="perl pack.pl";
$jspack_cmd="perl pack.pl";
$gzip_cmd="/usr/bin/7za a -tgzip -mx9 -si";
$output_dir="./compressed";

sub dir {
	my $f=shift;
	@dir=();
	foreach(split(/\//,$f)) {
		s/tdiary\-theme/compressed\-tdiary\-theme/g;
		push(@dir, $_);
	}
	pop(@dir);
	return $output_dir . "/" . join("/",@dir);
}

sub file {
	my $f=shift;
	$f=~s/tdiary\-theme/compressed\-tdiary\-theme/g;
	return $output_dir . "/" . $f;
}

foreach $find(`find .|grep tdiary-theme|grep -v tar\.gz|grep -v $output_dir|sort`) {
	$find=~s/[\r\n]//g;
	if($find=~/\.[Cc][Ss][Ss]$/) {
		$all.=<<EOM;
	@{[&file("$find.gz")]} \\
EOM

		$make.=<<EOM;
@{[&file("$find.gz")]}: @{[&file("$find")]}
	\@echo $gzip_cmd @{[&file("$find")]}
	\@$gzip_cmd @{[&file("$find.gz")]} < @{[&file("$find")]} >/dev/null 2>/dev/null

@{[&file("$find")]}: $find
	\@mkdir -p @{[&dir("$find")]}
	\@cat $find > @{[&file("$find.orig")]}
	\@echo $csspack_cmd $find
	\@$csspack_cmd $find > @{[&file("$find")]}

EOM
	} elsif($find=~/\.[Jj][Ss]$/) {
		$all.=<<EOM;
	@{[&file("$find.gz")]} \\
EOM

		$make.=<<EOM;
@{[&file("$find.gz")]}: @{[&file("$find")]}
	\@echo $gzip_cmd @{[&file("$find")]}
	\@$gzip_cmd @{[&file("$find.gz")]} < @{[&file("$find")]} >/dev/null 2>/dev/null

@{[&file("$find")]}: $find
	\@mkdir -p @{[&dir("$find")]}
	\@cat $find > @{[&file("$find.orig")]}
	\@cat $find > @{[&file("$find")]}
	\@echo $jspack_cmd $find
	\@$jspack_cmd $find > @{[&file("$find")]}

EOM
	} elsif($find=~/\.[Jj][Pp][Ee]?[Gg]$/) {
		$all.=<<EOM;
	@{[&file("$find")]} \\
EOM

		$make.=<<EOM;
@{[&file("$find")]}: $find
	\@mkdir -p @{[&dir("$find")]}
	\@cat $find > @{[&file("$find.orig")]}
	\@echo $mozjpeg_cmd $find
	\@$mozjpeg_cmd $find > @{[&file("$find")]}

EOM
	} elsif($find=~/\.[Pp][Nn][Gg]$/) {
		$all.=<<EOM;
	@{[&file("$find")]} \\
EOM

		$make.=<<EOM;
@{[&file("$find")]}: $find
	\@mkdir -p @{[&dir("$find")]}
	\@cat $find > @{[&file("$find.orig")]}
	\@cat $find > @{[&file("$find")]}
	\@echo $optipng_cmd @{[&file("$find")]}
	\@$optipng_cmd @{[&file("$find")]}

EOM
	} elsif($find=~/README$|\.[Gg][Ii][Ff]$|\.rb$|\.md$|\.r?html$|\.json$/ && $find ne "") {
		$all.=<<EOM;
	@{[&file($find)]} \\
EOM

		$make.=<<EOM;
@{[&file("$find")]}: $find
	\@mkdir -p @{[&dir("$find")]}
	\@echo cat $find
	\@cat $find > @{[&file("$find")]}

EOM
	}
}

$makefile=<<EOM;
all: \\
$all
EOM

print $makefile;
print $make;

