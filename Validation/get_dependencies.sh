#!/bin/bash

wget -nc 'https://github.com/papyri/jing-trang/releases/download/xsd_bce_leap_years-1.0/jing.jar'
wget -nc 'http://www.w3.org/TR/REC-rdf-syntax/rdfxml.rng'
for version in 8.13 8.16 8.23; do
  mkdir -p EpiDoc/${version}
  wget -nc -O EpiDoc/${version}/tei-epidoc.rng "http://www.stoa.org/epidoc/schema/${version}/tei-epidoc.rng" || echo "file already exists"
  sleep 3 
done
