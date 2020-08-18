set terminal jpeg
set size ratio 0.2
set grid
set mono
set tmargin 10
set bmargin 10
set datafile separator comma
set key off
set title ''
set xlabel ''
set ylabel ''
set style data line
plot 'timetemp.csv' using 2:xtic(1) title columnheader linewidth 4
