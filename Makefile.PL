use inc::Module::Install;

name        'WWW-Dict-OKDaily';
all_from    'lib/WWW/Dict/OKDaily.pm';
requires Encode => 0,
    'Class::Field' => 0,
    'WWW::Mechanize' => 0;


WriteAll;
