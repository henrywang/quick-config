#! /usr/bin/fish
 
#### Determine size of Terminal
# height=`stty  size | awk 'BEGIN {FS = " "} {print $1;}'`
# width=`stty  size | awk 'BEGIN {FS = " "} {print $2;}'`

# For fish shell only
set height (stty size | awk 'BEGIN {FS = " "} {print $1;}')
set width (stty size | awk 'BEGIN {FS = " "} {print $2;}')

set height (math "$height*14-100")
set width (math "$width*7-250")
echo "$height, $width"

### Display Image / offset with mutt bar
# echo -e "2;3;\n0;1;210;20;$width;$height;0;0;0;0;$argv\n4;\n3;"
echo -e "2;3;\n0;1;210;20;$width;$height;0;0;0;0;$argv\n4;\n3;" | /usr/libexec/w3m/w3mimgdisplay
