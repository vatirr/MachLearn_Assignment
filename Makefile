.PHONY: clean all

all: report.html README.md

report.html: report.Rmd pml-training.csv pml-testing.csv
	Rscript -e "rmarkdown::render(commandArgs(T), 'html_document')" $<

README.md: README.Rmd
	Rscript -e "rmarkdown::render(commandArgs(T), 'md_document')" $<

pml-training.csv:
	curl -o $@ https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv

pml-testing.csv: 
	curl -o $@ https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv

clean:
	rm -f *.html
