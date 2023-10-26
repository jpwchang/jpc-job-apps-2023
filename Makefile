setup:
	mkdir -p build
	rm -f build/teaching-statement.pdf
	rm -f build/research-statement.pdf
	rm -f build/dei-statement.pdf
	rm -f build/cover-letter.pdf

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

dei:
	cp "school-headers/${school}.tex" dei-statement/schoolheader.tex
	cd dei-statement && latexmk -pdf dei-statement.tex && cd ..
	cp "school-headers/generic.tex" dei-statement/schoolheader.tex
	cp dei-statement/dei-statement.pdf build/

coverlettergeneric:
	cp "school-headers/${school}.tex" cover-letter/schoolheader.tex
	cd cover-letter && latexmk -pdf cover-generic-template.tex && cd ..
	cp "school-headers/generic.tex" cover-letter/schoolheader.tex
	cp cover-letter/cover-generic-template.pdf build/cover-letter.pdf

coverlettercustom:
	cp "school-headers/${school}.tex" cover-letter/schoolheader.tex
	cd cover-letter && latexmk -pdf cover-custom-${school}.tex && cd ..
	cp "school-headers/generic.tex" cover-letter/schoolheader.tex
	cp cover-letter/cover-custom-${school}.pdf build/cover-letter.pdf

generic: school := generic
hmc: school := hmc
skidmore: school := skidmore
rosehulman: school := rosehulman
haverford: school := haverford
pomona: school := pomona
princeton: school := princeton
lafayette: school := lafayette
ucriverside: school := ucriverside
union: school := union
ucsd: school := ucsd
reed: school := reed
holycross: school := holycross
ubc: school := ubc
bard: school := bard
vassar: school := vassar
lmu: school := lmu
cmc: school := cmc
bostoncollege: school := bostoncollege
berkeley: school := berkeley
uiuc: school := uiuc
umw: school := umw
generic skidmore rosehulman haverford princeton lafayette ucriverside union ucsd reed holycross ubc bard bostoncollege berkeley uiuc umw: setup teaching research dei coverlettergeneric
	echo ${school} > build/SCHOOL
pomona hmc vassar lmu cmc: setup teaching research dei coverlettercustom
	echo ${school} > build/SCHOOL