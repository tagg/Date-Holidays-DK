package Date::Holidays::DK;
use strict;
use base qw(Exporter);

use Date::Simple;
use Date::Easter;

use vars qw($VERSION @EXPORT);
$VERSION = '0.01';
@EXPORT = qw(is_dk_holiday);

sub is_dk_holiday {
  my ($year, $month, $day) = @_;

  my $n = {'0101' => "Nytårsdag",
	   '0605' => "Grundlovsdag",
	   '1224' => "Juleaftensdag",
	   '1225' => "Juledag",
	   '1226' => "2. Juledag",
	  }->{sprintf "%02d%02d", $month, $day};

  return $n if $n;

  return {-7 => "Palmesøndag",
	  -3 => "Skærtorsdag",
	  -2 => "Langfredag",
	   0 => "Påskedag",
	   1 => "2. Påskedag",
	  26 => "Store Bededag",
	  39 => "Kristi Himmelfartsdag",
	  49 => "Pinsedag",
	  50 => "2. Pinsedag",
	 }->{Date::Simple->new($year, $month, $day) -
	     Date::Simple->new($year, easter($year))} || undef;
}

1;

=head1 NAME

Date::Holidays::DK - Determine Danish public holidays

=head1 SYNOPSIS

  use Date::Holidays::DK;
  my ($year, $month, $day) = (localtime)[ 5, 4, 3 ];
  $year  += 1900;
  $month += 1;
  print "Woohoo" if is_dk_holiday( $year, $month, $day );

=head1 DESCRIPTION

Determines whether a given date is a Danish public holiday or not.

This module employs the simple API of Date::Holidays::UK, but
implements a generalised detection mechanism, that will work for all
years since 1700, when Denmark adopted the Gregorian calendar.

=head1 Functions

=over 4

=item is_dk_holiday($year, $month, $date)

Returns the name of the Holiday that falls on the given day, or undef
if there is none.

=back

=head1 EXPORT

Exports is_dk_holiday() by default.

=head1 BUGS

Please report issues via CPAN RT:

  http://rt.cpan.org/NoAuth/Bugs.html?Dist=Date-Holidays-DK

or by sending mail to

  bug-Date-Holidays-DK@rt.cpan.org

=head1 AUTHOR

Lars Thegler <lars@thegler.dk>

=head1 COPYRIGHT

Copyright (c) 2004 Lars Thegler. All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

