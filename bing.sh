#!/usr/bin/bash
./url2file https://cn.bing.com >/dev/null 2>&1
my_picture=`./bing page.out | cut -d"=" -f 2 | cut -d"." -f 2`
./url2file `./bing page.out` >/dev/null 2>&1
mv page.out $my_picture".jpg"
echo $my_picture" was downloaded"
