set terminal jpeg
set size ratio 0.2
set grid
set mono
set ytics nomirror
set y2tics
set y2range [0:]
set tmargin 10
set bmargin 10
set datafile separator comma
set key off
set title ''
set xlabel ''
set ylabel ''
set style data line
set boxwidth 0.9 relative
set style fill transparent solid 0.3 noborder
plot '/opt/cl0ck/weather/ready.csv' using 2:xtic(1) axes x1y1 title columnheader linewidth 2, '/opt/cl0ck/weather/ready.csv' using 3:xtic(1) axes x2y2 with boxes
