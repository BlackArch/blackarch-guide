#!/bin/sh

TEXFILE="guide.tex"
HTMLFILE="`echo ${TEXFILE} | cut -d '.' -f 1`.html"

if [ ${#} -ne 1 ]
then
    echo "sh ${0} <action>"
    echo "actions:"
    echo "  pdf     - create pdf document"
    echo "  html    - create one html document"
    echo "  clean   - clean files and directory"
    exit 1337
fi

make_final_html()
{
    cat header.html > ${HTMLFILE}
    sed '1,23d' guide/${HTMLFILE} | sed '$d' | sed '$d' \
        >> ${HTMLFILE}
    cat footer.html >> ${HTMLFILE}
}

if [ "${1}" = "pdf" ]
then
    pdflatex "${TEXFILE}"
elif [ "${1}" = "html" ]
then
    latex2html -nonavigation -notop_navigation -nobottom_navigation \
        -split 0 -toc_depth 10 -lcase_tags -address "BlackArch Linux" \
        -show_section_numbers -html_version "4.0" -info 0 "${TEXFILE}"
    make_final_html
elif [ "${1}" = "clean" ]
then
    rm -rf *.pdf *.toc *.log *.aux *.out *.exs ${HTMLFILE} guide
else
    echo "mount /dev/brain"
    exit 1337
fi
