mkdir work
cp scans/*.jpg work/

mogrify -verbose -set colorspace Gray -separate -average work/*.jpg

cp scans/00001.jpg work/

mogrify -verbose -auto-orient -resize 50% work/*.jpg

convert work/*.jpg Kosmische_spelen_voor_uw_Commodore_64.pdf
