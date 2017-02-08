pdf:
	mkdir -p build
	@TEXINPUTS=.//: pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build --shell-escape main
all:
	mkdir -p build
	@TEXINPUTS=.//: pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build --shell-escape main
	bibtex build/main
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build main
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build main
fig:
	rm figures/cache/*
	pdflatex -interaction=nonstopmode -output-directory build --shell-escape main
clean:
	rm -rf build
	find . -type f \( -name  '*.thm' -or -name 'main.pdf' -or -name '*.aux' -or -name  '*.auxlock' -or -name '*.figlist' -or -name '*eps-converted-to.pdf' -or -name '*.bbl' -or -name '*.fdb_latexmk' -or -name '*.synctex.gz' -or -name '*.blg' -or -name '*.log' -or -name '*.out' -or -name '*.toc' -or -name '*.lot' -or -name '*.lof' -or -name '*.loa' -or -name '*.fls' \) -exec rm -f '{}' \;
edit:
	subl paper.sublime-project
