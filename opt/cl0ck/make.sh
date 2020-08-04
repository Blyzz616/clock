#! /bin/bash

# GET A LIST OF NEW FONTS
for n in $(convert -list font | egrep '^\s+Font' | egrep -v 'AvantGarde-Book|AvantGarde-BookOblique|AvantGarde-Demi|AvantGarde-DemiOblique|Bookman-Demi|Bookman-DemiItalic|Bookman-Light|Bookman-LightItalic|Courier|Courier-Bold|Courier-BoldOblique|Courier-Oblique|fixed|Helvetica|Helvetica-Bold|Helvetica-BoldOblique|Helvetica-Narrow|Helvetica-Narrow-Bold|Helvetica-Narrow-BoldOblique|Helvetica-Narrow-Oblique|Helvetica-Oblique|NewCenturySchlbk-Bold|NewCenturySchlbk-BoldItalic|NewCenturySchlbk-Italic|NewCenturySchlbk-Roman|Palatino-Bold|Palatino-BoldItalic|Palatino-Italic|Palatino-Roman|Symbol|Times-Bold|Times-BoldItalic|Times-Italic|Times-Roman|Century-Schoolbook-L-Bold|Century-Schoolbook-L-Bold-Italic|Century-Schoolbook-L-Italic|Century-Schoolbook-L-Roman|DejaVu-Sans|DejaVu-Sans-Bold|DejaVu-Sans-Mono|DejaVu-Sans-Mono-Bold|DejaVu-Serif|DejaVu-Serif-Bold|Dingbats|Droid-Sans-Fallback|Nimbus-Mono-L|Nimbus-Mono-L-Bold|Nimbus-Mono-L-Bold-Oblique|Nimbus-Mono-L-Regular-Oblique|Nimbus-Roman-No9-L|Nimbus-Roman-No9-L-Medium|Nimbus-Roman-No9-L-Medium-Italic|Nimbus-Roman-No9-L-Regular-Italic|Nimbus-Sans-L|Nimbus-Sans-L-Bold|Nimbus-Sans-L-Bold-Condensed|Nimbus-Sans-L-Bold-Condensed-Italic|Nimbus-Sans-L-Bold-Italic|Nimbus-Sans-L-Regular-Condensed|Nimbus-Sans-L-Regular-Condensed-Italic|Nimbus-Sans-L-Regular-Italic|Noto-Mono|Standard-Symbols-L|URW-Bookman-L-Demi-Bold|URW-Bookman-L-Demi-Bold-Italic|URW-Bookman-L-Light|URW-Bookman-L-Light-Italic|URW-Chancery-L-Medium-Italic|URW-Gothic-L-Book|URW-Gothic-L-Book-Oblique|URW-Gothic-L-Demi|URW-Gothic-L-Demi-Oblique|URW-Palladio-L-Bold|URW-Palladio-L-Bold-Italic|URW-Palladio-L-Italic|URW-Palladio-L-Roman' | awk -F: '{print $2}' | awk '{print $1}')
do
    FONTFACE=$n

    # CREATE NEW DIRECTORIES FOR THEM
    if [[ ! -d /opt/cl0ck/digital/$FONTFACE/ ]]; then
        mkdir -p /opt/cl0ck/digital/$FONTFACE/direct/hours
        mkdir -p /opt/cl0ck/digital/$FONTFACE/direct/minutes
        mkdir -p /opt/cl0ck/digital/$FONTFACE/inverse/hours
        mkdir -p /opt/cl0ck/digital/$FONTFACE/inverse/minutes
    else
        continue
    fi

# CREATE FILES (BOTH DIRECT AND INVERSE)

    for h in {0..23};
    do
        if [[ ${#h} -eq 1 ]]; then
            # ADD LEADING ZEROS
            convert -size 800x600 xc:white -fill black -font $FONTFACE -pointsize 300 -gravity center -draw "text 0,0 '0$h:00' " /opt/cl0ck/digital/$FONTFACE/direct/hours/0$h.bmp
            convert -size 800x600 xc:black -fill white -font $FONTFACE -pointsize 300 -gravity center -draw "text 0,0 '0$h:00' " /opt/cl0ck/digital/$FONTFACE/inverse/hours/0$h.bmp
        else
            convert -size 800x600 xc:white -fill black -font $FONTFACE -pointsize 300 -gravity center -draw "text 0,0 '$h:00' " /opt/cl0ck/digital/$FONTFACE/direct/hours/$h.bmp
            convert -size 800x600 xc:black -fill white -font $FONTFACE -pointsize 300 -gravity center -draw "text 0,0 '$h:00' " /opt/cl0ck/digital/$FONTFACE/inverse/hours/$h.bmp
        fi
    done
    for m in {0..59};
    do
        if [[ ${#m} -eq 1 ]]; then
            # ADD LEADING ZEROS
            convert -size 800x600 xc:white -fill black -font $FONTFACE -pointsize 300 -gravity center -draw "text 0,0 '00:0$m' " /opt/cl0ck/digital/$FONTFACE/direct/minutes/0$m.bmp
            convert -size 800x600 xc:black -fill white -font $FONTFACE -pointsize 300 -gravity center -draw "text 0,0 '00:0$m' " /opt/cl0ck/digital/$FONTFACE/inverse/minutes/0$m.bmp
        else
            convert -size 800x600 xc:white -fill black -font $FONTFACE -pointsize 300 -gravity center -draw "text 0,0 '00:$m' " /opt/cl0ck/digital/$FONTFACE/direct/minutes/$m.bmp
            convert -size 800x600 xc:black -fill white -font $FONTFACE -pointsize 300 -gravity center -draw "text 0,0 '00:$m' " /opt/cl0ck/digital/$FONTFACE/inverse/minutes/$m.bmp
        fi
    done

    #SPLIT THE FILES UP INTO _JUST_ THE HOUR OR MINUTE - TO BE REBUILT AT RUNTIME
    mogrify -crop 400x600+0+0 /opt/cl0ck/digital/$FONTFACE/direct/hours/*.bmp
    mogrify -crop 400x600+400+0 /opt/cl0ck/digital/$FONTFACE/direct/minutes/*.bmp
    mogrify -crop 400x600+0+0 /opt/cl0ck/digital/$FONTFACE/inverse/hours/*.bmp
    mogrify -crop 400x600+400+0 /opt/cl0ck/digital/$FONTFACE/inverse/minutes/*.bmp

done
