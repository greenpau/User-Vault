use 5.010001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'User::Vault',
    VERSION_FROM      => 'lib/User/Vault.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/User/Vault.pm', # retrieve abstract from module
       AUTHOR         => 'Paul Greenberg <paul@greenberg.pro>') : ()),
);



use ExtUtils::MakeMaker;

print "Checking for SNMP, V5.2  ";
$@ = '';
eval "use Net::SNMP 5.2 ();";
if ($@) {
    $ok = 0;
    print("\nYou don't have installed the SNMP module, version 5.2 or",
          " later.\n");
} else {
    print "ok\n";
}


print "Checking for GraphViz, V2.04  ";
$@ = '';
eval "use GraphViz 2.04 ();";
if ($@) {
    $ok = 0;
    print("\nYou don't have installed the GraphViz module, version 2.04 or",
          " later.\n");
} else {
    print "ok\n";
}
WriteMakefile(
    'NAME'              => 'SNMP::Map',
    'VERSION_FROM'      => 'Map.pm',
    'PREREQ_PM'         => {
        'Net::SNMP' =>5.2,
        'GraphViz' => 2.04
    },
    dist        	=> { COMPRESS => "gzip", SUFFIX => "gz" },      
);


-----
use 5.005;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'XML::TreePP::XMLPath',
    AUTHOR              => 'Russell E Glaue',
    VERSION_FROM        => 'lib/XML/TreePP/XMLPath.pm',
    ABSTRACT_FROM       => 'lib/XML/TreePP/XMLPath.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM           => { 'XML::TreePP' => 0.39,
                             'Data::Dump'  => 1.10,
                           },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'XML-TreePP-XMLPath-*' },
);
