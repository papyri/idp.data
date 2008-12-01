#!/usr/bin/perl
# get dates and other basic stuff for database from new texts

use strict;
use Roman;

my $docfile = "docs.lis";
my $datefile = "dates.lis";
open DOCS, ">$docfile" or die "could not open $docfile -- $!";
open DATES, ">$datefile" or die "could not open $datefile -- $!";

my ($series, $vol, $document, $date, $sdate, $edate);
my $source = "DDBDP";
my $ntype = "\\N";
my $otype = "\\N";
my $olang = "\\N";
my $loc = "\\N";
my $rpt_from = "\\N";
my $rpt_in = "\\N";
my $image = "\\N";
my $med = "\\N";
my $status = "\\N";
my $subdoc = "\\N";
while(<>)
{
    if (/DOCTYPE/)
    {
	$series = '';
    }
    if (/<title>/ and $series eq '')
    {
	($series) = $_ =~ /<title>(.*)<\/title>/;
    }
    $vol = $1 if (/<div0 type=\"?Volume\"? n=\"?([^\">]*)\"?>/i);
    $document = $1 if (/<div1 type=\"?document\"? n=\"?([^\">]*)\"?>/i);
    $date = $1 if (/<date>(.*)<\/date>/i);

    if (/<\/div1>/)
    {
	($sdate, $edate) = parse_date($date);
	print DOCS (join "\t", $series, $vol, $document, $ntype, $otype, $olang, $loc, $rpt_from, $rpt_in, $image, $med, $status), "\n";
	print DATES (join "\t", $source, $series, $vol, $document, $subdoc, $sdate, $edate, $date), "\n";
    }
}

close DOCS;
close DATES;

sub parse_date
{
    my ($in_date) = @_;
    my ($sdate, $edate);

    $in_date =~ s/^c//;
    $in_date =~ s/[\-\?]$//;

    my $era = 1;
    $in_date =~ s/^A\.?D\.?//;
    $in_date =~ s/A\.?D\.?$//;
    $in_date =~ s/spc$//;

    $era = -1 if ($in_date =~ s/B\.?C\.?$//) || ($in_date =~ s/sac$//);

    $in_date =~ s/^\s+//;
    $in_date =~ s/\s+$//;
    if ($in_date =~ /^(\d+)$/)
    {
	$sdate = $edate = ($1 * $era);
    }
    elsif ($in_date =~ /^(\d+)[\/\-](\d+)/)
    {
	$sdate = $1;
	$edate = $2;
	if (length($sdate) > length($edate))
	{
	    $edate = substr($sdate, 0, length($sdate)-length($edate)) . $edate;
	}
	$sdate *= $era;
	$edate *= $era;
    }
    elsif ($in_date =~ /^([XVIxvi]+)$/)
    {
	my $century = 100 * arabic($1);
	$sdate = $century;
	$sdate -= 100 if $era == 1;
	$edate = $century;
	$edate += 1 if $era == -1;
	$sdate += 1 if $era == 1;
	$edate -= 100 if $era == -1;
	$sdate *= $era;
	$edate *= $era;
    }
    elsif ($in_date =~ /^([XVIxvi]+)[\/\-]([XVIxvi]+)/)
    {
	$edate = 100 * arabic($2);
	$sdate = 100 * arabic($1);
	$sdate -= 100 if $era == 1;
	$edate += 1 if $era == -1;
	$sdate += 1 if $era == 1;
	$edate -= 100 if $era == -1;
	$sdate *= $era;
	$edate *= $era;
    }
    return ($sdate,$edate);
}
