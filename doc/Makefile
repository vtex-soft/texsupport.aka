
texpdf := lualatex -recorder -synctex=1 

default: akabookdoc.pdf

%.pdf: %.tex .FORCE
	$(texpdf) $<

clean:
	rm -rf *.log *.aux *.fls *.idx *.log *.synctex*
	rm -rf *.out *.hd *.toc

distclean: clean
	rm -rf *.pdf
.FORCE:
