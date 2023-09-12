teaching:
	cp "school-headers/${school}.tex" teaching-statement/schoolheader.tex
	cd teaching-statement && latexmk -pdf teaching-statement.tex && cd ..
	cp "school-headers/generic.tex" teaching-statement/schoolheader.tex
	cp teaching-statement/teaching-statement.pdf build/

research:
	cp "school-headers/${school}.tex" research-statement/schoolheader.tex
	cd research-statement && latexmk -pdf research-statement.tex && cd ..
	cp "school-headers/generic.tex" research-statement/schoolheader.tex
	cp research-statement/research-statement.pdf build/

coverlettergeneric:
	cp "school-headers/${school}.tex" cover-letter/schoolheader.tex
	cd cover-letter && latexmk -pdf cover-generic-template.tex && cd ..
	cp "school-headers/generic.tex" cover-letter/schoolheader.tex
	cp cover-letter/cover-generic-template.pdf build/cover-letter.pdf

generic: school := generic
hmc: school := hmc
generic hmc: teaching research coverlettergeneric
	echo ${school} > build/SCHOOL