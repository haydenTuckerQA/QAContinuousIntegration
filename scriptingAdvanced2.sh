#!/bin/bash
echo "Enter the file/path you would like to count the lines in"
read file

lines=$(wc -l < $file)

echo "There are $lines lines in $file!"

echo "File: $file" >> ${file}_log.txt
echo "Number of lines: $lines" >> ${file}_log.txt
