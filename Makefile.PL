use Tk::MMutil;
use Tk::Config;
use Config;

sub findPhoto
{
    my $photo_so;
    my $dir;
    foreach $dir (@INC) {
	my $try = "$dir/auto/Tk/Photo/Photo.$Config{'dlext'}";
	if (-f $try) {
	    $photo_so = $try;
	    last;
	}
    }
    warn "Cannot locate Photo.$Config{'dlext'}\n" unless defined $photo_so;
    $photo_so;
}

my $photo_so = findPhoto();

Tk::MMutil::TkExtMakefile
  (
   'NAME'          => 'Tk::TIFF',
   'LIBS'          => [($^O eq 'freebsd' ? '-ltiff34' : '-ltiff') . ' -ljpeg'
		      ],
   'INC'           => ($^O eq 'freebsd' ? '-I/usr/local/include/tiff34' : ''),
   #'OBJECT'        => '$(O_FILES)' . ($photo_so ? " $photo_so" : ""),
   'OBJECT'        => '$(O_FILES)',
   'VERSION_FROM'  => 'TIFF.pm',
   'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => '.gz',
                   'POSTOP'=>'-$(CHMOD) 644 $(DISTVNAME).tar$(SUFFIX)'},
   );


