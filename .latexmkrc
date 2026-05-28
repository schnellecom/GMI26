$out_dir = 'build'; # Default for files in the root directory

$pdflatex = 'pdflatex --recorder --synctex=1 --shell-escape -halt-on-error %O %S';
$lualatex = 'lualatex --recorder --synctex=1 --shell-escape -halt-on-error %O %S';
$xelatex = 'xelatex --recorder --synctex=1 --shell-escape -halt-on-error %O %S';

$ENV{'BSTINPUTS'} = './;bst/;' . ($ENV{'BSTINPUTS'} || '');
$pdf_mode = 1;

$ENV{'TEXMFHOME'} = "~/.local/share/texlive";
$ENV{'TEXMFCONFIG'} = "~/.config/texlive";
$ENV{'TEXMFVAR'} = "~/.cache/texlive";

# Custom dependency and function for nomencl package
add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
sub makenlo2nls {
	my ($base, $source) = ($_[0] =~ /^(.*)\.([^.]+)$/);
	system( "makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"" );
}