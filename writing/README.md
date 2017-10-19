To make the whole pdf, concatenate these four files sequentially:


1.  intro.md
2.  part1.md
3.  part2.md
4.  conclusions.md

Example:

    cat intro.md part[12].md conclusions.md > composite.md

If you've got pandoc, latex and the Gentium font installed, you can build a pdf with the shell script `pdf.sh` by giving the base name of the markdown composite, e.g.,

    pdf.sh composite


The resulting pdf file will be `composite.pdf`.
