#!/bin/sh

mkdir META-INF
printf '<?xml version="1.0" encoding="UTF-8"?>\n<manifest:manifest xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0" manifest:version="1.3" xmlns:loext="urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0"><manifest:file-entry manifest:full-path="/" manifest:version="1.3" manifest:media-type="application/vnd.oasis.opendocument.text"/><manifest:file-entry manifest:full-path="content.xml" manifest:media-type="text/xml"/></manifest:manifest>' > META-INF/manifest.xml

[ -n "$1" ] && printf '<?xml version="1.0" encoding="UTF-8"?>\n<office:document-content xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" office:version="1.3"><office:body><office:text><text:p>' > content.xml && printf "$(cat $1)" >> content.xml && printf '</text:p></office:text></office:body></office:document-content>' >> content.xml || printf '<?xml version="1.0" encoding="UTF-8"?>\n<office:document-content xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" office:version="1.3"/>' > content.xml

[ -z "$1" ] && zip -qr untitled.odt content.xml META-INF/manifest.xml
[ -n "$2" ] && zip -qr $2.odt content.xml META-INF/manifest.xml || zip -qr $1.odt content.xml META-INF/manifest.xml
rm -r META-INF content.xml
