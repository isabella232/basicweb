.PHONY: pdf html

all: amd64 x386 windows

amd64: basicweb.go
	GOOS=linux GOARCH=amd64 go build -o basicweb_amd64

x386: basicweb.go
	GOOS=linux GOARCH=386 go build -o basicweb_386

windows: basicweb.go
	GOOS=windows GOARCH=amd64 go build -o basicweb_amd64.exe
	GOOS=windows GOARCH=386 go build -o basicweb_386.exe

pdf: README.md
	docker run -it --rm -v $$(pwd):/workdir plass/mdtopdf mdtopdf README.md

html: README.md
	docker run -it --rm -v $$(pwd):/workdir plass/mdtopdf mdtohtml README.md

