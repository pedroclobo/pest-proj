all:: paper

paper: main.r paper.rmd
	(Rscript -e "rmarkdown::render('paper.rmd', 'pdf_document', quiet=TRUE)")

clean::
	(rm -f paper.pdf .Rhistory)
