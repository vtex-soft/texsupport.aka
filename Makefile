temp := akabook-project-template

zip:
	mkdir -p $(temp)
	cp template/*.tex $(temp)/
	mkdir -p $(temp)/doc
	cp -r doc/akabookdoc.pdf $(temp)/doc
	mkdir -p $(temp)/sty
	cp -r sty/ $(temp)/sty
	mkdir -p $(temp)/img
	echo "Folder for graphics. Please place here EPS, PDF, PNG and MPS files" > $(temp)/img/README
	zip -r $(temp).zip $(temp)/
	rm -rf $(temp)/
	mv $(temp).zip release/
