#/bin/bash

# Based on scripts from http://jmlacroix.com/archives/export-vim-highlight.html

S_OUTFILE=$(mktemp -t XXXXX-highlight)
H_OUTFILE=$(mktemp -t XXXXX-highlight)

INFILE=$1
PARAM="set nonumber"

if [ -z "$INFILE" ]
then
    echo "usage: $0 source.file"
    exit
fi

vim +'so $VIMRUNTIME/syntax/hitest.vim' \
    +'let html_use_css=1' \
    +'TOhtml' \
    +'v/^\./d' \
    +"wq! $S_OUTFILE" \
    +'q!' &>/dev/null

vim +"$PARAM" \
    +'let html_use_css=1' \
    +'TOhtml' \
    +'/<pre>/,/<\/pre>/d a' \
    +'g/./d' \
    +'1pu! a' \
    +'$d' \
    +"wq! $H_OUTFILE" \
    +'q!' $INFILE &>/dev/null

echo "<html><head><style>"
# This line is optional, useful if you use a dark screen
echo "pre { background: #000; color: #FFF; }"
cat $S_OUTFILE 
echo "</style></head><body>"
cat $H_OUTFILE
echo "</body></html>"

rm $S_OUTFILE
rm $H_OUTFILE
