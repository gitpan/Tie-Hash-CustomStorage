# $Author: domi $
# $Date: 2004/11/04 15:06:35 $
# $Name:  $
# $Revision: 1.1 $

use ExtUtils::MakeMaker;

my @files= qw(Hash/CustomStorage.pm Array/CustomStorage.pm) ;


my %PM = map ( ( "$_" => '$(INST_LIB)'."/Tie/$_" ), @files ) ;

my %M3 = map 
  {
    my $save = $_ ;
    s/\.pm$/.3pm/ ;
    s!/!::!g;
    ( $save => '$(INST_MAN3DIR)/Tie::'."$_" )
  }
  @files  ;

#print join("\n", values %M3),"\n"; exit ;

WriteMakefile
  (
   'NAME'	=> 'Tie-Hash-CustomStorage',
   'VERSION' => '1.001',
   ABSTRACT   => 'Tied hash with tied or object storage',
   AUTHOR     => 'Dominique Dumont (domi@komarr.grenoble.hp.com)',
   PM            => \%PM ,
   MAN3PODS => \%M3,
);

