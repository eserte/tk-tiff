package Tk::TIFF;
require DynaLoader;
require Tk;
require Tk::Image;
require Tk::Photo;

use vars qw($VERSION @ISA);
@ISA = qw(DynaLoader);

$VERSION = '0.01';

bootstrap Tk::TIFF $Tk::VERSION;

1;
__END__
