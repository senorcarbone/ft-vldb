pdf:
	mkdir -p build
	@TEXINPUTS=.//: pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build --shell-escape draft
all:
	mkdir -p build
	@TEXINPUTS=.//: pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build --shell-escape draft
	bibtex build/draft
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build draft
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build draft
fig:
	rm figures/cache/*
	pdflatex -interaction=nonstopmode -output-directory build --shell-escape draft
clean:
	rm -rf build
	find . -type f \( -name  '*.thm' -or -name 'draft.pdf' -or -name '*.aux' -or -name  '*.auxlock' -or -name '*.figlist' -or -name '*eps-converted-to.pdf' -or -name '*.bbl' -or -name '*.fdb_latexmk' -or -name '*.synctex.gz' -or -name '*.blg' -or -name '*.log' -or -name '*.out' -or -name '*.toc' -or -name '*.lot' -or -name '*.lof' -or -name '*.loa' -or -name '*.fls' \) -exec rm -f '{}' \;
edit:
	subl paper.sublime-project
