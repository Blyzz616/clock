### Three y-axes
reset session
set terminal png transparent truecolor
set mono
set datafile separator comma
set size ratio 0.2

set key off
set margins screen 0.1, screen 0.8, screen 0.1, screen 0.94

set multiplot
    set format x "%H:%M" timedate
    set xtics 3600*6
    set grid xtics, mxtics, ytics, mytics

    ##### first and second plot
    set ylabel
    set ytics nomirror

    set y2tics 0,5,20
    set y2range [0:20]
    set y2tics nomirror

    set style data line
    set boxwidth 0.9 relative
    set style fill transparent solid 0.3 noborder

    set style fill solid 1.0
    plot '/opt/cl0ck/weather/ready.csv' using 2:xtic(1) axes x1y1 linewidth 2, '/opt/cl0ck/weather/ready.csv' using 3:xtic(1) axes x1y2 with boxes lc rgb "#A0000000"

    unset xlabel
    unset ylabel
    unset y2label
    unset tics

    ##### Second plot
    set border 0
    set xrange[GPVAL_X_MIN:GPVAL_X_MAX]    # identical xrange like 1st plot
    set y2range[1000:0]
    set boxwidth 0.9 relative
    set style fill transparent solid 0.4 noborder
    plot '/opt/cl0ck/weather/ready.csv' using 4:xtic(1) axes x1y2 with boxes

unset multiplot
### end of code
