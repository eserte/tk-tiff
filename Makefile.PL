use Tk::MMutil;
use Tk::Config;

Tk::MMutil::TkExtMakefile
  (
   'NAME'          => 'Tk::TIFF',
   'LIBS'          => [($^O eq 'freebsd' ? '-ltiff34' : '-ltiff') . ' -ljpeg'
		      ],
   'INC'           => ($^O eq 'freebsd' ? '-I/usr/local/include/tiff34' : ''),
   'OBJECT'        => '$(O_FILES)',
   'VERSION_FROM'  => 'TIFF.pm',
   'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => '.gz',
                   'POSTOP'=>'-$(CHMOD) 644 $(DISTVNAME).tar$(SUFFIX)'},
   'PREREQ_PM'     => {'Tk' => 800.005 },
   );


