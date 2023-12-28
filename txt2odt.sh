#!/bin/sh

function no_file () {
	printf '<?xml version="1.0" encoding="UTF-8"?>\n<office:document-content xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" office:version="1.3"/>' > content.xml
	zip -qr untitled.odt content.xml META-INF/manifest.xml
}

function file () {
	printf '<?xml version="1.0" encoding="UTF-8"?>\n<office:document-content xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" office:version="1.3"><office:body><office:text>' > content.xml 
	i=$(awk 'NF >= 1 {print NR}' $1 | awk 'END {print}')
	j=1
	while [ $i -ne 0 ]; do printf '<text:p>' >> content.xml && printf "$(awk -v VAR=$j 'NF >= 1 && NR == VAR' $1)" >> content.xml && printf '</text:p>' >> content.xml && ((i=i-1)); ((j=j+1)); done
	printf '</office:text></office:body></office:document-content>' >> content.xml
	[ -n "$2" ] && zip -qr $2.odt content.xml META-INF/manifest.xml || zip -qr $1.odt content.xml META-INF/manifest.xml
}

mkdir META-INF
printf '<?xml version="1.0" encoding="UTF-8"?>\n<manifest:manifest xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0" manifest:version="1.3" xmlns:loext="urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0"><manifest:file-entry manifest:full-path="/" manifest:version="1.3" manifest:media-type="application/vnd.oasis.opendocument.text"/><manifest:file-entry manifest:full-path="content.xml" manifest:media-type="text/xml"/></manifest:manifest>' > META-INF/manifest.xml
[ -n "$1" ] && file $1 $2 || no_file
rm -r META-INF content.xml
