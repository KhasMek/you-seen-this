BUILD = build
BOOKNAME = You-Seen-This
TITLE = title.txt
METADATA = metadata.xml
CHAPTERS =  index.md bug-hunting.md hardware.md mobile.md payloads.md pentesting.md people.md recon.md social-engineering.md training-envs.md voip.md
TOC = --toc --toc-depth=2
# COVER_IMAGE = images/cover.jpg
LATEX_CLASS = report

all: book

book: epub pdf

clean:
	rm -r $(BUILD)

epub: $(BUILD)/epub/$(BOOKNAME).epub

pdf: $(BUILD)/pdf/$(BOOKNAME).pdf

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	cp index.md index.md.bak
	sed -i '/---/q' index.md
	# pandoc $(TOC) -S --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^
	pandoc $(TOC) -S --epub-metadata=$(METADATA) -o $@ $^
	mv index.md.bak index.md

$(BUILD)/pdf/$(BOOKNAME).pdf: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/pdf
	cp index.md index.md.bak
	sed -i '/---/q' index.md
	pandoc $(TOC) --latex-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $@ $^
	mv index.md.bak index.md


.PHONY: all book clean epub pdf
