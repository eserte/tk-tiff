package Tk::TIFF;
require DynaLoader;
use Tk 800.014;
use Tk::Photo;

use vars qw($VERSION @ISA);
@ISA = qw(DynaLoader);

$VERSION = '0.11';

bootstrap Tk::TIFF $Tk::VERSION;

#
# There are now two new functions (which may change!!!):
#   # Get current value of global ContrastEnhance Flag.
#   $contrast_enhance = Tk::TIFF::getContrastEnhance();
#
#   # Set new value to true or false, returning new value.
#   $contrast_enhance = Tk::TIFF::setContrastEnhance(0|1);
#

=head1 NAME

Tk::TIFF - Tk::Photo loader for TIFF files.

=cut

1;
__END__
