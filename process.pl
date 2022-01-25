#!/usr/bin/perl
use strict;

my $c_miles = 0;
# waypoint data structures
my @w_names_l;
my @w_names_r;
my @w_miles;
my @r_miles; # c_mileages at various resets

# parse waypoint file
LINE: while(my $line = <>) {
  chomp $line;
  # comment, whitespace
  if($line =~ /\#.*/ || $line =~ /^\s*$/) {
    next LINE;
  }
  # reset cumulative mileage
  if($line =~ /RESET/) {
    push @r_miles, $c_miles;
    $c_miles = 0;
    next LINE;
  }
  # regular waypoint
  my $miles, my $name;
  if($line =~ /(\d+)\s+(.+)/) {
    $miles = $1;
    $name = $2;
  } else {
    warn "Syntax error in input";
    next LINE;
  }
  # save distance since last waypoint in w_miles
  my $d_miles = $miles - $c_miles;
  push @w_miles, $d_miles;
  $c_miles = $miles;
  # parse and save waypoint name
  my $namel, my $namer;
  if($name =~ /(.+):(.+)/) {
    push @w_names_l, $1;
    push @w_names_r, $2;
  } else {
    push @w_names_l, $name;
    push @w_names_r, undef;
  }
}
# finish off the trip
push @r_miles, $c_miles;
$c_miles = 0;

# pretty-print results
while(scalar @w_names_l > 0) {
  # set up pretty name
  my $pretty_name;
  if(defined($w_names_r[0])) {
    $pretty_name="$w_names_l[0]\t$w_names_r[0]";
  } else {
    $pretty_name="$w_names_l[0]";
    if(length($w_names_l[0]) < 8) {
      $pretty_name .= "\t";
    }
  }
  # mileage, forward and reverse
  $c_miles += $w_miles[0];
  # advance data structures to next waypoint
  shift @w_names_l;
  shift @w_names_r;
  shift @w_miles;
  # print the waypoint, possibly twice if it is a reset point
  did_reset: for(my $reset_count = 0; $reset_count < 2; $reset_count++) {
    my $reverse = $r_miles[0] - $c_miles;
    # print
    print "$c_miles\t$pretty_name\t$reverse\n";
    # reset data structures
    if($reverse <= 0 && (scalar @w_names_l) > 0) {
      print "==============================\n";
      $c_miles = 0;
      shift @r_miles;
    } else {
      last did_reset;
    }
  }
}
