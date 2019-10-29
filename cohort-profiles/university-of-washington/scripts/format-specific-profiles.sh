#!/bin/bash
echo "***Move this script to the Saxon directory and launch it there using the command./format-specific-profiles.sh***"
read -p "Enter the absolute path (base path) to the full RDA json profile (WAU.profile.RDA.json): " profPath
read -p "Enter the format (monograph, etd, dvdVideo, map, adminMetadata) for which you want to create a profile: " format 
java -jar saxon9he.jar -s:$profPath/xml/dummy.xml -xsl:$profPath/scripts/pipe1-json2xml.xsl path=$profPath | java -jar saxon9he.jar -s:- -xsl:$profPath/scripts/pipe2-formats.xsl format=$format | java -jar saxon9he.jar -s:- -xsl:$profPath/scripts/pipe3-xml2json.xsl -o:$profPath/WAU.profile.RDA.$format.json
#Better: run the script in place using relative paths
#in that case: access the -jar file using a path entered as standard input