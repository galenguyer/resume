default: doc clean

FILES = resume.tex sidebar.tex altacv.cls

doc: $(FILES)
	PHONE_NUMBER="${PHONE_NUMBER}" lualatex -jobname=Galen_Guyer_Resume resume.tex

publish: default
	cp Galen_Guyer_Resume.pdf Galen_Guyer_Resume-`date +"%F_%H-%M-%S"`.pdf

.PHONY: watch
watch: default
	while true; do \
		clear; \
		make || true; \
		inotifywait -qe modify $(FILES); \
	done

.PHONY: clean
clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.bcf
	rm -f *.blg
	rm -f *.fdb_latexmk
	rm -f *.fls
	rm -f *.log
	rm -f *.out
	rm -f *.run.xml
	rm -f *.synctex.gz
	rm -f *.bcf

.PHONY: purge
purge: clean
	rm -rf *.pdf
	git clean -fX
