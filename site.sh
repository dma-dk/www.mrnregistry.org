#!/bin/bash

if [ "$1" = "pdf" ]; then
   cd adoc
   asciidoctor-pdf -r asciidoctor-diagram site.adoc -D ../target
   cd ..
   exit
elif [ "$1" = "html" ]; then
   asciidoctor -r asciidoctor-diagram adoc/site.adoc -D target
   exit
elif [ "$1" = "site" ]; then
   asciidoctor -r asciidoctor-diagram adoc/site.adoc -D target
   git checkout gh-pages
   cp target/site.html index.html
   git add index.html
   git commit -m "update site"
   git push
   git checkout master
   exit
elif [ -z "$1" ]; then 
	echo Usage: $0 target
	echo where target is:
else
	echo Unknown target: "$1"
	echo Valid targets are:
fi

echo "  pdf        Generates documentation in pdf"
echo "  html       Generates documentation in html"
echo "  site       Generates and publishes www.mrnregistry.org"

