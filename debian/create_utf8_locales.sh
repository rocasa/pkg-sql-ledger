#!/bin/sh

locales=$*
force=1
if [ -z "$locales" ]; then
    locales=*
    force=
fi

for locale in $locales; do
    # Skip bad directories
    if [ ! -d $locale ]; then continue; fi
    if echo "$locale" | grep -q -E "_(utf|big5)$"; then continue; fi
    # Skip if utf dir already exist
    if [ -d "${locale}_utf" -a -z "$force" ]; then continue; fi

    # Copy the directory over, and then convert it
    rm -rf "${locale}_utf"
    cp -a $locale "${locale}_utf"
    orig_charset=$(perl -ne "print \$1 if (/\((.*)\)/);" $locale/LANGUAGE)
    if [ -z "$orig_charset" ]; then
	echo "Warning: $locale/LANGUAGE doesn't specify charset, assume ISO-8859-1" >&2
    fi
    for file in ${locale}_utf/*; do
	filename=$(basename $file)
	if [ "$filename" = "LANGUAGE" ]; then
	    perl -i -pne "s/\(.*\)/(UTF-8)/ || s/\$/ (UTF-8)/" $file
	    continue
	elif [ "$filename" = "locales.pl" ]; then
	    continue
	fi
	recode ${orig_charset:-ISO-8859-1}..utf8 $file
	perl -i -pne "s/\{charset\}.*=\s*[\"']$orig_charset[\"']/\{charset\} = 'UTF-8'/" $file
    done
done
