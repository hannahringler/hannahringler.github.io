all:
	cd cv && make
	git add .
	git commit -m "website updates"
	git push