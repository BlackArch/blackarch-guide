#!/bin/sh

TEXFILE="${1}"
TARGET="${2}"
HTMLFILE="`echo ${TEXFILE} | cut -d '/' -f 2 | cut -d '.' -f 1`.html"

if [ ${#} -ne 2 ]
then
    echo "${0} <file> <target>"
    echo "targets:"
    echo "  html    - create one html document"
    echo "  pdf     - create pdf document"
    echo "  clean   - clean files and directory"
    exit 1337
fi

make_final_html()
{
    # add header
    cat html/header.html > ${HTMLFILE}

    sed '1,23d' latex/guide/${HTMLFILE} | sed '$d' | sed '$d' \
        >> ${HTMLFILE}

    # remove hr and address line
    sed -i '/<br><hr>/,/<\/address>/d' ${HTMLFILE}

    # add footer
    cat html/footer.html >> ${HTMLFILE}
}

if [ "${TARGET}" = "pdf" ]
then
    lualatex "${TEXFILE}"
elif [ "${TARGET}" = "html" ]
then
    echo "not implemented"
    exit 1
    #latex2html -nonavigation -notop_navigation -nobottom_navigation \
    #    -split 0 -toc_depth 10 -lcase_tags -address "BlackArch Linux" \
    #    -show_section_numbers -html_version "4.0" -info 0 "${TEXFILE}"
    #make_final_html
elif [ "${TARGET}" = "clean" ]
then
    rm -rf *.toc *.log *.aux *.out *.exs ${HTMLFILE}
else
    echo "mount /dev/brain"
    exit 1337
fi
