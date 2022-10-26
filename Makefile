DRAFT_NAME=draft-evens-grow-rfc7854bis

.PHONE: all clean lint format

all: gen/$(DRAFT_NAME).txt

html: gen/$(DRAFT_NAME).html

clean:
	rm -rf gen/*

lint: gen/$(DRAFT_NAME).xml
	rfclint gen/$(DRAFT_NAME).xml

format:
	mkdir -p gen
	mmark body.md >  gen/body.md
	echo updated MD is in  gen/body.md

gen/$(DRAFT_NAME).xml: 
	mkdir -p gen
	mmark  rfc.md > gen/$(DRAFT_NAME).xml

gen/$(DRAFT_NAME).txt: gen/$(DRAFT_NAME).xml
	xml2rfc --text --v3 gen/$(DRAFT_NAME).xml

gen/$(DRAFT_NAME).pdf: gen/$(DRAFT_NAME).xml
	xml2rfc --pdf --v3 gen/$(DRAFT_NAME).xml

gen/$(DRAFT_NAME).html: gen/$(DRAFT_NAME).xml
	xml2rfc --html --v3 gen/$(DRAFT_NAME).xml

gen/doc-$(DRAFT_NAME).pdf: abstract.md  body.md contributors.md 
	mkdir -p gen 
	pandoc -s title.md abstract.md  body.md contributors.md -o gen/doc-$(DRAFT_NAME).pdf

