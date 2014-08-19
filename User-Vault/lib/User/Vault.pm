package User::Vault;

use 5.010001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use User::Vault ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '1.0';


# Preloaded methods go here.

use strict;
use vars qw($VERSION);
$VERSION = '1.0';

sub load {
 use Data::Dumper;
 my $self = shift;
 print Dumper(\$self);
 return;
}


1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

User::Vault - Perl extension for user settings and credentials management

=head1 SYNOPSIS
  
  # To retrieve Google credentials    
  # First Name:              Gerry
  # Last Name:               Maulden
  # User ID:                 mauldger
  # Google E-mail:           gerry.maulden@gmail.com
  # Google Password:         DvmPYG9W
  # Password's MD5 Hash:     55e1039888bef40022893b35411b4e2f
  # Password's SHA1 Hash:    826b2656f39219373166685edcf5c94fffd221c8
  
  use User::Vault;
  my $vault = new Vault(".google.key");
  $vault->verbose(); # to enable debugging, passwords are displayed
  my %user = $vault->load("mauldger");
  printf("Google E-mail:   %s\n", $user{'google_email'}) if exist($user{'google_email'});
  printf("Google Password: %s\n", $user{'google_pass'}) if exist($user{'google_pass'});

=head1 DESCRIPTION

User::Vault retrieves user settings and credentials from a flat file 
organized in XML format. Several checks are done to ensure that the 
file is . 

User::Vault retrieves user settings and credentials from a flat file 
organized in XML format. Several checks are done to ensure that the 
file is complete. Additionally, there is a check that halts execution 
if the file has permissions other than "600".

For example, the below file is stored in ".google.key".

<?xml version="1.0"?>
<vault>
 <store>
  <uid>mauldger</uid>
  <firstname>Gerry</firstname>
  <lastname>Maulden</lastname>
  <settings>
   <pair>
    <key>google-email</key>
    <value>gerry.maulden@gmail.com</value>
   </pair>
   <pair>
    <key>google-pass</key>
    <value>DvmPYG9W</value>
   </pair>
  </settings>
 </store>
</vault>

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Paul Greenberg, E<lt>paul@greenberg.proE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Paul Greenberg

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
