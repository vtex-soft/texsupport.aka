
texpdf := pdflatex -recorder -synctex=1 

default: test.pdf

%.pdf: %.tex .FORCE
	$(texpdf) $<

clean:
	rm -rf *.log *.aux *.fls *.idx *.log *.pdf *.synctex* test.toc
.FORCE:
