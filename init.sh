#!/bin/bash
filename="AppZ-Healthcare-Case-Study-Oct-2020-v2-1"
if  grep $filename  -q  /var/www/html/wp-content/themes/Avada/header.php ;then
  echo "theme change already exist..."
else
    sed -n -i -e '/<?php wp_head(); ?>/r /wp-contents/plugin-customization/contact7_download.php' -e 1x -e '2,${x;p}' -e '${x;p}' /var/www/html/wp-content/themes/Avada/header.php 2>error.txt
    if [ -s error.txt ];then
	    rm error.txt
	    echo "failed to update header.php"
    else
        echo "header.php successfully updated"
fi
rm error.txt
fi
