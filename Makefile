teaching:
	cp "school-headers/${school}.tex" teaching-statement/schoolheader.tex
	cd teaching-statement && latexmk -pdf teaching-statement.tex && cd ..
	cp "school-headers/generic.tex" teaching-statement/schoolheader.tex

research:
	cp "school-headers/${school}.tex" research-statement/schoolheader.tex
	cd research-statement && latexmk -pdf research-statement.tex && cd ..
	cp "school-headers/generic.tex" research-statement/schoolheader.tex

generic: school := generic
hmc: school := hmc
generic hmc: teaching research