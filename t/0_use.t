# -*- perl -*-
use Test::More tests => 21;

BEGIN {
  use_ok('Date::Holidays::DK');
};

is(is_dk_holiday(2002,  3, 24), "Palmesøndag");
is(is_dk_holiday(2002,  3, 28), "Skærtorsdag");
is(is_dk_holiday(2002,  4,  1), "2. Påskedag");
is(is_dk_holiday(2002,  4, 26), "Store Bededag");
is(is_dk_holiday(2002,  5,  9), "Kristi Himmelfartsdag");
is(is_dk_holiday(2002,  5, 19), "Pinsedag");
is(is_dk_holiday(2002,  5, 20), "2. Pinsedag");
is(is_dk_holiday(2003,  4, 13), "Palmesøndag");
is(is_dk_holiday(2003,  4, 18), "Langfredag");
is(is_dk_holiday(2003,  4, 20), "Påskedag");
is(is_dk_holiday(2003,  5, 16), "Store Bededag");
is(is_dk_holiday(2003,  5, 29), "Kristi Himmelfartsdag");
is(is_dk_holiday(2003,  6,  8), "Pinsedag");
is(is_dk_holiday(2004,  1,  1), "Nytårsdag");
is(is_dk_holiday(2004,  6,  5), "Grundlovsdag");
is(is_dk_holiday(2004, 12, 25), "Juledag");
is(is_dk_holiday(2004,  5, 29), undef);
is(is_dk_holiday(2004,  5, 30), "Pinsedag");
is(is_dk_holiday(2004,  5, 31), "2. Pinsedag");
is(is_dk_holiday(2004,  6,  1), undef);

