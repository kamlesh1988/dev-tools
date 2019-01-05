#!/bin/bash
die () {
  echo >&2 "$@"
	echo "Usage"
	echo "./split-pdf.sh [filename] [no-of-pages-per-file]"
  echo "Example : ./split-pdf.sh some-pdf-file.pdf 10"
  exit 1
}

[ "$#" -eq 2 ] || die "2 argument required, $# provided"


pagesper=$2
file=$1
echo "file : $file , pagesper : $pagesper"
number=$(pdfinfo -- "$file" 2> /dev/null | awk '$1 == "Pages:" {print $2}')
echo "number : $number"
count=$((number / pagesper))
filename=${file%.pdf}
end=0
counter=0
#while [ "$count" -gt "$counter" ]; do 
while [ $number -gt $end ]; do 	
  start=$((counter*pagesper + 1));
  end=$((start + pagesper - 1));
  if [ $end -gt $number ] 
  then
  	# echo "for last set of page"
 	end=$number;
  fi
  echo "start : $start , end : $end";
  counterstring=$(printf %04d "$counter")
  pdftk "$file" cat "${start}-${end}" output "${filename}_${counterstring}.pdf"
  echo "Created ${filename}_${counterstring}.pdf for $counter"
  counter=$((counter + 1))
done
