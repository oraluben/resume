SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)

all: clean en zh
en: resume.tex
	latexmk -xelatex resume.tex
zh: resume-cn.tex
	latexmk -xelatex resume-cn.tex

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf *.cut
